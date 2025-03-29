import { LightningElement, track } from 'lwc';
import createEvent from '@salesforce/apex/EventController.createEvent';

export default class EventCreation extends LightningElement {
    @track eventRecord = {};

    handleChange(event) {
        this.eventRecord[event.target.name] = event.target.value;
    }

    saveEvent() {
        createEvent({ eventObj: this.eventRecord })
            .then(() => {
                this.eventRecord = {}; 
                alert('Event Created Successfully!');
            })
            .catch(error => console.error(error));
    }
}
