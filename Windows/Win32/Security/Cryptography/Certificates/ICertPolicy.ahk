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
     * Called by the server engine to allow the policy module to perform initialization tasks.
     * @param {BSTR} strConfig Represents the name of the certification authority, as entered during Certificate Services setup. For information about the configuration string name, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/certcli/nn-certcli-icertconfig2">ICertConfig2</a>.
     * @returns {HRESULT} <h3>VB</h3>
     *  If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//certpol/nf-certpol-icertpolicy-initialize
     */
    Initialize(strConfig) {
        strConfig := strConfig is String ? BSTR.Alloc(strConfig).Value : strConfig

        result := ComCall(7, this, "ptr", strConfig, "HRESULT")
        return result
    }

    /**
     * Notifies the policy module that a new request has entered the system.
     * @param {BSTR} strConfig Represents the name of the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certification authority</a>, as entered during Certificate Services setup. For information about the configuration string name, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/certcli/nn-certcli-icertconfig">ICertConfig</a>.
     * @param {Integer} Context Identifies the request and associated certificate under construction. The certificate server passes the context to this method.
     * @param {Integer} bNewRequest If set to <b>TRUE</b>, specifies that the request is new. If set to <b>FALSE</b>, the request is being resubmitted to the policy module as a result of an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/certadm/nf-certadm-icertadmin-resubmitrequest">ICertAdmin::ResubmitRequest</a> call. A value of <b>FALSE</b> can be used to indicate that the administrator wants the request to be issued or that request properties set by the administrator should be examined.
     * 
     * Note that <b>TRUE</b> is defined (in a Microsoft header file) for C/C++ programmers as one, while  Visual Basic defines the <b>True</b> keyword as negative one. As a result, Visual Basic developers must use one (instead of <b>True</b>) to set this parameter to <b>TRUE</b>. However, to set this parameter to <b>FALSE</b>, Visual Basic developers can use zero or <b>False</b>.
     * @param {Integer} Flags This parameter is reserved and must be set to zero.
     * @returns {Integer} A pointer to the disposition value. The method sets one of the following dispositions.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VR_INSTANT_BAD"></a><a id="vr_instant_bad"></a><dl>
     * <dt><b>VR_INSTANT_BAD</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Deny the request.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VR_INSTANT_OK"></a><a id="vr_instant_ok"></a><dl>
     * <dt><b>VR_INSTANT_OK</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Accept the request.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VR_PENDING"></a><a id="vr_pending"></a><dl>
     * <dt><b>VR_PENDING</b></dt>
     * <dt></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Add the request to the queue to accept or deny the request at a later  time.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//certpol/nf-certpol-icertpolicy-verifyrequest
     */
    VerifyRequest(strConfig, Context, bNewRequest, Flags) {
        strConfig := strConfig is String ? BSTR.Alloc(strConfig).Value : strConfig

        result := ComCall(8, this, "ptr", strConfig, "int", Context, "int", bNewRequest, "int", Flags, "int*", &pDisposition := 0, "HRESULT")
        return pDisposition
    }

    /**
     * Returns a human-readable description of the policy module and its function.
     * @returns {BSTR} A pointer to a <b>BSTR</b> that describes the policy module.
     * @see https://docs.microsoft.com/windows/win32/api//certpol/nf-certpol-icertpolicy-getdescription
     */
    GetDescription() {
        pstrDescription := BSTR()
        result := ComCall(9, this, "ptr", pstrDescription, "HRESULT")
        return pstrDescription
    }

    /**
     * Called by the server engine before the server is terminated.
     * @returns {HRESULT} <h3>VB</h3>
     *  If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//certpol/nf-certpol-icertpolicy-shutdown
     */
    ShutDown() {
        result := ComCall(10, this, "HRESULT")
        return result
    }
}
