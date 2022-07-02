import { LightningElement, track } from 'lwc';
import getParentObjects from '@salesforce/apex/RollupCalculator.getParentObjects';

export default class RollupCalculator extends LightningElement {
    value = 'none';
    @track results;
    @track error;

    get statusOptions() {
        getParentObjects().then(result => {
            this.results = result;
            console.log(result);
        }).catch(error => {
            this.error = error;
            console.log(error);
        })
        return [
            {
                label: 'Account', value: 'Account'
            },
            {
                label: 'Contact', value: 'Contact'
            }
        ];
    }

    handleChange(event) {
        this.value = event.detail.value;
    }

}