#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\ISignerCertificate.ahk
#Include .\IX509CertificateRequestPkcs10.ahk
#Include .\IX509EnrollmentStatus.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * X.509 Simple Computer Enrollment Protocol Interface
 * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nn-certenroll-ix509scepenrollment
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
     * @type {HRESULT} 
     */
    ServerCapabilities {
        set => this.put_ServerCapabilities(value)
    }

    /**
     * @type {Integer} 
     */
    FailInfo {
        get => this.get_FailInfo()
    }

    /**
     * @type {ISignerCertificate} 
     */
    SignerCertificate {
        get => this.get_SignerCertificate()
        set => this.put_SignerCertificate(value)
    }

    /**
     * @type {ISignerCertificate} 
     */
    OldCertificate {
        get => this.get_OldCertificate()
        set => this.put_OldCertificate(value)
    }

    /**
     * @type {IX509CertificateRequestPkcs10} 
     */
    Request {
        get => this.get_Request()
    }

    /**
     * @type {BSTR} 
     */
    CertificateFriendlyName {
        get => this.get_CertificateFriendlyName()
        set => this.put_CertificateFriendlyName(value)
    }

    /**
     * @type {IX509EnrollmentStatus} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    Silent {
        get => this.get_Silent()
        set => this.put_Silent(value)
    }

    /**
     * Initialize the instance in preparation for a new request.
     * @remarks
     * This method expects an SCEP server signature EA certificate and an SCEP server encryption EA certificate, both signed by the CA certificate.
     * 
     * This method fails if any of the expected certificates is missing, or if the thumbprint doesn't match the CA certificate.
     * @param {IX509CertificateRequestPkcs10} pRequest An instance of a request that has already been initialized.
     * @param {BSTR} strThumbprint The CA certificate thumbprint.
     * @param {Integer} ThumprintEncoding The encoding of the CA certificate thumbprint.
     * @param {BSTR} strServerCertificates A PKCS7 request with CA and SCEP RA certificates.
     * @param {Integer} Encoding The encoding type of the request.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ix509scepenrollment-initialize
     */
    Initialize(pRequest, strThumbprint, ThumprintEncoding, strServerCertificates, Encoding) {
        if(strThumbprint is String) {
            pin := BSTR.Alloc(strThumbprint)
            strThumbprint := pin.Value
        }
        if(strServerCertificates is String) {
            pin := BSTR.Alloc(strServerCertificates)
            strServerCertificates := pin.Value
        }

        result := ComCall(7, this, "ptr", pRequest, "ptr", strThumbprint, "int", ThumprintEncoding, "ptr", strServerCertificates, "int", Encoding, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Initialize the instance to prepare to generate a message to either retrieve an issued certificate, or install a response for a previous request by the issuer.
     * @param {Integer} Context_ 
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ix509scepenrollment-initializeforpending
     */
    InitializeForPending(Context_) {
        result := ComCall(8, this, "int", Context_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Create a PKCS10 request message with a challenge password. The request message is in an enveloped PKCS7 encrypted with the SCEP server encryption certificate and signed by the server signing certificate.
     * @remarks
     * You must call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509scepenrollment-initialize">Initialize</a> method before calling this method.
     * @param {Integer} Encoding 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ix509scepenrollment-createrequestmessage
     */
    CreateRequestMessage(Encoding) {
        pValue := BSTR()
        result := ComCall(9, this, "int", Encoding, "ptr", pValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pValue
    }

    /**
     * Create a message for certificate polling (manual enrollment).
     * @remarks
     * You must call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509scepenrollment-initializeforpending">InitializeForPending</a> method before calling this method.
     * @param {Integer} Encoding 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ix509scepenrollment-createretrievependingmessage
     */
    CreateRetrievePendingMessage(Encoding) {
        pValue := BSTR()
        result := ComCall(10, this, "int", Encoding, "ptr", pValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pValue
    }

    /**
     * Retrieve a previously issued certificate.
     * @remarks
     * You must call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509scepenrollment-initializeforpending">InitializeForPending</a> method before calling this method.
     * @param {Integer} Context_ 
     * @param {BSTR} strIssuer ASN.1 encoded issuer name.
     * @param {Integer} IssuerEncoding 
     * @param {BSTR} strSerialNumber 
     * @param {Integer} SerialNumberEncoding 
     * @param {Integer} Encoding 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ix509scepenrollment-createretrievecertificatemessage
     */
    CreateRetrieveCertificateMessage(Context_, strIssuer, IssuerEncoding, strSerialNumber, SerialNumberEncoding, Encoding) {
        if(strIssuer is String) {
            pin := BSTR.Alloc(strIssuer)
            strIssuer := pin.Value
        }
        if(strSerialNumber is String) {
            pin := BSTR.Alloc(strSerialNumber)
            strSerialNumber := pin.Value
        }

        pValue := BSTR()
        result := ComCall(11, this, "int", Context_, "ptr", strIssuer, "int", IssuerEncoding, "ptr", strSerialNumber, "int", SerialNumberEncoding, "int", Encoding, "ptr", pValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pValue
    }

    /**
     * Process a response message and return the disposition of the message.
     * @remarks
     * You must call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509scepenrollment-initialize">Initialize</a> and <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509scepenrollment-createrequestmessage">CreateRequestMessage</a> methods or the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509scepenrollment-initializeforpending">InitializeForPending</a> method before calling this method.
     * @param {BSTR} strResponse 
     * @param {Integer} Encoding 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ix509scepenrollment-processresponsemessage
     */
    ProcessResponseMessage(strResponse, Encoding) {
        if(strResponse is String) {
            pin := BSTR.Alloc(strResponse)
            strResponse := pin.Value
        }

        result := ComCall(12, this, "ptr", strResponse, "int", Encoding, "int*", &pDisposition := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pDisposition
    }

    /**
     * Sets the preferred hash and encryption algorithms for the request.
     * @remarks
     * If you do not set this property, then the default hash and encryption algorithms will be used.
     * 
     * This property must be set before calling the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509scepenrollment-createrequestmessage">CreateRequestMessage</a>, <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509scepenrollment-createretrievependingmessage">CreateRetrievePendingMessage</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509scepenrollment-createretrievecertificatemessage">CreateRetrieveCertificateMessage</a> methods.
     * @param {BSTR} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ix509scepenrollment-put_servercapabilities
     */
    put_ServerCapabilities(Value) {
        if(Value is String) {
            pin := BSTR.Alloc(Value)
            Value := pin.Value
        }

        result := ComCall(13, this, "ptr", Value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets information when the ProcessResponseMessage method detects a failed environment.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ix509scepenrollment-get_failinfo
     */
    get_FailInfo() {
        result := ComCall(14, this, "int*", &pValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pValue
    }

    /**
     * Gets or sets the signer certificate for the request. (Get)
     * @remarks
     * To create a renewal request, you must set this property prior to calling the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509scepenrollment-createrequestmessage">CreateRequestMessage</a> method. Otherwise, the <b>CreateRequestMessage</b> method will create a new request and generate a self-signed certificate using the same private key as the inner PKCSV10 reqeust.
     * @returns {ISignerCertificate} 
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ix509scepenrollment-get_signercertificate
     */
    get_SignerCertificate() {
        result := ComCall(15, this, "ptr*", &ppValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISignerCertificate(ppValue)
    }

    /**
     * Gets or sets the signer certificate for the request. (Put)
     * @remarks
     * To create a renewal request, you must set this property prior to calling the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509scepenrollment-createrequestmessage">CreateRequestMessage</a> method. Otherwise, the <b>CreateRequestMessage</b> method will create a new request and generate a self-signed certificate using the same private key as the inner PKCSV10 reqeust.
     * @param {ISignerCertificate} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ix509scepenrollment-put_signercertificate
     */
    put_SignerCertificate(pValue) {
        result := ComCall(16, this, "ptr", pValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets or sets an old certificate that a request is intended to replace. (Get)
     * @remarks
     * You must set this property before you call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509scepenrollment-createrequestmessage">CreateRequestMessage</a> method.
     * @returns {ISignerCertificate} 
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ix509scepenrollment-get_oldcertificate
     */
    get_OldCertificate() {
        result := ComCall(17, this, "ptr*", &ppValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISignerCertificate(ppValue)
    }

    /**
     * Gets or sets an old certificate that a request is intended to replace. (Put)
     * @remarks
     * You must set this property before you call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509scepenrollment-createrequestmessage">CreateRequestMessage</a> method.
     * @param {ISignerCertificate} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ix509scepenrollment-put_oldcertificate
     */
    put_OldCertificate(pValue) {
        result := ComCall(18, this, "ptr", pValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets or sets the transaction id for the request. (Get)
     * @remarks
     * If you do not specify a transaction id, then the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509scepenrollment-createrequestmessage">CreateRequestMessage</a> method will create one. If the transaction id has not been set or the <b>CreateRequestMessage</b>  method has not been called, then this property will return <b>CERTSRV_E_PROPERTY_EMPTY</b>.
     * 
     * After processing a pending request, the caller must save this value for later use when calling the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509scepenrollment-createretrievependingmessage">CreateRetrievePendingMessage</a> method to format a message to be sent to the SCEP server to poll for the issued certificate.
     * 
     * Set this property before you call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509scepenrollment-processresponsemessage">ProcessResponseMessage</a> method when you are using a new instance of the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509scepenrollment">IX509SCEPEnrollment</a> interface to install the response.
     * 
     * Set this property before you call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509scepenrollment-createretrievependingmessage">CreateRetrievePendingMessage</a> method when you are using a new instance of the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509scepenrollment">IX509SCEPEnrollment</a> interface to create a retrieval message.
     * @param {Integer} Encoding 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ix509scepenrollment-get_transactionid
     */
    get_TransactionId(Encoding) {
        pValue := BSTR()
        result := ComCall(19, this, "int", Encoding, "ptr", pValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pValue
    }

    /**
     * Gets or sets the transaction id for the request. (Put)
     * @remarks
     * If you do not specify a transaction id, then the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509scepenrollment-createrequestmessage">CreateRequestMessage</a> method will create one. If the transaction id has not been set or the <b>CreateRequestMessage</b>  method has not been called, then this property will return <b>CERTSRV_E_PROPERTY_EMPTY</b>.
     * 
     * After processing a pending request, the caller must save this value for later use when calling the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509scepenrollment-createretrievependingmessage">CreateRetrievePendingMessage</a> method to format a message to be sent to the SCEP server to poll for the issued certificate.
     * 
     * Set this property before you call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509scepenrollment-processresponsemessage">ProcessResponseMessage</a> method when you are using a new instance of the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509scepenrollment">IX509SCEPEnrollment</a> interface to install the response.
     * 
     * Set this property before you call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509scepenrollment-createretrievependingmessage">CreateRetrievePendingMessage</a> method when you are using a new instance of the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509scepenrollment">IX509SCEPEnrollment</a> interface to create a retrieval message.
     * @param {Integer} Encoding 
     * @param {BSTR} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ix509scepenrollment-put_transactionid
     */
    put_TransactionId(Encoding, Value) {
        if(Value is String) {
            pin := BSTR.Alloc(Value)
            Value := pin.Value
        }

        result := ComCall(20, this, "int", Encoding, "ptr", Value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets the inner PKCS10 request.
     * @remarks
     * You can use the inner PKCS10 request instance to set the subject, extensions, private key properties, encryption algorithm and strength, and the hash algorithm before you call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509scepenrollment-createrequestmessage">CreateRequestMessage</a> method.
     * @returns {IX509CertificateRequestPkcs10} 
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ix509scepenrollment-get_request
     */
    get_Request() {
        result := ComCall(21, this, "ptr*", &ppValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IX509CertificateRequestPkcs10(ppValue)
    }

    /**
     * Gets or sets the friendly name for the certificate. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ix509scepenrollment-get_certificatefriendlyname
     */
    get_CertificateFriendlyName() {
        pValue := BSTR()
        result := ComCall(22, this, "ptr", pValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pValue
    }

    /**
     * Gets or sets the friendly name for the certificate. (Put)
     * @param {BSTR} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ix509scepenrollment-put_certificatefriendlyname
     */
    put_CertificateFriendlyName(Value) {
        if(Value is String) {
            pin := BSTR.Alloc(Value)
            Value := pin.Value
        }

        result := ComCall(23, this, "ptr", Value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets the status of the request.
     * @returns {IX509EnrollmentStatus} 
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ix509scepenrollment-get_status
     */
    get_Status() {
        result := ComCall(24, this, "ptr*", &ppValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IX509EnrollmentStatus(ppValue)
    }

    /**
     * Gets the certificate for the request.
     * @param {Integer} Encoding 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ix509scepenrollment-get_certificate
     */
    get_Certificate(Encoding) {
        pValue := BSTR()
        result := ComCall(25, this, "int", Encoding, "ptr", pValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pValue
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_Silent() {
        result := ComCall(26, this, "short*", &pValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pValue
    }

    /**
     * Gets or sets whether to allow UI during the request.
     * @param {VARIANT_BOOL} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ix509scepenrollment-put_silent
     */
    put_Silent(Value) {
        result := ComCall(27, this, "short", Value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Delete any certificates or keys created for the request.
     * @remarks
     * You must set the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509scepenrollment-get_transactionid">TransactionId</a> property and call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509scepenrollment-initializeforpending">InitializeForPending</a> method before calling this method.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ix509scepenrollment-deleterequest
     */
    DeleteRequest() {
        result := ComCall(28, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
