/**
 * @description       : 
 * @author            : Amit Kumar
 * @group             : 
 * @last modified on  : 06-22-2021
 * @last modified by  : Amit Kumar
 * Modifications Log 
 * Ver   Date         Author       Modification
 * 1.0   06-22-2021   Amit Kumar   Initial Version
**/
import { LightningElement, api, track } from 'lwc';
import getCountryInformation from '@salesforce/apex/Ctrl_Covid19StatsPanel.getCountryInformation';
import getCovidStatsFor from '@salesforce/apex/Ctrl_Covid19StatsPanel.getCovidStatsFor';
import getCountries from '@salesforce/apex/Ctrl_Covid19StatsPanel.getCountries';

export default class Covid19StatsPanel extends LightningElement {
    @api recordId;
    
    isCountryAvailable = false;
    billingCountry = undefined;
    shippingCountry = undefined;
    billingCountryRecord = {};
    shippingCountryRecord = {};
    selectedCountryRecord = undefined;
    @track selectedRecord = undefined;
    toggleLabel = "Shipping";
    selectedCountryType;
    countryValue;
    countryOptions = [];
    
    connectedCallback(){
        this.getCountryInfo();    
        if(!this.recordId){
            this.getCountriesOptions();
        }
    }
    
    async getCountryInfo(){
        if(this.recordId){
            const countryResult = await getCountryInformation({accountId: this.recordId});
            if(countryResult != null){
                this.billingCountry = countryResult.BillingCountry;
                this.shippingCountry = countryResult.ShippingCountry;
                this.selectedCountryType = 'Selected Country: '+this.shippingCountry;
                this.isCountryAvailable = true;
                this.getCountryData();
            }
            else{
                this.billingCountry = undefined;
                this.shippingCountry = undefined;
                this.isCountryAvailable = false;
                this.getCountriesOptions();
            }
        }
    }
    
    getCountriesOptions(){
        getCountries()
        .then(result =>{
            this.countryOptions = [];
            for(const res of result){
                const record = {label: res, value:res};
                this.countryOptions = [...this.countryOptions, record];
            }
            this.countryOptions.unshift({label:'---Select Country---', value:'---Select---'});
            this.countryValue='---Select---';
        })
        .catch(error=>{
            console.log('ERROR ===> '+error);
        });
    }
    
    async getCountryData(){
        if(this.isCountryAvailable === true){
            const res1 = await getCovidStatsFor({country: this.billingCountry});
            const res2 = await getCovidStatsFor({country : this.shippingCountry});
            this.billingCountryRecord = res1;
            this.shippingCountryRecord = res2;
            this.selectedRecord = this.shippingCountryRecord;
        }
    }
    
    handleToggleClick(event){
        if(event.target.checked === true){
            this.toggleLabel = "Billing";
            this.selectedCountryType = 'Selected Country: '+this.billingCountry;
            this.selectedRecord = this.billingCountryRecord;
        }
        else{
            this.toggleLabel = "Shipping";
            this.selectedCountryType = 'Selected Country: '+this.shippingCountry;
            this.selectedRecord = this.shippingCountryRecord;
        }
    }
    
    handleCountryChange(event){
        this.countryValue = event.target.value;
    }
    
    handleSearchClick(){
        if(this.countryValue === '---Select---'){
            alert('Please select a country to get information');
        }
        else{
            getCovidStatsFor({country: this.countryValue})
            .then(result =>{
                this.selectedCountryRecord = result;
            })
            .catch(error =>{
                console.log(error);
            });
        }
    }
}