#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\ICspAlgorithms.ahk
#Include .\ICspStatus.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * Provides access to general information about a cryptographic provider.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/nn-certenroll-icspinformation
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class ICspInformation extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICspInformation
     * @type {Guid}
     */
    static IID => Guid("{728ab307-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InitializeFromName", "InitializeFromType", "get_CspAlgorithms", "get_HasHardwareRandomNumberGenerator", "get_IsHardwareDevice", "get_IsRemovable", "get_IsSoftwareDevice", "get_Valid", "get_MaxKeyContainerNameLength", "get_Name", "get_Type", "get_Version", "get_KeySpec", "get_IsSmartCard", "GetDefaultSecurityDescriptor", "get_LegacyCsp", "GetCspStatusFromOperations"]

    /**
     * @type {ICspAlgorithms} 
     */
    CspAlgorithms {
        get => this.get_CspAlgorithms()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    HasHardwareRandomNumberGenerator {
        get => this.get_HasHardwareRandomNumberGenerator()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    IsHardwareDevice {
        get => this.get_IsHardwareDevice()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    IsRemovable {
        get => this.get_IsRemovable()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    IsSoftwareDevice {
        get => this.get_IsSoftwareDevice()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    Valid {
        get => this.get_Valid()
    }

    /**
     * @type {Integer} 
     */
    MaxKeyContainerNameLength {
        get => this.get_MaxKeyContainerNameLength()
    }

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * @type {Integer} 
     */
    Type {
        get => this.get_Type()
    }

    /**
     * @type {Integer} 
     */
    Version {
        get => this.get_Version()
    }

    /**
     * @type {Integer} 
     */
    KeySpec {
        get => this.get_KeySpec()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    IsSmartCard {
        get => this.get_IsSmartCard()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    LegacyCsp {
        get => this.get_LegacyCsp()
    }

    /**
     * Initializes the object from a string that contains a provider name.
     * @param {BSTR} strName A <b>BSTR</b> variable that contains the name.
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
     * The object is already initialized.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-icspinformation-initializefromname
     */
    InitializeFromName(strName) {
        strName := strName is String ? BSTR.Alloc(strName).Value : strName

        result := ComCall(7, this, "ptr", strName, "HRESULT")
        return result
    }

    /**
     * Initializes the object from the default cryptographic provider.
     * @param {Integer} Type An <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/ne-certenroll-x509providertype">X509ProviderType</a> enumeration value that defines the provider type.
     * 
     * <ul>
     * <li>If you specify XCN_PROV_NONE and set the <i>pAlgorithm</i> parameter to a value other than <b>NULL</b>, the default  Cryptography API: Next Generation (CNG) provider is used.</li>
     * <li>If you specify a value other than XCN_PROV_NONE and set the <i>pAlgorithm</i> parameter to <b>NULL</b>, the default legacy cryptographic service provider (CSP) is used.</li>
     * </ul>
     * @param {IObjectId} pAlgorithm Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-iobjectid">IObjectId</a> interface that represents an algorithm OID. This parameter is optional and can be <b>NULL</b>. For more information, see the <i>Type</i> parameter.
     * @param {VARIANT_BOOL} MachineContext A <b>VARIANT_BOOL</b> variable that indicates whether to use the computer or user context to determine the default provider for the specified provider type. Specify <b>VARIANT_TRUE</b> for the computer and <b>VARIANT_FALSE</b> for the user.
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
     * The object is already initialized.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-icspinformation-initializefromtype
     */
    InitializeFromType(Type, pAlgorithm, MachineContext) {
        result := ComCall(8, this, "int", Type, "ptr", pAlgorithm, "short", MachineContext, "HRESULT")
        return result
    }

    /**
     * Retrieves a collection of ICspAlgorithm interfaces that contain information about the algorithms supported by the provider.
     * @remarks
     * 
     * An <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icspalgorithm">ICspAlgorithm</a> object contains information about the cryptographic algorithms supported by the provider. This includes the algorithm <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">object identifier</a> (OID), the permitted key lengths and incremental lengths, the algorithm name and abbreviated name, and a Boolean value that specifies whether the algorithm OID object is valid.
     * 
     * 
     * @returns {ICspAlgorithms} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-icspinformation-get_cspalgorithms
     */
    get_CspAlgorithms() {
        result := ComCall(9, this, "ptr*", &ppValue := 0, "HRESULT")
        return ICspAlgorithms(ppValue)
    }

    /**
     * Retrieves a Boolean value that specifies whether the provider supports a hardware random number generator that can be used to create random bytes for cryptographic operations.
     * @remarks
     * 
     * There are currently no Microsoft cryptographic providers that support this feature.
     * 
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-icspinformation-get_hashardwarerandomnumbergenerator
     */
    get_HasHardwareRandomNumberGenerator() {
        result := ComCall(10, this, "short*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Retrieves a Boolean value that determines whether the provider is implemented in a hardware device.
     * @remarks
     * 
     * This property only specifies whether a provider is implemented in hardware. Because a provider can be implemented in both hardware and software, you cannot assume that a value of true for this property  indicates that there is no software component. You must also examine the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icspinformation-get_issoftwaredevice">IsSoftwareDevice</a> property. The following providers return true for the <b>IsHardwareDevice</b> property:<ul>
     * <li>Microsoft Smart Card Key Storage Provider</li>
     * <li>Microsoft Base Smart Card Crypto Provider</li>
     * </ul>
     * 
     * 
     * Both of these providers also return true for the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icspinformation-get_issoftwaredevice">IsSoftwareDevice</a> property. The Certificate Enrollment service assumes that a provider is a smart card provider if both the <b>IsHardwareDevice</b> and <b>IsSoftwareDevice</b> properties are set, or if the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icspinformation-get_isremovable">IsRemovable</a> property is set.
     * 
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-icspinformation-get_ishardwaredevice
     */
    get_IsHardwareDevice() {
        result := ComCall(11, this, "short*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Retrieves a Boolean value that specifies whether the token that contains the key can be removed.
     * @remarks
     * 
     * Operator cards and  smart cards are examples of removable tokens that can contain keys. For example, the following providers return true for this property value:<ul>
     * <li>Microsoft Smart Card Key Storage Provider</li>
     * <li>Microsoft Base Smart Card Crypto Provider</li>
     * </ul>
     * 
     * 
     * The Certificate Enrollment service assumes that a provider is a smart card provider if both the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icspinformation-get_ishardwaredevice">IsHardwareDevice</a> and <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icspinformation-get_issoftwaredevice">IsSoftwareDevice</a> properties are set, or if the <b>IsRemovable</b> property is set.
     * 
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-icspinformation-get_isremovable
     */
    get_IsRemovable() {
        result := ComCall(12, this, "short*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Retrieves a Boolean value that specifies whether the provider is implemented in software.
     * @remarks
     * 
     * This property only specifies whether a provider is implemented in software. Because a provider can be implemented in both hardware and software, you cannot assume that a value of true for the <b>IsSoftwareDevice</b> property indicates that there is no hardware component. You must also examine the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icspinformation-get_ishardwaredevice">IsHardwareDevice</a> property. The following Microsoft providers return true for the <b>IsSoftwareDevice</b> property:<ul>
     * <li>Microsoft Software Key Storage Provider</li>
     * <li>Microsoft Smart Card Key Storage Provider</li>
     * <li>Microsoft Base Cryptographic Provider v1.0</li>
     * <li>Microsoft Base DSS and Diffie-Hellman Cryptographic Provider</li>
     * <li>Microsoft Base DSS Cryptographic Provider</li>
     * <li>Microsoft Base Smart Card Crypto Provider</li>
     * <li>Microsoft DH Schannel Cryptographic Provider</li>
     * <li>Microsoft Enhanced Cryptographic Provider v1.0</li>
     * <li>Microsoft Enhanced DSS and Diffie-Hellman Cryptographic Provider</li>
     * <li>Microsoft Enhanced RSA and AES Cryptographic Provider</li>
     * <li>Microsoft RSA Schannel Cryptographic Provider</li>
     * <li>Microsoft Strong Cryptographic Provider</li>
     * </ul>
     * 
     * 
     * The Microsoft Smart Card Key Storage Provider and the Microsoft Base Smart Card Crypto Provider also return true for the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icspinformation-get_ishardwaredevice">IsHardwareDevice</a> property. The Certificate Enrollment service assumes a smart card provider if both the <b>IsHardwareDevice</b> and <b>IsSoftwareDevice</b> properties are set, or if the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icspinformation-get_isremovable">IsRemovable</a> property is set.
     * 
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-icspinformation-get_issoftwaredevice
     */
    get_IsSoftwareDevice() {
        result := ComCall(13, this, "short*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Retrieves a Boolean value that specifies whether the provider is installed on the client computer.
     * @remarks
     * 
     * The <b>Valid</b> property is typically set by the Certificate Enrollment Control when it processes the list of providers identified in a template-based certificate request. If a provider listed in the template is not installed on the client, the control creates an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icspinformation">ICspInformation</a> object and sets the value of this property to false. You can use this property value in a user interface to indicate whether a provider is available. If a provider is not installed, only the <b>Valid</b> property and the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icspinformation-get_name">Name</a> property provide meaningful information.
     * 
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-icspinformation-get_valid
     */
    get_Valid() {
        result := ComCall(14, this, "short*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Retrieves the maximum supported length for the name of the private key container associated with the provider.
     * @remarks
     * 
     * The key container name can be specified and retrieved by calling the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-ix509privatekey-get_containername">ContainerName</a> property on the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509privatekey">IX509PrivateKey</a> interface. The values associated with the providers distributed by Microsoft are listed in the following table. Some of these providers may not be included on all operating systems and others may be included instead.<table>
     * <tr>
     * <th>Provider</th>
     * <th>MaxKeyContainerNameLength value</th>
     * </tr>
     * <tr>
     * <td>Microsoft Software Key Storage Provider</td>
     * <td>261</td>
     * </tr>
     * <tr>
     * <td>Microsoft Smart Card Key Storage Provider</td>
     * <td>40</td>
     * </tr>
     * <tr>
     * <td>Microsoft Base Cryptographic Provider v1.0</td>
     * <td>261</td>
     * </tr>
     * <tr>
     * <td>Microsoft Base DSS and Diffie-Hellman Cryptographic Provider</td>
     * <td>261</td>
     * </tr>
     * <tr>
     * <td>Microsoft Base DSS Cryptographic Provider</td>
     * <td>261</td>
     * </tr>
     * <tr>
     * <td>Microsoft Base Smart Card Crypto Provider</td>
     * <td>40</td>
     * </tr>
     * <tr>
     * <td>Microsoft DH Schannel Cryptographic Provider</td>
     * <td>261</td>
     * </tr>
     * <tr>
     * <td>Microsoft Enhanced Cryptographic Provider v1.0</td>
     * <td>261</td>
     * </tr>
     * <tr>
     * <td>Microsoft Enhanced DSS and Diffie-Hellman Cryptographic Provider</td>
     * <td>261</td>
     * </tr>
     * <tr>
     * <td>Microsoft Enhanced RSA and AES Cryptographic Provider</td>
     * <td>261</td>
     * </tr>
     * <tr>
     * <td>Microsoft RSA Schannel Cryptographic Provider</td>
     * <td>261</td>
     * </tr>
     * <tr>
     * <td>Microsoft Strong Cryptographic Provider</td>
     * <td>261</td>
     * </tr>
     * </table>
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-icspinformation-get_maxkeycontainernamelength
     */
    get_MaxKeyContainerNameLength() {
        result := ComCall(15, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Retrieves the name.
     * @remarks
     * 
     * The following list shows the names of some of the Microsoft providers installed on Windows Vista and later. This list is not inclusive:
     * 
     * <ul>
     * <li>Microsoft Software Key Storage Provider</li>
     * <li>Microsoft Smart Card Key Storage Provider</li>
     * <li>Microsoft Base Cryptographic Provider v1.0</li>
     * <li>Microsoft Base DSS and Diffie-Hellman Cryptographic Provider</li>
     * <li>Microsoft Base DSS Cryptographic Provider</li>
     * <li>Microsoft Base Smart Card Crypto Provider</li>
     * <li>Microsoft DH Schannel Cryptographic Provider</li>
     * <li>Microsoft Enhanced Cryptographic Provider v1.0</li>
     * <li>Microsoft Enhanced DSS and Diffie-Hellman Cryptographic Provider</li>
     * <li>Microsoft Enhanced RSA and AES Cryptographic Provider</li>
     * <li>Microsoft RSA Schannel Cryptographic Provider</li>
     * <li>Microsoft Strong Cryptographic Provider</li>
     * </ul>
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-icspinformation-get_name
     */
    get_Name() {
        pValue := BSTR()
        result := ComCall(16, this, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * Retrieves the type of the provider.
     * @remarks
     * 
     * The values associated with the providers distributed by Microsoft are listed in the following table. Some of these providers may not be included on all operating systems and others may be included instead.
     * 
     * <table>
     * <tr>
     * <th>Provider</th>
     * <th>Type value</th>
     * </tr>
     * <tr>
     * <td>Microsoft Software Key Storage Provider</td>
     * <td>XCN_PROV_NONE (0)</td>
     * </tr>
     * <tr>
     * <td>Microsoft Smart Card Key Storage Provider</td>
     * <td>XCN_PROV_NONE (0)</td>
     * </tr>
     * <tr>
     * <td>Microsoft Base Cryptographic Provider v1.0</td>
     * <td>XCN_PROV_RSA_FULL (1)</td>
     * </tr>
     * <tr>
     * <td>Microsoft Base DSS and Diffie-Hellman Cryptographic Provider</td>
     * <td>XCN_PROV_DSS_DH (13)</td>
     * </tr>
     * <tr>
     * <td>Microsoft Base DSS Cryptographic Provider</td>
     * <td>XCN_PROV_DSS (3)</td>
     * </tr>
     * <tr>
     * <td>Microsoft Base Smart Card Crypto Provider</td>
     * <td>XCN_PROV_RSA_FULL (1)</td>
     * </tr>
     * <tr>
     * <td>Microsoft DH Schannel Cryptographic Provider</td>
     * <td>XCN_PROV_DH_SCHANNEL  (18)</td>
     * </tr>
     * <tr>
     * <td>Microsoft Enhanced Cryptographic Provider v1.0</td>
     * <td>XCN_PROV_RSA_FULL (1)</td>
     * </tr>
     * <tr>
     * <td>Microsoft Enhanced DSS and Diffie-Hellman Cryptographic Provider</td>
     * <td>XCN_PROV_DSS_DH (13)</td>
     * </tr>
     * <tr>
     * <td>Microsoft Enhanced RSA and AES Cryptographic Provider</td>
     * <td>XCN_PROV_RSA_AES (24)</td>
     * </tr>
     * <tr>
     * <td>Microsoft RSA Schannel Cryptographic Provider</td>
     * <td>XCN_PROV_RSA_SCHANNEL (12)</td>
     * </tr>
     * <tr>
     * <td>Microsoft Strong Cryptographic Provider</td>
     * <td>CN_PROV_RSA_FULL (1)</td>
     * </tr>
     * </table>
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-icspinformation-get_type
     */
    get_Type() {
        result := ComCall(17, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Retrieves the version number of the provider.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-icspinformation-get_version
     */
    get_Version() {
        result := ComCall(18, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Retrieves a value that specifies the intended use of the algorithms supported by the provider.
     * @remarks
     * 
     * The value retrieved can be 0, 1, 2, or 3. If the value is 0 (XCN_AT_NONE), the provider is a Cryptography API: Next Generation (CNG) provider. The values associated with the providers distributed by Microsoft are listed in the following table. Some of these providers may not be included on all operating systems and others may be included instead.<table>
     * <tr>
     * <th>Provider</th>
     * <th>KeySpec value</th>
     * </tr>
     * <tr>
     * <td>
     * Microsoft Software Key Storage Provider
     * 
     * </td>
     * <td>
     * 0
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Microsoft Smart Card Key Storage Provider
     * 
     * </td>
     * <td>
     * 0
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Microsoft Base Cryptographic Provider v1.0
     * 
     * </td>
     * <td>
     * 3
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Microsoft Base DSS and Diffie-Hellman Cryptographic Provider
     * 
     * </td>
     * <td>
     * 3
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Microsoft Base DSS Cryptographic Provider
     * 
     * </td>
     * <td>
     * 2
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Microsoft Base Smart Card Crypto Provider
     * 
     * </td>
     * <td>
     * 3
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Microsoft DH Schannel Cryptographic Provider
     * 
     * </td>
     * <td>
     * 3
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Microsoft Enhanced Cryptographic Provider v1.0
     * 
     * </td>
     * <td>
     * 3
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Microsoft Enhanced DSS and Diffie-Hellman Cryptographic Provider
     * 
     * </td>
     * <td>
     * 3
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Microsoft Enhanced RSA and AES Cryptographic Provider
     * 
     * </td>
     * <td>
     * 3
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Microsoft RSA Schannel Cryptographic Provider
     * 
     * </td>
     * <td>
     * 1
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Microsoft Strong Cryptographic Provider
     * 
     * </td>
     * <td>
     * 3
     * 
     * </td>
     * </tr>
     * </table>
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-icspinformation-get_keyspec
     */
    get_KeySpec() {
        result := ComCall(19, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Retrieves a Boolean value that specifies whether the provider is a smart card provider.
     * @remarks
     * 
     * A smart card provider is typically identified by the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icspinformation-get_ishardwaredevice">IsHardwareDevice</a> property and the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icspinformation-get_issoftwaredevice">IsSoftwareDevice</a> property being set or the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-icspinformation-get_isremovable">IsRemovable</a> property being set.
     * 
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-icspinformation-get_issmartcard
     */
    get_IsSmartCard() {
        result := ComCall(20, this, "short*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Retrieves the default private key security descriptor.
     * @param {VARIANT_BOOL} MachineContext A <b>VARIANT_BOOL</b> variable that indicates whether to retrieve the security descriptor for the computer or the user. Specify <b>VARIANT_TRUE</b> for the computer and <b>VARIANT_FALSE</b> for the user.
     * @returns {BSTR} Pointer to a  <b>BSTR</b> variable that contains the security descriptor.
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-icspinformation-getdefaultsecuritydescriptor
     */
    GetDefaultSecurityDescriptor(MachineContext) {
        pValue := BSTR()
        result := ComCall(21, this, "short", MachineContext, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * Retrieves a Boolean value that specifies whether the provider is a Cryptography API:\_Next Generation (CNG) provider or a CryptoAPI (legacy) CSP.
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-icspinformation-get_legacycsp
     */
    get_LegacyCsp() {
        result := ComCall(22, this, "short*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * Creates an ICspStatus object for the first supported algorithm that is consistent with the specified signature, encryption, hashing, or cipher operation.
     * @param {IObjectId} pAlgorithm Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-iobjectid">IObjectId</a> interface that represents an algorithm OID. This parameter is optional and can be <b>NULL</b>.   
     * 
     * <ul>
     * <li>If you specify an OID and set the <i>Operations</i>  parameter to <b>XCN_NCRYPT_SIGNATURE_OPERATION</b> and combine this flag with either XCN_NCRYPT_EXACT_MATCH_OPERATION or XCN_NCRYPT_PREFER_SIGNATURE_ONLY_OPERATION, the first signature algorithm, if any, that matches the OID is used.</li>
     * <li>If you specify an OID but do not set the  <i>Operations</i>  parameter to <b>XCN_NCRYPT_SIGNATURE_OPERATION</b>, or you set <b>XCN_NCRYPT_SIGNATURE_OPERATION</b> but do not combine it with either XCN_NCRYPT_EXACT_MATCH_OPERATION or XCN_NCRYPT_PREFER_SIGNATURE_ONLY_OPERATION, the first algorithm that can be used for signing or encryption is used.</li>
     * <li>If you do not specify an OID, the first supported algorithm consistent with the flags specified in the  <i>Operations</i> parameter is used.</li>
     * </ul>
     * @param {Integer} Operations 
     * @returns {ICspStatus} Address of a variable that receives a pointer to an  <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-icspstatus">ICspStatus</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//certenroll/nf-certenroll-icspinformation-getcspstatusfromoperations
     */
    GetCspStatusFromOperations(pAlgorithm, Operations) {
        result := ComCall(23, this, "ptr", pAlgorithm, "int", Operations, "ptr*", &ppValue := 0, "HRESULT")
        return ICspStatus(ppValue)
    }
}
