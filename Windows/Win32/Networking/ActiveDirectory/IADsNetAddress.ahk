#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * The IADsNetAddress interface provides methods for an ADSI client to access the Net Address attribute.
 * @see https://learn.microsoft.com/windows/win32/api/iads/nn-iads-iadsnetaddress
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct IADsNetAddress extends IDispatch {
    /**
     * The interface identifier for IADsNetAddress
     * @type {Guid}
     */
    static IID := Guid("{b21a50a9-4080-11d1-a3ac-00c04fb950dc}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IADsNetAddress interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_AddressType : IntPtr
        put_AddressType : IntPtr
        get_Address     : IntPtr
        put_Address     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IADsNetAddress.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    AddressType {
        get => this.get_AddressType()
        set => this.put_AddressType(value)
    }

    /**
     * @type {VARIANT} 
     */
    Address {
        get => this.get_Address()
        set => this.put_Address(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AddressType() {
        result := ComCall(7, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {Integer} lnAddressType 
     * @returns {HRESULT} 
     */
    put_AddressType(lnAddressType) {
        result := ComCall(8, this, "int", lnAddressType, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_Address() {
        retval := VARIANT()
        result := ComCall(9, this, VARIANT.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {VARIANT} vAddress 
     * @returns {HRESULT} 
     */
    put_Address(vAddress) {
        result := ComCall(10, this, VARIANT, vAddress, "HRESULT")
        return result
    }

    Query(iid) {
        if (IADsNetAddress.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_AddressType := CallbackCreate(GetMethod(implObj, "get_AddressType"), flags, 2)
        this.vtbl.put_AddressType := CallbackCreate(GetMethod(implObj, "put_AddressType"), flags, 2)
        this.vtbl.get_Address := CallbackCreate(GetMethod(implObj, "get_Address"), flags, 2)
        this.vtbl.put_Address := CallbackCreate(GetMethod(implObj, "put_Address"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_AddressType)
        CallbackFree(this.vtbl.put_AddressType)
        CallbackFree(this.vtbl.get_Address)
        CallbackFree(this.vtbl.put_Address)
    }
}
