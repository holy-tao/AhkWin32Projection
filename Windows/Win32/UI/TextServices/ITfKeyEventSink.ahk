#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfKeyEventSink interface is implemented by a text service to receive keyboard and focus event notifications. To install this event sink, call ITfKeystrokeMgr::AdviseKeyEventSink.
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itfkeyeventsink
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
     * 
     * @param {BOOL} fForeground 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfkeyeventsink-onsetfocus
     */
    OnSetFocus(fForeground) {
        result := ComCall(3, this, "int", fForeground, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ITfContext} pic 
     * @param {WPARAM} wParam 
     * @param {LPARAM} lParam 
     * @param {Pointer<BOOL>} pfEaten 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfkeyeventsink-ontestkeydown
     */
    OnTestKeyDown(pic, wParam, lParam, pfEaten) {
        result := ComCall(4, this, "ptr", pic, "ptr", wParam, "ptr", lParam, "ptr", pfEaten, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ITfContext} pic 
     * @param {WPARAM} wParam 
     * @param {LPARAM} lParam 
     * @param {Pointer<BOOL>} pfEaten 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfkeyeventsink-ontestkeyup
     */
    OnTestKeyUp(pic, wParam, lParam, pfEaten) {
        result := ComCall(5, this, "ptr", pic, "ptr", wParam, "ptr", lParam, "ptr", pfEaten, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ITfContext} pic 
     * @param {WPARAM} wParam 
     * @param {LPARAM} lParam 
     * @param {Pointer<BOOL>} pfEaten 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfkeyeventsink-onkeydown
     */
    OnKeyDown(pic, wParam, lParam, pfEaten) {
        result := ComCall(6, this, "ptr", pic, "ptr", wParam, "ptr", lParam, "ptr", pfEaten, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ITfContext} pic 
     * @param {WPARAM} wParam 
     * @param {LPARAM} lParam 
     * @param {Pointer<BOOL>} pfEaten 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfkeyeventsink-onkeyup
     */
    OnKeyUp(pic, wParam, lParam, pfEaten) {
        result := ComCall(7, this, "ptr", pic, "ptr", wParam, "ptr", lParam, "ptr", pfEaten, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ITfContext} pic 
     * @param {Pointer<Guid>} rguid 
     * @param {Pointer<BOOL>} pfEaten 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfkeyeventsink-onpreservedkey
     */
    OnPreservedKey(pic, rguid, pfEaten) {
        result := ComCall(8, this, "ptr", pic, "ptr", rguid, "ptr", pfEaten, "HRESULT")
        return result
    }
}
