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
     * 
     * @param {WPARAM} wParam 
     * @param {LPARAM} lParam 
     * @param {Pointer<BOOL>} pfEaten 
     * @returns {HRESULT} 
     */
    OnKeyDown(wParam, lParam, pfEaten) {
        result := ComCall(3, this, "ptr", wParam, "ptr", lParam, "ptr", pfEaten, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {WPARAM} wParam 
     * @param {LPARAM} lParam 
     * @param {Pointer<BOOL>} pfEaten 
     * @returns {HRESULT} 
     */
    OnKeyUp(wParam, lParam, pfEaten) {
        result := ComCall(4, this, "ptr", wParam, "ptr", lParam, "ptr", pfEaten, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {WPARAM} wParam 
     * @param {LPARAM} lParam 
     * @param {Pointer<BOOL>} pfEaten 
     * @returns {HRESULT} 
     */
    OnTestKeyDown(wParam, lParam, pfEaten) {
        result := ComCall(5, this, "ptr", wParam, "ptr", lParam, "ptr", pfEaten, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {WPARAM} wParam 
     * @param {LPARAM} lParam 
     * @param {Pointer<BOOL>} pfEaten 
     * @returns {HRESULT} 
     */
    OnTestKeyUp(wParam, lParam, pfEaten) {
        result := ComCall(6, this, "ptr", wParam, "ptr", lParam, "ptr", pfEaten, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
