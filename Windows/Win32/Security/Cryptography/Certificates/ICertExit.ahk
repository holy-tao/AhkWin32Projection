#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\CERT_EXIT_EVENT_MASK.ahk" { CERT_EXIT_EVENT_MASK }
#Import "..\..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Provides communications between the Certificate Services server and an exit module.
 * @remarks
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
 * @see https://learn.microsoft.com/windows/win32/api/certexit/nn-certexit-icertexit
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct ICertExit extends IDispatch {
    /**
     * The interface identifier for ICertExit
     * @type {Guid}
     */
    static IID := Guid("{e19ae1a0-7364-11d0-8816-00a0c903b83c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICertExit interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        Initialize     : IntPtr
        Notify         : IntPtr
        GetDescription : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICertExit.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Called by the server engine when it initializes itself.
     * @remarks
     * When you write a custom exit module, implement this method.
     * @param {BSTR} strConfig Represents the name of the certification authority, as entered during Certificate Services setup. For information about the configuration string name, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/certcli/nn-certcli-icertconfig2">ICertConfig2</a>.
     * @returns {CERT_EXIT_EVENT_MASK} 
     * @see https://learn.microsoft.com/windows/win32/api/certexit/nf-certexit-icertexit-initialize
     */
    Initialize(strConfig) {
        strConfig := strConfig is String ? BSTR.Alloc(strConfig).Value : strConfig

        result := ComCall(7, this, BSTR, strConfig, "uint*", &pEventMask := 0, "HRESULT")
        return pEventMask
    }

    /**
     * Called by the server engine to notify an exit module that an event has occurred.
     * @remarks
     * If a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certification authority</a> is using multiple exit modules, Certificate Services will notify each exit module of the event (provided the exit module requested notification by means of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/certexit/nf-certexit-icertexit-initialize">Initialize</a>). The order in which the exit modules are notified should not be assumed, nor should one exit module depend on the processing of another exit module. Each notified exit module must return from 
     * <b>Notify</b> before the next exit module will be notified.
     * @param {Integer} ExitEvent A mask that indicates the kind of exit event that has occurred. The mask can have one of the following flag-bits set.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="EXITEVENT_CERTISSUED"></a><a id="exitevent_certissued"></a><dl>
     * <dt><b>EXITEVENT_CERTISSUED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Certificate issued.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="EXITEVENT_CERTPENDING"></a><a id="exitevent_certpending"></a><dl>
     * <dt><b>EXITEVENT_CERTPENDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Certificate pending.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="EXITEVENT_CERTDENIED"></a><a id="exitevent_certdenied"></a><dl>
     * <dt><b>EXITEVENT_CERTDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Certificate denied.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="EXITEVENT_CERTREVOKED"></a><a id="exitevent_certrevoked"></a><dl>
     * <dt><b>EXITEVENT_CERTREVOKED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Certificate revoked.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="EXITEVENT_CERTRETRIEVEPENDING"></a><a id="exitevent_certretrievepending"></a><dl>
     * <dt><b>EXITEVENT_CERTRETRIEVEPENDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Successful call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/certcli/nf-certcli-icertrequest-retrievepending">ICertRequest::RetrievePending</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="EXITEVENT_CRLISSUED"></a><a id="exitevent_crlissued"></a><dl>
     * <dt><b>EXITEVENT_CRLISSUED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">Certificate revocation list</a> (CRL) issued.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="EXITEVENT_SHUTDOWN"></a><a id="exitevent_shutdown"></a><dl>
     * <dt><b>EXITEVENT_SHUTDOWN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Certificate Services shutdown.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} _Context Specifies a context handle that can be used to get properties associated with the event from the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/certif/nn-certif-icertserverexit">ICertServerExit</a> interface.
     * @returns {HRESULT} <h3>VB</h3>
     *  If the method succeeds, the method returns S_OK.
     * 
     * If the method fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/certexit/nf-certexit-icertexit-notify
     */
    Notify(ExitEvent, _Context) {
        result := ComCall(8, this, "int", ExitEvent, "int", _Context, "HRESULT")
        return result
    }

    /**
     * Returns a human-readable description of the exit module and its function.
     * @remarks
     * When you write a custom exit module, implement this method.
     * @returns {BSTR} A pointer to the <b>BSTR</b> that describes the exit module.
     * @see https://learn.microsoft.com/windows/win32/api/certexit/nf-certexit-icertexit-getdescription
     */
    GetDescription() {
        pstrDescription := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, pstrDescription, "HRESULT")
        return pstrDescription
    }

    Query(iid) {
        if (ICertExit.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 3)
        this.vtbl.Notify := CallbackCreate(GetMethod(implObj, "Notify"), flags, 3)
        this.vtbl.GetDescription := CallbackCreate(GetMethod(implObj, "GetDescription"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Initialize)
        CallbackFree(this.vtbl.Notify)
        CallbackFree(this.vtbl.GetDescription)
    }
}
