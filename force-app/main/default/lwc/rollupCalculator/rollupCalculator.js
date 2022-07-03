import { LightningElement, track } from 'lwc';
import getParentObjects from '@salesforce/apex/RollupCalculator.getParentObjects';

export default class RollupCalculator extends LightningElement {
    valuep = 'none';
    valuec = 'none';
    @track results;
    @track error;
    @track parentOptions;

    get parentOptions() {
        getParentObjects().then(result => {
            this.results = result;
            console.log(result);
            console.log(this.normalizeList(result));
            this.parentOptions = this.normalizeList(result);
        }).catch(error => {
            this.error = error;
            console.log(error);
        })


    }

    get childOptions() {
        return { label: 'test', value: 'test' };
    }

    handleChange(event) {
        this.valuep = event.detail.value;
    }

    handleChange2(event) {
        this.valuec = event.detail.value;
    }

    normalizeList(val) {
        let objectList = [];

        for (let i = 0; i < val.length; i++) {
            const opt = { label: val[i], value: val[i] };
            objectList.push(opt);
        }

        return objectList;
    }

}