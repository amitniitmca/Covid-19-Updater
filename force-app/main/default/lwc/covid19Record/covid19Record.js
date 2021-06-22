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
import { LightningElement, api } from 'lwc';

export default class Covid19Record extends LightningElement {
    @api countryRecord;
    connectedCallback(){
        if(this.countryRecord){
            console.log('NOTHING');
        }
        else{
            console.log('EVERYTHING');
        }
    }
}