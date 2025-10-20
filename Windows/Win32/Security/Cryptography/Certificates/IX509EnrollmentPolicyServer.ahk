#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * The IX509EnrollmentPolicyServer interface represents a certificate enrollment policy (CEP) server.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/nn-certenroll-ix509enrollmentpolicyserver
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IX509EnrollmentPolicyServer extends IDispatch{
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

        result := ComCall(7, this, "ptr", bstrPolicyServerUrl, "ptr", bstrPolicyServerId, "int", authFlags, "short", fIsUnTrusted, "int", context, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} option 
     * @returns {HRESULT} 
     */
    LoadPolicy(option) {
        result := ComCall(8, this, "int", option, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IX509CertificateTemplates>} pTemplates 
     * @returns {HRESULT} 
     */
    GetTemplates(pTemplates) {
        result := ComCall(9, this, "ptr", pTemplates, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IX509CertificateTemplate>} pTemplate 
     * @param {Pointer<ICertificationAuthorities>} ppCAs 
     * @returns {HRESULT} 
     */
    GetCAsForTemplate(pTemplate, ppCAs) {
        result := ComCall(10, this, "ptr", pTemplate, "ptr", ppCAs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ICertificationAuthorities>} ppCAs 
     * @returns {HRESULT} 
     */
    GetCAs(ppCAs) {
        result := ComCall(11, this, "ptr", ppCAs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Validate() {
        result := ComCall(12, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IObjectIds>} ppObjectIds 
     * @returns {HRESULT} 
     */
    GetCustomOids(ppObjectIds) {
        result := ComCall(13, this, "ptr", ppObjectIds, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} pDate 
     * @returns {HRESULT} 
     */
    GetNextUpdateTime(pDate) {
        result := ComCall(14, this, "double*", pDate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} pDate 
     * @returns {HRESULT} 
     */
    GetLastUpdateTime(pDate) {
        result := ComCall(15, this, "double*", pDate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pValue 
     * @returns {HRESULT} 
     */
    GetPolicyServerUrl(pValue) {
        result := ComCall(16, this, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pValue 
     * @returns {HRESULT} 
     */
    GetPolicyServerId(pValue) {
        result := ComCall(17, this, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pValue 
     * @returns {HRESULT} 
     */
    GetFriendlyName(pValue) {
        result := ComCall(18, this, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pValue 
     * @returns {HRESULT} 
     */
    GetIsDefaultCEP(pValue) {
        result := ComCall(19, this, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pValue 
     * @returns {HRESULT} 
     */
    GetUseClientId(pValue) {
        result := ComCall(20, this, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pValue 
     * @returns {HRESULT} 
     */
    GetAllowUnTrustedCA(pValue) {
        result := ComCall(21, this, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pValue 
     * @returns {HRESULT} 
     */
    GetCachePath(pValue) {
        result := ComCall(22, this, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pValue 
     * @returns {HRESULT} 
     */
    GetCacheDir(pValue) {
        result := ComCall(23, this, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pValue 
     * @returns {HRESULT} 
     */
    GetAuthFlags(pValue) {
        result := ComCall(24, this, "int*", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} hWndParent 
     * @param {Integer} flag 
     * @param {BSTR} strCredential 
     * @param {BSTR} strPassword 
     * @returns {HRESULT} 
     */
    SetCredential(hWndParent, flag, strCredential, strPassword) {
        strCredential := strCredential is String ? BSTR.Alloc(strCredential).Value : strCredential
        strPassword := strPassword is String ? BSTR.Alloc(strPassword).Value : strPassword

        result := ComCall(25, this, "int", hWndParent, "int", flag, "ptr", strCredential, "ptr", strPassword, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pValue 
     * @returns {HRESULT} 
     */
    QueryChanges(pValue) {
        result := ComCall(26, this, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} val 
     * @returns {HRESULT} 
     */
    InitializeImport(val) {
        result := ComCall(27, this, "ptr", val, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} exportFlags 
     * @param {Pointer<VARIANT>} pVal 
     * @returns {HRESULT} 
     */
    Export(exportFlags, pVal) {
        result := ComCall(28, this, "int", exportFlags, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pValue 
     * @returns {HRESULT} 
     */
    get_Cost(pValue) {
        result := ComCall(29, this, "uint*", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Cost(value) {
        result := ComCall(30, this, "uint", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
