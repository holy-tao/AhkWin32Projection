#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * The IX509PolicyServerUrl interface can be used to set or retrieve property values associated with the certificate enrollment policy (CEP) server and to update associated registry values.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/nn-certenroll-ix509policyserverurl
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IX509PolicyServerUrl extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IX509PolicyServerUrl
     * @type {Guid}
     */
    static IID => Guid("{884e204a-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "get_Url", "put_Url", "get_Default", "put_Default", "get_Flags", "put_Flags", "get_AuthFlags", "put_AuthFlags", "get_Cost", "put_Cost", "GetStringProperty", "SetStringProperty", "UpdateRegistry", "RemoveFromRegistry"]

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
     * @type {Integer} 
     */
    Flags {
        get => this.get_Flags()
        set => this.put_Flags(value)
    }

    /**
     * @type {Integer} 
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
     * @param {Integer} context 
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following table.  For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
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
     * The <a href="/windows/desktop/api/certenroll/nn-certenroll-ix509policyserverurl">IX509PolicyServerUrl</a> has already been initialized.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509policyserverurl-initialize
     */
    Initialize(context) {
        result := ComCall(7, this, "int", context, "HRESULT")
        return result
    }

    /**
     * Specifies or retrieves the URL for the certificate enrollment policy (CEP) server.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509policyserverurl-get_url
     */
    get_Url() {
        ppValue := BSTR()
        result := ComCall(8, this, "ptr", ppValue, "HRESULT")
        return ppValue
    }

    /**
     * Specifies or retrieves the URL for the certificate enrollment policy (CEP) server.
     * @param {BSTR} pValue 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509policyserverurl-put_url
     */
    put_Url(pValue) {
        pValue := pValue is String ? BSTR.Alloc(pValue).Value : pValue

        result := ComCall(9, this, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * Specifies and retrieves a Boolean value that indicates whether this is the default certificate enrollment policy (CEP) server.
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509policyserverurl-get_default
     */
    get_Default() {
        result := ComCall(10, this, "short*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Specifies and retrieves a Boolean value that indicates whether this is the default certificate enrollment policy (CEP) server.
     * @param {VARIANT_BOOL} value 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509policyserverurl-put_default
     */
    put_Default(value) {
        result := ComCall(11, this, "short", value, "HRESULT")
        return result
    }

    /**
     * Specifies or retrieves a value that indicates whether the certificate enrollment policy (CEP) server policy information can be loaded from group policy, from the registry, or both.
     * @remarks
     * 
     * When the PsfLocationGroupPolicy and PsfLocationRegistry flags are combined, this method reads policy information from the local registry and combines it with policy information specified by group policy.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509policyserverurl-get_flags
     */
    get_Flags() {
        result := ComCall(12, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Specifies or retrieves a value that indicates whether the certificate enrollment policy (CEP) server policy information can be loaded from group policy, from the registry, or both.
     * @remarks
     * 
     * When the PsfLocationGroupPolicy and PsfLocationRegistry flags are combined, this method reads policy information from the local registry and combines it with policy information specified by group policy.
     * 
     * 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509policyserverurl-put_flags
     */
    put_Flags(Flags) {
        result := ComCall(13, this, "int", Flags, "HRESULT")
        return result
    }

    /**
     * Specifies and retrieves a value that indicates the authentication type used by the client to authenticate itself to the certificate enrollment policy (CEP) server.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509policyserverurl-get_authflags
     */
    get_AuthFlags() {
        result := ComCall(14, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Specifies and retrieves a value that indicates the authentication type used by the client to authenticate itself to the certificate enrollment policy (CEP) server.
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509policyserverurl-put_authflags
     */
    put_AuthFlags(Flags) {
        result := ComCall(15, this, "int", Flags, "HRESULT")
        return result
    }

    /**
     * Specifies and retrieves an arbitrary cost for contacting the certificate enrollment policy server.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509policyserverurl-get_cost
     */
    get_Cost() {
        result := ComCall(16, this, "uint*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Specifies and retrieves an arbitrary cost for contacting the certificate enrollment policy server.
     * @param {Integer} value 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509policyserverurl-put_cost
     */
    put_Cost(value) {
        result := ComCall(17, this, "uint", value, "HRESULT")
        return result
    }

    /**
     * Retrieves the certificate enrollment policy (CEP) server ID or the display name of the CEP server.
     * @param {Integer} propertyId 
     * @returns {BSTR} Pointer to a <b>BSTR</b> variable that receives the property value.
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509policyserverurl-getstringproperty
     */
    GetStringProperty(propertyId) {
        ppValue := BSTR()
        result := ComCall(18, this, "int", propertyId, "ptr", ppValue, "HRESULT")
        return ppValue
    }

    /**
     * Specifies the certificate enrollment policy (CEP) server ID or the display name of the CEP server.
     * @param {Integer} propertyId 
     * @param {BSTR} pValue A <b>BSTR</b> variable that receives the property value.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following table.  For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
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
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509policyserverurl-setstringproperty
     */
    SetStringProperty(propertyId, pValue) {
        pValue := pValue is String ? BSTR.Alloc(pValue).Value : pValue

        result := ComCall(19, this, "int", propertyId, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * Registers a certificate enrollment policy (CEP) server.
     * @param {Integer} context 
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following table.  For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
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
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509policyserverurl-updateregistry
     */
    UpdateRegistry(context) {
        result := ComCall(20, this, "int", context, "HRESULT")
        return result
    }

    /**
     * Unregisters a certificate enrollment policy (CEP) server.
     * @param {Integer} context 
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following table.  For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
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
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509policyserverurl-removefromregistry
     */
    RemoveFromRegistry(context) {
        result := ComCall(21, this, "int", context, "HRESULT")
        return result
    }
}
