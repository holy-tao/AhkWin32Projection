#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfContextKeyEventSink interface is implemented by a text service to receive keyboard event notifications that occur in an input context.
 * @see https://learn.microsoft.com/windows/win32/api//content/msctf/nn-msctf-itfcontextkeyeventsink
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfContextKeyEventSink extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfContextKeyEventSink
     * @type {Guid}
     */
    static IID => Guid("{0552ba5d-c835-4934-bf50-846aaa67432f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnKeyDown", "OnKeyUp", "OnTestKeyDown", "OnTestKeyUp"]

    /**
     * ITfContextKeyEventSink::OnKeyDown method
     * @param {WPARAM} wParam_ Specifies the virtual-key code of the key. For more information about this parameter, see the <i>wParam</i> parameter in <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-keydown">WM_KEYDOWN</a>.
     * @param {LPARAM} lParam_ Specifies the repeat count, scan code, extended-key flag, context code, previous key-state flag, and transition-state flag of the key. For more information about this parameter, see the <i>lParam</i> parameter in <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-keydown">WM_KEYDOWN</a>.
     * @returns {BOOL} Pointer to a BOOL value that, on exit, indicates if the key event is handled. If this value receives <b>TRUE</b>, the key event is handled. If this value is <b>FALSE</b>, the key event is not handled.
     * @see https://learn.microsoft.com/windows/win32/api//content/msctf/nf-msctf-itfcontextkeyeventsink-onkeydown
     */
    OnKeyDown(wParam_, lParam_) {
        wParam_ := wParam_ is Win32Handle ? NumGet(wParam_, "ptr") : wParam_
        lParam_ := lParam_ is Win32Handle ? NumGet(lParam_, "ptr") : lParam_

        result := ComCall(3, this, "ptr", wParam_, "ptr", lParam_, "int*", &pfEaten := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pfEaten
    }

    /**
     * ITfContextKeyEventSink::OnKeyUp method
     * @param {WPARAM} wParam_ Specifies the virtual-key code of the key. For more information about this parameter, see the <i>wParam</i> parameter in <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-keyup">WM_KEYUP</a>.
     * @param {LPARAM} lParam_ Specifies the repeat count, scan code, extended-key flag, context code, previous key-state flag, and transition-state flag of the key. For more information about this parameter, see the <i>lParam</i> parameter in <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-keyup">WM_KEYUP</a>.
     * @returns {BOOL} Pointer to a BOOL value that, on exit, indicates if the key event is handled. If this value receives <b>TRUE</b>, the key event is handled. If this value receives <b>FALSE</b>, the key event is not handled.
     * @see https://learn.microsoft.com/windows/win32/api//content/msctf/nf-msctf-itfcontextkeyeventsink-onkeyup
     */
    OnKeyUp(wParam_, lParam_) {
        wParam_ := wParam_ is Win32Handle ? NumGet(wParam_, "ptr") : wParam_
        lParam_ := lParam_ is Win32Handle ? NumGet(lParam_, "ptr") : lParam_

        result := ComCall(4, this, "ptr", wParam_, "ptr", lParam_, "int*", &pfEaten := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pfEaten
    }

    /**
     * ITfContextKeyEventSink::OnTestKeyDown method
     * @param {WPARAM} wParam_ Specifies the virtual-key code of the key. For more information about this parameter, see the <i>wParam</i> parameter in <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-keydown">WM_KEYDOWN</a>.
     * @param {LPARAM} lParam_ Specifies the repeat count, scan code, extended-key flag, context code, previous key-state flag, and transition-state flag of the key. For more information about this parameter, see the <i>lParam</i> parameter in <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-keydown">WM_KEYDOWN</a>.
     * @returns {BOOL} Pointer to a BOOL value that, on exit, indicates if the key event is handled. If this value receives <b>TRUE</b>, the key event is handled. If this value is <b>FALSE</b>, the key event is not handled.
     * @see https://learn.microsoft.com/windows/win32/api//content/msctf/nf-msctf-itfcontextkeyeventsink-ontestkeydown
     */
    OnTestKeyDown(wParam_, lParam_) {
        wParam_ := wParam_ is Win32Handle ? NumGet(wParam_, "ptr") : wParam_
        lParam_ := lParam_ is Win32Handle ? NumGet(lParam_, "ptr") : lParam_

        result := ComCall(5, this, "ptr", wParam_, "ptr", lParam_, "int*", &pfEaten := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pfEaten
    }

    /**
     * ITfContextKeyEventSink::OnTestKeyUp method
     * @param {WPARAM} wParam_ Specifies the virtual-key code of the key. For more information about this parameter, see the <i>wParam</i> parameter in <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-keyup">WM_KEYUP</a>.
     * @param {LPARAM} lParam_ Specifies the repeat count, scan code, extended-key flag, context code, previous key-state flag, and transition-state flag of the key. For more information about this parameter, see the <i>lParam</i> parameter in <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-keyup">WM_KEYUP</a>.
     * @returns {BOOL} Pointer to a BOOL value that, on exit, indicates if the key event is handled. If this value receives <b>TRUE</b>, the key event is handled. If this value receives <b>FALSE</b>, the key event would is not handled.
     * @see https://learn.microsoft.com/windows/win32/api//content/msctf/nf-msctf-itfcontextkeyeventsink-ontestkeyup
     */
    OnTestKeyUp(wParam_, lParam_) {
        wParam_ := wParam_ is Win32Handle ? NumGet(wParam_, "ptr") : wParam_
        lParam_ := lParam_ is Win32Handle ? NumGet(lParam_, "ptr") : lParam_

        result := ComCall(6, this, "ptr", wParam_, "ptr", lParam_, "int*", &pfEaten := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pfEaten
    }
}
