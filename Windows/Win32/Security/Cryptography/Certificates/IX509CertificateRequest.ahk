#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IX509CertificateRequest.ahk
#Include .\ICspInformations.ahk
#Include .\IObjectId.ahk
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
     * @type {Integer} 
     */
    Type {
        get => this.get_Type()
    }

    /**
     * @type {Integer} 
     */
    EnrollmentContext {
        get => this.get_EnrollmentContext()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    Silent {
        get => this.get_Silent()
        set => this.put_Silent(value)
    }

    /**
     * @type {Integer} 
     */
    ParentWindow {
        get => this.get_ParentWindow()
        set => this.put_ParentWindow(value)
    }

    /**
     * @type {BSTR} 
     */
    UIContextMessage {
        get => this.get_UIContextMessage()
        set => this.put_UIContextMessage(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    SuppressDefaults {
        get => this.get_SuppressDefaults()
        set => this.put_SuppressDefaults(value)
    }

    /**
     * @type {Integer} 
     */
    ClientId {
        get => this.get_ClientId()
        set => this.put_ClientId(value)
    }

    /**
     * @type {ICspInformations} 
     */
    CspInformations {
        get => this.get_CspInformations()
        set => this.put_CspInformations(value)
    }

    /**
     * @type {IObjectId} 
     */
    HashAlgorithm {
        get => this.get_HashAlgorithm()
        set => this.put_HashAlgorithm(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    AlternateSignatureAlgorithm {
        get => this.get_AlternateSignatureAlgorithm()
        set => this.put_AlternateSignatureAlgorithm(value)
    }

    /**
     * Initializes the request object for a user or a computer.
     * @param {Integer} Context 
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following table. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
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
     * The object is already initialized.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509certificaterequest-initialize
     */
    Initialize(Context) {
        result := ComCall(7, this, "int", Context, "HRESULT")
        return result
    }

    /**
     * Signs and encodes a certificate request and creates a key pair if one does not exist.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following table. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>CERTSRV_E_ARCHIVED_KEY_REQUIRED</b></b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequestcmc-get_archiveprivatekey">ArchivePrivateKey</a> property has been set for a CMC request but a key exchange certificate could not be found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>OLE_E_BLANK</b></b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object is not initialized.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509certificaterequest-encode
     */
    Encode() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * Restores the state of the request object to that which existed before the Encode method was called.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following table. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>CERTSRV_E_PROPERTY_EMPTY</b></b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Certificate extensions and attributes have not been defined.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>HRESULT_FROM_WIN32(ERROR_INVALID_STATE)</b></b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The request object is not encoded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b><b>OLE_E_BLANK</b></b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object is not initialized.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509certificaterequest-resetforencode
     */
    ResetForEncode() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * Retrieves a nested request object.
     * @param {Integer} Level A value of an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-innerrequestlevel">InnerRequestLevel</a> enumeration that specifies the envelopment level of the data to retrieve. You can use the <i>LevelNext</i> value to iterate through the nested levels or the <i>LevelInnermost</i> value to retrieve the most deeply nested request object. You cannot specify <i>LevelNext</i> for a PKCS #10 request.
     * @returns {IX509CertificateRequest} Address of a variable that receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509certificaterequest">IX509CertificateRequest</a> interface that contains the nested request. Call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequest-get_type">Type</a> property to determine whether the inner request object is a PKCS #10 or a CMC request. Then call <b>QueryInterface</b> to retrieve the appropriate pointer.
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509certificaterequest-getinnerrequest
     */
    GetInnerRequest(Level) {
        result := ComCall(10, this, "int", Level, "ptr*", &ppValue := 0, "HRESULT")
        return IX509CertificateRequest(ppValue)
    }

    /**
     * Retrieves a value that specifies the type of the request object.
     * @remarks
     * 
     * You can use this property with the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequest-getinnerrequest">GetInnerRequest</a> method to determine the type of the inner request object.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509certificaterequest-get_type
     */
    get_Type() {
        result := ComCall(11, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Retrieves a value that specifies whether the certificate is intended for a computer or a user.
     * @remarks
     * 
     * For a PKCS #7 or CMC request, the property value is retrieved from the inner request object.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509certificaterequest-get_enrollmentcontext
     */
    get_EnrollmentContext() {
        result := ComCall(12, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Specifies or retrieves a Boolean value that indicates whether any of the key-related modal dialogs are displayed during the certificate enrollment process.
     * @remarks
     * 
     * This property value is used by key-related Certificate Enrollment Control modal dialogs that:<ul>
     * <li>Direct a user to insert a smart card</li>
     * <li>Request a smart card pin number</li>
     * <li>Request the  protection level for a new key</li>
     * <li>Request a user password before accessing a key</li>
     * </ul>
     * 
     * 
     * You can set this property before calling any initialization  method or the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequest-encode">Encode</a> method. For a PKCS #10 request, the property value is retrieved from and specified on the associated <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509privatekey">IX509PrivateKey</a> object if the key exists. For a PKCS #7 or CMC request the property value is updated on the inner request and all signing certificates.
     * 
     * If the certificate request contains nested requests and you set the <b>Silent</b> property on the top level request, it is automatically propagated to all of the inner requests. You can, however, set the property manually on each of the inner objects.
     * 
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509certificaterequest-get_silent
     */
    get_Silent() {
        result := ComCall(13, this, "short*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Specifies or retrieves a Boolean value that indicates whether any of the key-related modal dialogs are displayed during the certificate enrollment process.
     * @remarks
     * 
     * This property value is used by key-related Certificate Enrollment Control modal dialogs that:<ul>
     * <li>Direct a user to insert a smart card</li>
     * <li>Request a smart card pin number</li>
     * <li>Request the  protection level for a new key</li>
     * <li>Request a user password before accessing a key</li>
     * </ul>
     * 
     * 
     * You can set this property before calling any initialization  method or the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequest-encode">Encode</a> method. For a PKCS #10 request, the property value is retrieved from and specified on the associated <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509privatekey">IX509PrivateKey</a> object if the key exists. For a PKCS #7 or CMC request the property value is updated on the inner request and all signing certificates.
     * 
     * If the certificate request contains nested requests and you set the <b>Silent</b> property on the top level request, it is automatically propagated to all of the inner requests. You can, however, set the property manually on each of the inner objects.
     * 
     * 
     * @param {VARIANT_BOOL} Value 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509certificaterequest-put_silent
     */
    put_Silent(Value) {
        result := ComCall(14, this, "short", Value, "HRESULT")
        return result
    }

    /**
     * Specifies and retrieves the ID of the window used by key-related user interface dialogs.
     * @remarks
     * 
     * This property value is used by key-related Certificate Enrollment Control modal dialogs that:<ul>
     * <li>Direct a user to insert a smart card</li>
     * <li>Request a smart card pin number</li>
     * <li>Request the  protection level for a new key</li>
     * <li>Request a user password before accessing a key</li>
     * </ul>
     * 
     * 
     * If your application uses key-related modal dialogs, we recommend that you use this property to ensure that your window displays in front of other windows and that the requested action is performed before the thread can be unblocked.
     * 
     * You can set this property before calling any initialization method or the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequest-encode">Encode</a> method. If the certificate request contains nested requests and you set the <b>ParentWindow</b> property on the top level request, it is automatically propagated to all of the inner requests. You can, however, set the property manually on each of the inner objects.
     * 
     * For a PKCS #10 request, the property value is retrieved from and specified on the associated <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509privatekey">IX509PrivateKey</a> object if the key exists. For a PKCS #7 or CMC request the window ID is updated on the inner request and all signing certificates.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509certificaterequest-get_parentwindow
     */
    get_ParentWindow() {
        result := ComCall(15, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Specifies and retrieves the ID of the window used by key-related user interface dialogs.
     * @remarks
     * 
     * This property value is used by key-related Certificate Enrollment Control modal dialogs that:<ul>
     * <li>Direct a user to insert a smart card</li>
     * <li>Request a smart card pin number</li>
     * <li>Request the  protection level for a new key</li>
     * <li>Request a user password before accessing a key</li>
     * </ul>
     * 
     * 
     * If your application uses key-related modal dialogs, we recommend that you use this property to ensure that your window displays in front of other windows and that the requested action is performed before the thread can be unblocked.
     * 
     * You can set this property before calling any initialization method or the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequest-encode">Encode</a> method. If the certificate request contains nested requests and you set the <b>ParentWindow</b> property on the top level request, it is automatically propagated to all of the inner requests. You can, however, set the property manually on each of the inner objects.
     * 
     * For a PKCS #10 request, the property value is retrieved from and specified on the associated <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509privatekey">IX509PrivateKey</a> object if the key exists. For a PKCS #7 or CMC request the window ID is updated on the inner request and all signing certificates.
     * 
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509certificaterequest-put_parentwindow
     */
    put_ParentWindow(Value) {
        result := ComCall(16, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * Specifies or retrieves a context string to display in the user interface.
     * @remarks
     * 
     * You can set this property before calling any initialization method or the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequest-encode">Encode</a> method. For a PKCS #10 request, the property value is retrieved from and specified on the associated <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509privatekey">IX509PrivateKey</a> object if the key exists. For a PKCS #7 or CMC request the property value is updated on the inner request and all signing certificates.
     * 
     * The context string should include additional information about an action. For example, if the user interface instructs the user to enter a smartcard PIN, the context string can indicate that a PIN is used to verify the identity of the user so that the request can be signed.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509certificaterequest-get_uicontextmessage
     */
    get_UIContextMessage() {
        pValue := BSTR()
        result := ComCall(17, this, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * Specifies or retrieves a context string to display in the user interface.
     * @remarks
     * 
     * You can set this property before calling any initialization method or the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequest-encode">Encode</a> method. For a PKCS #10 request, the property value is retrieved from and specified on the associated <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509privatekey">IX509PrivateKey</a> object if the key exists. For a PKCS #7 or CMC request the property value is updated on the inner request and all signing certificates.
     * 
     * The context string should include additional information about an action. For example, if the user interface instructs the user to enter a smartcard PIN, the context string can indicate that a PIN is used to verify the identity of the user so that the request can be signed.
     * 
     * 
     * @param {BSTR} Value 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509certificaterequest-put_uicontextmessage
     */
    put_UIContextMessage(Value) {
        Value := Value is String ? BSTR.Alloc(Value).Value : Value

        result := ComCall(18, this, "ptr", Value, "HRESULT")
        return result
    }

    /**
     * Specifies or retrieves a Boolean value that indicates whether the default extensions and attributes are included in the request.
     * @remarks
     * 
     * You must initialize the request object before calling this property. Set this property before calling the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequest-encode">Encode</a> method to suppress inclusion and encoding of default extensions and attributes in the certificate request.
     * 
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509certificaterequest-get_suppressdefaults
     */
    get_SuppressDefaults() {
        result := ComCall(19, this, "short*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Specifies or retrieves a Boolean value that indicates whether the default extensions and attributes are included in the request.
     * @remarks
     * 
     * You must initialize the request object before calling this property. Set this property before calling the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequest-encode">Encode</a> method to suppress inclusion and encoding of default extensions and attributes in the certificate request.
     * 
     * 
     * @param {VARIANT_BOOL} Value 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509certificaterequest-put_suppressdefaults
     */
    put_SuppressDefaults(Value) {
        result := ComCall(20, this, "short", Value, "HRESULT")
        return result
    }

    /**
     * Specifies or retrieves a byte array that contains the Distinguished Encoding Rules (DER) encoded certificate that is being renewed.
     * @remarks
     * 
     * The certificate is encoded by using DER as defined by the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">Abstract Syntax Notation One</a> (ASN.1) standard. The encoding process creates a byte array. The byte array is returned in a  string that is either a pure binary sequence or is Unicode encoded so that it can be displayed as text.
     * 
     * You must initialize the request object before calling this property. You can call this property before calling the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequest-encode">Encode</a> method.
     * 
     * 
     * @param {Integer} Encoding 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509certificaterequest-get_renewalcertificate
     */
    get_RenewalCertificate(Encoding) {
        pValue := BSTR()
        result := ComCall(21, this, "int", Encoding, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * Specifies or retrieves a byte array that contains the Distinguished Encoding Rules (DER) encoded certificate that is being renewed.
     * @remarks
     * 
     * The certificate is encoded by using DER as defined by the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">Abstract Syntax Notation One</a> (ASN.1) standard. The encoding process creates a byte array. The byte array is returned in a  string that is either a pure binary sequence or is Unicode encoded so that it can be displayed as text.
     * 
     * You must initialize the request object before calling this property. You can call this property before calling the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequest-encode">Encode</a> method.
     * 
     * 
     * @param {Integer} Encoding 
     * @param {BSTR} Value 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509certificaterequest-put_renewalcertificate
     */
    put_RenewalCertificate(Encoding, Value) {
        Value := Value is String ? BSTR.Alloc(Value).Value : Value

        result := ComCall(22, this, "int", Encoding, "ptr", Value, "HRESULT")
        return result
    }

    /**
     * Specifies and retrieves a value that identifies the executable that created the request.
     * @remarks
     * 
     * You must initialize the request object before calling this property. You can call this property before calling the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequest-encode">Encode</a> method.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509certificaterequest-get_clientid
     */
    get_ClientId() {
        result := ComCall(23, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Specifies and retrieves a value that identifies the executable that created the request.
     * @remarks
     * 
     * You must initialize the request object before calling this property. You can call this property before calling the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequest-encode">Encode</a> method.
     * 
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509certificaterequest-put_clientid
     */
    put_ClientId(Value) {
        result := ComCall(24, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * Specifies and retrieves a collection of cryptographic providers available for use by the request object.
     * @remarks
     * 
     * If you want to specify a collection of providers, you must set this property before calling the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequest-initialize">Initialize</a> method. The collection that you specify must contain all providers currently installed on the computer. If you specify a subset or a superset, the behavior of this property is undefined.
     * 
     * If you do not specify a collection, the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequest-initialize">Initialize</a> method sets the property value to a collection of all providers installed on the computer.
     * 
     * The <b>CspInformations</b> property exists so that the caller can avoid forcing the request object to fill the collection. This is useful when the caller is creating multiple requests in one session.
     * 
     * 
     * @returns {ICspInformations} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509certificaterequest-get_cspinformations
     */
    get_CspInformations() {
        result := ComCall(25, this, "ptr*", &ppValue := 0, "HRESULT")
        return ICspInformations(ppValue)
    }

    /**
     * Specifies and retrieves a collection of cryptographic providers available for use by the request object.
     * @remarks
     * 
     * If you want to specify a collection of providers, you must set this property before calling the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequest-initialize">Initialize</a> method. The collection that you specify must contain all providers currently installed on the computer. If you specify a subset or a superset, the behavior of this property is undefined.
     * 
     * If you do not specify a collection, the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequest-initialize">Initialize</a> method sets the property value to a collection of all providers installed on the computer.
     * 
     * The <b>CspInformations</b> property exists so that the caller can avoid forcing the request object to fill the collection. This is useful when the caller is creating multiple requests in one session.
     * 
     * 
     * @param {ICspInformations} pValue 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509certificaterequest-put_cspinformations
     */
    put_CspInformations(pValue) {
        result := ComCall(26, this, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * Specifies and retrieves the object identifier (OID) of the hash algorithm used to sign the certificate request.
     * @remarks
     * 
     * If the certificate request contains nested requests and you set the <b>HashAlgorithm</b> property on the top level request, it is automatically propagated to all of the inner requests, overwriting values that may have been previously set. You can, however, set the property manually on each of the inner objects.
     * 
     * You must initialize the request object before calling this property. You can call this property before calling the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequest-encode">Encode</a> method.
     * 
     * 
     * @returns {IObjectId} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509certificaterequest-get_hashalgorithm
     */
    get_HashAlgorithm() {
        result := ComCall(27, this, "ptr*", &ppValue := 0, "HRESULT")
        return IObjectId(ppValue)
    }

    /**
     * Specifies and retrieves the object identifier (OID) of the hash algorithm used to sign the certificate request.
     * @remarks
     * 
     * If the certificate request contains nested requests and you set the <b>HashAlgorithm</b> property on the top level request, it is automatically propagated to all of the inner requests, overwriting values that may have been previously set. You can, however, set the property manually on each of the inner objects.
     * 
     * You must initialize the request object before calling this property. You can call this property before calling the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequest-encode">Encode</a> method.
     * 
     * 
     * @param {IObjectId} pValue 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509certificaterequest-put_hashalgorithm
     */
    put_HashAlgorithm(pValue) {
        result := ComCall(28, this, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * Specifies and retrieves a Boolean value that indicates whether the signature algorithm object identifier (OID) for a PKCS
     * @remarks
     * 
     * Discrete algorithms are represented by separate <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">object identifiers</a> (OIDs) for the hashing algorithm and the signing algorithm. Examples include the following values.<table>
     * <tr>
     * <th>Discrete algorithm OID</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>
     * XCN_OID_NIST_sha256
     * 
     * (2.16.840.1.101.3.4.2.1)
     * 
     * </td>
     * <td>
     * National Institute of Standards and Technologies (NIST) 256-bit SHA hashing algorithm.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * XCN_OID_OIWSEC_rsaSign
     * 
     * (1.3.14.3.2.11)
     * 
     * </td>
     * <td>
     * NIST OSE Implementer Workshop Security (OIWSEC) RSA signing algorithm.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * 
     * Combined algorithms are represented by a single OID that identifies both the hashing and the signing algorithm. Examples include the following values.<table>
     * <tr>
     * <th>Combined algorithm OID</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>
     * XCN_OID_RSA_MD2RSA
     * 
     * (1.2.840.113549.1.1.2)
     * 
     * </td>
     * <td>
     * MD2 hashing algorithm combined with the RSA encryption algorithm from RSA Laboratories.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * XCN_OID_OIWSEC_md5RSA
     * 
     * (1.3.14.3.2.3)
     * 
     * </td>
     * <td>
     * OIWSEC MD5 hashing algorithm combined with the RSA encryption algorithm.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * 
     * If the certificate request contains nested requests and you set the <b>AlternateSignatureAlgorithm</b> property on the top level request, it is automatically propagated to all of the inner requests. You can, however, set the property manually on each of the inner objects.
     * 
     * For a PKCS #7 or a CMC request, this property retrieves a Boolean value for the primary signature on the inner PKCS #10 request. On input, all signer certificates are updated with the specified property value.
     * 
     * For a PKCS #10 request or certificate signature using the RSA public key algorithm, a property value of False (which indicates a combined OID) implies a version 1.5 signature and True (discrete OID) implies a version 2.1 signature.
     * 
     * You must initialize the request object before calling this property. You can call this property before calling the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequest-encode">Encode</a> method.
     * 
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509certificaterequest-get_alternatesignaturealgorithm
     */
    get_AlternateSignatureAlgorithm() {
        result := ComCall(29, this, "short*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Specifies and retrieves a Boolean value that indicates whether the signature algorithm object identifier (OID) for a PKCS
     * @remarks
     * 
     * Discrete algorithms are represented by separate <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">object identifiers</a> (OIDs) for the hashing algorithm and the signing algorithm. Examples include the following values.<table>
     * <tr>
     * <th>Discrete algorithm OID</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>
     * XCN_OID_NIST_sha256
     * 
     * (2.16.840.1.101.3.4.2.1)
     * 
     * </td>
     * <td>
     * National Institute of Standards and Technologies (NIST) 256-bit SHA hashing algorithm.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * XCN_OID_OIWSEC_rsaSign
     * 
     * (1.3.14.3.2.11)
     * 
     * </td>
     * <td>
     * NIST OSE Implementer Workshop Security (OIWSEC) RSA signing algorithm.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * 
     * Combined algorithms are represented by a single OID that identifies both the hashing and the signing algorithm. Examples include the following values.<table>
     * <tr>
     * <th>Combined algorithm OID</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>
     * XCN_OID_RSA_MD2RSA
     * 
     * (1.2.840.113549.1.1.2)
     * 
     * </td>
     * <td>
     * MD2 hashing algorithm combined with the RSA encryption algorithm from RSA Laboratories.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * XCN_OID_OIWSEC_md5RSA
     * 
     * (1.3.14.3.2.3)
     * 
     * </td>
     * <td>
     * OIWSEC MD5 hashing algorithm combined with the RSA encryption algorithm.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * 
     * If the certificate request contains nested requests and you set the <b>AlternateSignatureAlgorithm</b> property on the top level request, it is automatically propagated to all of the inner requests. You can, however, set the property manually on each of the inner objects.
     * 
     * For a PKCS #7 or a CMC request, this property retrieves a Boolean value for the primary signature on the inner PKCS #10 request. On input, all signer certificates are updated with the specified property value.
     * 
     * For a PKCS #10 request or certificate signature using the RSA public key algorithm, a property value of False (which indicates a combined OID) implies a version 1.5 signature and True (discrete OID) implies a version 2.1 signature.
     * 
     * You must initialize the request object before calling this property. You can call this property before calling the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequest-encode">Encode</a> method.
     * 
     * 
     * @param {VARIANT_BOOL} Value 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509certificaterequest-put_alternatesignaturealgorithm
     */
    put_AlternateSignatureAlgorithm(Value) {
        result := ComCall(30, this, "short", Value, "HRESULT")
        return result
    }

    /**
     * Retrieves a byte array that contains the signed, Distinguished Encoding Rules (DER) encoded certificate request.
     * @remarks
     * 
     * Call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509certificaterequest-encode">Encode</a> method to encode a certificate request using DER as defined by the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">Abstract Syntax Notation One</a> (ASN.1) standard. The encoding process creates a byte array that the <b>RawData</b> property returns   as a string. The string is either a pure binary sequence, or it is Unicode encoded so that it can be displayed as text.
     * 
     * 
     * @param {Integer} Encoding 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509certificaterequest-get_rawdata
     */
    get_RawData(Encoding) {
        pValue := BSTR()
        result := ComCall(31, this, "int", Encoding, "ptr", pValue, "HRESULT")
        return pValue
    }
}
