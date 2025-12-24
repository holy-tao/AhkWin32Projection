#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IX509PrivateKey.ahk
#Include .\IX509SignatureInformation.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * Represents a signing certificate that enables you to sign a certificate request.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/nn-certenroll-isignercertificate
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class ISignerCertificate extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISignerCertificate
     * @type {Guid}
     */
    static IID => Guid("{728ab33d-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "get_Certificate", "get_PrivateKey", "get_Silent", "put_Silent", "get_ParentWindow", "put_ParentWindow", "get_UIContextMessage", "put_UIContextMessage", "put_Pin", "get_SignatureInformation"]

    /**
     * @type {IX509PrivateKey} 
     */
    PrivateKey {
        get => this.get_PrivateKey()
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
     * @type {HRESULT} 
     */
    Pin {
        set => this.put_Pin(value)
    }

    /**
     * @type {IX509SignatureInformation} 
     */
    SignatureInformation {
        get => this.get_SignatureInformation()
    }

    /**
     * Initializes the object from a signing certificate.
     * @param {VARIANT_BOOL} MachineContext A <b>VARIANT_BOOL</b> variable that indicates whether to search the local computer certificate store context or the user context to find the certificate identified by the <i>strCertificate</i> parameter. Specify <b>VARIANT_TRUE</b> for the computer and <b>VARIANT_FALSE</b> for the user.
     * @param {Integer} VerifyType An <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-x509privatekeyverify">X509PrivateKeyVerify</a> enumeration value that specifies whether the private key used to sign the certificate must be verified and, if so, whether the verification must be silent or allows user input.
     * @param {Integer} Encoding An <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-encodingtype">EncodingType</a> enumeration value that specifies the type of Unicode encoding applied to  the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/d-gly">Distinguished Encoding Rules</a> (DER) encoded certificate string.
     * @param {BSTR} strCertificate A <b>BSTR</b> variable that contains the DER-encoded certificate.
     * 
     * Beginning with Windows 7 and Windows Server 2008 R2, you can specify a certificate thumb print or serial number rather than an encoded certificate. Doing so causes the function to search the appropriate local stores for the matching certificate. Keep in mind the following points:
     * 
     * <ul>
     * <li>The <b>BSTR</b> must be an even number of hexadecimal digits.</li>
     * <li>Whitespace between hexadecimal pairs is ignored.</li>
     * <li>The <i>Encoding</i> parameter must be set to <b>XCN_CRYPT_STRING_HEXRAW</b>.</li>
     * <li>The <i>MachineContext</i> parameter determines whether the user or computer stores or both are searched.</li>
     * <li>If a private key is needed, only the personal and request stores are searched.</li>
     * <li>If a private key is not needed, the root and intermediate CA stores are also searched.</li>
     * </ul>
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
     * <dt><b><b>HRESULT_FROM_WIN32(ERROR_ALREADY_INITIALIZED)</b></b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="/windows/desktop/api/certenroll/nn-certenroll-isignercertificate">ISignerCertificate</a> object has already been initialized.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-isignercertificate-initialize
     */
    Initialize(MachineContext, VerifyType, Encoding, strCertificate) {
        strCertificate := strCertificate is String ? BSTR.Alloc(strCertificate).Value : strCertificate

        result := ComCall(7, this, "short", MachineContext, "int", VerifyType, "int", Encoding, "ptr", strCertificate, "HRESULT")
        return result
    }

    /**
     * Retrieves a Distinguished Encoding Rules (DER) encoded byte array that contains the certificate.
     * @remarks
     * 
     * Call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-isignercertificate-initialize">Initialize</a> method to specify the certificate. You can also call the following properties to retrieve information about the signing certificate object:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-isignercertificate-put_pin">Pin</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-isignercertificate-get_privatekey">PrivateKey</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-isignercertificate-get_signatureinformation">SignatureInformation</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-isignercertificate-get_silent">Silent</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-isignercertificate-get_uicontextmessage">UIContextMessage</a>
     * </li>
     * </ul>
     * 
     * 
     * @param {Integer} Encoding 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-isignercertificate-get_certificate
     */
    get_Certificate(Encoding) {
        pValue := BSTR()
        result := ComCall(8, this, "int", Encoding, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * Retrieves the private key associated with the ISignerCertificate object.
     * @remarks
     * 
     * When you call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-isignercertificate-initialize">Initialize</a> method the Certificate Enrollment Control retrieves the signing certificate from the personal store and uses it to find an associated private key. You can also call the following properties to retrieve information about the signing certificate object:<ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-isignercertificate-get_certificate">Certificate</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-isignercertificate-get_parentwindow">ParentWindow</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-isignercertificate-put_pin">Pin</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-isignercertificate-get_signatureinformation">SignatureInformation</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-isignercertificate-get_silent">Silent</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-isignercertificate-get_uicontextmessage">UIContextMessage</a>
     * </li>
     * </ul>
     * 
     * 
     * @returns {IX509PrivateKey} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-isignercertificate-get_privatekey
     */
    get_PrivateKey() {
        result := ComCall(9, this, "ptr*", &ppValue := 0, "HRESULT")
        return IX509PrivateKey(ppValue)
    }

    /**
     * Specifies or retrieves a Boolean value that indicates whether the user is notified when the private key is used to sign a certificate request.
     * @remarks
     * 
     * Call this property to specify a value before calling the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-isignercertificate-initialize">Initialize</a> method. Setting this property also sets the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-get_silent">Silent</a> property on the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509privatekey">IX509PrivateKey</a> object. You can retrieve the private key object by calling <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-isignercertificate-get_privatekey">PrivateKey</a>. You can call the following properties to retrieve additional information about the signing certificate object:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-isignercertificate-get_certificate">Certificate</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-isignercertificate-get_parentwindow">ParentWindow</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-isignercertificate-put_pin">Pin</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-isignercertificate-get_signatureinformation">SignatureInformation</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-isignercertificate-get_uicontextmessage">UIContextMessage</a>
     * </li>
     * </ul>
     * 
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-isignercertificate-get_silent
     */
    get_Silent() {
        result := ComCall(10, this, "short*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Specifies or retrieves a Boolean value that indicates whether the user is notified when the private key is used to sign a certificate request.
     * @remarks
     * 
     * Call this property to specify a value before calling the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-isignercertificate-initialize">Initialize</a> method. Setting this property also sets the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-get_silent">Silent</a> property on the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509privatekey">IX509PrivateKey</a> object. You can retrieve the private key object by calling <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-isignercertificate-get_privatekey">PrivateKey</a>. You can call the following properties to retrieve additional information about the signing certificate object:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-isignercertificate-get_certificate">Certificate</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-isignercertificate-get_parentwindow">ParentWindow</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-isignercertificate-put_pin">Pin</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-isignercertificate-get_signatureinformation">SignatureInformation</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-isignercertificate-get_uicontextmessage">UIContextMessage</a>
     * </li>
     * </ul>
     * 
     * 
     * @param {VARIANT_BOOL} Value 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-isignercertificate-put_silent
     */
    put_Silent(Value) {
        result := ComCall(11, this, "short", Value, "HRESULT")
        return result
    }

    /**
     * Specifies or retrieves the ID of the window used to display signing certificate information.
     * @remarks
     * 
     * Call this property to specify a window ID before calling the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-isignercertificate-initialize">Initialize</a> method. The <b>ParentWindow</b> property internally sets the window ID on the  <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509privatekey">IX509PrivateKey</a> object. You can retrieve the private key object by calling the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-isignercertificate-get_privatekey">PrivateKey</a> property. You can call the following properties to retrieve additional information about the signing certificate object:<ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-isignercertificate-get_certificate">Certificate</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-isignercertificate-put_pin">Pin</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-isignercertificate-get_signatureinformation">SignatureInformation</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-isignercertificate-get_silent">Silent</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-isignercertificate-get_uicontextmessage">UIContextMessage</a>
     * </li>
     * </ul>
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-isignercertificate-get_parentwindow
     */
    get_ParentWindow() {
        result := ComCall(12, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Specifies or retrieves the ID of the window used to display signing certificate information.
     * @remarks
     * 
     * Call this property to specify a window ID before calling the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-isignercertificate-initialize">Initialize</a> method. The <b>ParentWindow</b> property internally sets the window ID on the  <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509privatekey">IX509PrivateKey</a> object. You can retrieve the private key object by calling the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-isignercertificate-get_privatekey">PrivateKey</a> property. You can call the following properties to retrieve additional information about the signing certificate object:<ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-isignercertificate-get_certificate">Certificate</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-isignercertificate-put_pin">Pin</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-isignercertificate-get_signatureinformation">SignatureInformation</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-isignercertificate-get_silent">Silent</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-isignercertificate-get_uicontextmessage">UIContextMessage</a>
     * </li>
     * </ul>
     * 
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-isignercertificate-put_parentwindow
     */
    put_ParentWindow(Value) {
        result := ComCall(13, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * Specifies or retrieves a string that contains user interface text associated with the signing certificate.
     * @remarks
     * 
     * Call this property to specify a value before calling the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-isignercertificate-initialize">Initialize</a> method. You can also call the following properties to retrieve additional information about the signing certificate object:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-isignercertificate-get_certificate">Certificate</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-isignercertificate-get_parentwindow">ParentWindow</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-isignercertificate-put_pin">Pin</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-isignercertificate-get_privatekey">PrivateKey</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-isignercertificate-get_signatureinformation">SignatureInformation</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-isignercertificate-get_silent">Silent</a>
     * </li>
     * </ul>
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-isignercertificate-get_uicontextmessage
     */
    get_UIContextMessage() {
        pValue := BSTR()
        result := ComCall(14, this, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * Specifies or retrieves a string that contains user interface text associated with the signing certificate.
     * @remarks
     * 
     * Call this property to specify a value before calling the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-isignercertificate-initialize">Initialize</a> method. You can also call the following properties to retrieve additional information about the signing certificate object:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-isignercertificate-get_certificate">Certificate</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-isignercertificate-get_parentwindow">ParentWindow</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-isignercertificate-put_pin">Pin</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-isignercertificate-get_privatekey">PrivateKey</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-isignercertificate-get_signatureinformation">SignatureInformation</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-isignercertificate-get_silent">Silent</a>
     * </li>
     * </ul>
     * 
     * 
     * @param {BSTR} Value 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-isignercertificate-put_uicontextmessage
     */
    put_UIContextMessage(Value) {
        Value := Value is String ? BSTR.Alloc(Value).Value : Value

        result := ComCall(15, this, "ptr", Value, "HRESULT")
        return result
    }

    /**
     * Specifies a personal identification number (PIN) used to authenticate a smart card user.
     * @remarks
     * 
     * Call this property to specify a value before calling the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-isignercertificate-initialize">Initialize</a> method. The <b>Pin</b> property internally sets the pin number on the  <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509privatekey">IX509PrivateKey</a> object. You can retrieve the private key object by calling <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-isignercertificate-get_privatekey">PrivateKey</a>. You can call the following properties to retrieve additional information about the signing certificate object:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-isignercertificate-get_certificate">Certificate</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-isignercertificate-get_parentwindow">ParentWindow</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-isignercertificate-get_signatureinformation">SignatureInformation</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-isignercertificate-get_silent">Silent</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-isignercertificate-get_uicontextmessage">UIContextMessage</a>
     * </li>
     * </ul>
     * 
     * 
     * @param {BSTR} Value 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-isignercertificate-put_pin
     */
    put_Pin(Value) {
        Value := Value is String ? BSTR.Alloc(Value).Value : Value

        result := ComCall(16, this, "ptr", Value, "HRESULT")
        return result
    }

    /**
     * Retrieves an IX509SignatureInformation object that contains information about the certificate signature.
     * @remarks
     * 
     * When you call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-isignercertificate-initialize">Initialize</a> method the Certificate Enrollment Control creates an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509signatureinformation">IX509SignatureInformation</a> object. You can also call the following properties to retrieve information about the signing certificate object:<ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-isignercertificate-get_certificate">Certificate</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-isignercertificate-get_parentwindow">ParentWindow</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-isignercertificate-put_pin">Pin</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-isignercertificate-get_privatekey">PrivateKey</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-isignercertificate-get_silent">Silent</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-isignercertificate-get_uicontextmessage">UIContextMessage</a>
     * </li>
     * </ul>
     * 
     * 
     * @returns {IX509SignatureInformation} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-isignercertificate-get_signatureinformation
     */
    get_SignatureInformation() {
        result := ComCall(17, this, "ptr*", &ppValue := 0, "HRESULT")
        return IX509SignatureInformation(ppValue)
    }
}
