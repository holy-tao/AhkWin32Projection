#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpNotifySource extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpNotifySource
     * @type {Guid}
     */
    static IID => Guid("{5eff4aef-8487-11d2-961c-00c04f8ee628}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetNotifySink", "SetNotifyWindowMessage", "SetNotifyCallbackFunction", "SetNotifyCallbackInterface", "SetNotifyWin32Event", "WaitForNotifyEvent", "GetNotifyEventHandle"]

    /**
     * 
     * @param {ISpNotifySink} pNotifySink 
     * @returns {HRESULT} 
     */
    SetNotifySink(pNotifySink) {
        result := ComCall(3, this, "ptr", pNotifySink, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} hWnd 
     * @param {Integer} Msg 
     * @param {WPARAM} wParam 
     * @param {LPARAM} lParam 
     * @returns {HRESULT} 
     */
    SetNotifyWindowMessage(hWnd, Msg, wParam, lParam) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd

        result := ComCall(4, this, "ptr", hWnd, "uint", Msg, "ptr", wParam, "ptr", lParam, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<SPNOTIFYCALLBACK>>} pfnCallback 
     * @param {WPARAM} wParam 
     * @param {LPARAM} lParam 
     * @returns {HRESULT} 
     */
    SetNotifyCallbackFunction(pfnCallback, wParam, lParam) {
        result := ComCall(5, this, "ptr*", pfnCallback, "ptr", wParam, "ptr", lParam, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISpNotifyCallback} pSpCallback 
     * @param {WPARAM} wParam 
     * @param {LPARAM} lParam 
     * @returns {HRESULT} 
     */
    SetNotifyCallbackInterface(pSpCallback, wParam, lParam) {
        result := ComCall(6, this, "ptr", pSpCallback, "ptr", wParam, "ptr", lParam, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SetNotifyWin32Event() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwMilliseconds 
     * @returns {HRESULT} 
     */
    WaitForNotifyEvent(dwMilliseconds) {
        result := ComCall(8, this, "uint", dwMilliseconds, "HRESULT")
        return result
    }

    /**
     * Retrieves a handle to a notification event.
     * @returns {HANDLE} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>. 
     * 
     * If the operation fails, the function returns a system error code.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-getnotifyeventhandle
     */
    GetNotifyEventHandle() {
        result := ComCall(9, this, "ptr")
        return result
    }
}
