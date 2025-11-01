#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * X.509 Simple Computer Enrollment Protocol Interface
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/nn-certenroll-ix509scepenrollment
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IX509SCEPEnrollment extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IX509SCEPEnrollment
     * @type {Guid}
     */
    static IID => Guid("{728ab361-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "InitializeForPending", "CreateRequestMessage", "CreateRetrievePendingMessage", "CreateRetrieveCertificateMessage", "ProcessResponseMessage", "put_ServerCapabilities", "get_FailInfo", "get_SignerCertificate", "put_SignerCertificate", "get_OldCertificate", "put_OldCertificate", "get_TransactionId", "put_TransactionId", "get_Request", "get_CertificateFriendlyName", "put_CertificateFriendlyName", "get_Status", "get_Certificate", "get_Silent", "put_Silent", "DeleteRequest"]

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @param {IX509CertificateRequestPkcs10} pRequest 
     * @param {BSTR} strThumbprint 
     * @param {Integer} ThumprintEncoding 
     * @param {BSTR} strServerCertificates 
     * @param {Integer} Encoding 
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
    Initialize(pRequest, strThumbprint, ThumprintEncoding, strServerCertificates, Encoding) {
        strThumbprint := strThumbprint is String ? BSTR.Alloc(strThumbprint).Value : strThumbprint
        strServerCertificates := strServerCertificates is String ? BSTR.Alloc(strServerCertificates).Value : strServerCertificates

        result := ComCall(7, this, "ptr", pRequest, "ptr", strThumbprint, "int", ThumprintEncoding, "ptr", strServerCertificates, "int", Encoding, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Context 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509scepenrollment-initializeforpending
     */
    InitializeForPending(Context) {
        result := ComCall(8, this, "int", Context, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Encoding 
     * @param {Pointer<BSTR>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509scepenrollment-createrequestmessage
     */
    CreateRequestMessage(Encoding, pValue) {
        result := ComCall(9, this, "int", Encoding, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Encoding 
     * @param {Pointer<BSTR>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509scepenrollment-createretrievependingmessage
     */
    CreateRetrievePendingMessage(Encoding, pValue) {
        result := ComCall(10, this, "int", Encoding, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Context 
     * @param {BSTR} strIssuer 
     * @param {Integer} IssuerEncoding 
     * @param {BSTR} strSerialNumber 
     * @param {Integer} SerialNumberEncoding 
     * @param {Integer} Encoding 
     * @param {Pointer<BSTR>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509scepenrollment-createretrievecertificatemessage
     */
    CreateRetrieveCertificateMessage(Context, strIssuer, IssuerEncoding, strSerialNumber, SerialNumberEncoding, Encoding, pValue) {
        strIssuer := strIssuer is String ? BSTR.Alloc(strIssuer).Value : strIssuer
        strSerialNumber := strSerialNumber is String ? BSTR.Alloc(strSerialNumber).Value : strSerialNumber

        result := ComCall(11, this, "int", Context, "ptr", strIssuer, "int", IssuerEncoding, "ptr", strSerialNumber, "int", SerialNumberEncoding, "int", Encoding, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strResponse 
     * @param {Integer} Encoding 
     * @param {Pointer<Integer>} pDisposition 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509scepenrollment-processresponsemessage
     */
    ProcessResponseMessage(strResponse, Encoding, pDisposition) {
        strResponse := strResponse is String ? BSTR.Alloc(strResponse).Value : strResponse

        pDispositionMarshal := pDisposition is VarRef ? "int*" : "ptr"

        result := ComCall(12, this, "ptr", strResponse, "int", Encoding, pDispositionMarshal, pDisposition, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509scepenrollment-put_servercapabilities
     */
    put_ServerCapabilities(Value) {
        Value := Value is String ? BSTR.Alloc(Value).Value : Value

        result := ComCall(13, this, "ptr", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509scepenrollment-get_failinfo
     */
    get_FailInfo(pValue) {
        pValueMarshal := pValue is VarRef ? "int*" : "ptr"

        result := ComCall(14, this, pValueMarshal, pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISignerCertificate>} ppValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509scepenrollment-get_signercertificate
     */
    get_SignerCertificate(ppValue) {
        result := ComCall(15, this, "ptr*", ppValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISignerCertificate} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509scepenrollment-put_signercertificate
     */
    put_SignerCertificate(pValue) {
        result := ComCall(16, this, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISignerCertificate>} ppValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509scepenrollment-get_oldcertificate
     */
    get_OldCertificate(ppValue) {
        result := ComCall(17, this, "ptr*", ppValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISignerCertificate} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509scepenrollment-put_oldcertificate
     */
    put_OldCertificate(pValue) {
        result := ComCall(18, this, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Encoding 
     * @param {Pointer<BSTR>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509scepenrollment-get_transactionid
     */
    get_TransactionId(Encoding, pValue) {
        result := ComCall(19, this, "int", Encoding, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Encoding 
     * @param {BSTR} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509scepenrollment-put_transactionid
     */
    put_TransactionId(Encoding, Value) {
        Value := Value is String ? BSTR.Alloc(Value).Value : Value

        result := ComCall(20, this, "int", Encoding, "ptr", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IX509CertificateRequestPkcs10>} ppValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509scepenrollment-get_request
     */
    get_Request(ppValue) {
        result := ComCall(21, this, "ptr*", ppValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509scepenrollment-get_certificatefriendlyname
     */
    get_CertificateFriendlyName(pValue) {
        result := ComCall(22, this, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509scepenrollment-put_certificatefriendlyname
     */
    put_CertificateFriendlyName(Value) {
        Value := Value is String ? BSTR.Alloc(Value).Value : Value

        result := ComCall(23, this, "ptr", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IX509EnrollmentStatus>} ppValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509scepenrollment-get_status
     */
    get_Status(ppValue) {
        result := ComCall(24, this, "ptr*", ppValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Encoding 
     * @param {Pointer<BSTR>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509scepenrollment-get_certificate
     */
    get_Certificate(Encoding, pValue) {
        result := ComCall(25, this, "int", Encoding, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pValue 
     * @returns {HRESULT} 
     */
    get_Silent(pValue) {
        result := ComCall(26, this, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509scepenrollment-put_silent
     */
    put_Silent(Value) {
        result := ComCall(27, this, "short", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509scepenrollment-deleterequest
     */
    DeleteRequest() {
        result := ComCall(28, this, "HRESULT")
        return result
    }
}
