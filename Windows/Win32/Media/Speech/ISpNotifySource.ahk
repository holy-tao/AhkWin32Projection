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
        result := ComCall(3, this, "ptr", pNotifySink, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HWND} hWnd_ 
     * @param {Integer} Msg_ 
     * @param {WPARAM} wParam_ 
     * @param {LPARAM} lParam_ 
     * @returns {HRESULT} 
     */
    SetNotifyWindowMessage(hWnd_, Msg_, wParam_, lParam_) {
        hWnd_ := hWnd_ is Win32Handle ? NumGet(hWnd_, "ptr") : hWnd_
        wParam_ := wParam_ is Win32Handle ? NumGet(wParam_, "ptr") : wParam_
        lParam_ := lParam_ is Win32Handle ? NumGet(lParam_, "ptr") : lParam_

        result := ComCall(4, this, "ptr", hWnd_, "uint", Msg_, "ptr", wParam_, "ptr", lParam_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<SPNOTIFYCALLBACK>>} pfnCallback_ 
     * @param {WPARAM} wParam_ 
     * @param {LPARAM} lParam_ 
     * @returns {HRESULT} 
     */
    SetNotifyCallbackFunction(pfnCallback_, wParam_, lParam_) {
        wParam_ := wParam_ is Win32Handle ? NumGet(wParam_, "ptr") : wParam_
        lParam_ := lParam_ is Win32Handle ? NumGet(lParam_, "ptr") : lParam_

        pfnCallback_Marshal := pfnCallback_ is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, pfnCallback_Marshal, pfnCallback_, "ptr", wParam_, "ptr", lParam_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {ISpNotifyCallback} pSpCallback 
     * @param {WPARAM} wParam_ 
     * @param {LPARAM} lParam_ 
     * @returns {HRESULT} 
     */
    SetNotifyCallbackInterface(pSpCallback, wParam_, lParam_) {
        wParam_ := wParam_ is Win32Handle ? NumGet(wParam_, "ptr") : wParam_
        lParam_ := lParam_ is Win32Handle ? NumGet(lParam_, "ptr") : lParam_

        result := ComCall(6, this, "ptr", pSpCallback, "ptr", wParam_, "ptr", lParam_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SetNotifyWin32Event() {
        result := ComCall(7, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} dwMilliseconds 
     * @returns {HRESULT} 
     */
    WaitForNotifyEvent(dwMilliseconds) {
        result := ComCall(8, this, "uint", dwMilliseconds, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves a handle to a notification event.
     * @returns {HANDLE} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>. 
     * 
     * If the operation fails, the function returns a system error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/clusapi/nf-clusapi-getnotifyeventhandle
     */
    GetNotifyEventHandle() {
        result := ComCall(9, this, "ptr")
        resultHandle := HANDLE({Value: result}, True)
        return resultHandle
    }
}
