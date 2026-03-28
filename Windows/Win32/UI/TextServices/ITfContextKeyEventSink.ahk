#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfContextKeyEventSink interface is implemented by a text service to receive keyboard event notifications that occur in an input context.
 * @see https://learn.microsoft.com/windows/win32/api/msctf/nn-msctf-itfcontextkeyeventsink
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
     * @param {WPARAM} _wParam 
     * @param {LPARAM} _lParam 
     * @returns {BOOL} Pointer to a BOOL value that, on exit, indicates if the key event is handled. If this value receives <b>TRUE</b>, the key event is handled. If this value is <b>FALSE</b>, the key event is not handled.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcontextkeyeventsink-onkeydown
     */
    OnKeyDown(_wParam, _lParam) {
        result := ComCall(3, this, "ptr", _wParam, "ptr", _lParam, "int*", &pfEaten := 0, "HRESULT")
        return pfEaten
    }

    /**
     * ITfContextKeyEventSink::OnKeyUp method
     * @param {WPARAM} _wParam 
     * @param {LPARAM} _lParam 
     * @returns {BOOL} Pointer to a BOOL value that, on exit, indicates if the key event is handled. If this value receives <b>TRUE</b>, the key event is handled. If this value receives <b>FALSE</b>, the key event is not handled.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcontextkeyeventsink-onkeyup
     */
    OnKeyUp(_wParam, _lParam) {
        result := ComCall(4, this, "ptr", _wParam, "ptr", _lParam, "int*", &pfEaten := 0, "HRESULT")
        return pfEaten
    }

    /**
     * ITfContextKeyEventSink::OnTestKeyDown method
     * @param {WPARAM} _wParam 
     * @param {LPARAM} _lParam 
     * @returns {BOOL} Pointer to a BOOL value that, on exit, indicates if the key event is handled. If this value receives <b>TRUE</b>, the key event is handled. If this value is <b>FALSE</b>, the key event is not handled.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcontextkeyeventsink-ontestkeydown
     */
    OnTestKeyDown(_wParam, _lParam) {
        result := ComCall(5, this, "ptr", _wParam, "ptr", _lParam, "int*", &pfEaten := 0, "HRESULT")
        return pfEaten
    }

    /**
     * ITfContextKeyEventSink::OnTestKeyUp method
     * @param {WPARAM} _wParam 
     * @param {LPARAM} _lParam 
     * @returns {BOOL} Pointer to a BOOL value that, on exit, indicates if the key event is handled. If this value receives <b>TRUE</b>, the key event is handled. If this value receives <b>FALSE</b>, the key event would is not handled.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcontextkeyeventsink-ontestkeyup
     */
    OnTestKeyUp(_wParam, _lParam) {
        result := ComCall(6, this, "ptr", _wParam, "ptr", _lParam, "int*", &pfEaten := 0, "HRESULT")
        return pfEaten
    }
}
