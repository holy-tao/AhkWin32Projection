#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Variant\VARIANT.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * Provided to retrieve information about a Certificate Services Policy or Exit module.
 * @remarks
 * 
 * The <b>ICertManageModule</b> interface provides a method to invoke the module user interface for setting and viewing configuration settings. Writers of Policy and Exit modules should implement the <b>ICertManageModule</b> interface (in addition to the <a href="https://docs.microsoft.com/windows/desktop/api/certpol/nn-certpol-icertpolicy">ICertPolicy</a> and <a href="https://docs.microsoft.com/windows/desktop/api/certexit/nn-certexit-icertexit">ICertExit</a> interfaces, respectively). An enterprise <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certification authority</a> (CA) should always use the Microsoft-provided enterprise policy and exit modules; additional exit modules are permitted for enterprise CAs.
 * 
 * The following is an example of what could be used in the DECLARE_REGISTRY macro of a class (CMyCertManagePolicyModule) which implements <b>ICertManageModule</b>.
 * 
 * 
 * ```cpp
 * DECLARE_REGISTRY(
 *     CMyCertManagePolicyModule,
 *     L"MyCode.PolicyManage.1",
 *     L"MyCode.PolicyManage",
 *     IDS_CERTMANAGEPOLICYMODULE_DESC,
 *     THREADFLAGS_BOTH);
 * ```
 * 
 * 
 * The IDS_CERTMANAGEPOLICYMODULE_DESC value is an application-specific identifier that identifies a string table string in the resource file (.rc) which describes the class.
 * 			
 * 			
 * 			
 * 			
 * 
 * <b>ICertManageModule</b> is defined in Certmod.h. When you create your program, however, use Certsrv.h as the include file.
 * 
 * Certificate Services interfaces support both apartment-threading and free-threading models. For better throughput, free threading is recommended.
 * 
 * In Visual Basic Scripting Edition, the name of the class that implements <b>ICertManageModule</b> must be either "PolicyManage" or "PolicyExit", depending on the type of module being created. The following string constants defined in Certmod.h may be used to simplify following the naming convention.
 * 
 * <table>
 * <tr>
 * <th>Constant</th>
 * <th>Value</th>
 * </tr>
 * <tr>
 * <td>
 * <b>wszCERTMANAGEEXIT_POSTFIX</b>
 * 
 * </td>
 * <td>
 * TEXT(".ExitManage")
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * <b>wszCERTMANAGEPOLICY_POSTFIX</b>
 * 
 * </td>
 * <td>
 * TEXT(".PolicyManage")
 * 
 * </td>
 * </tr>
 * </table>
 * 
 * @see https://docs.microsoft.com/windows/win32/api//certmod/nn-certmod-icertmanagemodule
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class ICertManageModule extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICertManageModule
     * @type {Guid}
     */
    static IID => Guid("{e7d7ad42-bd3d-11d1-9a4d-00c04fc297eb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetProperty", "SetProperty", "Configure"]

    /**
     * Retrieves a module's property value.
     * @param {BSTR} strConfig Represents the configuration string for the Certificate Services server in the form COMPUTERNAME\CANAME, where COMPUTERNAME is the Certificate Services server's network name, and CANAME is the common name of the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certification authority</a> (CA) as entered for the CA during Certificate Services setup. For information about the configuration string name, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/certcli/nn-certcli-icertconfig">ICertConfig</a>.
     * @param {BSTR} strStorageLocation A registry key that denotes the storage location in the <b>HKEY_LOCAL_MACHINE</b> hive for the property values. This value is in the following form:
     * 
     * 
     * <pre xml:space="preserve"><b>SYSTEM</b>
     *    <b>CurrentControlSet</b>
     *       <b>Services</b>
     *          <b>CertSvc</b>
     *             <b>Configuration</b>
     *                <i>CAName</i>
     *                   <i>PolicyOrExitModules</i>
     *                      <i>MyModule.PolicyOrExit</i></pre>
     * 
     * 
     * The <i>CAName</i> is the name of the certification authority's configuration string, <i>PolicyOrExitModules</i> will be either "Policy" or "Exit" (depending on whether a Policy or Exit module applies to this implementation of <b>ICertManageModule</b>), and <i>MyModule.PolicyOrExit</i> is the application-specific identifier for the module. Note that <i>CAName</i> is the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">sanitized name</a> for the certification authority. For information about the sanitized name, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/certcli/nf-certcli-icertconfig-getconfig">ICertConfig::GetConfig</a>. The use of this storage location is for future use.
     * @param {BSTR} strPropertyName The name of the property being queried. Policy and exit modules should support the following properties. 
     * 
     * 
     * 
     * 
     * 					
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="Name"></a><a id="name"></a><a id="NAME"></a><dl>
     * <dt><b>Name</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Name of the module.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="Description"></a><a id="description"></a><a id="DESCRIPTION"></a><dl>
     * <dt><b>Description</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Description of the module.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="Copyright"></a><a id="copyright"></a><a id="COPYRIGHT"></a><dl>
     * <dt><b>Copyright</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Copyright pertaining to the module.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="File_Version"></a><a id="file_version"></a><a id="FILE_VERSION"></a><dl>
     * <dt><b>File Version</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Version of the module file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="Product_Version"></a><a id="product_version"></a><a id="PRODUCT_VERSION"></a><dl>
     * <dt><b>Product Version</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Version of the module.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} Flags This parameter is reserved and must be set to zero.
     * @returns {VARIANT} A pointer to a <b>VARIANT</b> that is the retrieved value for the property specified by <i>strPropertyName</i>.
     * @see https://docs.microsoft.com/windows/win32/api//certmod/nf-certmod-icertmanagemodule-getproperty
     */
    GetProperty(strConfig, strStorageLocation, strPropertyName, Flags) {
        strConfig := strConfig is String ? BSTR.Alloc(strConfig).Value : strConfig
        strStorageLocation := strStorageLocation is String ? BSTR.Alloc(strStorageLocation).Value : strStorageLocation
        strPropertyName := strPropertyName is String ? BSTR.Alloc(strPropertyName).Value : strPropertyName

        pvarProperty := VARIANT()
        result := ComCall(7, this, "ptr", strConfig, "ptr", strStorageLocation, "ptr", strPropertyName, "int", Flags, "ptr", pvarProperty, "HRESULT")
        return pvarProperty
    }

    /**
     * Allows a module to set a property value.
     * @param {BSTR} strConfig Represents the configuration string for the Certificate Services server in the form COMPUTERNAME\CANAME, where COMPUTERNAME is the Certificate Services server's network name, and CANAME is the common name of the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certification authority</a> (CA) as entered for the CA during Certificate Services setup. For information about the configuration string name, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/certcli/nn-certcli-icertconfig">ICertConfig</a>.
     * @param {BSTR} strStorageLocation The location that provides storage for the property values, as described in the definition of <i>strStorageLocation</i> in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/certmod/nf-certmod-icertmanagemodule-getproperty">ICertManageModule::GetProperty</a>.
     * @param {BSTR} strPropertyName The name of the property whose value is being assigned. Policy and exit modules should support the following properties, which are used by Certificate Services Manager.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="Name"></a><a id="name"></a><a id="NAME"></a><dl>
     * <dt><b>Name</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Name of the module.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="Description"></a><a id="description"></a><a id="DESCRIPTION"></a><dl>
     * <dt><b>Description</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Description of the module.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="Copyright"></a><a id="copyright"></a><a id="COPYRIGHT"></a><dl>
     * <dt><b>Copyright</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Copyright pertaining to the module.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="File_Version"></a><a id="file_version"></a><a id="FILE_VERSION"></a><dl>
     * <dt><b>File Version</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Version of the module file.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="Product_Version"></a><a id="product_version"></a><a id="PRODUCT_VERSION"></a><dl>
     * <dt><b>Product Version</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Version of the module.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} Flags This parameter is reserved and must be set to zero.
     * @param {Pointer<VARIANT>} pvarProperty A value that is being assigned to the property specified by <i>strPropertyName</i>.
     * @returns {HRESULT} <h3>VB</h3>
     *  If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//certmod/nf-certmod-icertmanagemodule-setproperty
     */
    SetProperty(strConfig, strStorageLocation, strPropertyName, Flags, pvarProperty) {
        strConfig := strConfig is String ? BSTR.Alloc(strConfig).Value : strConfig
        strStorageLocation := strStorageLocation is String ? BSTR.Alloc(strStorageLocation).Value : strStorageLocation
        strPropertyName := strPropertyName is String ? BSTR.Alloc(strPropertyName).Value : strPropertyName

        result := ComCall(8, this, "ptr", strConfig, "ptr", strStorageLocation, "ptr", strPropertyName, "int", Flags, "ptr", pvarProperty, "HRESULT")
        return result
    }

    /**
     * Displays the module user interface.
     * @param {BSTR} strConfig Represents the configuration string for the Certificate Services server in the form COMPUTERNAME\CANAME, where COMPUTERNAME is the Certificate Services server's network name, and CANAME is the common name of the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certification authority</a> (CA) as entered for the CA during Certificate Services setup. For information about the configuration string name, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/certcli/nn-certcli-icertconfig">ICertConfig</a>.
     * @param {BSTR} strStorageLocation A location that provides storage for the property values, as described in the definition of <i>strStorageLocation</i> in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/certmod/nf-certmod-icertmanagemodule-getproperty">ICertManageModule::GetProperty</a>.
     * @param {Integer} Flags A value used to determine whether the configuration interface is to be presented to the user. If this value is zero, the user will be presented with an interface for configuring the module. If this value is CMM_REFRESHONLY, Certificate Services will not display the user interface, but the latest changes to the configuration of the module will be in effect when future certificate requests are processed (this allows changes to be incorporated without requiring a response to a user interface).
     * @returns {HRESULT} <h3>VB</h3>
     *  If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//certmod/nf-certmod-icertmanagemodule-configure
     */
    Configure(strConfig, strStorageLocation, Flags) {
        strConfig := strConfig is String ? BSTR.Alloc(strConfig).Value : strConfig
        strStorageLocation := strStorageLocation is String ? BSTR.Alloc(strStorageLocation).Value : strStorageLocation

        result := ComCall(9, this, "ptr", strConfig, "ptr", strStorageLocation, "int", Flags, "HRESULT")
        return result
    }
}
