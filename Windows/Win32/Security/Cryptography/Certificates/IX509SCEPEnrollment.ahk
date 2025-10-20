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
     * Initializes a thread to use Windows Runtime APIs.
     * @param {Pointer<IX509CertificateRequestPkcs10>} pRequest 
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

        result := ComCall(7, this, "ptr", pRequest, "ptr", strThumbprint, "int", ThumprintEncoding, "ptr", strServerCertificates, "int", Encoding, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Context 
     * @returns {HRESULT} 
     */
    InitializeForPending(Context) {
        result := ComCall(8, this, "int", Context, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Encoding 
     * @param {Pointer<BSTR>} pValue 
     * @returns {HRESULT} 
     */
    CreateRequestMessage(Encoding, pValue) {
        result := ComCall(9, this, "int", Encoding, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Encoding 
     * @param {Pointer<BSTR>} pValue 
     * @returns {HRESULT} 
     */
    CreateRetrievePendingMessage(Encoding, pValue) {
        result := ComCall(10, this, "int", Encoding, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

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
     */
    CreateRetrieveCertificateMessage(Context, strIssuer, IssuerEncoding, strSerialNumber, SerialNumberEncoding, Encoding, pValue) {
        strIssuer := strIssuer is String ? BSTR.Alloc(strIssuer).Value : strIssuer
        strSerialNumber := strSerialNumber is String ? BSTR.Alloc(strSerialNumber).Value : strSerialNumber

        result := ComCall(11, this, "int", Context, "ptr", strIssuer, "int", IssuerEncoding, "ptr", strSerialNumber, "int", SerialNumberEncoding, "int", Encoding, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} strResponse 
     * @param {Integer} Encoding 
     * @param {Pointer<Int32>} pDisposition 
     * @returns {HRESULT} 
     */
    ProcessResponseMessage(strResponse, Encoding, pDisposition) {
        strResponse := strResponse is String ? BSTR.Alloc(strResponse).Value : strResponse

        result := ComCall(12, this, "ptr", strResponse, "int", Encoding, "int*", pDisposition, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} Value 
     * @returns {HRESULT} 
     */
    put_ServerCapabilities(Value) {
        Value := Value is String ? BSTR.Alloc(Value).Value : Value

        result := ComCall(13, this, "ptr", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pValue 
     * @returns {HRESULT} 
     */
    get_FailInfo(pValue) {
        result := ComCall(14, this, "int*", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISignerCertificate>} ppValue 
     * @returns {HRESULT} 
     */
    get_SignerCertificate(ppValue) {
        result := ComCall(15, this, "ptr", ppValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISignerCertificate>} pValue 
     * @returns {HRESULT} 
     */
    put_SignerCertificate(pValue) {
        result := ComCall(16, this, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISignerCertificate>} ppValue 
     * @returns {HRESULT} 
     */
    get_OldCertificate(ppValue) {
        result := ComCall(17, this, "ptr", ppValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISignerCertificate>} pValue 
     * @returns {HRESULT} 
     */
    put_OldCertificate(pValue) {
        result := ComCall(18, this, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Encoding 
     * @param {Pointer<BSTR>} pValue 
     * @returns {HRESULT} 
     */
    get_TransactionId(Encoding, pValue) {
        result := ComCall(19, this, "int", Encoding, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Encoding 
     * @param {BSTR} Value 
     * @returns {HRESULT} 
     */
    put_TransactionId(Encoding, Value) {
        Value := Value is String ? BSTR.Alloc(Value).Value : Value

        result := ComCall(20, this, "int", Encoding, "ptr", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IX509CertificateRequestPkcs10>} ppValue 
     * @returns {HRESULT} 
     */
    get_Request(ppValue) {
        result := ComCall(21, this, "ptr", ppValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pValue 
     * @returns {HRESULT} 
     */
    get_CertificateFriendlyName(pValue) {
        result := ComCall(22, this, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} Value 
     * @returns {HRESULT} 
     */
    put_CertificateFriendlyName(Value) {
        Value := Value is String ? BSTR.Alloc(Value).Value : Value

        result := ComCall(23, this, "ptr", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IX509EnrollmentStatus>} ppValue 
     * @returns {HRESULT} 
     */
    get_Status(ppValue) {
        result := ComCall(24, this, "ptr", ppValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Encoding 
     * @param {Pointer<BSTR>} pValue 
     * @returns {HRESULT} 
     */
    get_Certificate(Encoding, pValue) {
        result := ComCall(25, this, "int", Encoding, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pValue 
     * @returns {HRESULT} 
     */
    get_Silent(pValue) {
        result := ComCall(26, this, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} Value 
     * @returns {HRESULT} 
     */
    put_Silent(Value) {
        result := ComCall(27, this, "short", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    DeleteRequest() {
        result := ComCall(28, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
