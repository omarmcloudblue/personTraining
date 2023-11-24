/**
 * @description       :
 * @author            : Yessith Estiven Herrera Sanjuan <yessith@cloudblue.us>
 * @group             :
 * @last modified on  : 10-12-2023
 * @last modified by  : Yessith Estiven Herrera Sanjuan <yessith@cloudblue.us>
 **/
import { LightningElement } from "lwc";
import { OmniscriptBaseMixin } from "vlocity_ins/omniscriptBaseMixin";
import ICON_WARNING from "@salesforce/resourceUrl/IconWarning";
import ICON_CHAINS from "@salesforce/resourceUrl/chains";

export default class SuraHomeHeaderCmp extends OmniscriptBaseMixin(
  LightningElement
) {
  iconWarning = ICON_WARNING;
  chains = ICON_CHAINS;
}