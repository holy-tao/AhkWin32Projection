#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugEventCallbacksWide extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugEventCallbacksWide
     * @type {Guid}
     */
    static IID => Guid("{0690e046-9c23-45ac-a04f-987ac29ad0d3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetInterestMask", "Breakpoint", "Exception", "CreateThread", "ExitThread", "CreateProcessA", "ExitProcess", "LoadModule", "UnloadModule", "SystemError", "SessionStatus", "ChangeDebuggeeState", "ChangeEngineState", "ChangeSymbolState"]

    /**
     * 
     * @returns {Integer} 
     */
    GetInterestMask() {
        result := ComCall(3, this, "uint*", &Mask := 0, "HRESULT")
        return Mask
    }

    /**
     * 
     * @param {IDebugBreakpoint2} Bp 
     * @returns {HRESULT} 
     */
    Breakpoint(Bp) {
        result := ComCall(4, this, "ptr", Bp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<EXCEPTION_RECORD64>} Exception 
     * @param {Integer} FirstChance 
     * @returns {HRESULT} 
     */
    Exception(Exception, FirstChance) {
        result := ComCall(5, this, "ptr", Exception, "uint", FirstChance, "HRESULT")
        return result
    }

    /**
     * Creates a thread to execute within the virtual address space of the calling process.
     * @param {Integer} Handle 
     * @param {Integer} DataOffset 
     * @param {Integer} StartOffset 
     * @returns {HRESULT} If the function succeeds, the return value is a handle to the new thread.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * Note that <b>CreateThread</b> may succeed even if 
     *        <i>lpStartAddress</i> points to data, code, or is not accessible. If the start address is 
     *        invalid when the thread runs, an exception occurs, and the thread terminates. Thread termination due to a 
     *        invalid start address is handled as an error exit for the thread's process. This behavior is similar to the 
     *        asynchronous nature of <a href="/windows/desktop/api/processthreadsapi/nf-processthreadsapi-createprocessa">CreateProcess</a>, where the 
     *        process is created even if it refers to invalid or missing dynamic-link libraries (DLLs).
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-createthread
     */
    CreateThread(Handle, DataOffset, StartOffset) {
        result := ComCall(6, this, "uint", Handle, "uint", DataOffset, "uint", StartOffset, "HRESULT")
        return result
    }

    /**
     * Ends the calling thread.
     * @remarks
     * 
     * <b>ExitThread</b> is the preferred method of exiting a thread in C code. However, in C++ code, the thread is exited before any destructors can be called or any other automatic cleanup can be performed. Therefore, in C++ code, you should return from your thread function.
     * 
     * When this function is called (either explicitly or by returning from a thread procedure), the current thread's stack is deallocated, all pending I/O initiated by the thread is canceled, and the thread terminates. The entry-point function of all attached dynamic-link libraries (DLLs) is invoked with a value indicating that the thread is detaching from the DLL.
     * 
     * If the thread is the last thread in the process when this function is called, the thread's process is also terminated.
     * 
     * The state of the thread object becomes signaled, releasing any other threads that had been waiting for the thread to terminate. The thread's termination status changes from STILL_ACTIVE to the value of the <i>dwExitCode</i> parameter.
     * 
     * Terminating a thread does not necessarily remove the thread object from the operating system. A thread object is deleted when the last handle to the thread is closed.
     * 
     * The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-exitprocess">ExitProcess</a>, 
     * <b>ExitThread</b>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-createthread">CreateThread</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-createremotethread">CreateRemoteThread</a> functions, and a process that is starting (as the result of a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-createprocessa">CreateProcess</a> call) are serialized between each other within a process. Only one of these events can happen in an address space at a time. This means the following restrictions hold:
     * 
     * <ul>
     * <li>During process startup and DLL initialization routines, new threads can be created, but they do not begin execution until DLL initialization is done for the process.</li>
     * <li>Only one thread in a process can be in a DLL initialization or detach routine at a time.</li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-exitprocess">ExitProcess</a> does not return until no threads are in their DLL initialization or detach routines.</li>
     * </ul>
     * A thread in an executable that is linked to the static C run-time library (CRT) should use <b>_beginthread</b> and <b>_endthread</b> for thread management rather than 
     * <b>CreateThread</b> and 
     * <b>ExitThread</b>. Failure to do so results in small memory leaks when 
     * the thread calls <b>ExitThread</b>. Another work around is to link the executable to the CRT in a DLL instead of the static CRT. Note that this memory leak only occurs from a DLL if the DLL is linked to the static CRT and a thread calls the <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-disablethreadlibrarycalls">DisableThreadLibraryCalls</a> function. Otherwise, it is safe to call <b>CreateThread</b> and 
     * <b>ExitThread</b> from a thread in a DLL that links to the static CRT.
     * 
     * Use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-getexitcodethread">GetExitCodeThread</a> function to retrieve a thread's exit code.
     * 
     * <b>Windows Phone 8.1:</b> This function is supported for Windows Phone Store apps on Windows Phone 8.1 and later.
     * 
     * <b>Windows 8.1</b> and <b>Windows Server 2012 R2</b>: This function is supported for Windows Store apps on Windows 8.1, Windows Server 2012 R2, and later.
     * 
     * 
     * 
     * @param {Integer} ExitCode 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-exitthread
     */
    ExitThread(ExitCode) {
        result := ComCall(7, this, "uint", ExitCode, "HRESULT")
        return result
    }

    /**
     * Creates a new process and its primary thread. The new process runs in the security context of the calling process.
     * @param {Integer} ImageFileHandle 
     * @param {Integer} Handle 
     * @param {Integer} BaseOffset 
     * @param {Integer} ModuleSize 
     * @param {PWSTR} ModuleName 
     * @param {PWSTR} ImageName 
     * @param {Integer} CheckSum 
     * @param {Integer} TimeDateStamp 
     * @param {Integer} InitialThreadHandle 
     * @param {Integer} ThreadDataOffset 
     * @param {Integer} StartOffset 
     * @returns {HRESULT} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * Note that the function returns before the process has finished initialization. If a required DLL cannot be located or fails to initialize, the process is terminated. To get the termination status of a process, call <a href="/windows/desktop/api/processthreadsapi/nf-processthreadsapi-getexitcodeprocess">GetExitCodeProcess</a>.
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-createprocessa
     */
    CreateProcessA(ImageFileHandle, Handle, BaseOffset, ModuleSize, ModuleName, ImageName, CheckSum, TimeDateStamp, InitialThreadHandle, ThreadDataOffset, StartOffset) {
        ModuleName := ModuleName is String ? StrPtr(ModuleName) : ModuleName
        ImageName := ImageName is String ? StrPtr(ImageName) : ImageName

        result := ComCall(8, this, "uint", ImageFileHandle, "uint", Handle, "uint", BaseOffset, "uint", ModuleSize, "ptr", ModuleName, "ptr", ImageName, "uint", CheckSum, "uint", TimeDateStamp, "uint", InitialThreadHandle, "uint", ThreadDataOffset, "uint", StartOffset, "HRESULT")
        return result
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
     * @param {Integer} ExitCode 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-exitprocess
     */
    ExitProcess(ExitCode) {
        result := ComCall(9, this, "uint", ExitCode, "HRESULT")
        return result
    }

    /**
     * Loads and executes an application or creates a new instance of an existing application.
     * @param {Integer} ImageFileHandle 
     * @param {Integer} BaseOffset 
     * @param {Integer} ModuleSize 
     * @param {PWSTR} ModuleName 
     * @param {PWSTR} ImageName 
     * @param {Integer} CheckSum 
     * @param {Integer} TimeDateStamp 
     * @returns {HRESULT} If the function succeeds, the return value is greater than 31.
     * 
     * If the function fails, the return value is an error value, which may be one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system is out of memory or resources.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_FORMAT</b></dt>
     * <dt>11L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The .exe file is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_FILE_NOT_FOUND</b></dt>
     * <dt>2L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified file was not found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_PATH_NOT_FOUND</b></dt>
     * <dt>3L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified path was not found.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-loadmodule
     */
    LoadModule(ImageFileHandle, BaseOffset, ModuleSize, ModuleName, ImageName, CheckSum, TimeDateStamp) {
        ModuleName := ModuleName is String ? StrPtr(ModuleName) : ModuleName
        ImageName := ImageName is String ? StrPtr(ImageName) : ImageName

        result := ComCall(10, this, "uint", ImageFileHandle, "uint", BaseOffset, "uint", ModuleSize, "ptr", ModuleName, "ptr", ImageName, "uint", CheckSum, "uint", TimeDateStamp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} ImageBaseName 
     * @param {Integer} BaseOffset 
     * @returns {HRESULT} 
     */
    UnloadModule(ImageBaseName, BaseOffset) {
        ImageBaseName := ImageBaseName is String ? StrPtr(ImageBaseName) : ImageBaseName

        result := ComCall(11, this, "ptr", ImageBaseName, "uint", BaseOffset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Error 
     * @param {Integer} Level 
     * @returns {HRESULT} 
     */
    SystemError(Error, Level) {
        result := ComCall(12, this, "uint", Error, "uint", Level, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Status 
     * @returns {HRESULT} 
     */
    SessionStatus(Status) {
        result := ComCall(13, this, "uint", Status, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @param {Integer} Argument 
     * @returns {HRESULT} 
     */
    ChangeDebuggeeState(Flags, Argument) {
        result := ComCall(14, this, "uint", Flags, "uint", Argument, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @param {Integer} Argument 
     * @returns {HRESULT} 
     */
    ChangeEngineState(Flags, Argument) {
        result := ComCall(15, this, "uint", Flags, "uint", Argument, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @param {Integer} Argument 
     * @returns {HRESULT} 
     */
    ChangeSymbolState(Flags, Argument) {
        result := ComCall(16, this, "uint", Flags, "uint", Argument, "HRESULT")
        return result
    }
}
