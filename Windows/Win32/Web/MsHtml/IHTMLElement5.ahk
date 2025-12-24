#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IHTMLDOMAttribute2.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include .\IHTMLAttributeCollection3.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLElement5 extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLElement5
     * @type {Guid}
     */
    static IID => Guid("{3051045d-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["getAttributeNode", "setAttributeNode", "removeAttributeNode", "hasAttribute", "put_role", "get_role", "put_ariaBusy", "get_ariaBusy", "put_ariaChecked", "get_ariaChecked", "put_ariaDisabled", "get_ariaDisabled", "put_ariaExpanded", "get_ariaExpanded", "put_ariaHaspopup", "get_ariaHaspopup", "put_ariaHidden", "get_ariaHidden", "put_ariaInvalid", "get_ariaInvalid", "put_ariaMultiselectable", "get_ariaMultiselectable", "put_ariaPressed", "get_ariaPressed", "put_ariaReadonly", "get_ariaReadonly", "put_ariaRequired", "get_ariaRequired", "put_ariaSecret", "get_ariaSecret", "put_ariaSelected", "get_ariaSelected", "getAttribute", "setAttribute", "removeAttribute", "get_attributes", "put_ariaValuenow", "get_ariaValuenow", "put_ariaPosinset", "get_ariaPosinset", "put_ariaSetsize", "get_ariaSetsize", "put_ariaLevel", "get_ariaLevel", "put_ariaValuemin", "get_ariaValuemin", "put_ariaValuemax", "get_ariaValuemax", "put_ariaControls", "get_ariaControls", "put_ariaDescribedby", "get_ariaDescribedby", "put_ariaFlowto", "get_ariaFlowto", "put_ariaLabelledby", "get_ariaLabelledby", "put_ariaActivedescendant", "get_ariaActivedescendant", "put_ariaOwns", "get_ariaOwns", "hasAttributes", "put_ariaLive", "get_ariaLive", "put_ariaRelevant", "get_ariaRelevant"]

    /**
     * @type {BSTR} 
     */
    role {
        get => this.get_role()
        set => this.put_role(value)
    }

    /**
     * @type {BSTR} 
     */
    ariaBusy {
        get => this.get_ariaBusy()
        set => this.put_ariaBusy(value)
    }

    /**
     * @type {BSTR} 
     */
    ariaChecked {
        get => this.get_ariaChecked()
        set => this.put_ariaChecked(value)
    }

    /**
     * @type {BSTR} 
     */
    ariaDisabled {
        get => this.get_ariaDisabled()
        set => this.put_ariaDisabled(value)
    }

    /**
     * @type {BSTR} 
     */
    ariaExpanded {
        get => this.get_ariaExpanded()
        set => this.put_ariaExpanded(value)
    }

    /**
     * @type {BSTR} 
     */
    ariaHaspopup {
        get => this.get_ariaHaspopup()
        set => this.put_ariaHaspopup(value)
    }

    /**
     * @type {BSTR} 
     */
    ariaHidden {
        get => this.get_ariaHidden()
        set => this.put_ariaHidden(value)
    }

    /**
     * @type {BSTR} 
     */
    ariaInvalid {
        get => this.get_ariaInvalid()
        set => this.put_ariaInvalid(value)
    }

    /**
     * @type {BSTR} 
     */
    ariaMultiselectable {
        get => this.get_ariaMultiselectable()
        set => this.put_ariaMultiselectable(value)
    }

    /**
     * @type {BSTR} 
     */
    ariaPressed {
        get => this.get_ariaPressed()
        set => this.put_ariaPressed(value)
    }

    /**
     * @type {BSTR} 
     */
    ariaReadonly {
        get => this.get_ariaReadonly()
        set => this.put_ariaReadonly(value)
    }

    /**
     * @type {BSTR} 
     */
    ariaRequired {
        get => this.get_ariaRequired()
        set => this.put_ariaRequired(value)
    }

    /**
     * @type {BSTR} 
     */
    ariaSecret {
        get => this.get_ariaSecret()
        set => this.put_ariaSecret(value)
    }

    /**
     * @type {BSTR} 
     */
    ariaSelected {
        get => this.get_ariaSelected()
        set => this.put_ariaSelected(value)
    }

    /**
     * @type {IHTMLAttributeCollection3} 
     */
    attributes {
        get => this.get_attributes()
    }

    /**
     * @type {BSTR} 
     */
    ariaValuenow {
        get => this.get_ariaValuenow()
        set => this.put_ariaValuenow(value)
    }

    /**
     * @type {Integer} 
     */
    ariaPosinset {
        get => this.get_ariaPosinset()
        set => this.put_ariaPosinset(value)
    }

    /**
     * @type {Integer} 
     */
    ariaSetsize {
        get => this.get_ariaSetsize()
        set => this.put_ariaSetsize(value)
    }

    /**
     * @type {Integer} 
     */
    ariaLevel {
        get => this.get_ariaLevel()
        set => this.put_ariaLevel(value)
    }

    /**
     * @type {BSTR} 
     */
    ariaValuemin {
        get => this.get_ariaValuemin()
        set => this.put_ariaValuemin(value)
    }

    /**
     * @type {BSTR} 
     */
    ariaValuemax {
        get => this.get_ariaValuemax()
        set => this.put_ariaValuemax(value)
    }

    /**
     * @type {BSTR} 
     */
    ariaControls {
        get => this.get_ariaControls()
        set => this.put_ariaControls(value)
    }

    /**
     * @type {BSTR} 
     */
    ariaDescribedby {
        get => this.get_ariaDescribedby()
        set => this.put_ariaDescribedby(value)
    }

    /**
     * @type {BSTR} 
     */
    ariaFlowto {
        get => this.get_ariaFlowto()
        set => this.put_ariaFlowto(value)
    }

    /**
     * @type {BSTR} 
     */
    ariaLabelledby {
        get => this.get_ariaLabelledby()
        set => this.put_ariaLabelledby(value)
    }

    /**
     * @type {BSTR} 
     */
    ariaActivedescendant {
        get => this.get_ariaActivedescendant()
        set => this.put_ariaActivedescendant(value)
    }

    /**
     * @type {BSTR} 
     */
    ariaOwns {
        get => this.get_ariaOwns()
        set => this.put_ariaOwns(value)
    }

    /**
     * @type {BSTR} 
     */
    ariaLive {
        get => this.get_ariaLive()
        set => this.put_ariaLive(value)
    }

    /**
     * @type {BSTR} 
     */
    ariaRelevant {
        get => this.get_ariaRelevant()
        set => this.put_ariaRelevant(value)
    }

    /**
     * 
     * @param {BSTR} bstrname 
     * @returns {IHTMLDOMAttribute2} 
     */
    getAttributeNode(bstrname) {
        bstrname := bstrname is String ? BSTR.Alloc(bstrname).Value : bstrname

        result := ComCall(7, this, "ptr", bstrname, "ptr*", &ppretAttribute := 0, "HRESULT")
        return IHTMLDOMAttribute2(ppretAttribute)
    }

    /**
     * 
     * @param {IHTMLDOMAttribute2} pattr 
     * @returns {IHTMLDOMAttribute2} 
     */
    setAttributeNode(pattr) {
        result := ComCall(8, this, "ptr", pattr, "ptr*", &ppretAttribute := 0, "HRESULT")
        return IHTMLDOMAttribute2(ppretAttribute)
    }

    /**
     * 
     * @param {IHTMLDOMAttribute2} pattr 
     * @returns {IHTMLDOMAttribute2} 
     */
    removeAttributeNode(pattr) {
        result := ComCall(9, this, "ptr", pattr, "ptr*", &ppretAttribute := 0, "HRESULT")
        return IHTMLDOMAttribute2(ppretAttribute)
    }

    /**
     * 
     * @param {BSTR} name 
     * @returns {VARIANT_BOOL} 
     */
    hasAttribute(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(10, this, "ptr", name, "short*", &pfHasAttribute := 0, "HRESULT")
        return pfHasAttribute
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_role(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(11, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_role() {
        p := BSTR()
        result := ComCall(12, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_ariaBusy(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(13, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ariaBusy() {
        p := BSTR()
        result := ComCall(14, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_ariaChecked(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(15, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ariaChecked() {
        p := BSTR()
        result := ComCall(16, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_ariaDisabled(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(17, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ariaDisabled() {
        p := BSTR()
        result := ComCall(18, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_ariaExpanded(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(19, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ariaExpanded() {
        p := BSTR()
        result := ComCall(20, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_ariaHaspopup(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(21, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ariaHaspopup() {
        p := BSTR()
        result := ComCall(22, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_ariaHidden(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(23, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ariaHidden() {
        p := BSTR()
        result := ComCall(24, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_ariaInvalid(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(25, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ariaInvalid() {
        p := BSTR()
        result := ComCall(26, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_ariaMultiselectable(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(27, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ariaMultiselectable() {
        p := BSTR()
        result := ComCall(28, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_ariaPressed(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(29, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ariaPressed() {
        p := BSTR()
        result := ComCall(30, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_ariaReadonly(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(31, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ariaReadonly() {
        p := BSTR()
        result := ComCall(32, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_ariaRequired(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(33, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ariaRequired() {
        p := BSTR()
        result := ComCall(34, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_ariaSecret(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(35, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ariaSecret() {
        p := BSTR()
        result := ComCall(36, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_ariaSelected(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(37, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ariaSelected() {
        p := BSTR()
        result := ComCall(38, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} strAttributeName 
     * @returns {VARIANT} 
     */
    getAttribute(strAttributeName) {
        strAttributeName := strAttributeName is String ? BSTR.Alloc(strAttributeName).Value : strAttributeName

        AttributeValue := VARIANT()
        result := ComCall(39, this, "ptr", strAttributeName, "ptr", AttributeValue, "HRESULT")
        return AttributeValue
    }

    /**
     * 
     * @param {BSTR} strAttributeName 
     * @param {VARIANT} AttributeValue 
     * @returns {HRESULT} 
     */
    setAttribute(strAttributeName, AttributeValue) {
        strAttributeName := strAttributeName is String ? BSTR.Alloc(strAttributeName).Value : strAttributeName

        result := ComCall(40, this, "ptr", strAttributeName, "ptr", AttributeValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strAttributeName 
     * @returns {VARIANT_BOOL} 
     */
    removeAttribute(strAttributeName) {
        strAttributeName := strAttributeName is String ? BSTR.Alloc(strAttributeName).Value : strAttributeName

        result := ComCall(41, this, "ptr", strAttributeName, "short*", &pfSuccess := 0, "HRESULT")
        return pfSuccess
    }

    /**
     * 
     * @returns {IHTMLAttributeCollection3} 
     */
    get_attributes() {
        result := ComCall(42, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLAttributeCollection3(p)
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_ariaValuenow(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(43, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ariaValuenow() {
        p := BSTR()
        result := ComCall(44, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_ariaPosinset(v) {
        result := ComCall(45, this, "short", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ariaPosinset() {
        result := ComCall(46, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_ariaSetsize(v) {
        result := ComCall(47, this, "short", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ariaSetsize() {
        result := ComCall(48, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_ariaLevel(v) {
        result := ComCall(49, this, "short", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ariaLevel() {
        result := ComCall(50, this, "short*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_ariaValuemin(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(51, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ariaValuemin() {
        p := BSTR()
        result := ComCall(52, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_ariaValuemax(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(53, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ariaValuemax() {
        p := BSTR()
        result := ComCall(54, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_ariaControls(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(55, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ariaControls() {
        p := BSTR()
        result := ComCall(56, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_ariaDescribedby(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(57, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ariaDescribedby() {
        p := BSTR()
        result := ComCall(58, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_ariaFlowto(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(59, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ariaFlowto() {
        p := BSTR()
        result := ComCall(60, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_ariaLabelledby(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(61, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ariaLabelledby() {
        p := BSTR()
        result := ComCall(62, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_ariaActivedescendant(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(63, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ariaActivedescendant() {
        p := BSTR()
        result := ComCall(64, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_ariaOwns(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(65, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ariaOwns() {
        p := BSTR()
        result := ComCall(66, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    hasAttributes() {
        result := ComCall(67, this, "short*", &pfHasAttributes := 0, "HRESULT")
        return pfHasAttributes
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_ariaLive(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(68, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ariaLive() {
        p := BSTR()
        result := ComCall(69, this, "ptr", p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_ariaRelevant(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(70, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ariaRelevant() {
        p := BSTR()
        result := ComCall(71, this, "ptr", p, "HRESULT")
        return p
    }
}
