#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITfThreadMgr.ahk

/**
 * The ITfThreadMgrEx interface is used by the application to activate the textservices with some flags. ITfThreadMgrEx can be obtained by QI from ITfThreadMgr.
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itfthreadmgrex
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfThreadMgrEx extends ITfThreadMgr{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfThreadMgrEx
     * @type {Guid}
     */
    static IID => Guid("{3e90ade3-7594-4cb0-bb58-69628f5f458c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 14

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ActivateEx", "GetActiveFlags"]

    /**
     * The ITfThreadMgrEx::ActivateEx method is used by an application to initialize and activate TSF for the calling thread. Unlike ITfThreadMgr::Activate, ITfThreadMgrEx::ActivateEx can take a flag to specify how TSF is activated.
     * @param {Integer} dwFlags <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_TMAE_NOACTIVATETIP"></a><a id="tf_tmae_noactivatetip"></a><dl>
     * <dt><b>TF_TMAE_NOACTIVATETIP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Text services will not be activated while ITfThreadMgrEx::ActivateEx is called. They will be activated when the calling thread has focus asynchronously.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_TMAE_SECUREMODE"></a><a id="tf_tmae_securemode"></a><dl>
     * <dt><b>TF_TMAE_SECUREMODE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * TSF is activated in secure mode. Only text services that support the secure mode will be activated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_TMAE_UIELEMENTENABLEDONLY"></a><a id="tf_tmae_uielementenabledonly"></a><dl>
     * <dt><b>TF_TMAE_UIELEMENTENABLEDONLY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * TSF activates only text services that are categorized in GUID_TFCAT_TIPCAP_UIELEMENTENABLED.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_TMAE_COMLESS"></a><a id="tf_tmae_comless"></a><dl>
     * <dt><b>TF_TMAE_COMLESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * TSF does not use COM. TSF activate only text services that are categorized in GUID_TFCAT_TIPCAP_COMLESS.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_TMAE_NOACTIVATEKEYBOARDLAYOUT"></a><a id="tf_tmae_noactivatekeyboardlayout"></a><dl>
     * <dt><b>TF_TMAE_NOACTIVATEKEYBOARDLAYOUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * TSF does not sync the current keyboard layout while ITfThreadMgrEx::ActivateEx() is called. The keyboard layout will be adjusted when the calling thread gets focus. This flag must be used with TF_TMAE_NOACTIVATETIP.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} [out] Pointer to a <a href="https://docs.microsoft.com/windows/desktop/TSF/tfclientid">TfClientId</a> value that receives a client identifier.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfthreadmgrex-activateex
     */
    ActivateEx(dwFlags) {
        result := ComCall(14, this, "uint*", &ptid := 0, "uint", dwFlags, "HRESULT")
        return ptid
    }

    /**
     * The ITfThreadMgrEx::GetActiveFlags method returns the flags TSF is active with.
     * @returns {Integer} The pointer to the DWORD value to receives the active flags of TSF.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_TMF_NOACTIVATETIP"></a><a id="tf_tmf_noactivatetip"></a><dl>
     * <dt><b>TF_TMF_NOACTIVATETIP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * TSF was activated with the TF_TMAE_NOACTIVATETIP flag.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_TMF_SECUREMODE"></a><a id="tf_tmf_securemode"></a><dl>
     * <dt><b>TF_TMF_SECUREMODE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * TSF is running as secure mode.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_TMF_UIELEMENTENABLEDONLY"></a><a id="tf_tmf_uielementenabledonly"></a><dl>
     * <dt><b>TF_TMF_UIELEMENTENABLEDONLY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * TSF is running with text services that support only UIElement.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_TMF_COMLESS"></a><a id="tf_tmf_comless"></a><dl>
     * <dt><b>TF_TMF_COMLESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * TSF is running without COM.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_TMF_WOW16"></a><a id="tf_tmf_wow16"></a><dl>
     * <dt><b>TF_TMF_WOW16</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * TSF is running in 16bit task.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_TMF_CONSOLE"></a><a id="tf_tmf_console"></a><dl>
     * <dt><b>TF_TMF_CONSOLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * TSF is running for console.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_TMF_ACTIVATED"></a><a id="tf_tmf_activated"></a><dl>
     * <dt><b>TF_TMF_ACTIVATED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * TSF is active.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfthreadmgrex-getactiveflags
     */
    GetActiveFlags() {
        result := ComCall(15, this, "uint*", &lpdwFlags := 0, "HRESULT")
        return lpdwFlags
    }
}
