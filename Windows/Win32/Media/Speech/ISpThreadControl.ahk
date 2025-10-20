#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include ..\..\Foundation\HWND.ahk
#Include .\ISpNotifySink.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpThreadControl extends ISpNotifySink{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpThreadControl
     * @type {Guid}
     */
    static IID => Guid("{a6be4d73-4403-4358-b22d-0346e23b1764}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["StartThread", "WaitForThreadDone", "TerminateThread", "ThreadHandle", "ThreadId", "NotifyEvent", "WindowHandle", "ThreadCompleteEvent", "ExitThreadEvent"]

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {Pointer<HWND>} phwnd 
     * @returns {HRESULT} 
     */
    StartThread(dwFlags, phwnd) {
        result := ComCall(4, this, "uint", dwFlags, "ptr", phwnd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fForceStop 
     * @param {Pointer<HRESULT>} phrThreadResult 
     * @param {Integer} msTimeOut 
     * @returns {HRESULT} 
     */
    WaitForThreadDone(fForceStop, phrThreadResult, msTimeOut) {
        result := ComCall(5, this, "int", fForceStop, "ptr", phrThreadResult, "uint", msTimeOut, "HRESULT")
        return result
    }

    /**
     * Terminates a thread.
     * @returns {HRESULT} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-terminatethread
     */
    TerminateThread() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HANDLE} 
     */
    ThreadHandle() {
        result := ComCall(7, this, "ptr")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    ThreadId() {
        result := ComCall(8, this, "uint")
        return result
    }

    /**
     * 
     * @returns {HANDLE} 
     */
    NotifyEvent() {
        result := ComCall(9, this, "ptr")
        return result
    }

    /**
     * 
     * @returns {HWND} 
     */
    WindowHandle() {
        result := ComCall(10, this, "ptr")
        return result
    }

    /**
     * 
     * @returns {HANDLE} 
     */
    ThreadCompleteEvent() {
        result := ComCall(11, this, "ptr")
        return result
    }

    /**
     * 
     * @returns {HANDLE} 
     */
    ExitThreadEvent() {
        result := ComCall(12, this, "ptr")
        return result
    }
}
