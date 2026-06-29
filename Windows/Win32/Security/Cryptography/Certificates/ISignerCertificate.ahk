#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IX509PrivateKey.ahk" { IX509PrivateKey }
#Import ".\EncodingType.ahk" { EncodingType }
#Import "..\..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\X509PrivateKeyVerify.ahk" { X509PrivateKeyVerify }
#Import ".\IX509SignatureInformation.ahk" { IX509SignatureInformation }
#Import "..\..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * Represents a signing certificate that enables you to sign a certificate request.
 * @see https://learn.microsoft.com/windows/win32/api/certenroll/nn-certenroll-isignercertificate
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct ISignerCertificate extends IDispatch {
    /**
     * The interface identifier for ISignerCertificate
     * @type {Guid}
     */
    static IID := Guid("{728ab33d-217d-11da-b2a4-000e7bbb2b09}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISignerCertificate interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        Initialize               : IntPtr
        get_Certificate          : IntPtr
        get_PrivateKey           : IntPtr
        get_Silent               : IntPtr
        put_Silent               : IntPtr
        get_ParentWindow         : IntPtr
        put_ParentWindow         : IntPtr
        get_UIContextMessage     : IntPtr
        put_UIContextMessage     : IntPtr
        put_Pin                  : IntPtr
        get_SignatureInformation : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISignerCertificate.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @type {BSTR} 
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
     * @remarks
     * The <b>Initialize</b> method:<ul>
     * <li>Verifies whether the private key associated with the certificate exists.</li>
     * <li>Creates an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509signatureinformation">IX509SignatureInformation</a> object and assigns it to the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-isignercertificate">ISignerCertificate</a> object.</li>
     * <li>Retrieves the public key algorithm from the private key.</li>
     * <li>Assigns the public key algorithm to the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509signatureinformation">IX509SignatureInformation</a> object.</li>
     * </ul>
     * 
     * 
     * Set the following properties before calling <b>Initialize</b>:<ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-isignercertificate-get_parentwindow">ParentWindow</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-isignercertificate-put_pin">Pin</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-isignercertificate-get_silent">Silent</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-isignercertificate-get_uicontextmessage">UIContextMessage</a>
     * </li>
     * </ul>
     * @param {VARIANT_BOOL} MachineContext A <b>VARIANT_BOOL</b> variable that indicates whether to search the local computer certificate store context or the user context to find the certificate identified by the <i>strCertificate</i> parameter. Specify <b>VARIANT_TRUE</b> for the computer and <b>VARIANT_FALSE</b> for the user.
     * @param {X509PrivateKeyVerify} VerifyType An <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-x509privatekeyverify">X509PrivateKeyVerify</a> enumeration value that specifies whether the private key used to sign the certificate must be verified and, if so, whether the verification must be silent or allows user input.
     * @param {EncodingType} Encoding An <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-encodingtype">EncodingType</a> enumeration value that specifies the type of Unicode encoding applied to  the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/d-gly">Distinguished Encoding Rules</a> (DER) encoded certificate string.
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
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following table. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
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
     * The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-isignercertificate">ISignerCertificate</a> object has already been initialized.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-isignercertificate-initialize
     */
    Initialize(MachineContext, VerifyType, Encoding, strCertificate) {
        strCertificate := strCertificate is String ? BSTR.Alloc(strCertificate).Value : strCertificate

        result := ComCall(7, this, VARIANT_BOOL, MachineContext, X509PrivateKeyVerify, VerifyType, EncodingType, Encoding, BSTR, strCertificate, "HRESULT")
        return result
    }

    /**
     * Retrieves a Distinguished Encoding Rules (DER) encoded byte array that contains the certificate.
     * @remarks
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
     * @param {EncodingType} Encoding 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-isignercertificate-get_certificate
     */
    get_Certificate(Encoding) {
        pValue := BSTR.Owned()
        result := ComCall(8, this, EncodingType, Encoding, BSTR.Ptr, pValue, "HRESULT")
        return pValue
    }

    /**
     * Retrieves the private key associated with the ISignerCertificate object.
     * @remarks
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
     * @returns {IX509PrivateKey} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-isignercertificate-get_privatekey
     */
    get_PrivateKey() {
        result := ComCall(9, this, "ptr*", &ppValue := 0, "HRESULT")
        return IX509PrivateKey(ppValue)
    }

    /**
     * Specifies or retrieves a Boolean value that indicates whether the user is notified when the private key is used to sign a certificate request. (Get)
     * @remarks
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
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-isignercertificate-get_silent
     */
    get_Silent() {
        result := ComCall(10, this, VARIANT_BOOL.Ptr, &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Specifies or retrieves a Boolean value that indicates whether the user is notified when the private key is used to sign a certificate request. (Put)
     * @remarks
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
     * @param {VARIANT_BOOL} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-isignercertificate-put_silent
     */
    put_Silent(Value) {
        result := ComCall(11, this, VARIANT_BOOL, Value, "HRESULT")
        return result
    }

    /**
     * Specifies or retrieves the ID of the window used to display signing certificate information. (Get)
     * @remarks
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-isignercertificate-get_parentwindow
     */
    get_ParentWindow() {
        result := ComCall(12, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Specifies or retrieves the ID of the window used to display signing certificate information. (Put)
     * @remarks
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
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-isignercertificate-put_parentwindow
     */
    put_ParentWindow(Value) {
        result := ComCall(13, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * Specifies or retrieves a string that contains user interface text associated with the signing certificate. (Get)
     * @remarks
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
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-isignercertificate-get_uicontextmessage
     */
    get_UIContextMessage() {
        pValue := BSTR.Owned()
        result := ComCall(14, this, BSTR.Ptr, pValue, "HRESULT")
        return pValue
    }

    /**
     * Specifies or retrieves a string that contains user interface text associated with the signing certificate. (Put)
     * @remarks
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
     * @param {BSTR} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-isignercertificate-put_uicontextmessage
     */
    put_UIContextMessage(Value) {
        Value := Value is String ? BSTR.Alloc(Value).Value : Value

        result := ComCall(15, this, BSTR, Value, "HRESULT")
        return result
    }

    /**
     * Specifies a personal identification number (PIN) used to authenticate a smart card user.
     * @remarks
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
     * @param {BSTR} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-isignercertificate-put_pin
     */
    put_Pin(Value) {
        Value := Value is String ? BSTR.Alloc(Value).Value : Value

        result := ComCall(16, this, BSTR, Value, "HRESULT")
        return result
    }

    /**
     * Retrieves an IX509SignatureInformation object that contains information about the certificate signature.
     * @remarks
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
     * @returns {IX509SignatureInformation} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-isignercertificate-get_signatureinformation
     */
    get_SignatureInformation() {
        result := ComCall(17, this, "ptr*", &ppValue := 0, "HRESULT")
        return IX509SignatureInformation(ppValue)
    }

    Query(iid) {
        if (ISignerCertificate.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 5)
        this.vtbl.get_Certificate := CallbackCreate(GetMethod(implObj, "get_Certificate"), flags, 3)
        this.vtbl.get_PrivateKey := CallbackCreate(GetMethod(implObj, "get_PrivateKey"), flags, 2)
        this.vtbl.get_Silent := CallbackCreate(GetMethod(implObj, "get_Silent"), flags, 2)
        this.vtbl.put_Silent := CallbackCreate(GetMethod(implObj, "put_Silent"), flags, 2)
        this.vtbl.get_ParentWindow := CallbackCreate(GetMethod(implObj, "get_ParentWindow"), flags, 2)
        this.vtbl.put_ParentWindow := CallbackCreate(GetMethod(implObj, "put_ParentWindow"), flags, 2)
        this.vtbl.get_UIContextMessage := CallbackCreate(GetMethod(implObj, "get_UIContextMessage"), flags, 2)
        this.vtbl.put_UIContextMessage := CallbackCreate(GetMethod(implObj, "put_UIContextMessage"), flags, 2)
        this.vtbl.put_Pin := CallbackCreate(GetMethod(implObj, "put_Pin"), flags, 2)
        this.vtbl.get_SignatureInformation := CallbackCreate(GetMethod(implObj, "get_SignatureInformation"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Initialize)
        CallbackFree(this.vtbl.get_Certificate)
        CallbackFree(this.vtbl.get_PrivateKey)
        CallbackFree(this.vtbl.get_Silent)
        CallbackFree(this.vtbl.put_Silent)
        CallbackFree(this.vtbl.get_ParentWindow)
        CallbackFree(this.vtbl.put_ParentWindow)
        CallbackFree(this.vtbl.get_UIContextMessage)
        CallbackFree(this.vtbl.put_UIContextMessage)
        CallbackFree(this.vtbl.put_Pin)
        CallbackFree(this.vtbl.get_SignatureInformation)
    }
}
