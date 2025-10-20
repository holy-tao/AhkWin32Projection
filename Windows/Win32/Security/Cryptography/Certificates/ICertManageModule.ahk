#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
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
     * 
     * @param {BSTR} strConfig 
     * @param {BSTR} strStorageLocation 
     * @param {BSTR} strPropertyName 
     * @param {Integer} Flags 
     * @param {Pointer<VARIANT>} pvarProperty 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certmod/nf-certmod-icertmanagemodule-getproperty
     */
    GetProperty(strConfig, strStorageLocation, strPropertyName, Flags, pvarProperty) {
        strConfig := strConfig is String ? BSTR.Alloc(strConfig).Value : strConfig
        strStorageLocation := strStorageLocation is String ? BSTR.Alloc(strStorageLocation).Value : strStorageLocation
        strPropertyName := strPropertyName is String ? BSTR.Alloc(strPropertyName).Value : strPropertyName

        result := ComCall(7, this, "ptr", strConfig, "ptr", strStorageLocation, "ptr", strPropertyName, "int", Flags, "ptr", pvarProperty, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strConfig 
     * @param {BSTR} strStorageLocation 
     * @param {BSTR} strPropertyName 
     * @param {Integer} Flags 
     * @param {Pointer<VARIANT>} pvarProperty 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certmod/nf-certmod-icertmanagemodule-setproperty
     */
    SetProperty(strConfig, strStorageLocation, strPropertyName, Flags, pvarProperty) {
        strConfig := strConfig is String ? BSTR.Alloc(strConfig).Value : strConfig
        strStorageLocation := strStorageLocation is String ? BSTR.Alloc(strStorageLocation).Value : strStorageLocation
        strPropertyName := strPropertyName is String ? BSTR.Alloc(strPropertyName).Value : strPropertyName

        result := ComCall(8, this, "ptr", strConfig, "ptr", strStorageLocation, "ptr", strPropertyName, "int", Flags, "ptr", pvarProperty, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strConfig 
     * @param {BSTR} strStorageLocation 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certmod/nf-certmod-icertmanagemodule-configure
     */
    Configure(strConfig, strStorageLocation, Flags) {
        strConfig := strConfig is String ? BSTR.Alloc(strConfig).Value : strConfig
        strStorageLocation := strStorageLocation is String ? BSTR.Alloc(strStorageLocation).Value : strStorageLocation

        result := ComCall(9, this, "ptr", strConfig, "ptr", strStorageLocation, "int", Flags, "HRESULT")
        return result
    }
}
