#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * The IX509CertificateRequest interface represents an abstract base certificate request that identifies methods and properties common to and inherited by each of the request objects implemented by the Certificate Enrollment API.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/nn-certenroll-ix509certificaterequest
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IX509CertificateRequest extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IX509CertificateRequest
     * @type {Guid}
     */
    static IID => Guid("{728ab341-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "Encode", "ResetForEncode", "GetInnerRequest", "get_Type", "get_EnrollmentContext", "get_Silent", "put_Silent", "get_ParentWindow", "put_ParentWindow", "get_UIContextMessage", "put_UIContextMessage", "get_SuppressDefaults", "put_SuppressDefaults", "get_RenewalCertificate", "put_RenewalCertificate", "get_ClientId", "put_ClientId", "get_CspInformations", "put_CspInformations", "get_HashAlgorithm", "put_HashAlgorithm", "get_AlternateSignatureAlgorithm", "put_AlternateSignatureAlgorithm", "get_RawData"]

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @param {Integer} Context 
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
    Initialize(Context) {
        result := ComCall(7, this, "int", Context, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequest-encode
     */
    Encode() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequest-resetforencode
     */
    ResetForEncode() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Level 
     * @param {Pointer<IX509CertificateRequest>} ppValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequest-getinnerrequest
     */
    GetInnerRequest(Level, ppValue) {
        result := ComCall(10, this, "int", Level, "ptr*", ppValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequest-get_type
     */
    get_Type(pValue) {
        result := ComCall(11, this, "int*", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequest-get_enrollmentcontext
     */
    get_EnrollmentContext(pValue) {
        result := ComCall(12, this, "int*", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequest-get_silent
     */
    get_Silent(pValue) {
        result := ComCall(13, this, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequest-put_silent
     */
    put_Silent(Value) {
        result := ComCall(14, this, "short", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequest-get_parentwindow
     */
    get_ParentWindow(pValue) {
        result := ComCall(15, this, "int*", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequest-put_parentwindow
     */
    put_ParentWindow(Value) {
        result := ComCall(16, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequest-get_uicontextmessage
     */
    get_UIContextMessage(pValue) {
        result := ComCall(17, this, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequest-put_uicontextmessage
     */
    put_UIContextMessage(Value) {
        Value := Value is String ? BSTR.Alloc(Value).Value : Value

        result := ComCall(18, this, "ptr", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequest-get_suppressdefaults
     */
    get_SuppressDefaults(pValue) {
        result := ComCall(19, this, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequest-put_suppressdefaults
     */
    put_SuppressDefaults(Value) {
        result := ComCall(20, this, "short", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Encoding 
     * @param {Pointer<BSTR>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequest-get_renewalcertificate
     */
    get_RenewalCertificate(Encoding, pValue) {
        result := ComCall(21, this, "int", Encoding, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Encoding 
     * @param {BSTR} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequest-put_renewalcertificate
     */
    put_RenewalCertificate(Encoding, Value) {
        Value := Value is String ? BSTR.Alloc(Value).Value : Value

        result := ComCall(22, this, "int", Encoding, "ptr", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequest-get_clientid
     */
    get_ClientId(pValue) {
        result := ComCall(23, this, "int*", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequest-put_clientid
     */
    put_ClientId(Value) {
        result := ComCall(24, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ICspInformations>} ppValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequest-get_cspinformations
     */
    get_CspInformations(ppValue) {
        result := ComCall(25, this, "ptr*", ppValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ICspInformations} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequest-put_cspinformations
     */
    put_CspInformations(pValue) {
        result := ComCall(26, this, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IObjectId>} ppValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequest-get_hashalgorithm
     */
    get_HashAlgorithm(ppValue) {
        result := ComCall(27, this, "ptr*", ppValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IObjectId} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequest-put_hashalgorithm
     */
    put_HashAlgorithm(pValue) {
        result := ComCall(28, this, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequest-get_alternatesignaturealgorithm
     */
    get_AlternateSignatureAlgorithm(pValue) {
        result := ComCall(29, this, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequest-put_alternatesignaturealgorithm
     */
    put_AlternateSignatureAlgorithm(Value) {
        result := ComCall(30, this, "short", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Encoding 
     * @param {Pointer<BSTR>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509certificaterequest-get_rawdata
     */
    get_RawData(Encoding, pValue) {
        result := ComCall(31, this, "int", Encoding, "ptr", pValue, "HRESULT")
        return result
    }
}
