#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 */
export default struct IIntelliForms extends IDispatch {
    /**
     * The interface identifier for IIntelliForms
     * @type {Guid}
     */
    static IID := Guid("{9b9f68e6-1aaa-11d2-bca5-00c04fd929db}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IIntelliForms interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_enabled : IntPtr
        put_enabled : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IIntelliForms.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    enabled {
        get => this.get_enabled()
        set => this.put_enabled(value)
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_enabled() {
        result := ComCall(7, this, VARIANT_BOOL.Ptr, &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {VARIANT_BOOL} bVal 
     * @returns {HRESULT} 
     */
    put_enabled(bVal) {
        result := ComCall(8, this, VARIANT_BOOL, bVal, "HRESULT")
        return result
    }

    Query(iid) {
        if (IIntelliForms.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_enabled := CallbackCreate(GetMethod(implObj, "get_enabled"), flags, 2)
        this.vtbl.put_enabled := CallbackCreate(GetMethod(implObj, "put_enabled"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_enabled)
        CallbackFree(this.vtbl.put_enabled)
    }
}
