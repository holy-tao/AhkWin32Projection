#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLStyleSheetRuleApplied extends IDispatch {
    /**
     * The interface identifier for IHTMLStyleSheetRuleApplied
     * @type {Guid}
     */
    static IID := Guid("{305104c1-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLStyleSheetRuleApplied interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_msSpecificity : IntPtr
        msGetSpecificity  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLStyleSheetRuleApplied.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    msSpecificity {
        get => this.get_msSpecificity()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_msSpecificity() {
        result := ComCall(7, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {Integer} 
     */
    msGetSpecificity(index) {
        result := ComCall(8, this, "int", index, "int*", &p := 0, "HRESULT")
        return p
    }

    Query(iid) {
        if (IHTMLStyleSheetRuleApplied.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_msSpecificity := CallbackCreate(GetMethod(implObj, "get_msSpecificity"), flags, 2)
        this.vtbl.msGetSpecificity := CallbackCreate(GetMethod(implObj, "msGetSpecificity"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_msSpecificity)
        CallbackFree(this.vtbl.msGetSpecificity)
    }
}
