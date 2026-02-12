#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include .\ISpNotifySink.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpNotifyTranslator extends ISpNotifySink{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpNotifyTranslator
     * @type {Guid}
     */
    static IID => Guid("{aca16614-5d3d-11d2-960e-00c04f8ee628}")

    /**
     * The class identifier for SpNotifyTranslator
     * @type {Guid}
     */
    static CLSID => Guid("{e2ae5372-5d40-11d2-960e-00c04f8ee628}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InitWindowMessage", "InitCallback", "InitSpNotifyCallback", "InitWin32Event", "Wait", "GetEventHandle"]

    /**
     * 
     * @param {HWND} hWnd_ 
     * @param {Integer} Msg_ 
     * @param {WPARAM} wParam_ 
     * @param {LPARAM} lParam_ 
     * @returns {HRESULT} 
     */
    InitWindowMessage(hWnd_, Msg_, wParam_, lParam_) {
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
    InitCallback(pfnCallback_, wParam_, lParam_) {
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
    InitSpNotifyCallback(pSpCallback, wParam_, lParam_) {
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
     * @param {HANDLE} hEvent 
     * @param {BOOL} fCloseHandleOnRelease 
     * @returns {HRESULT} 
     */
    InitWin32Event(hEvent, fCloseHandleOnRelease) {
        hEvent := hEvent is Win32Handle ? NumGet(hEvent, "ptr") : hEvent

        result := ComCall(7, this, "ptr", hEvent, "int", fCloseHandleOnRelease, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Waits for an event to occur for a specified communications device. The set of events that are monitored by this function is contained in the event mask associated with the device handle.
     * @remarks
     * The 
     * <b>WaitCommEvent</b> function monitors a set of events for a specified communications resource. To set and query the current event mask of a communications resource, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-setcommmask">SetCommMask</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-getcommmask">GetCommMask</a> functions.
     * 
     * If the overlapped operation cannot be completed immediately, the function returns <b>FALSE</b> and the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function returns <b>ERROR_IO_PENDING</b>, indicating that the operation is executing in the background. When this happens, the system sets the <b>hEvent</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure to the not-signaled state before 
     * <b>WaitCommEvent</b> returns, and then it sets it to the signaled state when one of the specified events or an error occurs. The calling process can use one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Sync/wait-functions">wait functions</a> to determine the event object's state and then use the <a href="https://docs.microsoft.com/windows/desktop/api/ioapiset/nf-ioapiset-getoverlappedresult">GetOverlappedResult</a> function to determine the results of the 
     * <b>WaitCommEvent</b> operation. 
     * <b>GetOverlappedResult</b> reports the success or failure of the operation, and the variable pointed to by the <i>lpEvtMask</i> parameter is set to indicate the event that occurred.
     * 
     * If a process attempts to change the device handle's event mask by using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-setcommmask">SetCommMask</a> function while an overlapped 
     * <b>WaitCommEvent</b> operation is in progress, 
     * <b>WaitCommEvent</b> returns immediately. The variable pointed to by the <i>lpEvtMask</i> parameter is set to zero.
     * @param {Integer} dwMilliseconds 
     * @returns {HRESULT} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/winbase/nf-winbase-waitcommevent
     */
    Wait(dwMilliseconds) {
        result := ComCall(8, this, "uint", dwMilliseconds, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HANDLE} 
     */
    GetEventHandle() {
        result := ComCall(9, this, "ptr")
        resultHandle := HANDLE({Value: result}, True)
        return resultHandle
    }
}
