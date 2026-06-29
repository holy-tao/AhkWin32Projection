#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\X509CertificateEnrollmentContext.ahk" { X509CertificateEnrollmentContext }
#Import ".\PolicyServerUrlPropertyID.ahk" { PolicyServerUrlPropertyID }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\PolicyServerUrlFlags.ahk" { PolicyServerUrlFlags }
#Import "..\..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\X509EnrollmentAuthFlags.ahk" { X509EnrollmentAuthFlags }

/**
 * The IX509PolicyServerUrl interface can be used to set or retrieve property values associated with the certificate enrollment policy (CEP) server and to update associated registry values.
 * @see https://learn.microsoft.com/windows/win32/api/certenroll/nn-certenroll-ix509policyserverurl
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct IX509PolicyServerUrl extends IDispatch {
    /**
     * The interface identifier for IX509PolicyServerUrl
     * @type {Guid}
     */
    static IID := Guid("{884e204a-217d-11da-b2a4-000e7bbb2b09}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IX509PolicyServerUrl interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        Initialize         : IntPtr
        get_Url            : IntPtr
        put_Url            : IntPtr
        get_Default        : IntPtr
        put_Default        : IntPtr
        get_Flags          : IntPtr
        put_Flags          : IntPtr
        get_AuthFlags      : IntPtr
        put_AuthFlags      : IntPtr
        get_Cost           : IntPtr
        put_Cost           : IntPtr
        GetStringProperty  : IntPtr
        SetStringProperty  : IntPtr
        UpdateRegistry     : IntPtr
        RemoveFromRegistry : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IX509PolicyServerUrl.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    Url {
        get => this.get_Url()
        set => this.put_Url(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    Default {
        get => this.get_Default()
        set => this.put_Default(value)
    }

    /**
     * @type {PolicyServerUrlFlags} 
     */
    Flags {
        get => this.get_Flags()
        set => this.put_Flags(value)
    }

    /**
     * @type {X509EnrollmentAuthFlags} 
     */
    AuthFlags {
        get => this.get_AuthFlags()
        set => this.put_AuthFlags(value)
    }

    /**
     * @type {Integer} 
     */
    Cost {
        get => this.get_Cost()
        set => this.put_Cost(value)
    }

    /**
     * Initializes an IX509PolicyServerUrl object for a computer or user context.
     * @param {X509CertificateEnrollmentContext} _context 
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following table.  For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_ALREADY_INITIALIZED)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509policyserverurl">IX509PolicyServerUrl</a> has already been initialized.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509policyserverurl-initialize
     */
    Initialize(_context) {
        result := ComCall(7, this, X509CertificateEnrollmentContext, _context, "HRESULT")
        return result
    }

    /**
     * Specifies or retrieves the URL for the certificate enrollment policy (CEP) server. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509policyserverurl-get_url
     */
    get_Url() {
        ppValue := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, ppValue, "HRESULT")
        return ppValue
    }

    /**
     * Specifies or retrieves the URL for the certificate enrollment policy (CEP) server. (Put)
     * @param {BSTR} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509policyserverurl-put_url
     */
    put_Url(pValue) {
        pValue := pValue is String ? BSTR.Alloc(pValue).Value : pValue

        result := ComCall(9, this, BSTR, pValue, "HRESULT")
        return result
    }

    /**
     * Specifies and retrieves a Boolean value that indicates whether this is the default certificate enrollment policy (CEP) server. (Get)
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509policyserverurl-get_default
     */
    get_Default() {
        result := ComCall(10, this, VARIANT_BOOL.Ptr, &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Specifies and retrieves a Boolean value that indicates whether this is the default certificate enrollment policy (CEP) server. (Put)
     * @param {VARIANT_BOOL} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509policyserverurl-put_default
     */
    put_Default(value) {
        result := ComCall(11, this, VARIANT_BOOL, value, "HRESULT")
        return result
    }

    /**
     * Specifies or retrieves a value that indicates whether the certificate enrollment policy (CEP) server policy information can be loaded from group policy, from the registry, or both. (Get)
     * @remarks
     * When the PsfLocationGroupPolicy and PsfLocationRegistry flags are combined, this method reads policy information from the local registry and combines it with policy information specified by group policy.
     * @returns {PolicyServerUrlFlags} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509policyserverurl-get_flags
     */
    get_Flags() {
        result := ComCall(12, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Specifies or retrieves a value that indicates whether the certificate enrollment policy (CEP) server policy information can be loaded from group policy, from the registry, or both. (Put)
     * @remarks
     * When the PsfLocationGroupPolicy and PsfLocationRegistry flags are combined, this method reads policy information from the local registry and combines it with policy information specified by group policy.
     * @param {PolicyServerUrlFlags} Flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509policyserverurl-put_flags
     */
    put_Flags(Flags) {
        result := ComCall(13, this, PolicyServerUrlFlags, Flags, "HRESULT")
        return result
    }

    /**
     * Specifies and retrieves a value that indicates the authentication type used by the client to authenticate itself to the certificate enrollment policy (CEP) server. (Get)
     * @returns {X509EnrollmentAuthFlags} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509policyserverurl-get_authflags
     */
    get_AuthFlags() {
        result := ComCall(14, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Specifies and retrieves a value that indicates the authentication type used by the client to authenticate itself to the certificate enrollment policy (CEP) server. (Put)
     * @param {X509EnrollmentAuthFlags} Flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509policyserverurl-put_authflags
     */
    put_AuthFlags(Flags) {
        result := ComCall(15, this, X509EnrollmentAuthFlags, Flags, "HRESULT")
        return result
    }

    /**
     * Specifies and retrieves an arbitrary cost for contacting the certificate enrollment policy server. (IX509PolicyServerUrl.get_Cost)
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509policyserverurl-get_cost
     */
    get_Cost() {
        result := ComCall(16, this, "uint*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Specifies and retrieves an arbitrary cost for contacting the certificate enrollment policy server. (IX509PolicyServerUrl.put_Cost)
     * @param {Integer} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509policyserverurl-put_cost
     */
    put_Cost(value) {
        result := ComCall(17, this, "uint", value, "HRESULT")
        return result
    }

    /**
     * Retrieves the certificate enrollment policy (CEP) server ID or the display name of the CEP server.
     * @param {PolicyServerUrlPropertyID} propertyId 
     * @returns {BSTR} Pointer to a <b>BSTR</b> variable that receives the property value.
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509policyserverurl-getstringproperty
     */
    GetStringProperty(propertyId) {
        ppValue := BSTR.Owned()
        result := ComCall(18, this, PolicyServerUrlPropertyID, propertyId, BSTR.Ptr, ppValue, "HRESULT")
        return ppValue
    }

    /**
     * Specifies the certificate enrollment policy (CEP) server ID or the display name of the CEP server.
     * @param {PolicyServerUrlPropertyID} propertyId 
     * @param {BSTR} pValue A <b>BSTR</b> variable that receives the property value.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following table.  For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pValue</i> parameter cannot be <b>NULL</b> or empty.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Memory could not be allocated for the property value.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509policyserverurl-setstringproperty
     */
    SetStringProperty(propertyId, pValue) {
        pValue := pValue is String ? BSTR.Alloc(pValue).Value : pValue

        result := ComCall(19, this, PolicyServerUrlPropertyID, propertyId, BSTR, pValue, "HRESULT")
        return result
    }

    /**
     * Registers a certificate enrollment policy (CEP) server.
     * @remarks
     * The <b>UpdateRegistry</b> method is called by the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509enrollmenthelper-addpolicyserver">AddPolicyServer</a> method.
     * @param {X509CertificateEnrollmentContext} _context 
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following table.  For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The URL of the policy server is empty.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_ACCESS_DISABLED_BY_POLICY)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * You do not have sufficient access rights to register the CEP.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509policyserverurl-updateregistry
     */
    UpdateRegistry(_context) {
        result := ComCall(20, this, X509CertificateEnrollmentContext, _context, "HRESULT")
        return result
    }

    /**
     * Unregisters a certificate enrollment policy (CEP) server.
     * @param {X509CertificateEnrollmentContext} _context 
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following table.  For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_ACCESS_DISABLED_BY_POLICY)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * You do not have sufficient access rights to unregister the CEP.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509policyserverurl-removefromregistry
     */
    RemoveFromRegistry(_context) {
        result := ComCall(21, this, X509CertificateEnrollmentContext, _context, "HRESULT")
        return result
    }

    Query(iid) {
        if (IX509PolicyServerUrl.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 2)
        this.vtbl.get_Url := CallbackCreate(GetMethod(implObj, "get_Url"), flags, 2)
        this.vtbl.put_Url := CallbackCreate(GetMethod(implObj, "put_Url"), flags, 2)
        this.vtbl.get_Default := CallbackCreate(GetMethod(implObj, "get_Default"), flags, 2)
        this.vtbl.put_Default := CallbackCreate(GetMethod(implObj, "put_Default"), flags, 2)
        this.vtbl.get_Flags := CallbackCreate(GetMethod(implObj, "get_Flags"), flags, 2)
        this.vtbl.put_Flags := CallbackCreate(GetMethod(implObj, "put_Flags"), flags, 2)
        this.vtbl.get_AuthFlags := CallbackCreate(GetMethod(implObj, "get_AuthFlags"), flags, 2)
        this.vtbl.put_AuthFlags := CallbackCreate(GetMethod(implObj, "put_AuthFlags"), flags, 2)
        this.vtbl.get_Cost := CallbackCreate(GetMethod(implObj, "get_Cost"), flags, 2)
        this.vtbl.put_Cost := CallbackCreate(GetMethod(implObj, "put_Cost"), flags, 2)
        this.vtbl.GetStringProperty := CallbackCreate(GetMethod(implObj, "GetStringProperty"), flags, 3)
        this.vtbl.SetStringProperty := CallbackCreate(GetMethod(implObj, "SetStringProperty"), flags, 3)
        this.vtbl.UpdateRegistry := CallbackCreate(GetMethod(implObj, "UpdateRegistry"), flags, 2)
        this.vtbl.RemoveFromRegistry := CallbackCreate(GetMethod(implObj, "RemoveFromRegistry"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Initialize)
        CallbackFree(this.vtbl.get_Url)
        CallbackFree(this.vtbl.put_Url)
        CallbackFree(this.vtbl.get_Default)
        CallbackFree(this.vtbl.put_Default)
        CallbackFree(this.vtbl.get_Flags)
        CallbackFree(this.vtbl.put_Flags)
        CallbackFree(this.vtbl.get_AuthFlags)
        CallbackFree(this.vtbl.put_AuthFlags)
        CallbackFree(this.vtbl.get_Cost)
        CallbackFree(this.vtbl.put_Cost)
        CallbackFree(this.vtbl.GetStringProperty)
        CallbackFree(this.vtbl.SetStringProperty)
        CallbackFree(this.vtbl.UpdateRegistry)
        CallbackFree(this.vtbl.RemoveFromRegistry)
    }
}
