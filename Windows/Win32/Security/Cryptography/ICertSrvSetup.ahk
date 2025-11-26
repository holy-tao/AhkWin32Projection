#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include .\ICertSrvSetupKeyInformationCollection.ahk
#Include .\ICertSrvSetupKeyInformation.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Defines functionality to install and uninstall Certification Authority (CA) and Certification Authority Web Enrollment roles on a Certificate Services computer.
 * @see https://docs.microsoft.com/windows/win32/api//casetup/nn-casetup-icertsrvsetup
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class ICertSrvSetup extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICertSrvSetup
     * @type {Guid}
     */
    static IID => Guid("{b760a1bb-4784-44c0-8f12-555f0780ff25}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CAErrorId", "get_CAErrorString", "InitializeDefaults", "GetCASetupProperty", "SetCASetupProperty", "IsPropertyEditable", "GetSupportedCATypes", "GetProviderNameList", "GetKeyLengthList", "GetHashAlgorithmList", "GetPrivateKeyContainerList", "GetExistingCACertificates", "CAImportPFX", "SetCADistinguishedName", "SetDatabaseInformation", "SetParentCAInformation", "SetWebCAInformation", "Install", "PreUnInstall", "PostUnInstall"]

    /**
     * @type {Integer} 
     */
    CAErrorId {
        get => this.get_CAErrorId()
    }

    /**
     * @type {BSTR} 
     */
    CAErrorString {
        get => this.get_CAErrorString()
    }

    /**
     * Gets the ID for additional error information related to a failed certification authority (CA) specification.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//casetup/nf-casetup-icertsrvsetup-get_caerrorid
     */
    get_CAErrorId() {
        result := ComCall(7, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Gets the string data for additional error information related to a failed certification authority (CA) specification.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//casetup/nf-casetup-icertsrvsetup-get_caerrorstring
     */
    get_CAErrorString() {
        pVal := BSTR()
        result := ComCall(8, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * Initializes a CCertSrvSetup object with default values to enable installation of the Certification Authority role.
     * @remarks
     * 
     * If the policy statement file "CAPolicy.inf" is installed, <b>InitializeDefaults</b> processes it.
     * 
     * 
     * @param {VARIANT_BOOL} bServer A value that indicates whether a CA will be installed on the computer. A <b>VARIANT_TRUE</b> value indicates that the role will be installed. Neither the Certification Authority nor Certification Authority Web Enrollment roles can be previously installed on the computer.
     * @param {VARIANT_BOOL} bClient A value that indicates whether a Certification Authority Web Enrollment role will be installed on the computer. A <b>VARIANT_TRUE</b> value indicates that the role will be installed. This role cannot be previously installed on the computer.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//casetup/nf-casetup-icertsrvsetup-initializedefaults
     */
    InitializeDefaults(bServer, bClient) {
        result := ComCall(9, this, "short", bServer, "short", bClient, "HRESULT")
        return result
    }

    /**
     * Gets a property value for a certification authority (CA) configuration.
     * @param {Integer} propertyId A value of the <a href="https://docs.microsoft.com/windows/win32/api/casetup/ne-casetup-casetupproperty">CASetupProperty</a> enumeration that specifies the type of property to get.
     * @returns {VARIANT} A <b>VARIANT</b> value that specifies the property value. The <b>VARIANT</b> type depends on the property type. For more information about the <b>VARIANT</b> type, see <a href="https://docs.microsoft.com/windows/win32/api/casetup/ne-casetup-casetupproperty">CASetupProperty</a>.
     * @see https://docs.microsoft.com/windows/win32/api//casetup/nf-casetup-icertsrvsetup-getcasetupproperty
     */
    GetCASetupProperty(propertyId) {
        pPropertyValue := VARIANT()
        result := ComCall(10, this, "int", propertyId, "ptr", pPropertyValue, "HRESULT")
        return pPropertyValue
    }

    /**
     * Sets a property value for a certification authority (CA) configuration.
     * @param {Integer} propertyId A <a href="https://docs.microsoft.com/windows/win32/api/casetup/ne-casetup-casetupproperty">CASetupProperty</a> constant that specifies the type of property to configure.
     * 
     * The following properties are set as a side effect of other methods and cannot be set directly with this method.
     * 
     * <b>ENUM_SETUPPROP_CANAME</b>
     * <b>ENUM_SETUPPROP_CADSSUFFIX</b>
     * <b>ENUM_SETUPPROP_EXPIRATIONDATE</b>
     * <b>ENUM_SETUPPROP_PARENTCANAME</b>
     * <b>ENUM_SETUPPROP_PARENTCAMACHINE</b>
     * <b>ENUM_SETUPPROP_DATABASEDIRECTORY</b>
     * <b>ENUM_SETUPPROP_LOGDIRECTORY</b>
     * <b>ENUM_SETUPPROP_SHAREDFOLDER</b>
     * <b>ENUM_SETUPPROP_WEBCAMACHINE</b>
     * <b>ENUM_SETUPPROP_WEBCANAME</b>
     * @param {Pointer<VARIANT>} pPropertyValue A pointer to a <b>VARIANT</b> that specifies the property value. The <b>VARIANT</b> type depends on the property type. For more information about the <b>VARIANT</b> type, see <a href="https://docs.microsoft.com/windows/win32/api/casetup/ne-casetup-casetupproperty">CASetupProperty</a>.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//casetup/nf-casetup-icertsrvsetup-setcasetupproperty
     */
    SetCASetupProperty(propertyId, pPropertyValue) {
        result := ComCall(11, this, "int", propertyId, "ptr", pPropertyValue, "HRESULT")
        return result
    }

    /**
     * Indicates to the caller whether a specified property can be edited.
     * @param {Integer} propertyId A <a href="https://docs.microsoft.com/windows/win32/api/casetup/ne-casetup-casetupproperty">CASetupProperty</a> constant that specifies the type of property to query.
     * @returns {VARIANT_BOOL} A value that indicates whether the property can be edited.
     * @see https://docs.microsoft.com/windows/win32/api//casetup/nf-casetup-icertsrvsetup-ispropertyeditable
     */
    IsPropertyEditable(propertyId) {
        result := ComCall(12, this, "int", propertyId, "short*", &pbEditable := 0, "HRESULT")
        return pbEditable
    }

    /**
     * Gets the types of certification authorities (CAs) that can be installed on a computer under the caller context.
     * @returns {VARIANT} A pointer to a <b>VARIANT</b> array of <b>VT_UI4</b> types that specify the supported CAs. The <a href="https://docs.microsoft.com/windows/desktop/api/certsrv/ne-certsrv-enum_catypes">ENUM_CATYPES</a> enumeration specifies the possible values for the array.
     * @see https://docs.microsoft.com/windows/win32/api//casetup/nf-casetup-icertsrvsetup-getsupportedcatypes
     */
    GetSupportedCATypes() {
        pCATypes := VARIANT()
        result := ComCall(13, this, "ptr", pCATypes, "HRESULT")
        return pCATypes
    }

    /**
     * Gets the list of cryptographic service providers (CSPs) that provide asymmetric key signature algorithms on the computer.
     * @returns {VARIANT} A pointer to a <b>VARIANT</b> array of <b>VT_BSTR</b> types, where each string represents the name of a CSP.
     * @see https://docs.microsoft.com/windows/win32/api//casetup/nf-casetup-icertsrvsetup-getprovidernamelist
     */
    GetProviderNameList() {
        pVal := VARIANT()
        result := ComCall(14, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * Gets the list of key lengths supported by the specified cryptographic service provider (CSP).
     * @param {BSTR} bstrProviderName A string that contains the name of the provider. For key storage providers, this must be in the form <i>PublicKeyAlgorithmName</i>#<i>KeyStorageProviderName</i> for example "RSA#Microsoft Software Key Storage provider".
     * @returns {VARIANT} A pointer to a <b>VARIANT</b> array of <b>VT_UI4</b> types that correspond to the key lengths supported by the CSP.
     * @see https://docs.microsoft.com/windows/win32/api//casetup/nf-casetup-icertsrvsetup-getkeylengthlist
     */
    GetKeyLengthList(bstrProviderName) {
        bstrProviderName := bstrProviderName is String ? BSTR.Alloc(bstrProviderName).Value : bstrProviderName

        pVal := VARIANT()
        result := ComCall(15, this, "ptr", bstrProviderName, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * Gets the list of hash algorithms supported by the specified cryptographic service provider (CSP) for an asymmetric signature key algorithm.
     * @param {BSTR} bstrProviderName A string that contains the provider name. For key storage providers, this must be in the form <i>PublicKeyAlgorithmName</i>#<i>KeyStorageProviderName</i> for example "RSA#Microsoft Software Key Storage provider".
     * @returns {VARIANT} A pointer to a <b>VARIANT</b> array of <b>VT_BSTR</b> types, where each string represents the name of an hash algorithm supported by the CSP.
     * @see https://docs.microsoft.com/windows/win32/api//casetup/nf-casetup-icertsrvsetup-gethashalgorithmlist
     */
    GetHashAlgorithmList(bstrProviderName) {
        bstrProviderName := bstrProviderName is String ? BSTR.Alloc(bstrProviderName).Value : bstrProviderName

        pVal := VARIANT()
        result := ComCall(16, this, "ptr", bstrProviderName, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * Gets the list of key container names stored by the specified cryptographic service provider (CSP) for asymmetric signature key algorithms.
     * @param {BSTR} bstrProviderName A string that contains the name of the provider. For key storage providers, this must be in the form <i>PublicKeyAlgorithmName</i>#<i>KeyStorageProviderName</i> for example "RSA#Microsoft Software Key Storage provider".
     * @returns {VARIANT} A pointer to a <b>VARIANT</b> array of <b>VT_BSTR</b> types, where each string represents the name of a key container used by the specified CSP.
     * @see https://docs.microsoft.com/windows/win32/api//casetup/nf-casetup-icertsrvsetup-getprivatekeycontainerlist
     */
    GetPrivateKeyContainerList(bstrProviderName) {
        bstrProviderName := bstrProviderName is String ? BSTR.Alloc(bstrProviderName).Value : bstrProviderName

        pVal := VARIANT()
        result := ComCall(17, this, "ptr", bstrProviderName, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * Gets the collection of CertSrvSetupKeyInformation objects that represent valid certification authority (CA) certificates currently installed on the computer.
     * @remarks
     * 
     * The <b>CertSrvSetupKeyInformationCollection</b> object contains valid certificates. A certificate is considered valid if it satisfies the following criteria:
     * 
     * <ul>
     * <li>Contains an AT_SIGNATURE key that matches the key in the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">private key</a> container.
     * </li>
     * <li>Is self-signed or has basic constraints for a CA.</li>
     * <li>Passes chain validation but might have an offline revocation error.
     * </li>
     * </ul>
     * 
     * 
     * @returns {ICertSrvSetupKeyInformationCollection} The address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/casetup/nn-casetup-icertsrvsetupkeyinformationcollection">ICertSrvSetupKeyInformationCollection</a> interface that can be used to access information for the set of valid CA certificates installed in the "LocalMachine" store.
     * @see https://docs.microsoft.com/windows/win32/api//casetup/nf-casetup-icertsrvsetup-getexistingcacertificates
     */
    GetExistingCACertificates() {
        result := ComCall(18, this, "ptr*", &ppVal := 0, "HRESULT")
        return ICertSrvSetupKeyInformationCollection(ppVal)
    }

    /**
     * Imports a certification authority (CA) certificate and its associated private key into the local computer store.
     * @remarks
     * 
     * The <b>CAImportPFX</b> method uses the input parameters to decrypt and decode a PFX file and then installs the key and <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certificate</a> in the local computer store. If the certificate satisfies the following criteria and after installation of the key, the method returns an <a href="https://docs.microsoft.com/windows/desktop/api/casetup/nn-casetup-icertsrvsetupkeyinformation">ICertSrvSetupKeyInformation</a> object to the caller.
     * 
     * <ul>
     * <li>Contains an AT_SIGNATURE key that matches the key in the private key container.
     * </li>
     * <li>Is self-signed or has basic constraints for a CA.</li>
     * <li>Passes chain validation but might have an offline revocation error.
     * </li>
     * </ul>
     * If the PFX file contains multiple certificates and keys, <b>CAImportPFX</b> installs all of the certificates and keys; however, the returned <a href="https://docs.microsoft.com/windows/desktop/api/casetup/nn-casetup-icertsrvsetupkeyinformation">ICertSrvSetupKeyInformation</a> object only contains properties of the last CA certificate in the file. When the caller finishes using the <b>ICertSrvSetupKeyInformation</b> object, the caller must release it by using the <a href="https://docs.microsoft.com/windows/win32/api/unknwn/nf-unknwn-iunknown-release">Release</a> method.
     * 
     * 
     * @param {BSTR} bstrFileName A string that contains the name of a PFX file used to import a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">private key</a>.
     * @param {BSTR} bstrPasswd A string that contains a password for the PFX file.
     * @param {VARIANT_BOOL} bOverwriteExistingKey A value that indicates whether to overwrite an existing key of the same name.
     * @returns {ICertSrvSetupKeyInformation} The address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/casetup/nn-casetup-icertsrvsetupkeyinformation">ICertSrvSetupKeyInformation</a> interface that can be used to set properties of the imported private key.
     * @see https://docs.microsoft.com/windows/win32/api//casetup/nf-casetup-icertsrvsetup-caimportpfx
     */
    CAImportPFX(bstrFileName, bstrPasswd, bOverwriteExistingKey) {
        bstrFileName := bstrFileName is String ? BSTR.Alloc(bstrFileName).Value : bstrFileName
        bstrPasswd := bstrPasswd is String ? BSTR.Alloc(bstrPasswd).Value : bstrPasswd

        result := ComCall(19, this, "ptr", bstrFileName, "ptr", bstrPasswd, "short", bOverwriteExistingKey, "ptr*", &ppVal := 0, "HRESULT")
        return ICertSrvSetupKeyInformation(ppVal)
    }

    /**
     * Sets a certification authority (CA) common name and an optional distinguished name suffix.
     * @remarks
     * 
     * Upon success, the <b>SetCADistinguishedName</b> method changes the <b>ENUM_SETUPPROP_CANAME</b> and <b>ENUM_SETUPPROP_CADSSUFFIX</b> property values to reflect the <i>bstrCADN</i> name. For more information about setup properties, see <a href="https://docs.microsoft.com/windows/win32/api/casetup/ne-casetup-casetupproperty">CASetupProperty</a>.
     * 
     * Upon failure, the <b>SetCADistinguishedName</b> method might set additional error information in the <a href="https://docs.microsoft.com/windows/desktop/api/casetup/nf-casetup-icertsrvsetup-get_caerrorid">CAErrorId</a> and <a href="https://docs.microsoft.com/windows/desktop/api/casetup/nf-casetup-icertsrvsetup-get_caerrorstring">CAErrorString</a> properties.
     * 
     * If an existing key and its associated certificate are being used to configure the CA, this method must not be called. If an existing key is being used  to configure the CA, without using the associated certificate, the common name in <i>bstrCADN</i> must match the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">sanitized</a> <b>ContainerName</b> of the key. 
     * 
     * If <i>bstrCADN</i> includes UTF8 encoding, set the appropriate flag in CAPolicy.inf and place it in the  %windir%.
     * 
     * 
     * @param {BSTR} bstrCADN A string that contains the name for a CA in the form <i>CommonName</i>,<i>DistinguishedNameSuffix</i>, where the comma (,) and <i>DistinguishedNameSuffix</i> are optional.
     * 
     * 
     * The following table describes an example of a distinguished name, including the optional distinguished name suffix, for the computer <i>MyServer</i>.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>CN=mydomain-<i>MyServer</i>-CA</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Common name for the <i>MyServer</i> computer that belongs to the <i>MyDomain</i> domain.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>DC=<i>MyDomain</i>,DC=<i>MyCompany</i>,DC=com</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Distinguished name suffix (optional)
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>CN=<i>MyDomain</i>-<i>MyServer</i>-CA,DC=<i>MyDomain</i>,DC=<i>MyCompany</i>,DC=com</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Distinguished name including the optional suffix
     * 
     * </td>
     * </tr>
     * </table>
     * @param {VARIANT_BOOL} bIgnoreUnicode A value that indicates whether to allow Unicode encoding of the name information. A value of <b>VARIANT_TRUE</b> enables Unicode encoding.
     * @param {VARIANT_BOOL} bOverwriteExistingKey A value that indicates whether to allow the name in <i>bstrCADN</i>, even though a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">private key</a> with the same name exists on the computer. A value of <b>VARIANT_TRUE</b> enables the method to overwrite the existing key.
     * @param {VARIANT_BOOL} bOverwriteExistingCAInDS A value that indicates whether to allow the name in <i>bstrCADN</i>, even though a CA with the same distinguished name exists in the directory service. A value of <b>VARIANT_TRUE</b> enables the method to overwrite the existing directory service entry.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//casetup/nf-casetup-icertsrvsetup-setcadistinguishedname
     */
    SetCADistinguishedName(bstrCADN, bIgnoreUnicode, bOverwriteExistingKey, bOverwriteExistingCAInDS) {
        bstrCADN := bstrCADN is String ? BSTR.Alloc(bstrCADN).Value : bstrCADN

        result := ComCall(20, this, "ptr", bstrCADN, "short", bIgnoreUnicode, "short", bOverwriteExistingKey, "short", bOverwriteExistingCAInDS, "HRESULT")
        return result
    }

    /**
     * Sets the database related information for the certification authority (CA) role.
     * @remarks
     * 
     * The <b>SetDatabaseInformation</b> method creates the specified directories if they do not exist.
     * 
     * Upon failure, the <b>SetDatabaseInformation</b> method might set additional error information in the <a href="https://docs.microsoft.com/windows/desktop/api/casetup/nf-casetup-icertsrvsetup-get_caerrorid">CAErrorId</a> and <a href="https://docs.microsoft.com/windows/desktop/api/casetup/nf-casetup-icertsrvsetup-get_caerrorstring">CAErrorString</a> properties.
     * 
     * 
     * @param {BSTR} bstrDBDirectory A string that contains the name of the directory where the CA database files will be stored. This parameter must not be <b>NULL</b> or an empty string.
     * @param {BSTR} bstrLogDirectory A string that contains the name of the directory where the CA database log files will be stored. This parameter must not be <b>NULL</b> or an empty string.
     * @param {BSTR} bstrSharedFolder This parameter is reserved for future use and must be <b>NULL</b> or an empty string.
     * @param {VARIANT_BOOL} bForceOverwrite A value that indicates whether to overwrite any existing database files in the specified directory. A value of <b>VARIANT_TRUE</b> specifies to overwrite existing files.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//casetup/nf-casetup-icertsrvsetup-setdatabaseinformation
     */
    SetDatabaseInformation(bstrDBDirectory, bstrLogDirectory, bstrSharedFolder, bForceOverwrite) {
        bstrDBDirectory := bstrDBDirectory is String ? BSTR.Alloc(bstrDBDirectory).Value : bstrDBDirectory
        bstrLogDirectory := bstrLogDirectory is String ? BSTR.Alloc(bstrLogDirectory).Value : bstrLogDirectory
        bstrSharedFolder := bstrSharedFolder is String ? BSTR.Alloc(bstrSharedFolder).Value : bstrSharedFolder

        result := ComCall(21, this, "ptr", bstrDBDirectory, "ptr", bstrLogDirectory, "ptr", bstrSharedFolder, "short", bForceOverwrite, "HRESULT")
        return result
    }

    /**
     * Sets the parent certification authority (CA) information for a subordinate CA configuration.
     * @remarks
     * 
     * The <b>SetParentCAInformation</b> method pings the parent CA computer to verify that it is available on the network.
     * 
     * Upon success, <b>SetParentCAInformation</b> sets the ENUM_SETUPPROP_PARENTCAMACHINE and ENUM_SETUPPROP_PARENTCANAME properties for the subordinate CA configuration.
     * For more information about setup properties, see <a href="https://docs.microsoft.com/windows/win32/api/casetup/ne-casetup-casetupproperty">CASetupProperty</a>.
     * 
     * 
     * @param {BSTR} bstrCAConfiguration A string that contains a valid configuration for the parent CA. The string must be in the form <i>ComputerName</i> or <i>ComputerName\CAName</i>, where <i>ComputerName</i> is the network name of the parent CA host computer, and <i>CAName</i> is the common name of the parent CA.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//casetup/nf-casetup-icertsrvsetup-setparentcainformation
     */
    SetParentCAInformation(bstrCAConfiguration) {
        bstrCAConfiguration := bstrCAConfiguration is String ? BSTR.Alloc(bstrCAConfiguration).Value : bstrCAConfiguration

        result := ComCall(22, this, "ptr", bstrCAConfiguration, "HRESULT")
        return result
    }

    /**
     * Sets the certification authority (CA) information for the Certification Authority Web Enrollment role.
     * @remarks
     * 
     * The <b>SetWebCAInformation</b> method pings the CA computer to verify that it is available on the network.
     * 
     * Upon success, <b>SetWebCAInformation</b> sets the ENUM_SETUPPROP_WEBCAMACHINE and ENUM_SETUPPROP_WEBCANAME properties for the Certification Authority Web Enrollment role configuration.
     * For more information about setup properties, see <a href="https://docs.microsoft.com/windows/win32/api/casetup/ne-casetup-casetupproperty">CASetupProperty</a>.
     * 
     * 
     * @param {BSTR} bstrCAConfiguration A string that contains a valid configuration for the CA. The string must be in the form <i>ComputerName</i> or <i>ComputerName\CAName</i>, where <i>ComputerName</i> is the network name of the CA host computer, and <i>CAName</i> is the common name of the CA.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//casetup/nf-casetup-icertsrvsetup-setwebcainformation
     */
    SetWebCAInformation(bstrCAConfiguration) {
        bstrCAConfiguration := bstrCAConfiguration is String ? BSTR.Alloc(bstrCAConfiguration).Value : bstrCAConfiguration

        result := ComCall(23, this, "ptr", bstrCAConfiguration, "HRESULT")
        return result
    }

    /**
     * Installs a role as configured in the CCertSrvSetup object.
     * @remarks
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/casetup/nf-casetup-icertsrvsetup-initializedefaults">InitializeDefaults</a> method must be called before calling this or any other method on a <b>CCertSrvSetup</b> object.
     * 
     * Unless the key already exists, the <b>Install</b> method creates a key for the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certification authority</a> (CA) certificate. If the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">cryptographic service provider</a> (CSP) requires interaction, it prompts the user.
     * 
     * 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//casetup/nf-casetup-icertsrvsetup-install
     */
    Install() {
        result := ComCall(24, this, "HRESULT")
        return result
    }

    /**
     * Temporarily saves role-specific state information and then it uninstalls the role.
     * @remarks
     * 
     * The <b>PreUnInstall</b> method should be called before performing a role-specific uninstall.
     * 
     * 
     * @param {VARIANT_BOOL} bClientOnly A value that indicates whether the caller wants to only uninstall the Certification Authority Web Enrollment role. A value of <b>VARIANT_TRUE</b> specifies to only uninstall the Certification Authority Web Enrollment role. This only applies if both the Certification Authority and Certification Authority Web Enrollment roles are installed on the computer.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//casetup/nf-casetup-icertsrvsetup-preuninstall
     */
    PreUnInstall(bClientOnly) {
        result := ComCall(25, this, "short", bClientOnly, "HRESULT")
        return result
    }

    /**
     * Is not implemented and is reserved for future use.
     * @returns {HRESULT} This method does not return a value.
     * @see https://docs.microsoft.com/windows/win32/api//casetup/nf-casetup-icertsrvsetup-postuninstall
     */
    PostUnInstall() {
        result := ComCall(26, this, "HRESULT")
        return result
    }
}
