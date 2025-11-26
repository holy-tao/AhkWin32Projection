#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IX509CertificateTemplates.ahk
#Include .\ICertificationAuthorities.ahk
#Include .\IObjectIds.ahk
#Include ..\..\..\System\Variant\VARIANT.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * The IX509EnrollmentPolicyServer interface represents a certificate enrollment policy (CEP) server.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/nn-certenroll-ix509enrollmentpolicyserver
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IX509EnrollmentPolicyServer extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IX509EnrollmentPolicyServer
     * @type {Guid}
     */
    static IID => Guid("{13b79026-2181-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "LoadPolicy", "GetTemplates", "GetCAsForTemplate", "GetCAs", "Validate", "GetCustomOids", "GetNextUpdateTime", "GetLastUpdateTime", "GetPolicyServerUrl", "GetPolicyServerId", "GetFriendlyName", "GetIsDefaultCEP", "GetUseClientId", "GetAllowUnTrustedCA", "GetCachePath", "GetCacheDir", "GetAuthFlags", "SetCredential", "QueryChanges", "InitializeImport", "Export", "get_Cost", "put_Cost"]

    /**
     * @type {Integer} 
     */
    Cost {
        get => this.get_Cost()
        set => this.put_Cost(value)
    }

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @param {BSTR} bstrPolicyServerUrl 
     * @param {BSTR} bstrPolicyServerId 
     * @param {Integer} authFlags 
     * @param {VARIANT_BOOL} fIsUnTrusted 
     * @param {Integer} context 
     * @returns {HRESULT} <ul>
     * <li><b>S_OK</b> - Successfully initialized for the first time on the current thread</li>
     * <li><b>S_FALSE</b> - Successful nested initialization (current thread was already 
     *         initialized for the specified apartment type)</li>
     * <li><b>E_INVALIDARG</b> - Invalid <i>initType</i> value</li>
     * <li><b>CO_E_INIT_TLS</b> - Failed to allocate COM's internal TLS structure</li>
     * <li><b>E_OUTOFMEMORY</b> - Failed to allocate per-thread/per-apartment structures other 
     *         than the TLS</li>
     * <li><b>RPC_E_CHANGED_MODE</b> - The current thread is already initialized for a different 
     *         apartment type from what is specified.</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//roapi/nf-roapi-initialize
     */
    Initialize(bstrPolicyServerUrl, bstrPolicyServerId, authFlags, fIsUnTrusted, context) {
        bstrPolicyServerUrl := bstrPolicyServerUrl is String ? BSTR.Alloc(bstrPolicyServerUrl).Value : bstrPolicyServerUrl
        bstrPolicyServerId := bstrPolicyServerId is String ? BSTR.Alloc(bstrPolicyServerId).Value : bstrPolicyServerId

        result := ComCall(7, this, "ptr", bstrPolicyServerUrl, "ptr", bstrPolicyServerId, "int", authFlags, "short", fIsUnTrusted, "int", context, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} option 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509enrollmentpolicyserver-loadpolicy
     */
    LoadPolicy(option) {
        result := ComCall(8, this, "int", option, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IX509CertificateTemplates} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509enrollmentpolicyserver-gettemplates
     */
    GetTemplates() {
        result := ComCall(9, this, "ptr*", &pTemplates := 0, "HRESULT")
        return IX509CertificateTemplates(pTemplates)
    }

    /**
     * 
     * @param {IX509CertificateTemplate} pTemplate 
     * @returns {ICertificationAuthorities} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509enrollmentpolicyserver-getcasfortemplate
     */
    GetCAsForTemplate(pTemplate) {
        result := ComCall(10, this, "ptr", pTemplate, "ptr*", &ppCAs := 0, "HRESULT")
        return ICertificationAuthorities(ppCAs)
    }

    /**
     * 
     * @returns {ICertificationAuthorities} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509enrollmentpolicyserver-getcas
     */
    GetCAs() {
        result := ComCall(11, this, "ptr*", &ppCAs := 0, "HRESULT")
        return ICertificationAuthorities(ppCAs)
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509enrollmentpolicyserver-validate
     */
    Validate() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IObjectIds} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509enrollmentpolicyserver-getcustomoids
     */
    GetCustomOids() {
        result := ComCall(13, this, "ptr*", &ppObjectIds := 0, "HRESULT")
        return IObjectIds(ppObjectIds)
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509enrollmentpolicyserver-getnextupdatetime
     */
    GetNextUpdateTime() {
        result := ComCall(14, this, "double*", &pDate := 0, "HRESULT")
        return pDate
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509enrollmentpolicyserver-getlastupdatetime
     */
    GetLastUpdateTime() {
        result := ComCall(15, this, "double*", &pDate := 0, "HRESULT")
        return pDate
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509enrollmentpolicyserver-getpolicyserverurl
     */
    GetPolicyServerUrl() {
        pValue := BSTR()
        result := ComCall(16, this, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509enrollmentpolicyserver-getpolicyserverid
     */
    GetPolicyServerId() {
        pValue := BSTR()
        result := ComCall(17, this, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509enrollmentpolicyserver-getfriendlyname
     */
    GetFriendlyName() {
        pValue := BSTR()
        result := ComCall(18, this, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509enrollmentpolicyserver-getisdefaultcep
     */
    GetIsDefaultCEP() {
        result := ComCall(19, this, "short*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509enrollmentpolicyserver-getuseclientid
     */
    GetUseClientId() {
        result := ComCall(20, this, "short*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509enrollmentpolicyserver-getallowuntrustedca
     */
    GetAllowUnTrustedCA() {
        result := ComCall(21, this, "short*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509enrollmentpolicyserver-getcachepath
     */
    GetCachePath() {
        pValue := BSTR()
        result := ComCall(22, this, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509enrollmentpolicyserver-getcachedir
     */
    GetCacheDir() {
        pValue := BSTR()
        result := ComCall(23, this, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509enrollmentpolicyserver-getauthflags
     */
    GetAuthFlags() {
        result := ComCall(24, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {Integer} hWndParent 
     * @param {Integer} flag 
     * @param {BSTR} strCredential 
     * @param {BSTR} strPassword 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509enrollmentpolicyserver-setcredential
     */
    SetCredential(hWndParent, flag, strCredential, strPassword) {
        strCredential := strCredential is String ? BSTR.Alloc(strCredential).Value : strCredential
        strPassword := strPassword is String ? BSTR.Alloc(strPassword).Value : strPassword

        result := ComCall(25, this, "int", hWndParent, "int", flag, "ptr", strCredential, "ptr", strPassword, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509enrollmentpolicyserver-querychanges
     */
    QueryChanges() {
        result := ComCall(26, this, "short*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {VARIANT} val 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509enrollmentpolicyserver-initializeimport
     */
    InitializeImport(val) {
        result := ComCall(27, this, "ptr", val, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} exportFlags 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509enrollmentpolicyserver-export
     */
    Export(exportFlags) {
        pVal := VARIANT()
        result := ComCall(28, this, "int", exportFlags, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509enrollmentpolicyserver-get_cost
     */
    get_Cost() {
        result := ComCall(29, this, "uint*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509enrollmentpolicyserver-put_cost
     */
    put_Cost(value) {
        result := ComCall(30, this, "uint", value, "HRESULT")
        return result
    }
}
