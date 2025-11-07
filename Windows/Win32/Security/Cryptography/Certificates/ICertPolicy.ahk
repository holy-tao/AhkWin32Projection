#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * Provides communications between the Certificate Services server engine and the policy module.
 * @remarks
 * 
 * Only a stand-alone <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certification authority</a> should use custom policy or exit modules; when running an enterprise certification authority, the use of Microsoft-provided policy and exit modules is strongly recommended.
 * 
 * Implementers of <b>ICertPolicy</b> should also implement 
 * <a href="https://docs.microsoft.com/windows/desktop/api/certmod/nn-certmod-icertmanagemodule">ICertManageModule</a>. Additionally, the ProgID for a class implementing <b>ICertPolicy</b> must conform to a naming convention. Specifically, the ProgID must be of the form:
 * 
 * <b>"</b><i>MyApp</i><b>.Policy"</b>
 * 
 * Where <i>MyApp</i> is a specifier that identifies the application. For example, in C++, the following code could be used in the DECLARE_REGISTRY macro of a class (CMyCertPolicyModule) which implements <b>ICertPolicy</b>.
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
 * <td>
 * <b>wszCERTPOLICYMODULE_POSTFIX</b>
 * 
 * </td>
 * <td>
 * TEXT(".Policy")
 * 
 * </td>
 * </tr>
 * </table>
 *  
 * 
 * No more than one Visual Basic Scripting Edition policy module may be registered on the Certificate Services server at one time. If more than one such policy module is registered on the Certificate Services server, the Certification Authority MMC snap-in, Certificate Services application, or certutil command line program may produce errors. Note that  the Visual Basic Scripting Edition development environment automatically registers a DLL when it is successfully built. As a result, you may encounter this situation when one Visual Basic Scripting Edition policy module is already registered and another Visual Basic Scripting Edition policy module is created. To avoid this situation, you must unregister one of the Visual Basic Scripting Edition policy modules, by using the command-line instruction <b>regsvr32 /u </b><i>FileName.dll</i>, where <i>FileName.dll</i> is the name of the Visual Basic Scripting Edition policy module that you do not intend to make active.
 * 
 * Implementers of <b>ICertPolicy</b> in Visual Basic Scripting Edition must name their project in the form: 
 * 
 * <b>"</b><i>MyApp</i><b>"</b>
 * 
 * Where <i>MyApp</i> is a specifier that identifies the application; further, the class implementing <b>ICertPolicy</b> must be named <b>"Policy"</b>.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//certpol/nn-certpol-icertpolicy
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class ICertPolicy extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICertPolicy
     * @type {Guid}
     */
    static IID => Guid("{38bb5a00-7636-11d0-b413-00a0c91bbf8c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "VerifyRequest", "GetDescription", "ShutDown"]

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @param {BSTR} strConfig 
     * @returns {HRESULT} <ul>
     * <li><b>S_OK</b> - Successfully initialized for the first time on the current thread</li>
     * <li><b>S_FALSE</b> - Successful nested initialization (current thread was already 
     *         initialized for the specified apartment type)</li>
     * <li><b>E_INVALIDARG</b> - Invalid <i>initType</i> value</li>
     * <li><b>CO_E_INIT_TLS</b> - Failed to allocate COM's internal TLS structure</li>
     * <li><b>E_OUTOFMEMORY</b> - Failed to allocate per-thread/per-apartment structures other 
     *         than the TLS</li>
     * <li><b>RPC_E_CHANGED_MODE</b> - The current thread is already initialized for a different 
     *         apartment type from what is specified.</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//roapi/nf-roapi-initialize
     */
    Initialize(strConfig) {
        strConfig := strConfig is String ? BSTR.Alloc(strConfig).Value : strConfig

        result := ComCall(7, this, "ptr", strConfig, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strConfig 
     * @param {Integer} Context 
     * @param {Integer} bNewRequest 
     * @param {Integer} Flags 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/certpol/nf-certpol-icertpolicy-verifyrequest
     */
    VerifyRequest(strConfig, Context, bNewRequest, Flags) {
        strConfig := strConfig is String ? BSTR.Alloc(strConfig).Value : strConfig

        result := ComCall(8, this, "ptr", strConfig, "int", Context, "int", bNewRequest, "int", Flags, "int*", &pDisposition := 0, "HRESULT")
        return pDisposition
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certpol/nf-certpol-icertpolicy-getdescription
     */
    GetDescription() {
        pstrDescription := BSTR()
        result := ComCall(9, this, "ptr", pstrDescription, "HRESULT")
        return pstrDescription
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certpol/nf-certpol-icertpolicy-shutdown
     */
    ShutDown() {
        result := ComCall(10, this, "HRESULT")
        return result
    }
}
