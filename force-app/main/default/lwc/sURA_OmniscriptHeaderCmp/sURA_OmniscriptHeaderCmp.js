import { LightningElement, api } from "lwc";
import { OmniscriptBaseMixin } from "vlocity_ins/omniscriptBaseMixin";

export default class SURAOmniscriptHeaderCmp extends OmniscriptBaseMixin(
  LightningElement
) {
  @api showBackButton = false;
  @api goUrl = null;
  @api title = "Volver";

  goBack() {
    console.log("Going to back...");
    this.omniPrevStep();
  }

  gotoUrl() {
    if (this.goUrl != null) {
      console.log("Going to URL: ", this.goUrl);
      window.location.assign(this.goUrl);
    }
  }

  handleClick(event) {
    if (event) {
      if (this.goUrl != null) {
        this.gotoUrl();
      } else {
        this.goBack();
      }
    }
  }

  connectedCallback() {
    //console.log(this.showBackButton);
  }
}