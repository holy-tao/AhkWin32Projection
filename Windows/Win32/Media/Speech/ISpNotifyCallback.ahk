#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\LPARAM.ahk
#Include ..\..\Foundation\WPARAM.ahk
#Include ..\..\Foundation\HRESULT.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 */
class ISpNotifyCallback extends Win32ComInterface {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 0

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["NotifyCallback"]

    /**
     * 
     * @param {WPARAM} _wParam 
     * @param {LPARAM} _lParam 
     * @returns {HRESULT} 
     */
    NotifyCallback(_wParam, _lParam) {
        result := ComCall(0, this, "ptr", _wParam, "ptr", _lParam, "HRESULT")
        return result
    }
}
