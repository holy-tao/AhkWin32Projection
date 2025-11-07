#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * Provides communications between the Certificate Services server and an exit module.
 * @remarks
 * 
  * Implementers of <b>ICertExit</b> should also implement 
  * <a href="https://docs.microsoft.com/windows/desktop/api/certmod/nn-certmod-icertmanagemodule">ICertManageModule</a>. Additionally, the ProgID for a class implementing <b>ICertExit</b> must conform to a naming convention. Specifically, the ProgID must be of the form:
  * 
  * <b>"</b><i>MyApp</i><b>.Exit"</b>
  * 
  * Where <i>MyApp</i> is a specifier that identifies the application. For example, in C++, the following code could be used in the DECLARE_REGISTRY macro of a class (CMyCertExitModule) which implements <b>ICertExit</b>.
  * 
  * 
  * ```cpp
  * DECLARE_REGISTRY(
  *     CMyCertExitModule,
  *     L"MyCode.Exit.1",
  *     L"MyCode.Exit",
  *     IDS_CERTEXITMODULE_DESC,
  *     THREADFLAGS_BOTH)
  * ```
  * 
  * 
  * For the previous sample, the IDS_CERTEXITMODULE_DESC value is an application-specific identifier in the resource file (.rc) for a string that describes the class.
  * 
  * String constants defined in Certmod.h can be used to simplify following the naming convention.
  * 
  * <table>
  * <tr>
  * <th>Constant</th>
  * <th>Value</th>
  * </tr>
  * <tr>
  * <td>
  * <b>wszCERTEXITMODULE_POSTFIX</b>
  * 
  * </td>
  * <td>
  * TEXT(".Exit")
  * 
  * </td>
  * </tr>
  * </table>
  *  
  * 
  * No more than one Visual Basic Scripting Edition exit module may be registered on the Certificate Services server at one time. If more than one Visual Basic Scripting Edition exit module is registered, the Certification Authority MMC snap-in, Certificate Services application, or certutil command line program may produce errors. Note that the Visual Basic Scripting Edition development environment automatically registers a DLL when it is successfully built. As a result, you may encounter this situation when one Visual Basic Scripting Edition exit module is already registered and another Visual Basic Scripting Edition exit module is created. To avoid this situation, you must unregister one of the Visual Basic Scripting Edition exit modules, by means of the command-line instruction <b>regsvr32 /u </b><i>FileName</i><b>.dll</b>, where <i>FileName</i>.dll is the name of the Visual Basic Scripting Edition exit module that is not intended to be made active.
  * 
  * Implementers of <b>ICertExit</b> in Visual Basic Scripting Edition must name their project in the form:
  * 
  * <b>"</b><i>MyApp</i><b>"</b>
  * 
  * Where <i>MyApp</i> is a specifier that identifies the application; further, the class implementing <b>ICertExit</b> must be named <b>"Exit"</b>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//certexit/nn-certexit-icertexit
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class ICertExit extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICertExit
     * @type {Guid}
     */
    static IID => Guid("{e19ae1a0-7364-11d0-8816-00a0c903b83c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "Notify", "GetDescription"]

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @param {BSTR} strConfig 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//roapi/nf-roapi-initialize
     */
    Initialize(strConfig) {
        strConfig := strConfig is String ? BSTR.Alloc(strConfig).Value : strConfig

        result := ComCall(7, this, "ptr", strConfig, "uint*", &pEventMask := 0, "HRESULT")
        return pEventMask
    }

    /**
     * 
     * @param {Integer} ExitEvent 
     * @param {Integer} Context 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certexit/nf-certexit-icertexit-notify
     */
    Notify(ExitEvent, Context) {
        result := ComCall(8, this, "int", ExitEvent, "int", Context, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certexit/nf-certexit-icertexit-getdescription
     */
    GetDescription() {
        pstrDescription := BSTR()
        result := ComCall(9, this, "ptr", pstrDescription, "HRESULT")
        return pstrDescription
    }
}
