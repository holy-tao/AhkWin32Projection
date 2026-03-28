#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfKeyEventSink interface is implemented by a text service to receive keyboard and focus event notifications. To install this event sink, call ITfKeystrokeMgr::AdviseKeyEventSink.
 * @see https://learn.microsoft.com/windows/win32/api/msctf/nn-msctf-itfkeyeventsink
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfKeyEventSink extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfKeyEventSink
     * @type {Guid}
     */
    static IID => Guid("{aa80e7f5-2021-11d2-93e0-0060b067b86e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnSetFocus", "OnTestKeyDown", "OnTestKeyUp", "OnKeyDown", "OnKeyUp", "OnPreservedKey"]

    /**
     * ITfKeyEventSink::OnSetFocus method
     * @param {BOOL} fForeground If <b>TRUE</b>, the test service receives the focus. Otherwise the text service loses the focus.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfkeyeventsink-onsetfocus
     */
    OnSetFocus(fForeground) {
        result := ComCall(3, this, "int", fForeground, "HRESULT")
        return result
    }

    /**
     * ITfKeyEventSink::OnTestKeyDown method
     * @param {ITfContext} pic Pointer to the input context that receives the key event.
     * @param {WPARAM} _wParam 
     * @param {LPARAM} _lParam 
     * @returns {BOOL} Pointer to a BOOL that, on exit, indicates if the key event would be handled. If this value receives <b>TRUE</b>, the key event would be handled. If this value is <b>FALSE</b>, the key event would not be handled.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfkeyeventsink-ontestkeydown
     */
    OnTestKeyDown(pic, _wParam, _lParam) {
        result := ComCall(4, this, "ptr", pic, "ptr", _wParam, "ptr", _lParam, "int*", &pfEaten := 0, "HRESULT")
        return pfEaten
    }

    /**
     * ITfKeyEventSink::OnTestKeyUp method
     * @param {ITfContext} pic Pointer to the input context that receives the key event.
     * @param {WPARAM} _wParam 
     * @param {LPARAM} _lParam 
     * @returns {BOOL} Pointer to a BOOL that, on exit, indicates if the key event would be handled. If this value receives <b>TRUE</b>, the key event would be handled. If this value receives <b>FALSE</b>, the key event would not be handled.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfkeyeventsink-ontestkeyup
     */
    OnTestKeyUp(pic, _wParam, _lParam) {
        result := ComCall(5, this, "ptr", pic, "ptr", _wParam, "ptr", _lParam, "int*", &pfEaten := 0, "HRESULT")
        return pfEaten
    }

    /**
     * ITfKeyEventSink::OnKeyDown method
     * @param {ITfContext} pic Pointer to the input context that receives the key event.
     * @param {WPARAM} _wParam 
     * @param {LPARAM} _lParam 
     * @returns {BOOL} Pointer to a BOOL that, on exit, indicates if the key event was handled. If this value receives <b>TRUE</b>, the key event was handled. If this value is <b>FALSE</b>, the key event was not handled.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfkeyeventsink-onkeydown
     */
    OnKeyDown(pic, _wParam, _lParam) {
        result := ComCall(6, this, "ptr", pic, "ptr", _wParam, "ptr", _lParam, "int*", &pfEaten := 0, "HRESULT")
        return pfEaten
    }

    /**
     * ITfKeyEventSink::OnKeyUp method
     * @param {ITfContext} pic Pointer to the input context that receives the key event.
     * @param {WPARAM} _wParam 
     * @param {LPARAM} _lParam 
     * @returns {BOOL} Pointer to a BOOL that, on exit, indicates if the key event was handled. If this value receives <b>TRUE</b>, the key event was handled. If this value receives <b>FALSE</b>, the key event was not handled.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfkeyeventsink-onkeyup
     */
    OnKeyUp(pic, _wParam, _lParam) {
        result := ComCall(7, this, "ptr", pic, "ptr", _wParam, "ptr", _lParam, "int*", &pfEaten := 0, "HRESULT")
        return pfEaten
    }

    /**
     * ITfKeyEventSink::OnPreservedKey method
     * @param {ITfContext} pic Pointer to the input context that receives the key event.
     * @param {Pointer<Guid>} rguid Contains the command GUID of the preserved key.
     * @returns {BOOL} Pointer to a BOOL value that, on exit, indicates if the preserved key event was handled. If this value receives <b>TRUE</b>, the preserved key event was handled. If this value receives <b>FALSE</b>, the preserved key event was not handled.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfkeyeventsink-onpreservedkey
     */
    OnPreservedKey(pic, rguid) {
        result := ComCall(8, this, "ptr", pic, "ptr", rguid, "int*", &pfEaten := 0, "HRESULT")
        return pfEaten
    }
}
