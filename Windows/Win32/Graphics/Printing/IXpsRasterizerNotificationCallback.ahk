#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IXpsRasterizerNotificationCallback extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXpsRasterizerNotificationCallback
     * @type {Guid}
     */
    static IID => Guid("{9ab8fd0d-cb94-49c2-9cb0-97ec1d5469d2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Continue"]

    /**
     * Enables a debugger to continue a thread that previously reported a debugging event.
     * @remarks
     * Only the thread that created <i>dwProcessId</i> with the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-createprocessa">CreateProcess</a> function can call 
     * <b>ContinueDebugEvent</b>.
     * 
     * After the 
     * <b>ContinueDebugEvent</b> function succeeds, the specified thread continues. Depending on the debugging event previously reported by the thread, different actions occur. If the continued thread previously reported an EXIT_THREAD_DEBUG_EVENT debugging event, 
     * <b>ContinueDebugEvent</b> closes the handle the debugger has to the thread. If the continued thread previously reported an EXIT_PROCESS_DEBUG_EVENT debugging event, 
     * <b>ContinueDebugEvent</b> closes the handles the debugger has to the process and to the thread.
     * @returns {HRESULT} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/debugapi/nf-debugapi-continuedebugevent
     */
    Continue() {
        result := ComCall(3, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
