#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ICertManageModule.ahk
#Include .\ICertPolicy.ahk

/**
 * Provide communications between the Certificate Services server engine and the policy module.
 * @remarks
 * 
 * Implementers of <a href="https://docs.microsoft.com/windows/desktop/api/certpol/nn-certpol-icertpolicy">ICertPolicy</a> should also implement 
 * <a href="https://docs.microsoft.com/windows/desktop/api/certmod/nn-certmod-icertmanagemodule">ICertManageModule</a>. Additionally, the ProgID for a class implementing <b>ICertPolicy</b> must conform to a naming convention. Specifically, the ProgID must be of the form:
 * 
 * <b>"</b><i>MyApp</i><b>.Policy"</b>
 * 
 * Where <i>MyApp</i> is a specifier that identifies the application. For example, in C++, the following could be used in the DECLARE_REGISTRY macro of a class (CMyCertPolicyModule) which implements <a href="https://docs.microsoft.com/windows/desktop/api/certpol/nn-certpol-icertpolicy">ICertPolicy</a>.
 * 
 * 
 * ```cpp
 * DECLARE_REGISTRY(
 *     CMyCertPolicyModule,
 *     L"MyCode.Policy.1",
 *     L"MyCode.Policy",
 *     IDS_CERTPOLICYMODULE_DESC,
 *     THREADFLAGS_BOTH);
 * ```
 * 
 * 
 * For the previous example, the IDS_CERTPOLICYMODULE_DESC value is an application-specific identifier in the resource file (.rc) for a string which describes the class.
 * 
 * String constants defined in Certmod.h can be used to simplify following the naming convention.
 * 
 * <table>
 * <tr>
 * <th>Constant</th>
 * <th>Value</th>
 * </tr>
 * <tr>
 * <td><b>wszCERTPOLICYMODULE_POSTFIX</b></td>
 * <td>TEXT(".Policy")</td>
 * </tr>
 * </table>
 *  
 * 
 * No more than one Visual Basic Scripting Edition policy module may be registered on the Certificate Services server at one time. If more than one such policy module is registered on the Certificate Services server, the Certification Authority MMC snap-in, Certificate Services application, or Certutil tool may produce errors. Note that the  Visual Basic Scripting Edition development environment automatically registers a DLL when it is successfully built. As a result, you may encounter this situation when one Visual Basic Scripting Edition policy module is already registered and another Visual Basic Scripting Edition policy module is created. To avoid this situation, you must unregister one of the Visual Basic Scripting Edition policy modules, by using the command-line instruction <b>regsvr32 /u </b><i>FileName.dll</i>, where <i>FileName.dll</i> is the name of the Visual Basic Scripting Edition policy module that you do not intend to make active.
 * 
 * Implementers of <a href="https://docs.microsoft.com/windows/desktop/api/certpol/nn-certpol-icertpolicy">ICertPolicy</a> in Visual Basic Scripting Edition must name their project in the form:
 * 
 * <b>"</b><i>MyApp</i><b>"</b>
 * 
 * Where <i>MyApp</i> is a specifier that identifies the application; further, the class implementing <a href="https://docs.microsoft.com/windows/desktop/api/certpol/nn-certpol-icertpolicy">ICertPolicy</a> must be named <b>"Policy"</b>.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//certpol/nn-certpol-icertpolicy2
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class ICertPolicy2 extends ICertPolicy{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICertPolicy2
     * @type {Guid}
     */
    static IID => Guid("{3db4910e-8001-4bf1-aa1b-f43a808317a0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 11

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetManageModule"]

    /**
     * Retrieves the ICertManageModule interface associated with the ICertPolicy2 interface by calling GetManageModule and passing in the address of a pointer to an ICertManageModule.
     * @returns {ICertManageModule} Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/certmod/nn-certmod-icertmanagemodule">ICertManageModule</a> interface associated with the <a href="https://docs.microsoft.com/windows/desktop/api/certpol/nn-certpol-icertpolicy2">ICertPolicy2</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//certpol/nf-certpol-icertpolicy2-getmanagemodule
     */
    GetManageModule() {
        result := ComCall(11, this, "ptr*", &ppManageModule := 0, "HRESULT")
        return ICertManageModule(ppManageModule)
    }
}
