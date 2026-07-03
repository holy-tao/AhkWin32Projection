#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IADs.ahk" { IADs }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * The IADsLocality interface is a dual interface that inherits from IADs.
 * @see https://learn.microsoft.com/windows/win32/api/iads/nn-iads-iadslocality
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct IADsLocality extends IADs {
    /**
     * The interface identifier for IADsLocality
     * @type {Guid}
     */
    static IID := Guid("{a05e03a2-effe-11cf-8abc-00c04fd8d503}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IADsLocality interfaces
    */
    struct Vtbl extends IADs.Vtbl {
        get_Description   : IntPtr
        put_Description   : IntPtr
        get_LocalityName  : IntPtr
        put_LocalityName  : IntPtr
        get_PostalAddress : IntPtr
        put_PostalAddress : IntPtr
        get_SeeAlso       : IntPtr
        put_SeeAlso       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IADsLocality.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    Description {
        get => this.get_Description()
        set => this.put_Description(value)
    }

    /**
     * @type {BSTR} 
     */
    LocalityName {
        get => this.get_LocalityName()
        set => this.put_LocalityName(value)
    }

    /**
     * @type {BSTR} 
     */
    PostalAddress {
        get => this.get_PostalAddress()
        set => this.put_PostalAddress(value)
    }

    /**
     * @type {VARIANT} 
     */
    SeeAlso {
        get => this.get_SeeAlso()
        set => this.put_SeeAlso(value)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Description() {
        retval := BSTR.Owned()
        result := ComCall(20, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrDescription 
     * @returns {HRESULT} 
     */
    put_Description(bstrDescription) {
        bstrDescription := bstrDescription is String ? BSTR.Alloc(bstrDescription).Value : bstrDescription

        result := ComCall(21, this, BSTR, bstrDescription, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_LocalityName() {
        retval := BSTR.Owned()
        result := ComCall(22, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrLocalityName 
     * @returns {HRESULT} 
     */
    put_LocalityName(bstrLocalityName) {
        bstrLocalityName := bstrLocalityName is String ? BSTR.Alloc(bstrLocalityName).Value : bstrLocalityName

        result := ComCall(23, this, BSTR, bstrLocalityName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_PostalAddress() {
        retval := BSTR.Owned()
        result := ComCall(24, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrPostalAddress 
     * @returns {HRESULT} 
     */
    put_PostalAddress(bstrPostalAddress) {
        bstrPostalAddress := bstrPostalAddress is String ? BSTR.Alloc(bstrPostalAddress).Value : bstrPostalAddress

        result := ComCall(25, this, BSTR, bstrPostalAddress, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_SeeAlso() {
        retval := VARIANT()
        result := ComCall(26, this, VARIANT.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {VARIANT} vSeeAlso 
     * @returns {HRESULT} 
     */
    put_SeeAlso(vSeeAlso) {
        result := ComCall(27, this, VARIANT, vSeeAlso, "HRESULT")
        return result
    }

    Query(iid) {
        if (IADsLocality.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Description := CallbackCreate(GetMethod(implObj, "get_Description"), flags, 2)
        this.vtbl.put_Description := CallbackCreate(GetMethod(implObj, "put_Description"), flags, 2)
        this.vtbl.get_LocalityName := CallbackCreate(GetMethod(implObj, "get_LocalityName"), flags, 2)
        this.vtbl.put_LocalityName := CallbackCreate(GetMethod(implObj, "put_LocalityName"), flags, 2)
        this.vtbl.get_PostalAddress := CallbackCreate(GetMethod(implObj, "get_PostalAddress"), flags, 2)
        this.vtbl.put_PostalAddress := CallbackCreate(GetMethod(implObj, "put_PostalAddress"), flags, 2)
        this.vtbl.get_SeeAlso := CallbackCreate(GetMethod(implObj, "get_SeeAlso"), flags, 2)
        this.vtbl.put_SeeAlso := CallbackCreate(GetMethod(implObj, "put_SeeAlso"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Description)
        CallbackFree(this.vtbl.put_Description)
        CallbackFree(this.vtbl.get_LocalityName)
        CallbackFree(this.vtbl.put_LocalityName)
        CallbackFree(this.vtbl.get_PostalAddress)
        CallbackFree(this.vtbl.put_PostalAddress)
        CallbackFree(this.vtbl.get_SeeAlso)
        CallbackFree(this.vtbl.put_SeeAlso)
    }
}
