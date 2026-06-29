#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * The IADsPostalAddress interface provides methods for an ADSI client to access the Postal Address attribute.
 * @see https://learn.microsoft.com/windows/win32/api/iads/nn-iads-iadspostaladdress
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct IADsPostalAddress extends IDispatch {
    /**
     * The interface identifier for IADsPostalAddress
     * @type {Guid}
     */
    static IID := Guid("{7adecf29-4680-11d1-a3b4-00c04fb950dc}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IADsPostalAddress interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_PostalAddress : IntPtr
        put_PostalAddress : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IADsPostalAddress.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT} 
     */
    PostalAddress {
        get => this.get_PostalAddress()
        set => this.put_PostalAddress(value)
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_PostalAddress() {
        retval := VARIANT()
        result := ComCall(7, this, VARIANT.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {VARIANT} vPostalAddress 
     * @returns {HRESULT} 
     */
    put_PostalAddress(vPostalAddress) {
        result := ComCall(8, this, VARIANT, vPostalAddress, "HRESULT")
        return result
    }

    Query(iid) {
        if (IADsPostalAddress.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_PostalAddress := CallbackCreate(GetMethod(implObj, "get_PostalAddress"), flags, 2)
        this.vtbl.put_PostalAddress := CallbackCreate(GetMethod(implObj, "put_PostalAddress"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_PostalAddress)
        CallbackFree(this.vtbl.put_PostalAddress)
    }
}
