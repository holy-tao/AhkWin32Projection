#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IOCSPCAConfiguration.ahk" { IOCSPCAConfiguration }
#Import "..\..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * Represents a set of certificates for which an Online Certificate Status Protocol (OCSP) service has been configured to provide certificate status responses.
 * @see https://learn.microsoft.com/windows/win32/api/certadm/nn-certadm-iocspcaconfigurationcollection
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct IOCSPCAConfigurationCollection extends IDispatch {
    /**
     * The interface identifier for IOCSPCAConfigurationCollection
     * @type {Guid}
     */
    static IID := Guid("{2bebea0b-5ece-4f28-a91c-86b4bb20f0d3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IOCSPCAConfigurationCollection interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get__NewEnum          : IntPtr
        get_Item              : IntPtr
        get_Count             : IntPtr
        get_ItemByName        : IntPtr
        CreateCAConfiguration : IntPtr
        DeleteCAConfiguration : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IOCSPCAConfigurationCollection.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IUnknown} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * Gets an enumerator for the configuration set.
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-iocspcaconfigurationcollection-get__newenum
     */
    get__NewEnum() {
        result := ComCall(7, this, "ptr*", &pVal := 0, "HRESULT")
        return IUnknown(pVal)
    }

    /**
     * Gets a certification authority (CA) configuration identified by index in the configuration set.
     * @param {Integer} Index 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-iocspcaconfigurationcollection-get_item
     */
    get_Item(Index) {
        pVal := VARIANT()
        result := ComCall(8, this, "int", Index, VARIANT.Ptr, pVal, "HRESULT")
        return pVal
    }

    /**
     * Gets the number of certification authority (CA) configurations in the configuration set.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-iocspcaconfigurationcollection-get_count
     */
    get_Count() {
        result := ComCall(9, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Gets a certification authority (CA) configuration identified by name in the configuration set.
     * @param {BSTR} bstrIdentifier 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-iocspcaconfigurationcollection-get_itembyname
     */
    get_ItemByName(bstrIdentifier) {
        bstrIdentifier := bstrIdentifier is String ? BSTR.Alloc(bstrIdentifier).Value : bstrIdentifier

        pVal := VARIANT()
        result := ComCall(10, this, BSTR, bstrIdentifier, VARIANT.Ptr, pVal, "HRESULT")
        return pVal
    }

    /**
     * Creates a new certification authority (CA) configuration and adds it to the configuration set.
     * @param {BSTR} bstrIdentifier A string that contains a name for the new <a href="https://docs.microsoft.com/windows/desktop/api/certadm/nn-certadm-iocspcaconfiguration">IOCSPCAConfiguration</a> object.
     * @param {VARIANT} varCACert An X.509 CA certificate.
     * @returns {IOCSPCAConfiguration} The address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/certadm/nn-certadm-iocspcaconfiguration">IOCSPCAConfiguration</a> interface for the newly created object.
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-iocspcaconfigurationcollection-createcaconfiguration
     */
    CreateCAConfiguration(bstrIdentifier, varCACert) {
        bstrIdentifier := bstrIdentifier is String ? BSTR.Alloc(bstrIdentifier).Value : bstrIdentifier

        result := ComCall(11, this, BSTR, bstrIdentifier, VARIANT, varCACert, "ptr*", &ppVal := 0, "HRESULT")
        return IOCSPCAConfiguration(ppVal)
    }

    /**
     * Removes a named certification authority (CA) configuration from the configuration set.
     * @remarks
     * The <i>bstrIdentifier</i> value must be one previously set by the <a href="https://docs.microsoft.com/windows/desktop/api/certadm/nf-certadm-iocspcaconfigurationcollection-createcaconfiguration">CreateCAConfiguration</a> method.
     * @param {BSTR} bstrIdentifier A string that contains the name for the <a href="https://docs.microsoft.com/windows/desktop/api/certadm/nn-certadm-iocspcaconfiguration">IOCSPCAConfiguration</a> object.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-iocspcaconfigurationcollection-deletecaconfiguration
     */
    DeleteCAConfiguration(bstrIdentifier) {
        bstrIdentifier := bstrIdentifier is String ? BSTR.Alloc(bstrIdentifier).Value : bstrIdentifier

        result := ComCall(12, this, BSTR, bstrIdentifier, "HRESULT")
        return result
    }

    Query(iid) {
        if (IOCSPCAConfigurationCollection.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get__NewEnum := CallbackCreate(GetMethod(implObj, "get__NewEnum"), flags, 2)
        this.vtbl.get_Item := CallbackCreate(GetMethod(implObj, "get_Item"), flags, 3)
        this.vtbl.get_Count := CallbackCreate(GetMethod(implObj, "get_Count"), flags, 2)
        this.vtbl.get_ItemByName := CallbackCreate(GetMethod(implObj, "get_ItemByName"), flags, 3)
        this.vtbl.CreateCAConfiguration := CallbackCreate(GetMethod(implObj, "CreateCAConfiguration"), flags, 4)
        this.vtbl.DeleteCAConfiguration := CallbackCreate(GetMethod(implObj, "DeleteCAConfiguration"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get__NewEnum)
        CallbackFree(this.vtbl.get_Item)
        CallbackFree(this.vtbl.get_Count)
        CallbackFree(this.vtbl.get_ItemByName)
        CallbackFree(this.vtbl.CreateCAConfiguration)
        CallbackFree(this.vtbl.DeleteCAConfiguration)
    }
}
