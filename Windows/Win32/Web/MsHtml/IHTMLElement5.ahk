#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IHTMLAttributeCollection3.ahk" { IHTMLAttributeCollection3 }
#Import ".\IHTMLDOMAttribute2.ahk" { IHTMLDOMAttribute2 }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLElement5 extends IDispatch {
    /**
     * The interface identifier for IHTMLElement5
     * @type {Guid}
     */
    static IID := Guid("{3051045d-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLElement5 interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        getAttributeNode         : IntPtr
        setAttributeNode         : IntPtr
        removeAttributeNode      : IntPtr
        hasAttribute             : IntPtr
        put_role                 : IntPtr
        get_role                 : IntPtr
        put_ariaBusy             : IntPtr
        get_ariaBusy             : IntPtr
        put_ariaChecked          : IntPtr
        get_ariaChecked          : IntPtr
        put_ariaDisabled         : IntPtr
        get_ariaDisabled         : IntPtr
        put_ariaExpanded         : IntPtr
        get_ariaExpanded         : IntPtr
        put_ariaHaspopup         : IntPtr
        get_ariaHaspopup         : IntPtr
        put_ariaHidden           : IntPtr
        get_ariaHidden           : IntPtr
        put_ariaInvalid          : IntPtr
        get_ariaInvalid          : IntPtr
        put_ariaMultiselectable  : IntPtr
        get_ariaMultiselectable  : IntPtr
        put_ariaPressed          : IntPtr
        get_ariaPressed          : IntPtr
        put_ariaReadonly         : IntPtr
        get_ariaReadonly         : IntPtr
        put_ariaRequired         : IntPtr
        get_ariaRequired         : IntPtr
        put_ariaSecret           : IntPtr
        get_ariaSecret           : IntPtr
        put_ariaSelected         : IntPtr
        get_ariaSelected         : IntPtr
        getAttribute             : IntPtr
        setAttribute             : IntPtr
        removeAttribute          : IntPtr
        get_attributes           : IntPtr
        put_ariaValuenow         : IntPtr
        get_ariaValuenow         : IntPtr
        put_ariaPosinset         : IntPtr
        get_ariaPosinset         : IntPtr
        put_ariaSetsize          : IntPtr
        get_ariaSetsize          : IntPtr
        put_ariaLevel            : IntPtr
        get_ariaLevel            : IntPtr
        put_ariaValuemin         : IntPtr
        get_ariaValuemin         : IntPtr
        put_ariaValuemax         : IntPtr
        get_ariaValuemax         : IntPtr
        put_ariaControls         : IntPtr
        get_ariaControls         : IntPtr
        put_ariaDescribedby      : IntPtr
        get_ariaDescribedby      : IntPtr
        put_ariaFlowto           : IntPtr
        get_ariaFlowto           : IntPtr
        put_ariaLabelledby       : IntPtr
        get_ariaLabelledby       : IntPtr
        put_ariaActivedescendant : IntPtr
        get_ariaActivedescendant : IntPtr
        put_ariaOwns             : IntPtr
        get_ariaOwns             : IntPtr
        hasAttributes            : IntPtr
        put_ariaLive             : IntPtr
        get_ariaLive             : IntPtr
        put_ariaRelevant         : IntPtr
        get_ariaRelevant         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLElement5.Vtbl()
        }
        super.__New(implObj, flags)
    }

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

        result := ComCall(7, this, BSTR, bstrname, "ptr*", &ppretAttribute := 0, "HRESULT")
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

        result := ComCall(10, this, BSTR, name, VARIANT_BOOL.Ptr, &pfHasAttribute := 0, "HRESULT")
        return pfHasAttribute
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_role(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(11, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_role() {
        p := BSTR.Owned()
        result := ComCall(12, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_ariaBusy(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(13, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ariaBusy() {
        p := BSTR.Owned()
        result := ComCall(14, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_ariaChecked(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(15, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ariaChecked() {
        p := BSTR.Owned()
        result := ComCall(16, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_ariaDisabled(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(17, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ariaDisabled() {
        p := BSTR.Owned()
        result := ComCall(18, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_ariaExpanded(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(19, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ariaExpanded() {
        p := BSTR.Owned()
        result := ComCall(20, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_ariaHaspopup(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(21, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ariaHaspopup() {
        p := BSTR.Owned()
        result := ComCall(22, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_ariaHidden(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(23, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ariaHidden() {
        p := BSTR.Owned()
        result := ComCall(24, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_ariaInvalid(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(25, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ariaInvalid() {
        p := BSTR.Owned()
        result := ComCall(26, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_ariaMultiselectable(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(27, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ariaMultiselectable() {
        p := BSTR.Owned()
        result := ComCall(28, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_ariaPressed(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(29, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ariaPressed() {
        p := BSTR.Owned()
        result := ComCall(30, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_ariaReadonly(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(31, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ariaReadonly() {
        p := BSTR.Owned()
        result := ComCall(32, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_ariaRequired(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(33, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ariaRequired() {
        p := BSTR.Owned()
        result := ComCall(34, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_ariaSecret(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(35, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ariaSecret() {
        p := BSTR.Owned()
        result := ComCall(36, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_ariaSelected(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(37, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ariaSelected() {
        p := BSTR.Owned()
        result := ComCall(38, this, BSTR.Ptr, p, "HRESULT")
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
        result := ComCall(39, this, BSTR, strAttributeName, VARIANT.Ptr, AttributeValue, "HRESULT")
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

        result := ComCall(40, this, BSTR, strAttributeName, VARIANT, AttributeValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strAttributeName 
     * @returns {VARIANT_BOOL} 
     */
    removeAttribute(strAttributeName) {
        strAttributeName := strAttributeName is String ? BSTR.Alloc(strAttributeName).Value : strAttributeName

        result := ComCall(41, this, BSTR, strAttributeName, VARIANT_BOOL.Ptr, &pfSuccess := 0, "HRESULT")
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

        result := ComCall(43, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ariaValuenow() {
        p := BSTR.Owned()
        result := ComCall(44, this, BSTR.Ptr, p, "HRESULT")
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

        result := ComCall(51, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ariaValuemin() {
        p := BSTR.Owned()
        result := ComCall(52, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_ariaValuemax(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(53, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ariaValuemax() {
        p := BSTR.Owned()
        result := ComCall(54, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_ariaControls(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(55, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ariaControls() {
        p := BSTR.Owned()
        result := ComCall(56, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_ariaDescribedby(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(57, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ariaDescribedby() {
        p := BSTR.Owned()
        result := ComCall(58, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_ariaFlowto(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(59, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ariaFlowto() {
        p := BSTR.Owned()
        result := ComCall(60, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_ariaLabelledby(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(61, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ariaLabelledby() {
        p := BSTR.Owned()
        result := ComCall(62, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_ariaActivedescendant(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(63, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ariaActivedescendant() {
        p := BSTR.Owned()
        result := ComCall(64, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_ariaOwns(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(65, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ariaOwns() {
        p := BSTR.Owned()
        result := ComCall(66, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    hasAttributes() {
        result := ComCall(67, this, VARIANT_BOOL.Ptr, &pfHasAttributes := 0, "HRESULT")
        return pfHasAttributes
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_ariaLive(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(68, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ariaLive() {
        p := BSTR.Owned()
        result := ComCall(69, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} v 
     * @returns {HRESULT} 
     */
    put_ariaRelevant(v) {
        v := v is String ? BSTR.Alloc(v).Value : v

        result := ComCall(70, this, BSTR, v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ariaRelevant() {
        p := BSTR.Owned()
        result := ComCall(71, this, BSTR.Ptr, p, "HRESULT")
        return p
    }

    Query(iid) {
        if (IHTMLElement5.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.getAttributeNode := CallbackCreate(GetMethod(implObj, "getAttributeNode"), flags, 3)
        this.vtbl.setAttributeNode := CallbackCreate(GetMethod(implObj, "setAttributeNode"), flags, 3)
        this.vtbl.removeAttributeNode := CallbackCreate(GetMethod(implObj, "removeAttributeNode"), flags, 3)
        this.vtbl.hasAttribute := CallbackCreate(GetMethod(implObj, "hasAttribute"), flags, 3)
        this.vtbl.put_role := CallbackCreate(GetMethod(implObj, "put_role"), flags, 2)
        this.vtbl.get_role := CallbackCreate(GetMethod(implObj, "get_role"), flags, 2)
        this.vtbl.put_ariaBusy := CallbackCreate(GetMethod(implObj, "put_ariaBusy"), flags, 2)
        this.vtbl.get_ariaBusy := CallbackCreate(GetMethod(implObj, "get_ariaBusy"), flags, 2)
        this.vtbl.put_ariaChecked := CallbackCreate(GetMethod(implObj, "put_ariaChecked"), flags, 2)
        this.vtbl.get_ariaChecked := CallbackCreate(GetMethod(implObj, "get_ariaChecked"), flags, 2)
        this.vtbl.put_ariaDisabled := CallbackCreate(GetMethod(implObj, "put_ariaDisabled"), flags, 2)
        this.vtbl.get_ariaDisabled := CallbackCreate(GetMethod(implObj, "get_ariaDisabled"), flags, 2)
        this.vtbl.put_ariaExpanded := CallbackCreate(GetMethod(implObj, "put_ariaExpanded"), flags, 2)
        this.vtbl.get_ariaExpanded := CallbackCreate(GetMethod(implObj, "get_ariaExpanded"), flags, 2)
        this.vtbl.put_ariaHaspopup := CallbackCreate(GetMethod(implObj, "put_ariaHaspopup"), flags, 2)
        this.vtbl.get_ariaHaspopup := CallbackCreate(GetMethod(implObj, "get_ariaHaspopup"), flags, 2)
        this.vtbl.put_ariaHidden := CallbackCreate(GetMethod(implObj, "put_ariaHidden"), flags, 2)
        this.vtbl.get_ariaHidden := CallbackCreate(GetMethod(implObj, "get_ariaHidden"), flags, 2)
        this.vtbl.put_ariaInvalid := CallbackCreate(GetMethod(implObj, "put_ariaInvalid"), flags, 2)
        this.vtbl.get_ariaInvalid := CallbackCreate(GetMethod(implObj, "get_ariaInvalid"), flags, 2)
        this.vtbl.put_ariaMultiselectable := CallbackCreate(GetMethod(implObj, "put_ariaMultiselectable"), flags, 2)
        this.vtbl.get_ariaMultiselectable := CallbackCreate(GetMethod(implObj, "get_ariaMultiselectable"), flags, 2)
        this.vtbl.put_ariaPressed := CallbackCreate(GetMethod(implObj, "put_ariaPressed"), flags, 2)
        this.vtbl.get_ariaPressed := CallbackCreate(GetMethod(implObj, "get_ariaPressed"), flags, 2)
        this.vtbl.put_ariaReadonly := CallbackCreate(GetMethod(implObj, "put_ariaReadonly"), flags, 2)
        this.vtbl.get_ariaReadonly := CallbackCreate(GetMethod(implObj, "get_ariaReadonly"), flags, 2)
        this.vtbl.put_ariaRequired := CallbackCreate(GetMethod(implObj, "put_ariaRequired"), flags, 2)
        this.vtbl.get_ariaRequired := CallbackCreate(GetMethod(implObj, "get_ariaRequired"), flags, 2)
        this.vtbl.put_ariaSecret := CallbackCreate(GetMethod(implObj, "put_ariaSecret"), flags, 2)
        this.vtbl.get_ariaSecret := CallbackCreate(GetMethod(implObj, "get_ariaSecret"), flags, 2)
        this.vtbl.put_ariaSelected := CallbackCreate(GetMethod(implObj, "put_ariaSelected"), flags, 2)
        this.vtbl.get_ariaSelected := CallbackCreate(GetMethod(implObj, "get_ariaSelected"), flags, 2)
        this.vtbl.getAttribute := CallbackCreate(GetMethod(implObj, "getAttribute"), flags, 3)
        this.vtbl.setAttribute := CallbackCreate(GetMethod(implObj, "setAttribute"), flags, 3)
        this.vtbl.removeAttribute := CallbackCreate(GetMethod(implObj, "removeAttribute"), flags, 3)
        this.vtbl.get_attributes := CallbackCreate(GetMethod(implObj, "get_attributes"), flags, 2)
        this.vtbl.put_ariaValuenow := CallbackCreate(GetMethod(implObj, "put_ariaValuenow"), flags, 2)
        this.vtbl.get_ariaValuenow := CallbackCreate(GetMethod(implObj, "get_ariaValuenow"), flags, 2)
        this.vtbl.put_ariaPosinset := CallbackCreate(GetMethod(implObj, "put_ariaPosinset"), flags, 2)
        this.vtbl.get_ariaPosinset := CallbackCreate(GetMethod(implObj, "get_ariaPosinset"), flags, 2)
        this.vtbl.put_ariaSetsize := CallbackCreate(GetMethod(implObj, "put_ariaSetsize"), flags, 2)
        this.vtbl.get_ariaSetsize := CallbackCreate(GetMethod(implObj, "get_ariaSetsize"), flags, 2)
        this.vtbl.put_ariaLevel := CallbackCreate(GetMethod(implObj, "put_ariaLevel"), flags, 2)
        this.vtbl.get_ariaLevel := CallbackCreate(GetMethod(implObj, "get_ariaLevel"), flags, 2)
        this.vtbl.put_ariaValuemin := CallbackCreate(GetMethod(implObj, "put_ariaValuemin"), flags, 2)
        this.vtbl.get_ariaValuemin := CallbackCreate(GetMethod(implObj, "get_ariaValuemin"), flags, 2)
        this.vtbl.put_ariaValuemax := CallbackCreate(GetMethod(implObj, "put_ariaValuemax"), flags, 2)
        this.vtbl.get_ariaValuemax := CallbackCreate(GetMethod(implObj, "get_ariaValuemax"), flags, 2)
        this.vtbl.put_ariaControls := CallbackCreate(GetMethod(implObj, "put_ariaControls"), flags, 2)
        this.vtbl.get_ariaControls := CallbackCreate(GetMethod(implObj, "get_ariaControls"), flags, 2)
        this.vtbl.put_ariaDescribedby := CallbackCreate(GetMethod(implObj, "put_ariaDescribedby"), flags, 2)
        this.vtbl.get_ariaDescribedby := CallbackCreate(GetMethod(implObj, "get_ariaDescribedby"), flags, 2)
        this.vtbl.put_ariaFlowto := CallbackCreate(GetMethod(implObj, "put_ariaFlowto"), flags, 2)
        this.vtbl.get_ariaFlowto := CallbackCreate(GetMethod(implObj, "get_ariaFlowto"), flags, 2)
        this.vtbl.put_ariaLabelledby := CallbackCreate(GetMethod(implObj, "put_ariaLabelledby"), flags, 2)
        this.vtbl.get_ariaLabelledby := CallbackCreate(GetMethod(implObj, "get_ariaLabelledby"), flags, 2)
        this.vtbl.put_ariaActivedescendant := CallbackCreate(GetMethod(implObj, "put_ariaActivedescendant"), flags, 2)
        this.vtbl.get_ariaActivedescendant := CallbackCreate(GetMethod(implObj, "get_ariaActivedescendant"), flags, 2)
        this.vtbl.put_ariaOwns := CallbackCreate(GetMethod(implObj, "put_ariaOwns"), flags, 2)
        this.vtbl.get_ariaOwns := CallbackCreate(GetMethod(implObj, "get_ariaOwns"), flags, 2)
        this.vtbl.hasAttributes := CallbackCreate(GetMethod(implObj, "hasAttributes"), flags, 2)
        this.vtbl.put_ariaLive := CallbackCreate(GetMethod(implObj, "put_ariaLive"), flags, 2)
        this.vtbl.get_ariaLive := CallbackCreate(GetMethod(implObj, "get_ariaLive"), flags, 2)
        this.vtbl.put_ariaRelevant := CallbackCreate(GetMethod(implObj, "put_ariaRelevant"), flags, 2)
        this.vtbl.get_ariaRelevant := CallbackCreate(GetMethod(implObj, "get_ariaRelevant"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.getAttributeNode)
        CallbackFree(this.vtbl.setAttributeNode)
        CallbackFree(this.vtbl.removeAttributeNode)
        CallbackFree(this.vtbl.hasAttribute)
        CallbackFree(this.vtbl.put_role)
        CallbackFree(this.vtbl.get_role)
        CallbackFree(this.vtbl.put_ariaBusy)
        CallbackFree(this.vtbl.get_ariaBusy)
        CallbackFree(this.vtbl.put_ariaChecked)
        CallbackFree(this.vtbl.get_ariaChecked)
        CallbackFree(this.vtbl.put_ariaDisabled)
        CallbackFree(this.vtbl.get_ariaDisabled)
        CallbackFree(this.vtbl.put_ariaExpanded)
        CallbackFree(this.vtbl.get_ariaExpanded)
        CallbackFree(this.vtbl.put_ariaHaspopup)
        CallbackFree(this.vtbl.get_ariaHaspopup)
        CallbackFree(this.vtbl.put_ariaHidden)
        CallbackFree(this.vtbl.get_ariaHidden)
        CallbackFree(this.vtbl.put_ariaInvalid)
        CallbackFree(this.vtbl.get_ariaInvalid)
        CallbackFree(this.vtbl.put_ariaMultiselectable)
        CallbackFree(this.vtbl.get_ariaMultiselectable)
        CallbackFree(this.vtbl.put_ariaPressed)
        CallbackFree(this.vtbl.get_ariaPressed)
        CallbackFree(this.vtbl.put_ariaReadonly)
        CallbackFree(this.vtbl.get_ariaReadonly)
        CallbackFree(this.vtbl.put_ariaRequired)
        CallbackFree(this.vtbl.get_ariaRequired)
        CallbackFree(this.vtbl.put_ariaSecret)
        CallbackFree(this.vtbl.get_ariaSecret)
        CallbackFree(this.vtbl.put_ariaSelected)
        CallbackFree(this.vtbl.get_ariaSelected)
        CallbackFree(this.vtbl.getAttribute)
        CallbackFree(this.vtbl.setAttribute)
        CallbackFree(this.vtbl.removeAttribute)
        CallbackFree(this.vtbl.get_attributes)
        CallbackFree(this.vtbl.put_ariaValuenow)
        CallbackFree(this.vtbl.get_ariaValuenow)
        CallbackFree(this.vtbl.put_ariaPosinset)
        CallbackFree(this.vtbl.get_ariaPosinset)
        CallbackFree(this.vtbl.put_ariaSetsize)
        CallbackFree(this.vtbl.get_ariaSetsize)
        CallbackFree(this.vtbl.put_ariaLevel)
        CallbackFree(this.vtbl.get_ariaLevel)
        CallbackFree(this.vtbl.put_ariaValuemin)
        CallbackFree(this.vtbl.get_ariaValuemin)
        CallbackFree(this.vtbl.put_ariaValuemax)
        CallbackFree(this.vtbl.get_ariaValuemax)
        CallbackFree(this.vtbl.put_ariaControls)
        CallbackFree(this.vtbl.get_ariaControls)
        CallbackFree(this.vtbl.put_ariaDescribedby)
        CallbackFree(this.vtbl.get_ariaDescribedby)
        CallbackFree(this.vtbl.put_ariaFlowto)
        CallbackFree(this.vtbl.get_ariaFlowto)
        CallbackFree(this.vtbl.put_ariaLabelledby)
        CallbackFree(this.vtbl.get_ariaLabelledby)
        CallbackFree(this.vtbl.put_ariaActivedescendant)
        CallbackFree(this.vtbl.get_ariaActivedescendant)
        CallbackFree(this.vtbl.put_ariaOwns)
        CallbackFree(this.vtbl.get_ariaOwns)
        CallbackFree(this.vtbl.hasAttributes)
        CallbackFree(this.vtbl.put_ariaLive)
        CallbackFree(this.vtbl.get_ariaLive)
        CallbackFree(this.vtbl.put_ariaRelevant)
        CallbackFree(this.vtbl.get_ariaRelevant)
    }
}
