#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IX509PublicKey.ahk
#Include .\ICspInformations.ahk
#Include .\ICspStatus.ahk
#Include .\IObjectId.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * Represents an asymmetric private key that can be used for encryption, signing, and key agreement.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/nn-certenroll-ix509privatekey
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IX509PrivateKey extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IX509PrivateKey
     * @type {Guid}
     */
    static IID => Guid("{728ab30c-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Open", "Create", "Close", "Delete", "Verify", "Import", "Export", "ExportPublicKey", "get_ContainerName", "put_ContainerName", "get_ContainerNamePrefix", "put_ContainerNamePrefix", "get_ReaderName", "put_ReaderName", "get_CspInformations", "put_CspInformations", "get_CspStatus", "put_CspStatus", "get_ProviderName", "put_ProviderName", "get_ProviderType", "put_ProviderType", "get_LegacyCsp", "put_LegacyCsp", "get_Algorithm", "put_Algorithm", "get_KeySpec", "put_KeySpec", "get_Length", "put_Length", "get_ExportPolicy", "put_ExportPolicy", "get_KeyUsage", "put_KeyUsage", "get_KeyProtection", "put_KeyProtection", "get_MachineContext", "put_MachineContext", "get_SecurityDescriptor", "put_SecurityDescriptor", "get_Certificate", "put_Certificate", "get_UniqueContainerName", "get_Opened", "get_DefaultContainer", "get_Existing", "put_Existing", "get_Silent", "put_Silent", "get_ParentWindow", "put_ParentWindow", "get_UIContextMessage", "put_UIContextMessage", "put_Pin", "get_FriendlyName", "put_FriendlyName", "get_Description", "put_Description"]

    /**
     * @type {BSTR} 
     */
    ContainerName {
        get => this.get_ContainerName()
        set => this.put_ContainerName(value)
    }

    /**
     * @type {BSTR} 
     */
    ContainerNamePrefix {
        get => this.get_ContainerNamePrefix()
        set => this.put_ContainerNamePrefix(value)
    }

    /**
     * @type {BSTR} 
     */
    ReaderName {
        get => this.get_ReaderName()
        set => this.put_ReaderName(value)
    }

    /**
     * @type {ICspInformations} 
     */
    CspInformations {
        get => this.get_CspInformations()
        set => this.put_CspInformations(value)
    }

    /**
     * @type {ICspStatus} 
     */
    CspStatus {
        get => this.get_CspStatus()
        set => this.put_CspStatus(value)
    }

    /**
     * @type {BSTR} 
     */
    ProviderName {
        get => this.get_ProviderName()
        set => this.put_ProviderName(value)
    }

    /**
     * @type {Integer} 
     */
    ProviderType {
        get => this.get_ProviderType()
        set => this.put_ProviderType(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    LegacyCsp {
        get => this.get_LegacyCsp()
        set => this.put_LegacyCsp(value)
    }

    /**
     * @type {IObjectId} 
     */
    Algorithm {
        get => this.get_Algorithm()
        set => this.put_Algorithm(value)
    }

    /**
     * @type {Integer} 
     */
    KeySpec {
        get => this.get_KeySpec()
        set => this.put_KeySpec(value)
    }

    /**
     * @type {Integer} 
     */
    Length {
        get => this.get_Length()
        set => this.put_Length(value)
    }

    /**
     * @type {Integer} 
     */
    ExportPolicy {
        get => this.get_ExportPolicy()
        set => this.put_ExportPolicy(value)
    }

    /**
     * @type {Integer} 
     */
    KeyUsage {
        get => this.get_KeyUsage()
        set => this.put_KeyUsage(value)
    }

    /**
     * @type {Integer} 
     */
    KeyProtection {
        get => this.get_KeyProtection()
        set => this.put_KeyProtection(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    MachineContext {
        get => this.get_MachineContext()
        set => this.put_MachineContext(value)
    }

    /**
     * @type {BSTR} 
     */
    SecurityDescriptor {
        get => this.get_SecurityDescriptor()
        set => this.put_SecurityDescriptor(value)
    }

    /**
     * @type {BSTR} 
     */
    UniqueContainerName {
        get => this.get_UniqueContainerName()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    Opened {
        get => this.get_Opened()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    DefaultContainer {
        get => this.get_DefaultContainer()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    Existing {
        get => this.get_Existing()
        set => this.put_Existing(value)
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
     * @type {BSTR} 
     */
    FriendlyName {
        get => this.get_FriendlyName()
        set => this.put_FriendlyName(value)
    }

    /**
     * @type {BSTR} 
     */
    Description {
        get => this.get_Description()
        set => this.put_Description(value)
    }

    /**
     * Opens an existing private key.
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509privatekey-open
     */
    Open() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * Creates an asymmetric private key.
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
     * <dt><b>HRESULT_FROM_WIN32(ERROR_BUSY)</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The CSP handle is not <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_FILE_EXISTS)</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The key already exists.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509privatekey-create
     */
    Create() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * Releases the handle of the cryptographic service provider (CSP) or the handle of the Cryptography API:\_Next Generation (CNG) key storage provider (KSP).
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509privatekey-close
     */
    Close() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * Releases the handle of the cryptographic service provider (CSP) or the handle of the Cryptography API:\_Next Generation (CNG) key storage provider (KSP) and deletes the key from disk or smart card.
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
     * The CSP could not be found.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509privatekey-delete
     */
    Delete() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * Verifies that a private key exists and can be used by the client but does not open the key.
     * @param {Integer} VerifyType 
     * @returns {HRESULT} If the function succeeds, the function returns <b>S_OK</b>.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. Possible values include, but are not limited to, those in the following table. Also, this method calls the <a href="/windows/desktop/api/wincrypt/nf-wincrypt-cryptgetuserkey">CryptGetUserKey</a> and <a href="/windows/desktop/api/wincrypt/nf-wincrypt-cryptacquirecontexta">CryptAcquireContext</a>CryptoAPI functions and can return errors identified in that documentation. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CERTSRV_E_PROPERTY_EMPTY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Properties related to the CSP or KSP could not be found.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509privatekey-verify
     */
    Verify(VerifyType) {
        result := ComCall(11, this, "int", VerifyType, "HRESULT")
        return result
    }

    /**
     * Imports an existing private key into a key container within a cryptographic provider.
     * @param {BSTR} strExportType If the key was created by using a CNG KSP (Key Storage Provider), the <b>Import</b> method passes this argument to the <i>pszProperty</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/ncrypt/nf-ncrypt-ncryptsetproperty">NCryptSetProperty</a> function. That is, the value you specify will be used as the name of a property to be set on the imported key.
     * 
     * If the key was created by using a CryptoAPI CSP (Cryptographic Service Provider), this argument specifies how the private key is to be imported. This can be the following value.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BCRYPT_PRIVATE_KEY_BLOB"></a><a id="bcrypt_private_key_blob"></a><dl>
     * <dt><b>BCRYPT_PRIVATE_KEY_BLOB</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Imports the entire private key.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {BSTR} strEncodedKey A <b>BSTR</b> variable that contains the key to import.
     * @param {Integer} Encoding An <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-encodingtype">EncodingType</a> enumeration value that specifies the type of Unicode encoding to be applied to the string contained in the <i>strEncodedKey</i> parameter. The default value is XCN_CRYPT_STRING_BASE64.
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
     * <dt><b>HRESULT_FROM_WIN32(ERROR_FILE_READ_ONLY)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The key container is already open. You can receive this error if you have already called <a href="/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-open">Open</a> or <a href="/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-create">Create</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_CALL_NOT_IMPLEMENTED)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The key was created by a CryptoAPI CSP and you specified a value other than BCRYPT_PRIVATE_KEY_BLOB for the <i>strExportType</i> parameter.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509privatekey-import
     */
    Import(strExportType, strEncodedKey, Encoding) {
        strExportType := strExportType is String ? BSTR.Alloc(strExportType).Value : strExportType
        strEncodedKey := strEncodedKey is String ? BSTR.Alloc(strEncodedKey).Value : strEncodedKey

        result := ComCall(12, this, "ptr", strExportType, "ptr", strEncodedKey, "int", Encoding, "HRESULT")
        return result
    }

    /**
     * Copies the private key to a byte array.
     * @param {BSTR} strExportType A <b>BSTR</b> value that specifies how the private key is exported. 
     * 
     * If the key was created by using a CNG KSP (Key Storage Provider), you can specify one of the values allowed by the <i>pszBlobType</i> parameter in the <a href="https://docs.microsoft.com/windows/desktop/api/ncrypt/nf-ncrypt-ncryptexportkey">NCryptExportKey</a> function.
     * @param {Integer} Encoding An <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-encodingtype">EncodingType</a> enumeration value that specifies the type of Unicode encoding to be applied to the string contained in the <i>pstrEncodedKey</i> parameter. The default value is XCN_CRYPT_STRING_BASE64.
     * @returns {BSTR} Pointer to a <b>BSTR</b> variable that contains the private key.
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509privatekey-export
     */
    Export(strExportType, Encoding) {
        strExportType := strExportType is String ? BSTR.Alloc(strExportType).Value : strExportType

        pstrEncodedKey := BSTR()
        result := ComCall(13, this, "ptr", strExportType, "int", Encoding, "ptr", pstrEncodedKey, "HRESULT")
        return pstrEncodedKey
    }

    /**
     * Exports the public key portion of the asymmetric key pair.
     * @returns {IX509PublicKey} Address of a variable that receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509publickey">IX509PublicKey</a> interface that represents the key.
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509privatekey-exportpublickey
     */
    ExportPublicKey() {
        result := ComCall(14, this, "ptr*", &ppPublicKey := 0, "HRESULT")
        return IX509PublicKey(ppPublicKey)
    }

    /**
     * Specifies or retrieves the name of the key container.
     * @remarks
     * 
     * If you do not specify a name, one is created when the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-create">Create</a> method is called.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509privatekey-get_containername
     */
    get_ContainerName() {
        pValue := BSTR()
        result := ComCall(15, this, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * Specifies or retrieves the name of the key container.
     * @remarks
     * 
     * If you do not specify a name, one is created when the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-create">Create</a> method is called.
     * 
     * 
     * @param {BSTR} Value 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509privatekey-put_containername
     */
    put_ContainerName(Value) {
        Value := Value is String ? BSTR.Alloc(Value).Value : Value

        result := ComCall(16, this, "ptr", Value, "HRESULT")
        return result
    }

    /**
     * Specifies or retrieves a prefix added to the name of the key container.
     * @remarks
     * 
     * A prefix can contain any string limited to the maximum length of the key container name and to legal container name characters. For example, if you do not call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-get_containername">ContainerName</a> property to specify a key container name, one is automatically created when the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-create">Create</a> method is called, and the prefix to the container name will be the string "lp". For another example, if you are creating a test harness and want to differentiate key containers by the programs that generated them, you can use the name of the executable as the prefix.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509privatekey-get_containernameprefix
     */
    get_ContainerNamePrefix() {
        pValue := BSTR()
        result := ComCall(17, this, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * Specifies or retrieves a prefix added to the name of the key container.
     * @remarks
     * 
     * A prefix can contain any string limited to the maximum length of the key container name and to legal container name characters. For example, if you do not call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-get_containername">ContainerName</a> property to specify a key container name, one is automatically created when the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-create">Create</a> method is called, and the prefix to the container name will be the string "lp". For another example, if you are creating a test harness and want to differentiate key containers by the programs that generated them, you can use the name of the executable as the prefix.
     * 
     * 
     * @param {BSTR} Value 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509privatekey-put_containernameprefix
     */
    put_ContainerNamePrefix(Value) {
        Value := Value is String ? BSTR.Alloc(Value).Value : Value

        result := ComCall(18, this, "ptr", Value, "HRESULT")
        return result
    }

    /**
     * Specifies or retrieves the name of a smart card reader.
     * @remarks
     * 
     * If you set this property before opening a key, the reader name is concatenated to the name of the key container. The format is \\.&#92;<i>Reader_Name</i>&#92;<i>Container_Name</i>. Prepending the reader name to the key container name enables the name to be disambiguated in subsequent calls to a cryptographic provider. The private key is typically stored in the smart card key container when a smart card is used.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509privatekey-get_readername
     */
    get_ReaderName() {
        pValue := BSTR()
        result := ComCall(19, this, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * Specifies or retrieves the name of a smart card reader.
     * @remarks
     * 
     * If you set this property before opening a key, the reader name is concatenated to the name of the key container. The format is \\.&#92;<i>Reader_Name</i>&#92;<i>Container_Name</i>. Prepending the reader name to the key container name enables the name to be disambiguated in subsequent calls to a cryptographic provider. The private key is typically stored in the smart card key container when a smart card is used.
     * 
     * 
     * @param {BSTR} Value 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509privatekey-put_readername
     */
    put_ReaderName(Value) {
        Value := Value is String ? BSTR.Alloc(Value).Value : Value

        result := ComCall(20, this, "ptr", Value, "HRESULT")
        return result
    }

    /**
     * Specifies or retrieves a collection of ICspInformation objects that contain information about the available cryptographic providers that support the public key algorithm associated with the private key.
     * @remarks
     * 
     * The enrollment process expects the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icspinformations">ICspInformations</a> collection to include all providers installed on the client computer. You should therefore not attempt to set this property to a subset of the installed providers. We recommend that you create  an empty  collection and call <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icspinformations-addavailablecsps">AddAvailableCsps</a> to  populate it. Build this collection once and set it on all top level request objects (or the private key if you are using the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509privatekey">IX509PrivateKey</a> object directly) to avoid the cost of creating multiple collections. An <b>ICspInformations</b> collection is large.
     * 
     * 
     * @returns {ICspInformations} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509privatekey-get_cspinformations
     */
    get_CspInformations() {
        result := ComCall(21, this, "ptr*", &ppValue := 0, "HRESULT")
        return ICspInformations(ppValue)
    }

    /**
     * Specifies or retrieves a collection of ICspInformation objects that contain information about the available cryptographic providers that support the public key algorithm associated with the private key.
     * @remarks
     * 
     * The enrollment process expects the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icspinformations">ICspInformations</a> collection to include all providers installed on the client computer. You should therefore not attempt to set this property to a subset of the installed providers. We recommend that you create  an empty  collection and call <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icspinformations-addavailablecsps">AddAvailableCsps</a> to  populate it. Build this collection once and set it on all top level request objects (or the private key if you are using the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509privatekey">IX509PrivateKey</a> object directly) to avoid the cost of creating multiple collections. An <b>ICspInformations</b> collection is large.
     * 
     * 
     * @param {ICspInformations} pValue 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509privatekey-put_cspinformations
     */
    put_CspInformations(pValue) {
        result := ComCall(22, this, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * Specifies or retrieves an ICspStatus object that contains information about the cryptographic provider and algorithm pair associated with the private key.
     * @remarks
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-get_algorithm">Algorithm</a> and <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-get_providername">ProviderName</a> properties are automatically set when you call the <b>CspStatus</b> property. The <b>CspStatus</b> property is typically set during the enrollment process. That is, when a request template specifies multiple provider/algorithm pairs, the enrollment code sets the <b>CspStatus</b> property to the first enabled <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icspstatus">ICspStatus</a> object and tries to create a private key. If a key cannot be created, the enrollment code sets this property to the next enabled <b>ICspStatus</b> object and tries again.
     * 
     * 
     * @returns {ICspStatus} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509privatekey-get_cspstatus
     */
    get_CspStatus() {
        result := ComCall(23, this, "ptr*", &ppValue := 0, "HRESULT")
        return ICspStatus(ppValue)
    }

    /**
     * Specifies or retrieves an ICspStatus object that contains information about the cryptographic provider and algorithm pair associated with the private key.
     * @remarks
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-get_algorithm">Algorithm</a> and <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-get_providername">ProviderName</a> properties are automatically set when you call the <b>CspStatus</b> property. The <b>CspStatus</b> property is typically set during the enrollment process. That is, when a request template specifies multiple provider/algorithm pairs, the enrollment code sets the <b>CspStatus</b> property to the first enabled <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icspstatus">ICspStatus</a> object and tries to create a private key. If a key cannot be created, the enrollment code sets this property to the next enabled <b>ICspStatus</b> object and tries again.
     * 
     * 
     * @param {ICspStatus} pValue 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509privatekey-put_cspstatus
     */
    put_CspStatus(pValue) {
        result := ComCall(24, this, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * Specifies or retrieves the name of the cryptographic provider.
     * @remarks
     * 
     * Setting this property automatically sets the following properties to be consistent with the specified <b>ProviderName</b> value:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-get_keyspec">KeySpec</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-get_legacycsp">LegacyCsp</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-get_providertype">ProviderType</a>
     * </li>
     * </ul>
     * These properties are set in the following manner:
     * 
     * <ul>
     * <li>The provider configuration data is used, if available, to determine the appropriate <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-get_providertype">ProviderType</a> value.</li>
     * <li>If the specified provider is a CNG KSP:<ul>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-get_legacycsp">LegacyCsp</a> property is set to <b>VARIANT_FALSE</b>.</li>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-get_keyspec">KeySpec</a> property is set to <b>XCN_AT_NONE</b>.</li>
     * </ul>
     * </li>
     * <li>If the specified provider is not a CNG KSP:<ul>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-get_legacycsp">LegacyCsp</a> property is set to <b>VARIANT_TRUE</b>.</li>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-get_keyspec">KeySpec</a> property is set to <b>XCN_AT_SIGNATURE</b>.</li>
     * </ul>
     * </li>
     * </ul>
     * If you set the <b>ProviderName</b> property, we recommend that you do not set the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-get_legacycsp">LegacyCsp</a> or <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-get_providertype">ProviderType</a> properties.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509privatekey-get_providername
     */
    get_ProviderName() {
        pValue := BSTR()
        result := ComCall(25, this, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * Specifies or retrieves the name of the cryptographic provider.
     * @remarks
     * 
     * Setting this property automatically sets the following properties to be consistent with the specified <b>ProviderName</b> value:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-get_keyspec">KeySpec</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-get_legacycsp">LegacyCsp</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-get_providertype">ProviderType</a>
     * </li>
     * </ul>
     * These properties are set in the following manner:
     * 
     * <ul>
     * <li>The provider configuration data is used, if available, to determine the appropriate <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-get_providertype">ProviderType</a> value.</li>
     * <li>If the specified provider is a CNG KSP:<ul>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-get_legacycsp">LegacyCsp</a> property is set to <b>VARIANT_FALSE</b>.</li>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-get_keyspec">KeySpec</a> property is set to <b>XCN_AT_NONE</b>.</li>
     * </ul>
     * </li>
     * <li>If the specified provider is not a CNG KSP:<ul>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-get_legacycsp">LegacyCsp</a> property is set to <b>VARIANT_TRUE</b>.</li>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-get_keyspec">KeySpec</a> property is set to <b>XCN_AT_SIGNATURE</b>.</li>
     * </ul>
     * </li>
     * </ul>
     * If you set the <b>ProviderName</b> property, we recommend that you do not set the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-get_legacycsp">LegacyCsp</a> or <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-get_providertype">ProviderType</a> properties.
     * 
     * 
     * @param {BSTR} Value 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509privatekey-put_providername
     */
    put_ProviderName(Value) {
        Value := Value is String ? BSTR.Alloc(Value).Value : Value

        result := ComCall(26, this, "ptr", Value, "HRESULT")
        return result
    }

    /**
     * Specifies or retrieves the type of cryptographic provider associated with the private key.
     * @remarks
     * 
     * You can use this property to force the use of the default provider for a given provider type. For example, to use the <b>PROV_RSA_SCHANNEL</b> provider, set this property to the <b>XCN_PROV_RSA_SCHANNEL</b><a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-x509providertype">X509ProviderType</a> enumeration value and do not specify a value for the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-get_providername">ProviderName</a> property.
     * 
     * Setting this property automatically sets the following properties to be consistent with the specified <b>ProviderType</b> value:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-get_keyspec">KeySpec</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-get_legacycsp">LegacyCsp</a>
     * </li>
     * </ul>
     * These properties are set in the following manner:
     * 
     * <ul>
     * <li>If the <b>ProviderType</b> is set to <b>XCN_PROV_NONE</b>:<ul>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-get_legacycsp">LegacyCsp</a> property is set to <b>VARIANT_FALSE</b>.</li>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-get_keyspec">KeySpec</a> property is set to <b>XCN_AT_NONE</b>.</li>
     * </ul>
     * </li>
     * <li>If the <b>ProviderType</b> is not set to <b>XCN_PROV_NONE</b>:<ul>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-get_legacycsp">LegacyCsp</a> property is set to <b>VARIANT_TRUE</b>.</li>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-get_keyspec">KeySpec</a> property is set to <b>XCN_AT_SIGNATURE</b> if the  current value is <b>XCN_AT_NONE</b>.</li>
     * </ul>
     * </li>
     * </ul>
     * Because  a previously specified <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-get_providername">ProviderName</a> is not affected by setting the <b>ProviderType</b> property, setting a <b>ProviderType</b> that is inconsistent with the <b>ProviderName</b> property will result in undefined behavior, likely a failure when creating or opening a private key. We recommend that you set the <b>ProviderType</b> property only when attempting to force the use of the default provider for the specified type as discussed above.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509privatekey-get_providertype
     */
    get_ProviderType() {
        result := ComCall(27, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Specifies or retrieves the type of cryptographic provider associated with the private key.
     * @remarks
     * 
     * You can use this property to force the use of the default provider for a given provider type. For example, to use the <b>PROV_RSA_SCHANNEL</b> provider, set this property to the <b>XCN_PROV_RSA_SCHANNEL</b><a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-x509providertype">X509ProviderType</a> enumeration value and do not specify a value for the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-get_providername">ProviderName</a> property.
     * 
     * Setting this property automatically sets the following properties to be consistent with the specified <b>ProviderType</b> value:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-get_keyspec">KeySpec</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-get_legacycsp">LegacyCsp</a>
     * </li>
     * </ul>
     * These properties are set in the following manner:
     * 
     * <ul>
     * <li>If the <b>ProviderType</b> is set to <b>XCN_PROV_NONE</b>:<ul>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-get_legacycsp">LegacyCsp</a> property is set to <b>VARIANT_FALSE</b>.</li>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-get_keyspec">KeySpec</a> property is set to <b>XCN_AT_NONE</b>.</li>
     * </ul>
     * </li>
     * <li>If the <b>ProviderType</b> is not set to <b>XCN_PROV_NONE</b>:<ul>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-get_legacycsp">LegacyCsp</a> property is set to <b>VARIANT_TRUE</b>.</li>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-get_keyspec">KeySpec</a> property is set to <b>XCN_AT_SIGNATURE</b> if the  current value is <b>XCN_AT_NONE</b>.</li>
     * </ul>
     * </li>
     * </ul>
     * Because  a previously specified <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-get_providername">ProviderName</a> is not affected by setting the <b>ProviderType</b> property, setting a <b>ProviderType</b> that is inconsistent with the <b>ProviderName</b> property will result in undefined behavior, likely a failure when creating or opening a private key. We recommend that you set the <b>ProviderType</b> property only when attempting to force the use of the default provider for the specified type as discussed above.
     * 
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509privatekey-put_providertype
     */
    put_ProviderType(Value) {
        result := ComCall(28, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * Specifies or retrieves a Boolean value that indicates whether the provider is a CryptoAPI (legacy) cryptographic service provider (CSP).
     * @remarks
     * 
     * Setting this property automatically sets the following properties to be consistent with the specified <b>LegacyCsp</b> value:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-get_keyspec">KeySpec</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-get_providertype">ProviderType</a>
     * </li>
     * </ul>
     * These properties are set in the following manner:
     * 
     * <ul>
     * <li>If the <b>LegacyCsp</b> property is set to <b>VARIANT_FALSE</b>:<ul>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-get_providertype">ProviderType</a> is set to <b>XCN_PROV_NONE</b>.</li>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-get_keyspec">KeySpec</a> property is set to <b>XCN_AT_NONE</b>.</li>
     * </ul>
     * </li>
     * <li>If the <b>LegacyCsp</b> property is set to <b>VARIANT_TRUE</b>:<ul>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-get_providertype">ProviderType</a> is set to <b>XCN_PROV_RSA_FULL</b> if the current value is <b>XCN_PROV_NONE</b>.</li>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-get_keyspec">KeySpec</a> property is set to <b>XCN_AT_SIGNATURE</b> if the current property is <b>XCN_AT_NONE</b>.</li>
     * </ul>
     * </li>
     * </ul>
     * Because  a previously specified <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-get_providername">ProviderName</a> is not affected by setting the <b>LegacyCsp</b> property, setting a <b>LegacyCsp</b> that is inconsistent with the <b>ProviderName</b> property will result in undefined behavior, likely a failure when creating or opening a private key.
     * 
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509privatekey-get_legacycsp
     */
    get_LegacyCsp() {
        result := ComCall(29, this, "short*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Specifies or retrieves a Boolean value that indicates whether the provider is a CryptoAPI (legacy) cryptographic service provider (CSP).
     * @remarks
     * 
     * Setting this property automatically sets the following properties to be consistent with the specified <b>LegacyCsp</b> value:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-get_keyspec">KeySpec</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-get_providertype">ProviderType</a>
     * </li>
     * </ul>
     * These properties are set in the following manner:
     * 
     * <ul>
     * <li>If the <b>LegacyCsp</b> property is set to <b>VARIANT_FALSE</b>:<ul>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-get_providertype">ProviderType</a> is set to <b>XCN_PROV_NONE</b>.</li>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-get_keyspec">KeySpec</a> property is set to <b>XCN_AT_NONE</b>.</li>
     * </ul>
     * </li>
     * <li>If the <b>LegacyCsp</b> property is set to <b>VARIANT_TRUE</b>:<ul>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-get_providertype">ProviderType</a> is set to <b>XCN_PROV_RSA_FULL</b> if the current value is <b>XCN_PROV_NONE</b>.</li>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-get_keyspec">KeySpec</a> property is set to <b>XCN_AT_SIGNATURE</b> if the current property is <b>XCN_AT_NONE</b>.</li>
     * </ul>
     * </li>
     * </ul>
     * Because  a previously specified <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-get_providername">ProviderName</a> is not affected by setting the <b>LegacyCsp</b> property, setting a <b>LegacyCsp</b> that is inconsistent with the <b>ProviderName</b> property will result in undefined behavior, likely a failure when creating or opening a private key.
     * 
     * 
     * @param {VARIANT_BOOL} Value 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509privatekey-put_legacycsp
     */
    put_LegacyCsp(Value) {
        result := ComCall(30, this, "short", Value, "HRESULT")
        return result
    }

    /**
     * Specifies or retrieves an object identifier (OID) for the public key algorithm.
     * @remarks
     * 
     * This property is automatically set when the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-get_cspstatus">CspStatus</a> property is called.
     * 
     * 
     * @returns {IObjectId} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509privatekey-get_algorithm
     */
    get_Algorithm() {
        result := ComCall(31, this, "ptr*", &ppValue := 0, "HRESULT")
        return IObjectId(ppValue)
    }

    /**
     * Specifies or retrieves an object identifier (OID) for the public key algorithm.
     * @remarks
     * 
     * This property is automatically set when the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-get_cspstatus">CspStatus</a> property is called.
     * 
     * 
     * @param {IObjectId} pValue 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509privatekey-put_algorithm
     */
    put_Algorithm(pValue) {
        result := ComCall(32, this, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * Specifies or retrieves a value that identifies whether a private key can be used for signing, or encryption, or both.
     * @remarks
     * 
     * If you specify a value of XCN_AT_SIGNATURE, the <b>KeySpec</b> property automatically sets the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-get_keyusage">KeyUsage</a> property to XCN_NCRYPT_ALLOW_SIGNING_FLAG. If you specify XCN_AT_KEYEXCHANGE, the <b>KeyUsage</b> property is set to XCN_NCRYPT_ALLOW_DECRYPT_FLAG |
     * 				 XCN_NCRYPT_ALLOW_KEY_AGREEMENT_FLAG. The <b>KeySpec</b> property only applies to [legacy] providers created by using CryptoAPI.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509privatekey-get_keyspec
     */
    get_KeySpec() {
        result := ComCall(33, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Specifies or retrieves a value that identifies whether a private key can be used for signing, or encryption, or both.
     * @remarks
     * 
     * If you specify a value of XCN_AT_SIGNATURE, the <b>KeySpec</b> property automatically sets the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-get_keyusage">KeyUsage</a> property to XCN_NCRYPT_ALLOW_SIGNING_FLAG. If you specify XCN_AT_KEYEXCHANGE, the <b>KeyUsage</b> property is set to XCN_NCRYPT_ALLOW_DECRYPT_FLAG |
     * 				 XCN_NCRYPT_ALLOW_KEY_AGREEMENT_FLAG. The <b>KeySpec</b> property only applies to [legacy] providers created by using CryptoAPI.
     * 
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509privatekey-put_keyspec
     */
    put_KeySpec(Value) {
        result := ComCall(34, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * Specifies or retrieves the length, in bits, of the private key.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509privatekey-get_length
     */
    get_Length() {
        result := ComCall(35, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Specifies or retrieves the length, in bits, of the private key.
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509privatekey-put_length
     */
    put_Length(Value) {
        result := ComCall(36, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * Specifies or retrieves export constraints for a private key.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509privatekey-get_exportpolicy
     */
    get_ExportPolicy() {
        result := ComCall(37, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Specifies or retrieves export constraints for a private key.
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509privatekey-put_exportpolicy
     */
    put_ExportPolicy(Value) {
        result := ComCall(38, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * Specifies or retrieves a value that identifies the specific purpose for which a private key can be used.
     * @remarks
     * 
     * If you set the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-get_keyspec">KeySpec</a> property for a  legacy CSP to XCN_NCRYPT_ALLOW_SIGNING_FLAG, the <b>KeyUsage</b> property to XCN_NCRYPT_ALLOW_SIGNING_FLAG. If you specify XCN_AT_KEYEXCHANGE, the <b>KeyUsage</b> property is automatically set to XCN_NCRYPT_ALLOW_DECRYPT_FLAG |
     *              XCN_NCRYPT_ALLOW_KEY_AGREEMENT_FLAG.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509privatekey-get_keyusage
     */
    get_KeyUsage() {
        result := ComCall(39, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Specifies or retrieves a value that identifies the specific purpose for which a private key can be used.
     * @remarks
     * 
     * If you set the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-get_keyspec">KeySpec</a> property for a  legacy CSP to XCN_NCRYPT_ALLOW_SIGNING_FLAG, the <b>KeyUsage</b> property to XCN_NCRYPT_ALLOW_SIGNING_FLAG. If you specify XCN_AT_KEYEXCHANGE, the <b>KeyUsage</b> property is automatically set to XCN_NCRYPT_ALLOW_DECRYPT_FLAG |
     *              XCN_NCRYPT_ALLOW_KEY_AGREEMENT_FLAG.
     * 
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509privatekey-put_keyusage
     */
    put_KeyUsage(Value) {
        result := ComCall(40, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * Specifies or retrieves a value that indicates how a private key is protected before use.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509privatekey-get_keyprotection
     */
    get_KeyProtection() {
        result := ComCall(41, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Specifies or retrieves a value that indicates how a private key is protected before use.
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509privatekey-put_keyprotection
     */
    put_KeyProtection(Value) {
        result := ComCall(42, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * Specifies or retrieves a Boolean value that identifies the local certificate store context.
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509privatekey-get_machinecontext
     */
    get_MachineContext() {
        result := ComCall(43, this, "short*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Specifies or retrieves a Boolean value that identifies the local certificate store context.
     * @param {VARIANT_BOOL} Value 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509privatekey-put_machinecontext
     */
    put_MachineContext(Value) {
        result := ComCall(44, this, "short", Value, "HRESULT")
        return result
    }

    /**
     * Specifies or retrieves the security descriptor for the private key.
     * @remarks
     * 
     * To use the security descriptor, you must call the <a href="https://docs.microsoft.com/windows/desktop/api/sddl/nf-sddl-convertstringsecuritydescriptortosecuritydescriptora">ConvertStringSecurityDescriptorToSecurityDescriptor</a> function included with the Microsoft Authorization API and specify the string returned by the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icspinformation-getdefaultsecuritydescriptor">GetDefaultSecurityDescriptor</a> method.
     * 
     * The security descriptor is used to define access to private keys for the computer and user in the following manner:<ul>
     * <li>By default, only local administrators and services running under the LocalSystem account can access private keys associated with the computer account.</li>
     * <li>When a CSP stores the private key of a user in an encrypted file in the user profile, it uses a security descriptor to set access permissions to the file.</li>
     * </ul>
     * 
     * 
     * If the key is not open when you specify a descriptor, the property value  will be set when the key is opened.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509privatekey-get_securitydescriptor
     */
    get_SecurityDescriptor() {
        pValue := BSTR()
        result := ComCall(45, this, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * Specifies or retrieves the security descriptor for the private key.
     * @remarks
     * 
     * To use the security descriptor, you must call the <a href="https://docs.microsoft.com/windows/desktop/api/sddl/nf-sddl-convertstringsecuritydescriptortosecuritydescriptora">ConvertStringSecurityDescriptorToSecurityDescriptor</a> function included with the Microsoft Authorization API and specify the string returned by the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icspinformation-getdefaultsecuritydescriptor">GetDefaultSecurityDescriptor</a> method.
     * 
     * The security descriptor is used to define access to private keys for the computer and user in the following manner:<ul>
     * <li>By default, only local administrators and services running under the LocalSystem account can access private keys associated with the computer account.</li>
     * <li>When a CSP stores the private key of a user in an encrypted file in the user profile, it uses a security descriptor to set access permissions to the file.</li>
     * </ul>
     * 
     * 
     * If the key is not open when you specify a descriptor, the property value  will be set when the key is opened.
     * 
     * 
     * @param {BSTR} Value 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509privatekey-put_securitydescriptor
     */
    put_SecurityDescriptor(Value) {
        Value := Value is String ? BSTR.Alloc(Value).Value : Value

        result := ComCall(46, this, "ptr", Value, "HRESULT")
        return result
    }

    /**
     * Specifies or retrieves a byte array that contains the certificate associated with the private key.
     * @remarks
     * 
     * If the key is not open when you specify a  certificate, the certificate will be set when the key is opened. For more information, see the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-open">Open</a> method.
     * 
     * The <b>Certificate</b> property compares the public key associated with the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509privatekey">IX509PrivateKey</a> object to the public key included in the certificate. The two keys must match.
     * 
     * 
     * @param {Integer} Encoding 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509privatekey-get_certificate
     */
    get_Certificate(Encoding) {
        pValue := BSTR()
        result := ComCall(47, this, "int", Encoding, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * Specifies or retrieves a byte array that contains the certificate associated with the private key.
     * @remarks
     * 
     * If the key is not open when you specify a  certificate, the certificate will be set when the key is opened. For more information, see the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-open">Open</a> method.
     * 
     * The <b>Certificate</b> property compares the public key associated with the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509privatekey">IX509PrivateKey</a> object to the public key included in the certificate. The two keys must match.
     * 
     * 
     * @param {Integer} Encoding 
     * @param {BSTR} Value 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509privatekey-put_certificate
     */
    put_Certificate(Encoding, Value) {
        Value := Value is String ? BSTR.Alloc(Value).Value : Value

        result := ComCall(48, this, "int", Encoding, "ptr", Value, "HRESULT")
        return result
    }

    /**
     * Retrieves a unique name for the key container.
     * @remarks
     * 
     * This property retrieves an alternate name that can be used when accessing a key when you believe that the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-get_containername">ContainerName</a> property value is not unique enough to provide adequate identification. Typically the key container creates the name. For example, the Cryptography API: Next Generation (CNG) key storage provider (KSP) returns the name of the encrypted file that contains the key.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509privatekey-get_uniquecontainername
     */
    get_UniqueContainerName() {
        pValue := BSTR()
        result := ComCall(49, this, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * Retrieves a Boolean value that specifies whether the private key is open.
     * @remarks
     * 
     * You can call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-create">Create</a> method to create a private key, and call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-open">Open</a> method to open one.
     * 
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509privatekey-get_opened
     */
    get_Opened() {
        result := ComCall(50, this, "short*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Retrieves a Boolean value that specifies whether the private key represents the default key container.
     * @remarks
     * 
     * Key containers are identified by name. The name can be specified by the client, or it can be a default value supported by the CSP or KSP. For example, some CSPs use the logon name of the current user as the default container name.
     * 
     * This property value is set when the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-open">Open</a> or <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-create">Create</a> methods are called.
     * 
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509privatekey-get_defaultcontainer
     */
    get_DefaultContainer() {
        result := ComCall(51, this, "short*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Specifies or retrieves a Boolean value that indicates whether the private key has been created or imported.
     * @remarks
     * 
     * Call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-create">Create</a> method to create a new private key. Call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-open">Open</a> method to open an existing key.
     * 
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509privatekey-get_existing
     */
    get_Existing() {
        result := ComCall(52, this, "short*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Specifies or retrieves a Boolean value that indicates whether the private key has been created or imported.
     * @remarks
     * 
     * Call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-create">Create</a> method to create a new private key. Call the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-open">Open</a> method to open an existing key.
     * 
     * 
     * @param {VARIANT_BOOL} Value 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509privatekey-put_existing
     */
    put_Existing(Value) {
        result := ComCall(53, this, "short", Value, "HRESULT")
        return result
    }

    /**
     * Specifies or retrieves a Boolean value that indicates whether the Certificate Enrollment Control is allowed to display a dialog box when the private key is accessed.
     * @remarks
     * 
     * If the user interface is not allowed but is required to access the private key, operations that require the user interface will fail.
     * 
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509privatekey-get_silent
     */
    get_Silent() {
        result := ComCall(54, this, "short*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Specifies or retrieves a Boolean value that indicates whether the Certificate Enrollment Control is allowed to display a dialog box when the private key is accessed.
     * @remarks
     * 
     * If the user interface is not allowed but is required to access the private key, operations that require the user interface will fail.
     * 
     * 
     * @param {VARIANT_BOOL} Value 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509privatekey-put_silent
     */
    put_Silent(Value) {
        result := ComCall(55, this, "short", Value, "HRESULT")
        return result
    }

    /**
     * Specifies or retrieves the ID of the window used to display key information.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509privatekey-get_parentwindow
     */
    get_ParentWindow() {
        result := ComCall(56, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Specifies or retrieves the ID of the window used to display key information.
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509privatekey-put_parentwindow
     */
    put_ParentWindow(Value) {
        result := ComCall(57, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * Specifies or retrieves a string that contains user interface text associated with the private key.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509privatekey-get_uicontextmessage
     */
    get_UIContextMessage() {
        pValue := BSTR()
        result := ComCall(58, this, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * Specifies or retrieves a string that contains user interface text associated with the private key.
     * @param {BSTR} Value 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509privatekey-put_uicontextmessage
     */
    put_UIContextMessage(Value) {
        Value := Value is String ? BSTR.Alloc(Value).Value : Value

        result := ComCall(59, this, "ptr", Value, "HRESULT")
        return result
    }

    /**
     * Specifies a personal identification number (PIN) that is used to authenticate users prior to accessing a private key container on a smart card.
     * @param {BSTR} Value 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509privatekey-put_pin
     */
    put_Pin(Value) {
        Value := Value is String ? BSTR.Alloc(Value).Value : Value

        result := ComCall(60, this, "ptr", Value, "HRESULT")
        return result
    }

    /**
     * Specifies or retrieves a display name for the private key.
     * @remarks
     * 
     * This property can contain any text and is intended to be displayed in a user interface to identify the private key.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509privatekey-get_friendlyname
     */
    get_FriendlyName() {
        pValue := BSTR()
        result := ComCall(61, this, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * Specifies or retrieves a display name for the private key.
     * @remarks
     * 
     * This property can contain any text and is intended to be displayed in a user interface to identify the private key.
     * 
     * 
     * @param {BSTR} Value 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509privatekey-put_friendlyname
     */
    put_FriendlyName(Value) {
        Value := Value is String ? BSTR.Alloc(Value).Value : Value

        result := ComCall(62, this, "ptr", Value, "HRESULT")
        return result
    }

    /**
     * Specifies or retrieves a string that contains a description of the private key.
     * @remarks
     * 
     * This property can contain any text and is intended to be displayed in a user interface to identify the nature and uses of the private key.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509privatekey-get_description
     */
    get_Description() {
        pValue := BSTR()
        result := ComCall(63, this, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * Specifies or retrieves a string that contains a description of the private key.
     * @remarks
     * 
     * This property can contain any text and is intended to be displayed in a user interface to identify the nature and uses of the private key.
     * 
     * 
     * @param {BSTR} Value 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-ix509privatekey-put_description
     */
    put_Description(Value) {
        Value := Value is String ? BSTR.Alloc(Value).Value : Value

        result := ComCall(64, this, "ptr", Value, "HRESULT")
        return result
    }
}
