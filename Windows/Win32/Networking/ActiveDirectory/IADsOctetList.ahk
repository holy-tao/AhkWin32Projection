#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * The IADsOctetList interface provides methods for an ADSI client to access the Octet List attribute.
 * @see https://learn.microsoft.com/windows/win32/api/iads/nn-iads-iadsoctetlist
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct IADsOctetList extends IDispatch {
    /**
     * The interface identifier for IADsOctetList
     * @type {Guid}
     */
    static IID := Guid("{7b28b80f-4680-11d1-a3b4-00c04fb950dc}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IADsOctetList interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_OctetList : IntPtr
        put_OctetList : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IADsOctetList.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT} 
     */
    OctetList {
        get => this.get_OctetList()
        set => this.put_OctetList(value)
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_OctetList() {
        retval := VARIANT()
        result := ComCall(7, this, VARIANT.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {VARIANT} vOctetList 
     * @returns {HRESULT} 
     */
    put_OctetList(vOctetList) {
        result := ComCall(8, this, VARIANT, vOctetList, "HRESULT")
        return result
    }

    Query(iid) {
        if (IADsOctetList.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_OctetList := CallbackCreate(GetMethod(implObj, "get_OctetList"), flags, 2)
        this.vtbl.put_OctetList := CallbackCreate(GetMethod(implObj, "put_OctetList"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_OctetList)
        CallbackFree(this.vtbl.put_OctetList)
    }
}
