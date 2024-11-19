import Controller from "sap/ui/core/mvc/Controller";
import UIComponent from "sap/ui/core/UIComponent";
import formatter from "../model/formatter";
import Event from "sap/ui/base/Event";


/**
 * @namespace flexso.htf.frontend.frontend.controller
 */
export default class Master extends Controller {
  public formatter = formatter;

  /*eslint-disable @typescript-eslint/no-empty-function*/
  public onInit(): void {}
}
