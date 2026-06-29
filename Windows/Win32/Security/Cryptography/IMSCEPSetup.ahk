#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }
#Import ".\MSCEPSetupProperty.ahk" { MSCEPSetupProperty }

/**
 * Defines functionality to install and uninstall a Network Device Enrollment Service (NDES) role on a Certificate Services computer.
 * @see https://learn.microsoft.com/windows/win32/api/casetup/nn-casetup-imscepsetup
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct IMSCEPSetup extends IDispatch {
    /**
     * The interface identifier for IMSCEPSetup
     * @type {Guid}
     */
    static IID := Guid("{4f7761bb-9f3b-4592-9ee0-9a73259c313e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMSCEPSetup interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_MSCEPErrorId      : IntPtr
        get_MSCEPErrorString  : IntPtr
        InitializeDefaults    : IntPtr
        GetMSCEPSetupProperty : IntPtr
        SetMSCEPSetupProperty : IntPtr
        SetAccountInformation : IntPtr
        IsMSCEPStoreEmpty     : IntPtr
        GetProviderNameList   : IntPtr
        GetKeyLengthList      : IntPtr
        Install               : IntPtr
        PreUnInstall          : IntPtr
        PostUnInstall         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMSCEPSetup.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    MSCEPErrorId {
        get => this.get_MSCEPErrorId()
    }

    /**
     * @type {BSTR} 
     */
    MSCEPErrorString {
        get => this.get_MSCEPErrorString()
    }

    /**
     * Gets the ID for additional error information related to a failed Network Device Enrollment Service (NDES) specification. Any method call on the parent object resets this property.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/casetup/nf-casetup-imscepsetup-get_msceperrorid
     */
    get_MSCEPErrorId() {
        result := ComCall(7, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Contains the string data for additional error information related to a failed Network Device Enrollment Service (NDES) specification. Any method call on the parent object resets this property.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/casetup/nf-casetup-imscepsetup-get_msceperrorstring
     */
    get_MSCEPErrorString() {
        pVal := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, pVal, "HRESULT")
        return pVal
    }

    /**
     * Initializes a CMSCEPSetup object with default values to enable installation of a Network Device Enrollment Service (NDES) role.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/casetup/nf-casetup-imscepsetup-initializedefaults
     */
    InitializeDefaults() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * Gets a property value for a Network Device Enrollment Service (NDES) configuration.
     * @param {MSCEPSetupProperty} propertyId A value of the <a href="https://docs.microsoft.com/windows/win32/api/casetup/ne-casetup-mscepsetupproperty">MSCEPSetupProperty</a> enumeration that specifies the type of property to get.
     * @returns {VARIANT} A <b>VARIANT</b> that specifies the property value. The <b>VARIANT</b> type depends on the property type. For more information about the <b>VARIANT</b> type, see <a href="https://docs.microsoft.com/windows/win32/api/casetup/ne-casetup-mscepsetupproperty">MSCEPSetupProperty</a>.
     * @see https://learn.microsoft.com/windows/win32/api/casetup/nf-casetup-imscepsetup-getmscepsetupproperty
     */
    GetMSCEPSetupProperty(propertyId) {
        pVal := VARIANT()
        result := ComCall(10, this, MSCEPSetupProperty, propertyId, VARIANT.Ptr, pVal, "HRESULT")
        return pVal
    }

    /**
     * Sets a property value for a Network Device Enrollment Service (NDES) configuration.
     * @param {MSCEPSetupProperty} propertyId A value of the <a href="https://docs.microsoft.com/windows/win32/api/casetup/ne-casetup-mscepsetupproperty">MSCEPSetupProperty</a> enumeration that specifies the type of property to configure.
     * @param {Pointer<VARIANT>} pPropertyValue A pointer to a  <b>VARIANT</b> that specifies the property value. The <b>VARIANT</b> type depends on the property type. For more information about the <b>VARIANT</b> type, see <a href="https://docs.microsoft.com/windows/win32/api/casetup/ne-casetup-mscepsetupproperty">MSCEPSetupProperty</a>.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/casetup/nf-casetup-imscepsetup-setmscepsetupproperty
     */
    SetMSCEPSetupProperty(propertyId, pPropertyValue) {
        result := ComCall(11, this, MSCEPSetupProperty, propertyId, VARIANT.Ptr, pPropertyValue, "HRESULT")
        return result
    }

    /**
     * Sets the user account information used by the IIS Network Device Enrollment Service (NDES) extension to perform enrollment on behalf of network devices.
     * @remarks
     * The account must be a member of the <b>IIS_USRS</b> group on the computer.
     * 
     * If NDES is configured for an enterprise <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certification authority</a> (CA), the account must have read permission on the <b>IPSecIntermediateOffline</b> template.
     * @param {BSTR} bstrUserName A string that contains the name of the user account to use with the IIS extension in the form [<i>DomainName</i>\]<i>UserName</i>.
     * @param {BSTR} bstrPassword A string that contains the password for the user account.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/casetup/nf-casetup-imscepsetup-setaccountinformation
     */
    SetAccountInformation(bstrUserName, bstrPassword) {
        bstrUserName := bstrUserName is String ? BSTR.Alloc(bstrUserName).Value : bstrUserName
        bstrPassword := bstrPassword is String ? BSTR.Alloc(bstrPassword).Value : bstrPassword

        result := ComCall(12, this, BSTR, bstrUserName, BSTR, bstrPassword, "HRESULT")
        return result
    }

    /**
     * Always returns VARIANT_TRUE. It should not be used.
     * @remarks
     * For the Network Device Enrollment Service (NDES) role, the My personal store is used. The default implementation does not use a separate store for signing and exchange certificates.
     * @returns {VARIANT_BOOL} This parameter always contains <b>VARIANT_TRUE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/casetup/nf-casetup-imscepsetup-ismscepstoreempty
     */
    IsMSCEPStoreEmpty() {
        result := ComCall(13, this, VARIANT_BOOL.Ptr, &pbEmpty := 0, "HRESULT")
        return pbEmpty
    }

    /**
     * Gets the list of cryptographic service providers (CSPs) that provide asymmetric key signature and exchange algorithms on the computer.
     * @param {VARIANT_BOOL} bExchange A value that indicates whether the provider names are for exchange key algorithms. A <b>VARIANT_TRUE</b>  value indicates exchange key providers; otherwise, the providers are for signing keys.
     * @returns {VARIANT} A pointer to a <b>VARIANT</b>  array of <b>VT_BSTR</b> types, where each string represents the name of a CSP.
     * @see https://learn.microsoft.com/windows/win32/api/casetup/nf-casetup-imscepsetup-getprovidernamelist
     */
    GetProviderNameList(bExchange) {
        pVal := VARIANT()
        result := ComCall(14, this, VARIANT_BOOL, bExchange, VARIANT.Ptr, pVal, "HRESULT")
        return pVal
    }

    /**
     * Gets the list of key lengths supported by the specified cryptographic service provider (CSP). (IMSCEPSetup.GetKeyLengthList)
     * @param {VARIANT_BOOL} bExchange A value that indicates whether the listed lengths are for an exchange key algorithm. A <b>VARIANT_TRUE</b>  value indicates exchange key lengths; otherwise, the lengths are for signing keys.
     * @param {BSTR} bstrProviderName A string that contains the name of the CSP.
     * @returns {VARIANT} A pointer to a  <b>VARIANT</b> array of <b>VT_UI4</b> types that correspond to the key lengths supported by the CSP.
     * @see https://learn.microsoft.com/windows/win32/api/casetup/nf-casetup-imscepsetup-getkeylengthlist
     */
    GetKeyLengthList(bExchange, bstrProviderName) {
        bstrProviderName := bstrProviderName is String ? BSTR.Alloc(bstrProviderName).Value : bstrProviderName

        pVal := VARIANT()
        result := ComCall(15, this, VARIANT_BOOL, bExchange, BSTR, bstrProviderName, VARIANT.Ptr, pVal, "HRESULT")
        return pVal
    }

    /**
     * Installs a Network Device Enrollment Service (NDES) role as configured in a CMSCEPSetup object.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/casetup/nf-casetup-imscepsetup-install
     */
    Install() {
        result := ComCall(16, this, "HRESULT")
        return result
    }

    /**
     * Removes registry and IIS settings for the Network Device Enrollment Service (NDES) role.
     * @remarks
     * You can use this method to support an uninstall of an NDES role. The role must be already installed on the computer. This method should be called before calling the role-specific component-based servicing (CBS) uninstall process.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/casetup/nf-casetup-imscepsetup-preuninstall
     */
    PreUnInstall() {
        result := ComCall(17, this, "HRESULT")
        return result
    }

    /**
     * Is not implemented. It is reserved for future use.
     * @returns {HRESULT} This method does not return a value.
     * @see https://learn.microsoft.com/windows/win32/api/casetup/nf-casetup-imscepsetup-postuninstall
     */
    PostUnInstall() {
        result := ComCall(18, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMSCEPSetup.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_MSCEPErrorId := CallbackCreate(GetMethod(implObj, "get_MSCEPErrorId"), flags, 2)
        this.vtbl.get_MSCEPErrorString := CallbackCreate(GetMethod(implObj, "get_MSCEPErrorString"), flags, 2)
        this.vtbl.InitializeDefaults := CallbackCreate(GetMethod(implObj, "InitializeDefaults"), flags, 1)
        this.vtbl.GetMSCEPSetupProperty := CallbackCreate(GetMethod(implObj, "GetMSCEPSetupProperty"), flags, 3)
        this.vtbl.SetMSCEPSetupProperty := CallbackCreate(GetMethod(implObj, "SetMSCEPSetupProperty"), flags, 3)
        this.vtbl.SetAccountInformation := CallbackCreate(GetMethod(implObj, "SetAccountInformation"), flags, 3)
        this.vtbl.IsMSCEPStoreEmpty := CallbackCreate(GetMethod(implObj, "IsMSCEPStoreEmpty"), flags, 2)
        this.vtbl.GetProviderNameList := CallbackCreate(GetMethod(implObj, "GetProviderNameList"), flags, 3)
        this.vtbl.GetKeyLengthList := CallbackCreate(GetMethod(implObj, "GetKeyLengthList"), flags, 4)
        this.vtbl.Install := CallbackCreate(GetMethod(implObj, "Install"), flags, 1)
        this.vtbl.PreUnInstall := CallbackCreate(GetMethod(implObj, "PreUnInstall"), flags, 1)
        this.vtbl.PostUnInstall := CallbackCreate(GetMethod(implObj, "PostUnInstall"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_MSCEPErrorId)
        CallbackFree(this.vtbl.get_MSCEPErrorString)
        CallbackFree(this.vtbl.InitializeDefaults)
        CallbackFree(this.vtbl.GetMSCEPSetupProperty)
        CallbackFree(this.vtbl.SetMSCEPSetupProperty)
        CallbackFree(this.vtbl.SetAccountInformation)
        CallbackFree(this.vtbl.IsMSCEPStoreEmpty)
        CallbackFree(this.vtbl.GetProviderNameList)
        CallbackFree(this.vtbl.GetKeyLengthList)
        CallbackFree(this.vtbl.Install)
        CallbackFree(this.vtbl.PreUnInstall)
        CallbackFree(this.vtbl.PostUnInstall)
    }
}
