#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfKeyTraceEventSink interface is implemented by an application or text service to receive key stroke event notifications before the event is processed by the target.
 * @remarks
 * 
 * The difference between <b>ITfKeyTraceEventSink</b> and <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfkeyeventsink">ITfKeyEventSink</a> events is that <b>ITfKeyTraceEventSink</b> events occur before any filtering or processing of the key event occurs. The <b>ITfKeyTraceEventSink</b> events also occur before the target application can process the key event.
 * 
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itfkeytraceeventsink
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfKeyTraceEventSink extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfKeyTraceEventSink
     * @type {Guid}
     */
    static IID => Guid("{1cd4c13b-1c36-4191-a70a-7f3e611f367d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnKeyTraceDown", "OnKeyTraceUp"]

    /**
     * ITfKeyTraceEventSink::OnKeyTraceDown method
     * @param {WPARAM} wParam The WPARAM of the key event. For more information about this parameter, see the <i>wParam</i> parameter in <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-keydown">WM_KEYDOWN</a>.
     * @param {LPARAM} lParam The LPARAM of the key event. For more information about this parameter, see the <i>lParam</i> parameter in <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-keydown">WM_KEYDOWN</a>.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfkeytraceeventsink-onkeytracedown
     */
    OnKeyTraceDown(wParam, lParam) {
        result := ComCall(3, this, "ptr", wParam, "ptr", lParam, "HRESULT")
        return result
    }

    /**
     * ITfKeyTraceEventSink::OnKeyTraceUp method
     * @param {WPARAM} wParam The WPARAM of the key event. For more information about this parameter, see the <i>wParam</i> parameter in <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-keyup">WM_KEYUP</a>.
     * @param {LPARAM} lParam The LPARAM of the key event. For more information about this parameter, see the <i>lParam</i> parameter in <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-keyup">WM_KEYUP</a>.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfkeytraceeventsink-onkeytraceup
     */
    OnKeyTraceUp(wParam, lParam) {
        result := ComCall(4, this, "ptr", wParam, "ptr", lParam, "HRESULT")
        return result
    }
}
