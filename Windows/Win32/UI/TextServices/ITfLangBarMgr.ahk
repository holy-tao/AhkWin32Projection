#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfLangBarMgr interface is implemented by the TSF manager and used by text services to manage event sink notification and configure floating language bar display settings. The interface ID is IID_ITfLangBarMgr.
 * @see https://docs.microsoft.com/windows/win32/api//ctfutb/nn-ctfutb-itflangbarmgr
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfLangBarMgr extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfLangBarMgr
     * @type {Guid}
     */
    static IID => Guid("{87955690-e627-11d2-8ddb-00105a2799b5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AdviseEventSink", "UnadviseEventSink", "GetThreadMarshalInterface", "GetThreadLangBarItemMgr", "GetInputProcessorProfiles", "RestoreLastFocus", "SetModalInput", "ShowFloating", "GetShowFloatingStatus"]

    /**
     * The ITfLangBarMgr::AdviseEventSink method advises a sink about a language bar event.
     * @param {ITfLangBarEventSink} pSink Sink object to advise about the event.
     * @param {HWND} hwnd Reserved; must be <b>NULL</b>.
     * @param {Integer} dwFlags Reserved; must be 0.
     * @param {Pointer<Integer>} pdwCookie Pointer to an identifier for the connection.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>pSink</i> is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//ctfutb/nf-ctfutb-itflangbarmgr-adviseeventsink
     */
    AdviseEventSink(pSink, hwnd, dwFlags, pdwCookie) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        pdwCookieMarshal := pdwCookie is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", pSink, "ptr", hwnd, "uint", dwFlags, pdwCookieMarshal, pdwCookie, "HRESULT")
        return result
    }

    /**
     * ITfLangBarMgr::UnadviseEventSink method
     * @param {Integer} dwCookie A DWORD value that identifies the advise event sink to uninstall. This value is provided by a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/ctfutb/nf-ctfutb-itflangbarmgr-adviseeventsink">ITfLangBarMgr::AdviseEventSink</a>.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//ctfutb/nf-ctfutb-itflangbarmgr-unadviseeventsink
     */
    UnadviseEventSink(dwCookie) {
        result := ComCall(4, this, "uint", dwCookie, "HRESULT")
        return result
    }

    /**
     * ITfLangBarMgr::GetThreadMarshalInterface method
     * @param {Integer} dwThreadId 
     * @param {Integer} dwType 
     * @param {Pointer<Guid>} riid 
     * @returns {IUnknown} 
     * @see https://docs.microsoft.com/windows/win32/api//ctfutb/nf-ctfutb-itflangbarmgr-getthreadmarshalinterface
     */
    GetThreadMarshalInterface(dwThreadId, dwType, riid) {
        result := ComCall(5, this, "uint", dwThreadId, "uint", dwType, "ptr", riid, "ptr*", &ppunk := 0, "HRESULT")
        return IUnknown(ppunk)
    }

    /**
     * ITfLangBarMgr::GetThreadLangBarItemMgr method
     * @param {Integer} dwThreadId 
     * @param {Pointer<ITfLangBarItemMgr>} pplbi 
     * @param {Pointer<Integer>} pdwThreadid 
     * @returns {HRESULT} This method does not return a value.
     * @see https://docs.microsoft.com/windows/win32/api//ctfutb/nf-ctfutb-itflangbarmgr-getthreadlangbaritemmgr
     */
    GetThreadLangBarItemMgr(dwThreadId, pplbi, pdwThreadid) {
        pdwThreadidMarshal := pdwThreadid is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "uint", dwThreadId, "ptr*", pplbi, pdwThreadidMarshal, pdwThreadid, "HRESULT")
        return result
    }

    /**
     * ITfLangBarMgr::GetInputProcessorProfiles method
     * @param {Integer} dwThreadId 
     * @param {Pointer<ITfInputProcessorProfiles>} ppaip 
     * @param {Pointer<Integer>} pdwThreadid 
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//ctfutb/nf-ctfutb-itflangbarmgr-getinputprocessorprofiles
     */
    GetInputProcessorProfiles(dwThreadId, ppaip, pdwThreadid) {
        pdwThreadidMarshal := pdwThreadid is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, "uint", dwThreadId, "ptr*", ppaip, pdwThreadidMarshal, pdwThreadid, "HRESULT")
        return result
    }

    /**
     * ITfLangBarMgr::RestoreLastFocus method
     * @param {BOOL} fPrev 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//ctfutb/nf-ctfutb-itflangbarmgr-restorelastfocus
     */
    RestoreLastFocus(fPrev) {
        result := ComCall(8, this, "uint*", &pdwThreadId := 0, "int", fPrev, "HRESULT")
        return pdwThreadId
    }

    /**
     * ITfLangBarMgr::SetModalInput method
     * @param {ITfLangBarEventSink} pSink 
     * @param {Integer} dwThreadId Should not be used.
     * @param {Integer} dwFlags Should not be used.
     * @returns {HRESULT} This method does not return a value.
     * @see https://docs.microsoft.com/windows/win32/api//ctfutb/nf-ctfutb-itflangbarmgr-setmodalinput
     */
    SetModalInput(pSink, dwThreadId, dwFlags) {
        result := ComCall(9, this, "ptr", pSink, "uint", dwThreadId, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * ITfLangBarMgr::ShowFloating method
     * @param {Integer} dwFlags Specifies language bar display settings.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_SFT_SHOWNORMAL"></a><a id="tf_sft_shownormal"></a><dl>
     * <dt><b>TF_SFT_SHOWNORMAL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Display the language bar as a floating window. This constant cannot be combined with the TF_SFT_DOCK, TF_SFT_MINIMIZED, TF_SFT_HIDDEN, or TF_SFT_DESKBAND constants.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_SFT_DOCK"></a><a id="tf_sft_dock"></a><dl>
     * <dt><b>TF_SFT_DOCK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Deprecated as of Windows Vista. Dock the language bar in its own task pane. This constant cannot be combined with the TF_SFT_SHOWNORMAL, TF_SFT_MINIMIZED, TF_SFT_HIDDEN, or TF_SFT_DESKBAND constants. Available only on Windows XP.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_SFT_MINIMIZED"></a><a id="tf_sft_minimized"></a><dl>
     * <dt><b>TF_SFT_MINIMIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Deprecated as of Windows Vista. Display the language bar as a single icon in the system tray. This constant cannot be combined with the TF_SFT_SHOWNORMAL, TF_SFT_DOCK, TF_SFT_HIDDEN, or TF_SFT_DESKBAND constants.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_SFT_HIDDEN"></a><a id="tf_sft_hidden"></a><dl>
     * <dt><b>TF_SFT_HIDDEN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Hide the language bar. This constant cannot be combined with the TF_SFT_SHOWNORMAL, TF_SFT_DOCK, TF_SFT_MINIMIZED, or TF_SFT_DESKBAND constants.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_SFT_NOTRANSPARENCY"></a><a id="tf_sft_notransparency"></a><dl>
     * <dt><b>TF_SFT_NOTRANSPARENCY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Make the language bar opaque.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_SFT_LOWTRANSPARENCY"></a><a id="tf_sft_lowtransparency"></a><dl>
     * <dt><b>TF_SFT_LOWTRANSPARENCY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Make the language bar partially transparent. Available only on Windows 2000 or later.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_SFT_HIGHTRANSPARENCY"></a><a id="tf_sft_hightransparency"></a><dl>
     * <dt><b>TF_SFT_HIGHTRANSPARENCY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Make the language bar highly transparent. Available only on Windows 2000 or later.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_SFT_LABELS"></a><a id="tf_sft_labels"></a><dl>
     * <dt><b>TF_SFT_LABELS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Display text labels next to language bar icons.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_SFT_NOLABELS"></a><a id="tf_sft_nolabels"></a><dl>
     * <dt><b>TF_SFT_NOLABELS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Hide language bar icon text labels.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_SFT_EXTRAICONSONMINIMIZED"></a><a id="tf_sft_extraiconsonminimized"></a><dl>
     * <dt><b>TF_SFT_EXTRAICONSONMINIMIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Display text service icons on the taskbar when the language bar is minimized.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_SFT_NOEXTRAICONSONMINIMIZED"></a><a id="tf_sft_noextraiconsonminimized"></a><dl>
     * <dt><b>TF_SFT_NOEXTRAICONSONMINIMIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Hide text service icons on the taskbar when the language bar is minimized.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_SFT_DESKBAND"></a><a id="tf_sft_deskband"></a><dl>
     * <dt><b>TF_SFT_DESKBAND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Dock the language bar in the system task bar. This constant cannot be combined with the TF_SFT_SHOWNORMAL, TF_SFT_DOCK, TF_SFT_MINIMIZED, or TF_SFT_HIDDEN constants. Available only on Windows XP.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>dwFlags</i> is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//ctfutb/nf-ctfutb-itflangbarmgr-showfloating
     */
    ShowFloating(dwFlags) {
        result := ComCall(10, this, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * ITfLangBarMgr::GetShowFloatingStatus method
     * @returns {Integer} Indicates current language bar display settings. For a list of bitfield values, see <a href="https://docs.microsoft.com/windows/desktop/api/ctfutb/nf-ctfutb-itflangbarmgr-showfloating">ITfLangBarMgr::ShowFloating</a>.
     * @see https://docs.microsoft.com/windows/win32/api//ctfutb/nf-ctfutb-itflangbarmgr-getshowfloatingstatus
     */
    GetShowFloatingStatus() {
        result := ComCall(11, this, "uint*", &pdwFlags := 0, "HRESULT")
        return pdwFlags
    }
}
