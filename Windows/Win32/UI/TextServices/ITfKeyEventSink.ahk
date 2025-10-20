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
     * 
     * @param {BOOL} fForeground 
     * @returns {HRESULT} 
     */
    OnSetFocus(fForeground) {
        result := ComCall(3, this, "int", fForeground, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITfContext>} pic 
     * @param {WPARAM} wParam 
     * @param {LPARAM} lParam 
     * @param {Pointer<BOOL>} pfEaten 
     * @returns {HRESULT} 
     */
    OnTestKeyDown(pic, wParam, lParam, pfEaten) {
        result := ComCall(4, this, "ptr", pic, "ptr", wParam, "ptr", lParam, "ptr", pfEaten, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITfContext>} pic 
     * @param {WPARAM} wParam 
     * @param {LPARAM} lParam 
     * @param {Pointer<BOOL>} pfEaten 
     * @returns {HRESULT} 
     */
    OnTestKeyUp(pic, wParam, lParam, pfEaten) {
        result := ComCall(5, this, "ptr", pic, "ptr", wParam, "ptr", lParam, "ptr", pfEaten, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITfContext>} pic 
     * @param {WPARAM} wParam 
     * @param {LPARAM} lParam 
     * @param {Pointer<BOOL>} pfEaten 
     * @returns {HRESULT} 
     */
    OnKeyDown(pic, wParam, lParam, pfEaten) {
        result := ComCall(6, this, "ptr", pic, "ptr", wParam, "ptr", lParam, "ptr", pfEaten, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITfContext>} pic 
     * @param {WPARAM} wParam 
     * @param {LPARAM} lParam 
     * @param {Pointer<BOOL>} pfEaten 
     * @returns {HRESULT} 
     */
    OnKeyUp(pic, wParam, lParam, pfEaten) {
        result := ComCall(7, this, "ptr", pic, "ptr", wParam, "ptr", lParam, "ptr", pfEaten, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITfContext>} pic 
     * @param {Pointer<Guid>} rguid 
     * @param {Pointer<BOOL>} pfEaten 
     * @returns {HRESULT} 
     */
    OnPreservedKey(pic, rguid, pfEaten) {
        result := ComCall(8, this, "ptr", pic, "ptr", rguid, "ptr", pfEaten, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
