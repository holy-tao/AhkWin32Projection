#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IHTMLStyleSheetRulesAppliedCollection.ahk" { IHTMLStyleSheetRulesAppliedCollection }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\IHTMLStyle.ahk" { IHTMLStyle }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IHTMLElement.ahk" { IHTMLElement }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IRulesApplied extends IDispatch {
    /**
     * The interface identifier for IRulesApplied
     * @type {Guid}
     */
    static IID := Guid("{305104bf-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for RulesApplied
     * @type {Guid}
     */
    static CLSID := Guid("{7c803920-7a53-4d26-98ac-fdd23e6b9e01}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRulesApplied interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_element            : IntPtr
        get_inlineStyles       : IntPtr
        get_appliedRules       : IntPtr
        propertyIsInline       : IntPtr
        propertyIsInheritable  : IntPtr
        hasInheritableProperty : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRulesApplied.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IHTMLElement} 
     */
    element {
        get => this.get_element()
    }

    /**
     * @type {IHTMLStyle} 
     */
    inlineStyles {
        get => this.get_inlineStyles()
    }

    /**
     * @type {IHTMLStyleSheetRulesAppliedCollection} 
     */
    appliedRules {
        get => this.get_appliedRules()
    }

    /**
     * 
     * @returns {IHTMLElement} 
     */
    get_element() {
        result := ComCall(7, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLElement(p)
    }

    /**
     * 
     * @returns {IHTMLStyle} 
     */
    get_inlineStyles() {
        result := ComCall(8, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLStyle(p)
    }

    /**
     * 
     * @returns {IHTMLStyleSheetRulesAppliedCollection} 
     */
    get_appliedRules() {
        result := ComCall(9, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLStyleSheetRulesAppliedCollection(p)
    }

    /**
     * 
     * @param {BSTR} name 
     * @returns {VARIANT_BOOL} 
     */
    propertyIsInline(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(10, this, BSTR, name, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {BSTR} name 
     * @returns {VARIANT_BOOL} 
     */
    propertyIsInheritable(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(11, this, BSTR, name, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    hasInheritableProperty() {
        result := ComCall(12, this, VARIANT_BOOL.Ptr, &p := 0, "HRESULT")
        return p
    }

    Query(iid) {
        if (IRulesApplied.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_element := CallbackCreate(GetMethod(implObj, "get_element"), flags, 2)
        this.vtbl.get_inlineStyles := CallbackCreate(GetMethod(implObj, "get_inlineStyles"), flags, 2)
        this.vtbl.get_appliedRules := CallbackCreate(GetMethod(implObj, "get_appliedRules"), flags, 2)
        this.vtbl.propertyIsInline := CallbackCreate(GetMethod(implObj, "propertyIsInline"), flags, 3)
        this.vtbl.propertyIsInheritable := CallbackCreate(GetMethod(implObj, "propertyIsInheritable"), flags, 3)
        this.vtbl.hasInheritableProperty := CallbackCreate(GetMethod(implObj, "hasInheritableProperty"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_element)
        CallbackFree(this.vtbl.get_inlineStyles)
        CallbackFree(this.vtbl.get_appliedRules)
        CallbackFree(this.vtbl.propertyIsInline)
        CallbackFree(this.vtbl.propertyIsInheritable)
        CallbackFree(this.vtbl.hasInheritableProperty)
    }
}
