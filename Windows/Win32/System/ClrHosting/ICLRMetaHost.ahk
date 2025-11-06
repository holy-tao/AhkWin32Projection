#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IEnumUnknown.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class ICLRMetaHost extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICLRMetaHost
     * @type {Guid}
     */
    static IID => Guid("{d332db9e-b9b3-4125-8207-a14884f53216}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetRuntime", "GetVersionFromFile", "EnumerateInstalledRuntimes", "EnumerateLoadedRuntimes", "RequestRuntimeLoadedNotification", "QueryLegacyV2RuntimeBinding", "ExitProcess"]

    /**
     * 
     * @param {PWSTR} pwzVersion 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    GetRuntime(pwzVersion, riid) {
        pwzVersion := pwzVersion is String ? StrPtr(pwzVersion) : pwzVersion

        result := ComCall(3, this, "ptr", pwzVersion, "ptr", riid, "ptr*", &ppRuntime := 0, "HRESULT")
        return ppRuntime
    }

    /**
     * 
     * @param {PWSTR} pwzFilePath 
     * @param {PWSTR} pwzBuffer 
     * @param {Pointer<Integer>} pcchBuffer 
     * @returns {HRESULT} 
     */
    GetVersionFromFile(pwzFilePath, pwzBuffer, pcchBuffer) {
        pwzFilePath := pwzFilePath is String ? StrPtr(pwzFilePath) : pwzFilePath
        pwzBuffer := pwzBuffer is String ? StrPtr(pwzBuffer) : pwzBuffer

        pcchBufferMarshal := pcchBuffer is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "ptr", pwzFilePath, "ptr", pwzBuffer, pcchBufferMarshal, pcchBuffer, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IEnumUnknown} 
     */
    EnumerateInstalledRuntimes() {
        result := ComCall(5, this, "ptr*", &ppEnumerator := 0, "HRESULT")
        return IEnumUnknown(ppEnumerator)
    }

    /**
     * 
     * @param {HANDLE} hndProcess 
     * @returns {IEnumUnknown} 
     */
    EnumerateLoadedRuntimes(hndProcess) {
        hndProcess := hndProcess is Win32Handle ? NumGet(hndProcess, "ptr") : hndProcess

        result := ComCall(6, this, "ptr", hndProcess, "ptr*", &ppEnumerator := 0, "HRESULT")
        return IEnumUnknown(ppEnumerator)
    }

    /**
     * 
     * @param {Pointer<RuntimeLoadedCallbackFnPtr>} pCallbackFunction 
     * @returns {HRESULT} 
     */
    RequestRuntimeLoadedNotification(pCallbackFunction) {
        result := ComCall(7, this, "ptr", pCallbackFunction, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    QueryLegacyV2RuntimeBinding(riid) {
        result := ComCall(8, this, "ptr", riid, "ptr*", &ppUnk := 0, "HRESULT")
        return ppUnk
    }

    /**
     * Ends the calling process and all its threads.
     * @remarks
     * 
     * Use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-getexitcodeprocess">GetExitCodeProcess</a> function to retrieve the process's exit value. Use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-getexitcodethread">GetExitCodeThread</a> function to retrieve a thread's exit value.
     * 
     * Exiting a process causes the following:
     * 
     * <ol>
     * <li>All of the threads in the process, except the calling thread, terminate their execution without receiving a DLL_THREAD_DETACH notification.</li>
     * <li>The states of all of the threads terminated in step 1 become signaled.</li>
     * <li>The entry-point functions of all loaded dynamic-link libraries (DLLs) are called with DLL_PROCESS_DETACH. </li>
     * <li>After all attached DLLs have executed any process termination code, the <b>ExitProcess</b> function terminates the current process, including the calling thread.</li>
     * <li>The state of the calling thread becomes signaled.</li>
     * <li>All of the object handles opened by the process are closed.</li>
     * <li>The termination status of the process changes from STILL_ACTIVE to the exit value of the process.</li>
     * <li>The state of the process object becomes signaled, satisfying any threads that had been waiting for the process to terminate.</li>
     * </ol>
     * If one of the terminated threads in the process holds a lock and the DLL detach code in one of the loaded DLLs attempts to acquire the same lock, then calling <b>ExitProcess</b> results in a deadlock. In contrast, if a process terminates by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-terminateprocess">TerminateProcess</a>, the DLLs that the process is attached to are not notified of the process termination. Therefore, if you do not know the state of all threads in your process, it is better to call <b>TerminateProcess</b> than  <b>ExitProcess</b>. Note that returning from the <b>main</b> function of an application results in a call to <b>ExitProcess</b>.
     * 
     * Calling 
     * <b>ExitProcess</b> in a DLL can lead to unexpected application or system errors. Be sure to call 
     * <b>ExitProcess</b> from a DLL only if you know which applications or system components will load the DLL and that it is safe to call 
     * <b>ExitProcess</b> in this context. 
     * 
     * Exiting a process does not cause child processes to be terminated.
     * 
     * Exiting a process does not necessarily remove the process object from the operating system. A process object is deleted when the last handle to the process is closed.
     * 
     * 
     * 
     * @param {Integer} iExitCode 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-exitprocess
     */
    ExitProcess(iExitCode) {
        result := ComCall(9, this, "int", iExitCode, "HRESULT")
        return result
    }
}
