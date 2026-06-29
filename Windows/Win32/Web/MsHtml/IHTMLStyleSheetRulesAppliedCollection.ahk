#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IHTMLStyleSheetRule.ahk" { IHTMLStyleSheetRule }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLStyleSheetRulesAppliedCollection extends IDispatch {
    /**
     * The interface identifier for IHTMLStyleSheetRulesAppliedCollection
     * @type {Guid}
     */
    static IID := Guid("{305104c0-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLStyleSheetRulesAppliedCollection
     * @type {Guid}
     */
    static CLSID := Guid("{eb36f845-2395-4719-b85c-d0d80e184bd9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLStyleSheetRulesAppliedCollection interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        item                       : IntPtr
        get_length                 : IntPtr
        propertyAppliedBy          : IntPtr
        propertyAppliedTrace       : IntPtr
        propertyAppliedTraceLength : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLStyleSheetRulesAppliedCollection.Vtbl()
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
     * 
     * @param {Integer} index 
     * @returns {IHTMLStyleSheetRule} 
     */
    item(index) {
        result := ComCall(7, this, "int", index, "ptr*", &ppHTMLStyleSheetRule := 0, "HRESULT")
        return IHTMLStyleSheetRule(ppHTMLStyleSheetRule)
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
     * @param {BSTR} name 
     * @returns {IHTMLStyleSheetRule} 
     */
    propertyAppliedBy(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(9, this, BSTR, name, "ptr*", &ppRule := 0, "HRESULT")
        return IHTMLStyleSheetRule(ppRule)
    }

    /**
     * 
     * @param {BSTR} name 
     * @param {Integer} index 
     * @returns {IHTMLStyleSheetRule} 
     */
    propertyAppliedTrace(name, index) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(10, this, BSTR, name, "int", index, "ptr*", &ppRule := 0, "HRESULT")
        return IHTMLStyleSheetRule(ppRule)
    }

    /**
     * 
     * @param {BSTR} name 
     * @returns {Integer} 
     */
    propertyAppliedTraceLength(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(11, this, BSTR, name, "int*", &pLength := 0, "HRESULT")
        return pLength
    }

    Query(iid) {
        if (IHTMLStyleSheetRulesAppliedCollection.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.item := CallbackCreate(GetMethod(implObj, "item"), flags, 3)
        this.vtbl.get_length := CallbackCreate(GetMethod(implObj, "get_length"), flags, 2)
        this.vtbl.propertyAppliedBy := CallbackCreate(GetMethod(implObj, "propertyAppliedBy"), flags, 3)
        this.vtbl.propertyAppliedTrace := CallbackCreate(GetMethod(implObj, "propertyAppliedTrace"), flags, 4)
        this.vtbl.propertyAppliedTraceLength := CallbackCreate(GetMethod(implObj, "propertyAppliedTraceLength"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.item)
        CallbackFree(this.vtbl.get_length)
        CallbackFree(this.vtbl.propertyAppliedBy)
        CallbackFree(this.vtbl.propertyAppliedTrace)
        CallbackFree(this.vtbl.propertyAppliedTraceLength)
    }
}
