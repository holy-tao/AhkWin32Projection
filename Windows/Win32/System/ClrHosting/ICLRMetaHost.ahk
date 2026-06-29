#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\Com\IEnumUnknown.ahk" { IEnumUnknown }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
export default struct ICLRMetaHost extends IUnknown {
    /**
     * The interface identifier for ICLRMetaHost
     * @type {Guid}
     */
    static IID := Guid("{d332db9e-b9b3-4125-8207-a14884f53216}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICLRMetaHost interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetRuntime                       : IntPtr
        GetVersionFromFile               : IntPtr
        EnumerateInstalledRuntimes       : IntPtr
        EnumerateLoadedRuntimes          : IntPtr
        RequestRuntimeLoadedNotification : IntPtr
        QueryLegacyV2RuntimeBinding      : IntPtr
        ExitProcess                      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICLRMetaHost.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} pwzVersion 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    GetRuntime(pwzVersion, riid) {
        pwzVersion := pwzVersion is String ? StrPtr(pwzVersion) : pwzVersion

        result := ComCall(3, this, "ptr", pwzVersion, Guid.Ptr, riid, "ptr*", &ppRuntime := 0, "HRESULT")
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
        result := ComCall(6, this, HANDLE, hndProcess, "ptr*", &ppEnumerator := 0, "HRESULT")
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
        result := ComCall(8, this, Guid.Ptr, riid, "ptr*", &ppUnk := 0, "HRESULT")
        return ppUnk
    }

    /**
     * Ends the calling process and all its threads.
     * @remarks
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
     * @param {Integer} iExitCode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-exitprocess
     */
    ExitProcess(iExitCode) {
        result := ComCall(9, this, "int", iExitCode, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICLRMetaHost.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetRuntime := CallbackCreate(GetMethod(implObj, "GetRuntime"), flags, 4)
        this.vtbl.GetVersionFromFile := CallbackCreate(GetMethod(implObj, "GetVersionFromFile"), flags, 4)
        this.vtbl.EnumerateInstalledRuntimes := CallbackCreate(GetMethod(implObj, "EnumerateInstalledRuntimes"), flags, 2)
        this.vtbl.EnumerateLoadedRuntimes := CallbackCreate(GetMethod(implObj, "EnumerateLoadedRuntimes"), flags, 3)
        this.vtbl.RequestRuntimeLoadedNotification := CallbackCreate(GetMethod(implObj, "RequestRuntimeLoadedNotification"), flags, 2)
        this.vtbl.QueryLegacyV2RuntimeBinding := CallbackCreate(GetMethod(implObj, "QueryLegacyV2RuntimeBinding"), flags, 3)
        this.vtbl.ExitProcess := CallbackCreate(GetMethod(implObj, "ExitProcess"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetRuntime)
        CallbackFree(this.vtbl.GetVersionFromFile)
        CallbackFree(this.vtbl.EnumerateInstalledRuntimes)
        CallbackFree(this.vtbl.EnumerateLoadedRuntimes)
        CallbackFree(this.vtbl.RequestRuntimeLoadedNotification)
        CallbackFree(this.vtbl.QueryLegacyV2RuntimeBinding)
        CallbackFree(this.vtbl.ExitProcess)
    }
}
