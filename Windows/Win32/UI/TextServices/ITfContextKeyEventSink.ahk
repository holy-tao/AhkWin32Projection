#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfContextKeyEventSink interface is implemented by a text service to receive keyboard event notifications that occur in an input context.
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itfcontextkeyeventsink
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
     * 
     * @param {WPARAM} wParam 
     * @param {LPARAM} lParam 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcontextkeyeventsink-onkeydown
     */
    OnKeyDown(wParam, lParam) {
        result := ComCall(3, this, "ptr", wParam, "ptr", lParam, "int*", &pfEaten := 0, "HRESULT")
        return pfEaten
    }

    /**
     * 
     * @param {WPARAM} wParam 
     * @param {LPARAM} lParam 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcontextkeyeventsink-onkeyup
     */
    OnKeyUp(wParam, lParam) {
        result := ComCall(4, this, "ptr", wParam, "ptr", lParam, "int*", &pfEaten := 0, "HRESULT")
        return pfEaten
    }

    /**
     * 
     * @param {WPARAM} wParam 
     * @param {LPARAM} lParam 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcontextkeyeventsink-ontestkeydown
     */
    OnTestKeyDown(wParam, lParam) {
        result := ComCall(5, this, "ptr", wParam, "ptr", lParam, "int*", &pfEaten := 0, "HRESULT")
        return pfEaten
    }

    /**
     * 
     * @param {WPARAM} wParam 
     * @param {LPARAM} lParam 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcontextkeyeventsink-ontestkeyup
     */
    OnTestKeyUp(wParam, lParam) {
        result := ComCall(6, this, "ptr", wParam, "ptr", lParam, "int*", &pfEaten := 0, "HRESULT")
        return pfEaten
    }
}
