#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\IHTMLElement.ahk" { IHTMLElement }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IRulesApplied.ahk" { IRulesApplied }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IRulesAppliedCollection extends IDispatch {
    /**
     * The interface identifier for IRulesAppliedCollection
     * @type {Guid}
     */
    static IID := Guid("{305104be-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for RulesAppliedCollection
     * @type {Guid}
     */
    static CLSID := Guid("{671926ee-c3cf-40af-be8f-1cbaee6486e8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRulesAppliedCollection interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        item                         : IntPtr
        get_length                   : IntPtr
        get_element                  : IntPtr
        propertyInheritedFrom        : IntPtr
        get_propertyCount            : IntPtr
        property                     : IntPtr
        propertyInheritedTrace       : IntPtr
        propertyInheritedTraceLength : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRulesAppliedCollection.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    length {
        get => this.get_length()
    }

    /**
     * @type {IHTMLElement} 
     */
    element {
        get => this.get_element()
    }

    /**
     * @type {Integer} 
     */
    propertyCount {
        get => this.get_propertyCount()
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {IRulesApplied} 
     */
    item(index) {
        result := ComCall(7, this, "int", index, "ptr*", &ppRulesApplied := 0, "HRESULT")
        return IRulesApplied(ppRulesApplied)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_length() {
        result := ComCall(8, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IHTMLElement} 
     */
    get_element() {
        result := ComCall(9, this, "ptr*", &p := 0, "HRESULT")
        return IHTMLElement(p)
    }

    /**
     * 
     * @param {BSTR} name 
     * @returns {IRulesApplied} 
     */
    propertyInheritedFrom(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(10, this, BSTR, name, "ptr*", &ppRulesApplied := 0, "HRESULT")
        return IRulesApplied(ppRulesApplied)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_propertyCount() {
        result := ComCall(11, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {BSTR} 
     */
    property(index) {
        pbstrProperty := BSTR.Owned()
        result := ComCall(12, this, "int", index, BSTR.Ptr, pbstrProperty, "HRESULT")
        return pbstrProperty
    }

    /**
     * 
     * @param {BSTR} name 
     * @param {Integer} index 
     * @returns {IRulesApplied} 
     */
    propertyInheritedTrace(name, index) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(13, this, BSTR, name, "int", index, "ptr*", &ppRulesApplied := 0, "HRESULT")
        return IRulesApplied(ppRulesApplied)
    }

    /**
     * 
     * @param {BSTR} name 
     * @returns {Integer} 
     */
    propertyInheritedTraceLength(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(14, this, BSTR, name, "int*", &pLength := 0, "HRESULT")
        return pLength
    }

    Query(iid) {
        if (IRulesAppliedCollection.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.item := CallbackCreate(GetMethod(implObj, "item"), flags, 3)
        this.vtbl.get_length := CallbackCreate(GetMethod(implObj, "get_length"), flags, 2)
        this.vtbl.get_element := CallbackCreate(GetMethod(implObj, "get_element"), flags, 2)
        this.vtbl.propertyInheritedFrom := CallbackCreate(GetMethod(implObj, "propertyInheritedFrom"), flags, 3)
        this.vtbl.get_propertyCount := CallbackCreate(GetMethod(implObj, "get_propertyCount"), flags, 2)
        this.vtbl.property := CallbackCreate(GetMethod(implObj, "property"), flags, 3)
        this.vtbl.propertyInheritedTrace := CallbackCreate(GetMethod(implObj, "propertyInheritedTrace"), flags, 4)
        this.vtbl.propertyInheritedTraceLength := CallbackCreate(GetMethod(implObj, "propertyInheritedTraceLength"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.item)
        CallbackFree(this.vtbl.get_length)
        CallbackFree(this.vtbl.get_element)
        CallbackFree(this.vtbl.propertyInheritedFrom)
        CallbackFree(this.vtbl.get_propertyCount)
        CallbackFree(this.vtbl.property)
        CallbackFree(this.vtbl.propertyInheritedTrace)
        CallbackFree(this.vtbl.propertyInheritedTraceLength)
    }
}
