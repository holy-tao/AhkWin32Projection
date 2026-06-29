#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISignerCertificate.ahk" { ISignerCertificate }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IX509CertificateRequestPkcs10.ahk" { IX509CertificateRequestPkcs10 }
#Import ".\X509CertificateEnrollmentContext.ahk" { X509CertificateEnrollmentContext }
#Import ".\X509SCEPDisposition.ahk" { X509SCEPDisposition }
#Import ".\IX509EnrollmentStatus.ahk" { IX509EnrollmentStatus }
#Import "..\..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\EncodingType.ahk" { EncodingType }
#Import ".\X509SCEPFailInfo.ahk" { X509SCEPFailInfo }
#Import "..\..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * X.509 Simple Computer Enrollment Protocol Interface
 * @see https://learn.microsoft.com/windows/win32/api/certenroll/nn-certenroll-ix509scepenrollment
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct IX509SCEPEnrollment extends IDispatch {
    /**
     * The interface identifier for IX509SCEPEnrollment
     * @type {Guid}
     */
    static IID := Guid("{728ab361-217d-11da-b2a4-000e7bbb2b09}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IX509SCEPEnrollment interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        Initialize                       : IntPtr
        InitializeForPending             : IntPtr
        CreateRequestMessage             : IntPtr
        CreateRetrievePendingMessage     : IntPtr
        CreateRetrieveCertificateMessage : IntPtr
        ProcessResponseMessage           : IntPtr
        put_ServerCapabilities           : IntPtr
        get_FailInfo                     : IntPtr
        get_SignerCertificate            : IntPtr
        put_SignerCertificate            : IntPtr
        get_OldCertificate               : IntPtr
        put_OldCertificate               : IntPtr
        get_TransactionId                : IntPtr
        put_TransactionId                : IntPtr
        get_Request                      : IntPtr
        get_CertificateFriendlyName      : IntPtr
        put_CertificateFriendlyName      : IntPtr
        get_Status                       : IntPtr
        get_Certificate                  : IntPtr
        get_Silent                       : IntPtr
        put_Silent                       : IntPtr
        DeleteRequest                    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IX509SCEPEnrollment.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    ServerCapabilities {
        set => this.put_ServerCapabilities(value)
    }

    /**
     * @type {X509SCEPFailInfo} 
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
     * @param {EncodingType} ThumprintEncoding The encoding of the CA certificate thumbprint.
     * @param {BSTR} strServerCertificates A PKCS7 request with CA and SCEP RA certificates.
     * @param {EncodingType} Encoding The encoding type of the request.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509scepenrollment-initialize
     */
    Initialize(pRequest, strThumbprint, ThumprintEncoding, strServerCertificates, Encoding) {
        strThumbprint := strThumbprint is String ? BSTR.Alloc(strThumbprint).Value : strThumbprint
        strServerCertificates := strServerCertificates is String ? BSTR.Alloc(strServerCertificates).Value : strServerCertificates

        result := ComCall(7, this, "ptr", pRequest, BSTR, strThumbprint, EncodingType, ThumprintEncoding, BSTR, strServerCertificates, EncodingType, Encoding, "HRESULT")
        return result
    }

    /**
     * Initialize the instance to prepare to generate a message to either retrieve an issued certificate, or install a response for a previous request by the issuer.
     * @param {X509CertificateEnrollmentContext} _Context 
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509scepenrollment-initializeforpending
     */
    InitializeForPending(_Context) {
        result := ComCall(8, this, X509CertificateEnrollmentContext, _Context, "HRESULT")
        return result
    }

    /**
     * Create a PKCS10 request message with a challenge password. The request message is in an enveloped PKCS7 encrypted with the SCEP server encryption certificate and signed by the server signing certificate.
     * @remarks
     * You must call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509scepenrollment-initialize">Initialize</a> method before calling this method.
     * @param {EncodingType} Encoding 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509scepenrollment-createrequestmessage
     */
    CreateRequestMessage(Encoding) {
        pValue := BSTR.Owned()
        result := ComCall(9, this, EncodingType, Encoding, BSTR.Ptr, pValue, "HRESULT")
        return pValue
    }

    /**
     * Create a message for certificate polling (manual enrollment).
     * @remarks
     * You must call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509scepenrollment-initializeforpending">InitializeForPending</a> method before calling this method.
     * @param {EncodingType} Encoding 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509scepenrollment-createretrievependingmessage
     */
    CreateRetrievePendingMessage(Encoding) {
        pValue := BSTR.Owned()
        result := ComCall(10, this, EncodingType, Encoding, BSTR.Ptr, pValue, "HRESULT")
        return pValue
    }

    /**
     * Retrieve a previously issued certificate.
     * @remarks
     * You must call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509scepenrollment-initializeforpending">InitializeForPending</a> method before calling this method.
     * @param {X509CertificateEnrollmentContext} _Context 
     * @param {BSTR} strIssuer ASN.1 encoded issuer name.
     * @param {EncodingType} IssuerEncoding 
     * @param {BSTR} strSerialNumber 
     * @param {EncodingType} SerialNumberEncoding 
     * @param {EncodingType} Encoding 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509scepenrollment-createretrievecertificatemessage
     */
    CreateRetrieveCertificateMessage(_Context, strIssuer, IssuerEncoding, strSerialNumber, SerialNumberEncoding, Encoding) {
        strIssuer := strIssuer is String ? BSTR.Alloc(strIssuer).Value : strIssuer
        strSerialNumber := strSerialNumber is String ? BSTR.Alloc(strSerialNumber).Value : strSerialNumber

        pValue := BSTR.Owned()
        result := ComCall(11, this, X509CertificateEnrollmentContext, _Context, BSTR, strIssuer, EncodingType, IssuerEncoding, BSTR, strSerialNumber, EncodingType, SerialNumberEncoding, EncodingType, Encoding, BSTR.Ptr, pValue, "HRESULT")
        return pValue
    }

    /**
     * Process a response message and return the disposition of the message.
     * @remarks
     * You must call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509scepenrollment-initialize">Initialize</a> and <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509scepenrollment-createrequestmessage">CreateRequestMessage</a> methods or the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509scepenrollment-initializeforpending">InitializeForPending</a> method before calling this method.
     * @param {BSTR} strResponse 
     * @param {EncodingType} Encoding 
     * @returns {X509SCEPDisposition} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509scepenrollment-processresponsemessage
     */
    ProcessResponseMessage(strResponse, Encoding) {
        strResponse := strResponse is String ? BSTR.Alloc(strResponse).Value : strResponse

        result := ComCall(12, this, BSTR, strResponse, EncodingType, Encoding, "int*", &pDisposition := 0, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509scepenrollment-put_servercapabilities
     */
    put_ServerCapabilities(Value) {
        Value := Value is String ? BSTR.Alloc(Value).Value : Value

        result := ComCall(13, this, BSTR, Value, "HRESULT")
        return result
    }

    /**
     * Gets information when the ProcessResponseMessage method detects a failed environment.
     * @returns {X509SCEPFailInfo} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509scepenrollment-get_failinfo
     */
    get_FailInfo() {
        result := ComCall(14, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Gets or sets the signer certificate for the request. (Get)
     * @remarks
     * To create a renewal request, you must set this property prior to calling the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509scepenrollment-createrequestmessage">CreateRequestMessage</a> method. Otherwise, the <b>CreateRequestMessage</b> method will create a new request and generate a self-signed certificate using the same private key as the inner PKCSV10 reqeust.
     * @returns {ISignerCertificate} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509scepenrollment-get_signercertificate
     */
    get_SignerCertificate() {
        result := ComCall(15, this, "ptr*", &ppValue := 0, "HRESULT")
        return ISignerCertificate(ppValue)
    }

    /**
     * Gets or sets the signer certificate for the request. (Put)
     * @remarks
     * To create a renewal request, you must set this property prior to calling the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509scepenrollment-createrequestmessage">CreateRequestMessage</a> method. Otherwise, the <b>CreateRequestMessage</b> method will create a new request and generate a self-signed certificate using the same private key as the inner PKCSV10 reqeust.
     * @param {ISignerCertificate} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509scepenrollment-put_signercertificate
     */
    put_SignerCertificate(pValue) {
        result := ComCall(16, this, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * Gets or sets an old certificate that a request is intended to replace. (Get)
     * @remarks
     * You must set this property before you call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509scepenrollment-createrequestmessage">CreateRequestMessage</a> method.
     * @returns {ISignerCertificate} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509scepenrollment-get_oldcertificate
     */
    get_OldCertificate() {
        result := ComCall(17, this, "ptr*", &ppValue := 0, "HRESULT")
        return ISignerCertificate(ppValue)
    }

    /**
     * Gets or sets an old certificate that a request is intended to replace. (Put)
     * @remarks
     * You must set this property before you call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509scepenrollment-createrequestmessage">CreateRequestMessage</a> method.
     * @param {ISignerCertificate} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509scepenrollment-put_oldcertificate
     */
    put_OldCertificate(pValue) {
        result := ComCall(18, this, "ptr", pValue, "HRESULT")
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
     * @param {EncodingType} Encoding 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509scepenrollment-get_transactionid
     */
    get_TransactionId(Encoding) {
        pValue := BSTR.Owned()
        result := ComCall(19, this, EncodingType, Encoding, BSTR.Ptr, pValue, "HRESULT")
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
     * @param {EncodingType} Encoding 
     * @param {BSTR} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509scepenrollment-put_transactionid
     */
    put_TransactionId(Encoding, Value) {
        Value := Value is String ? BSTR.Alloc(Value).Value : Value

        result := ComCall(20, this, EncodingType, Encoding, BSTR, Value, "HRESULT")
        return result
    }

    /**
     * Gets the inner PKCS10 request.
     * @remarks
     * You can use the inner PKCS10 request instance to set the subject, extensions, private key properties, encryption algorithm and strength, and the hash algorithm before you call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509scepenrollment-createrequestmessage">CreateRequestMessage</a> method.
     * @returns {IX509CertificateRequestPkcs10} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509scepenrollment-get_request
     */
    get_Request() {
        result := ComCall(21, this, "ptr*", &ppValue := 0, "HRESULT")
        return IX509CertificateRequestPkcs10(ppValue)
    }

    /**
     * Gets or sets the friendly name for the certificate. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509scepenrollment-get_certificatefriendlyname
     */
    get_CertificateFriendlyName() {
        pValue := BSTR.Owned()
        result := ComCall(22, this, BSTR.Ptr, pValue, "HRESULT")
        return pValue
    }

    /**
     * Gets or sets the friendly name for the certificate. (Put)
     * @param {BSTR} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509scepenrollment-put_certificatefriendlyname
     */
    put_CertificateFriendlyName(Value) {
        Value := Value is String ? BSTR.Alloc(Value).Value : Value

        result := ComCall(23, this, BSTR, Value, "HRESULT")
        return result
    }

    /**
     * Gets the status of the request.
     * @returns {IX509EnrollmentStatus} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509scepenrollment-get_status
     */
    get_Status() {
        result := ComCall(24, this, "ptr*", &ppValue := 0, "HRESULT")
        return IX509EnrollmentStatus(ppValue)
    }

    /**
     * Gets the certificate for the request.
     * @param {EncodingType} Encoding 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509scepenrollment-get_certificate
     */
    get_Certificate(Encoding) {
        pValue := BSTR.Owned()
        result := ComCall(25, this, EncodingType, Encoding, BSTR.Ptr, pValue, "HRESULT")
        return pValue
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_Silent() {
        result := ComCall(26, this, VARIANT_BOOL.Ptr, &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Gets or sets whether to allow UI during the request.
     * @param {VARIANT_BOOL} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509scepenrollment-put_silent
     */
    put_Silent(Value) {
        result := ComCall(27, this, VARIANT_BOOL, Value, "HRESULT")
        return result
    }

    /**
     * Delete any certificates or keys created for the request.
     * @remarks
     * You must set the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509scepenrollment-get_transactionid">TransactionId</a> property and call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509scepenrollment-initializeforpending">InitializeForPending</a> method before calling this method.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509scepenrollment-deleterequest
     */
    DeleteRequest() {
        result := ComCall(28, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IX509SCEPEnrollment.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 6)
        this.vtbl.InitializeForPending := CallbackCreate(GetMethod(implObj, "InitializeForPending"), flags, 2)
        this.vtbl.CreateRequestMessage := CallbackCreate(GetMethod(implObj, "CreateRequestMessage"), flags, 3)
        this.vtbl.CreateRetrievePendingMessage := CallbackCreate(GetMethod(implObj, "CreateRetrievePendingMessage"), flags, 3)
        this.vtbl.CreateRetrieveCertificateMessage := CallbackCreate(GetMethod(implObj, "CreateRetrieveCertificateMessage"), flags, 8)
        this.vtbl.ProcessResponseMessage := CallbackCreate(GetMethod(implObj, "ProcessResponseMessage"), flags, 4)
        this.vtbl.put_ServerCapabilities := CallbackCreate(GetMethod(implObj, "put_ServerCapabilities"), flags, 2)
        this.vtbl.get_FailInfo := CallbackCreate(GetMethod(implObj, "get_FailInfo"), flags, 2)
        this.vtbl.get_SignerCertificate := CallbackCreate(GetMethod(implObj, "get_SignerCertificate"), flags, 2)
        this.vtbl.put_SignerCertificate := CallbackCreate(GetMethod(implObj, "put_SignerCertificate"), flags, 2)
        this.vtbl.get_OldCertificate := CallbackCreate(GetMethod(implObj, "get_OldCertificate"), flags, 2)
        this.vtbl.put_OldCertificate := CallbackCreate(GetMethod(implObj, "put_OldCertificate"), flags, 2)
        this.vtbl.get_TransactionId := CallbackCreate(GetMethod(implObj, "get_TransactionId"), flags, 3)
        this.vtbl.put_TransactionId := CallbackCreate(GetMethod(implObj, "put_TransactionId"), flags, 3)
        this.vtbl.get_Request := CallbackCreate(GetMethod(implObj, "get_Request"), flags, 2)
        this.vtbl.get_CertificateFriendlyName := CallbackCreate(GetMethod(implObj, "get_CertificateFriendlyName"), flags, 2)
        this.vtbl.put_CertificateFriendlyName := CallbackCreate(GetMethod(implObj, "put_CertificateFriendlyName"), flags, 2)
        this.vtbl.get_Status := CallbackCreate(GetMethod(implObj, "get_Status"), flags, 2)
        this.vtbl.get_Certificate := CallbackCreate(GetMethod(implObj, "get_Certificate"), flags, 3)
        this.vtbl.get_Silent := CallbackCreate(GetMethod(implObj, "get_Silent"), flags, 2)
        this.vtbl.put_Silent := CallbackCreate(GetMethod(implObj, "put_Silent"), flags, 2)
        this.vtbl.DeleteRequest := CallbackCreate(GetMethod(implObj, "DeleteRequest"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Initialize)
        CallbackFree(this.vtbl.InitializeForPending)
        CallbackFree(this.vtbl.CreateRequestMessage)
        CallbackFree(this.vtbl.CreateRetrievePendingMessage)
        CallbackFree(this.vtbl.CreateRetrieveCertificateMessage)
        CallbackFree(this.vtbl.ProcessResponseMessage)
        CallbackFree(this.vtbl.put_ServerCapabilities)
        CallbackFree(this.vtbl.get_FailInfo)
        CallbackFree(this.vtbl.get_SignerCertificate)
        CallbackFree(this.vtbl.put_SignerCertificate)
        CallbackFree(this.vtbl.get_OldCertificate)
        CallbackFree(this.vtbl.put_OldCertificate)
        CallbackFree(this.vtbl.get_TransactionId)
        CallbackFree(this.vtbl.put_TransactionId)
        CallbackFree(this.vtbl.get_Request)
        CallbackFree(this.vtbl.get_CertificateFriendlyName)
        CallbackFree(this.vtbl.put_CertificateFriendlyName)
        CallbackFree(this.vtbl.get_Status)
        CallbackFree(this.vtbl.get_Certificate)
        CallbackFree(this.vtbl.get_Silent)
        CallbackFree(this.vtbl.put_Silent)
        CallbackFree(this.vtbl.DeleteRequest)
    }
}
