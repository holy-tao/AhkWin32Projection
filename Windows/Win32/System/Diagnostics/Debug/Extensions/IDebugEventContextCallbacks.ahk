#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugEventContextCallbacks extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugEventContextCallbacks
     * @type {Guid}
     */
    static IID => Guid("{61a4905b-23f9-4247-b3c5-53d087529ab7}")

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
        result := ComCall(3, this, "uint*", &Mask := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Mask
    }

    /**
     * 
     * @param {IDebugBreakpoint2} Bp 
     * @param {Pointer} Context_ 
     * @param {Integer} ContextSize 
     * @returns {HRESULT} 
     */
    Breakpoint(Bp, Context_, ContextSize) {
        result := ComCall(4, this, "ptr", Bp, "ptr", Context_, "uint", ContextSize, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Exception Event Class
     * @param {Pointer<EXCEPTION_RECORD64>} Exception 
     * @param {Integer} FirstChance 
     * @param {Pointer} Context_ 
     * @param {Integer} ContextSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/event-classes/exception-event-class
     */
    Exception(Exception, FirstChance, Context_, ContextSize) {
        result := ComCall(5, this, "ptr", Exception, "uint", FirstChance, "ptr", Context_, "uint", ContextSize, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Creates a thread to execute within the virtual address space of the calling process.
     * @remarks
     * The number of threads a process can create is limited by the available virtual memory. By default, every thread has one megabyte of stack space. Therefore, you can create at most 2,048 threads. If you reduce the default stack size, you can create more threads. However, your application will have better performance if you create one thread per processor and build queues of requests for which the application maintains the context information. A thread would process all requests in a queue before processing requests in the next queue.
     * 
     * The new thread handle is created with the <b>THREAD_ALL_ACCESS</b> access right. If a security descriptor is not provided when the thread is created, a default security descriptor is constructed for the new thread using the primary token of the   process that is creating the thread. When a caller attempts to access the thread  with the <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-openthread">OpenThread</a> function, the effective token of the caller is evaluated against this  security descriptor to grant or deny access. 
     * 
     *  The newly created thread  has full access rights to itself when calling the <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-getcurrentthread">GetCurrentThread</a>  function. 
     * 
     * <b>Windows Server 2003:  </b>The thread's access rights to itself are computed by evaluating the primary token of the process in which the thread was created  against the default security descriptor constructed for the thread. If the thread is created in a remote process, the primary token of the remote process is used. As a result, the newly created thread may have reduced access rights to itself when calling <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-getcurrentthread">GetCurrentThread</a>. Some access rights including <b>THREAD_SET_THREAD_TOKEN</b> and <b>THREAD_GET_CONTEXT</b> may not be present, leading to unexpected failures. For this reason, creating a thread while impersonating another user is not recommended.
     * 
     *  If the thread is created in a runnable state (that is, if the <b>CREATE_SUSPENDED</b> flag is not used), the thread can start running before <b>CreateThread</b> returns and, in particular, before  the caller receives the handle and identifier of the created thread.
     * 
     * The thread execution begins at the function specified by the <i>lpStartAddress</i> parameter. If this function returns, the <b>DWORD</b> return value is used to terminate the thread in an implicit call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-exitthread">ExitThread</a> function. Use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-getexitcodethread">GetExitCodeThread</a> function to get the thread's return value.
     * 
     * The thread is created with a thread priority of <b>THREAD_PRIORITY_NORMAL</b>. Use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-getthreadpriority">GetThreadPriority</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-setthreadpriority">SetThreadPriority</a> functions to get and set the priority value of a thread.
     * 
     * When a thread terminates, the thread object attains a signaled state, satisfying any threads that were waiting on the object.
     * 
     * The thread object remains in the system until the thread has terminated and all handles to it have been closed through a call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-closehandle">CloseHandle</a>.
     * 
     * The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-exitprocess">ExitProcess</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-exitthread">ExitThread</a>, 
     * <b>CreateThread</b>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-createremotethread">CreateRemoteThread</a> functions, and a process that is starting (as the result of a call by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-createprocessa">CreateProcess</a>) are serialized between each other within a process. Only one of these events can happen in an address space at a time. This means that the following restrictions hold:
     * 
     * <ul>
     * <li>During process startup and DLL initialization routines, new threads can be created, but they do not begin execution until DLL initialization is done for the process.</li>
     * <li>Only one thread in a process can be in a DLL initialization or detach routine at a time.</li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-exitprocess">ExitProcess</a> does not complete until there are no threads in their DLL initialization or detach routines.</li>
     * </ul>
     * A thread in an executable that calls the C run-time library (CRT) should use the <a href="https://docs.microsoft.com/cpp/c-runtime-library/reference/beginthread-beginthreadex">_beginthreadex</a> and <a href="https://docs.microsoft.com/cpp/c-runtime-library/reference/endthread-endthreadex">_endthreadex</a> functions for thread management rather than 
     * <b>CreateThread</b> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-exitthread">ExitThread</a>; this requires the use of the multithreaded version of the CRT. If a thread created using <b>CreateThread</b> calls the CRT, the CRT may terminate the process in low-memory conditions.
     * 
     * <b>Windows Phone 8.1:</b> This function is supported for Windows Phone Store apps on Windows Phone 8.1 and later.
     * 
     * <b>Windows 8.1</b> and <b>Windows Server 2012 R2</b>: This function is supported for Windows Store apps on Windows 8.1, Windows Server 2012 R2, and later.
     * @param {Integer} Handle_ 
     * @param {Integer} DataOffset 
     * @param {Integer} StartOffset 
     * @param {Pointer} Context_ 
     * @param {Integer} ContextSize 
     * @returns {HRESULT} If the function succeeds, the return value is a handle to the new thread.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * Note that <b>CreateThread</b> may succeed even if 
     *        <i>lpStartAddress</i> points to data, code, or is not accessible. If the start address is 
     *        invalid when the thread runs, an exception occurs, and the thread terminates. Thread termination due to a 
     *        invalid start address is handled as an error exit for the thread's process. This behavior is similar to the 
     *        asynchronous nature of <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-createprocessa">CreateProcess</a>, where the 
     *        process is created even if it refers to invalid or missing dynamic-link libraries (DLLs).
     * @see https://learn.microsoft.com/windows/win32/api//content/processthreadsapi/nf-processthreadsapi-createthread
     */
    CreateThread(Handle_, DataOffset, StartOffset, Context_, ContextSize) {
        result := ComCall(6, this, "uint", Handle_, "uint", DataOffset, "uint", StartOffset, "ptr", Context_, "uint", ContextSize, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Ends the calling thread.
     * @remarks
     * <b>ExitThread</b> is the preferred method of exiting a thread in C code. However, in C++ code, the thread is exited before any destructors can be called or any other automatic cleanup can be performed. Therefore, in C++ code, you should return from your thread function.
     * 
     * When this function is called (either explicitly or by returning from a thread procedure), the current thread's stack is deallocated, all pending I/O initiated by the thread that is not associated with a completion port is canceled, and the thread terminates. The entry-point function of all attached dynamic-link libraries (DLLs) is invoked with a value indicating that the thread is detaching from the DLL.
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
     * @param {Integer} ExitCode 
     * @param {Pointer} Context_ 
     * @param {Integer} ContextSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/processthreadsapi/nf-processthreadsapi-exitthread
     */
    ExitThread(ExitCode, Context_, ContextSize) {
        result := ComCall(7, this, "uint", ExitCode, "ptr", Context_, "uint", ContextSize, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Creates a new process and its primary thread. The new process runs in the security context of the calling process. (ANSI)
     * @remarks
     * The process is assigned a process identifier. The identifier is valid until the process terminates. It can be used to identify the process, or specified in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-openprocess">OpenProcess</a> function to open a handle to the process. The initial thread in the process is also assigned a thread identifier. It can be specified in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-openthread">OpenThread</a> function to open a handle to the thread. The identifier is valid until the thread terminates and can be used to uniquely identify the thread within the system. These identifiers are returned in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/ns-processthreadsapi-process_information">PROCESS_INFORMATION</a> structure.
     * 
     * The name of the executable in the command line that the operating system provides to a process is not necessarily identical to that in the command line that the calling process gives to the 
     * <b>CreateProcess</b> function. The operating system may prepend a fully qualified path to an executable name that is provided without a fully qualified path.
     * 
     * The calling thread can use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-waitforinputidle">WaitForInputIdle</a> function to wait until the new process has finished its initialization and is waiting for user input with no input pending. This can be useful for synchronization between parent and child processes, because 
     * <b>CreateProcess</b> returns without waiting for the new process to finish its initialization. For example, the creating process would use 
     * <b>WaitForInputIdle</b> before trying to find a window associated with the new process.
     * 
     * The preferred way to shut down a process is by using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-exitprocess">ExitProcess</a> function, because this function sends notification of approaching termination to all DLLs attached to the process. Other means of shutting down a process do not notify the attached DLLs. Note that when a thread calls 
     * <b>ExitProcess</b>, other threads of the process are terminated without an opportunity to execute any additional code (including the thread termination code of attached DLLs). For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ProcThread/terminating-a-process">Terminating a Process</a>.
     * 
     * A  parent process can directly alter the environment variables of a child process during process creation.  This is the only  situation when a process can directly change the environment settings of another process. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ProcThread/changing-environment-variables">Changing Environment Variables</a>.
     * 
     * If an application provides an environment block, the current directory information of the system drives is not automatically propagated to the new process. For example, there is an environment variable named =C: whose value is the current directory on drive C. An application must manually pass the current directory information to the new process. To do so, the application must explicitly create these environment variable strings, sort them alphabetically (because the system uses a sorted environment), and put them into the environment block. Typically, they will go at the front of the environment block, due to the environment block sort order.
     * 
     * One way to obtain the current directory information for a drive X is to make the following call: 
     * <c>GetFullPathName("X:", ...)</c>. That avoids an application having to scan the environment block. If the full path returned is X:\, there is no need to pass that value on as environment data, since the root directory is the default current directory for drive X of a new process.
     * 
     * When a process is created with <b>CREATE_NEW_PROCESS_GROUP</b> specified, an implicit call to 
     * <a href="https://docs.microsoft.com/windows/console/setconsolectrlhandler">SetConsoleCtrlHandler</a>(<b>NULL</b>,<b>TRUE</b>) is made on behalf of the new process; this means that the new process has CTRL+C disabled. This lets shells handle CTRL+C themselves, and selectively pass that signal on to sub-processes. CTRL+BREAK is not disabled, and may be used to interrupt the process/process group.
     * 
     * By default, passing <b>TRUE</b> as the value of the <i>bInheritHandles</i> parameter causes all inheritable handles to be inherited by the new process.
     * This can be problematic for applications which create processes from multiple threads simultaneously
     * yet desire each process to inherit different handles.
     * Applications can use the
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-updateprocthreadattribute">UpdateProcThreadAttributeList</a> function
     * with the <b>PROC_THREAD_ATTRIBUTE_HANDLE_LIST</b> parameter
     * to provide a list of handles to be inherited by a particular process.
     * 
     * <h3><a id="Security_Remarks"></a><a id="security_remarks"></a><a id="SECURITY_REMARKS"></a>Security Remarks</h3>
     * The first parameter, <i>lpApplicationName</i>, can be <b>NULL</b>, in which case the executable name must be in the  white space–delimited string pointed to by <i>lpCommandLine</i>. If the executable or path name has a space in it, there is a risk that a different executable could be run because of the way the function parses spaces. The following example is dangerous because the function will attempt to run "Program.exe", if it exists, instead of "MyApp.exe".
     * 
     * 
     * ``` syntax
     * 	LPTSTR szCmdline = _tcsdup(TEXT("C:\\Program Files\\MyApp -L -S"));
     * 	CreateProcess(NULL, szCmdline, // ... );
     * ```
     * 
     * If a malicious user were to create an application called "Program.exe" on a system, any program that incorrectly calls 
     * <b>CreateProcess</b> using the Program Files directory will run this application instead of the intended application.
     * 
     * To avoid this problem, do not pass <b>NULL</b> for <i>lpApplicationName</i>. If you do pass <b>NULL</b> for <i>lpApplicationName</i>, use quotation marks around the executable path in <i>lpCommandLine</i>, as shown in the example below.
     * 
     * 
     * ``` syntax
     * 	LPTSTR szCmdline[] = _tcsdup(TEXT("\"C:\\Program Files\\MyApp\" -L -S"));
     * 	CreateProcess(NULL, szCmdline, //...);
     * ```
     * @param {Integer} ImageFileHandle 
     * @param {Integer} Handle_ 
     * @param {Integer} BaseOffset 
     * @param {Integer} ModuleSize 
     * @param {PWSTR} ModuleName 
     * @param {PWSTR} ImageName 
     * @param {Integer} CheckSum 
     * @param {Integer} TimeDateStamp 
     * @param {Integer} InitialThreadHandle 
     * @param {Integer} ThreadDataOffset 
     * @param {Integer} StartOffset 
     * @param {Pointer} Context_ 
     * @param {Integer} ContextSize 
     * @returns {HRESULT} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * Note that the function returns before the process has finished initialization. If a required DLL cannot be located or fails to initialize, the process is terminated. To get the termination status of a process, call <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-getexitcodeprocess">GetExitCodeProcess</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/processthreadsapi/nf-processthreadsapi-createprocessa
     */
    CreateProcessA(ImageFileHandle, Handle_, BaseOffset, ModuleSize, ModuleName, ImageName, CheckSum, TimeDateStamp, InitialThreadHandle, ThreadDataOffset, StartOffset, Context_, ContextSize) {
        ModuleName := ModuleName is String ? StrPtr(ModuleName) : ModuleName
        ImageName := ImageName is String ? StrPtr(ImageName) : ImageName

        result := ComCall(8, this, "uint", ImageFileHandle, "uint", Handle_, "uint", BaseOffset, "uint", ModuleSize, "ptr", ModuleName, "ptr", ImageName, "uint", CheckSum, "uint", TimeDateStamp, "uint", InitialThreadHandle, "uint", ThreadDataOffset, "uint", StartOffset, "ptr", Context_, "uint", ContextSize, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
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
     * @param {Integer} ExitCode 
     * @param {Pointer} Context_ 
     * @param {Integer} ContextSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/processthreadsapi/nf-processthreadsapi-exitprocess
     */
    ExitProcess(ExitCode, Context_, ContextSize) {
        result := ComCall(9, this, "uint", ExitCode, "ptr", Context_, "uint", ContextSize, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Loads and executes an application or creates a new instance of an existing application.
     * @remarks
     * The <b>LOADPARMS32</b> structure has the following form:
     * 						
     * 
     * 
     * ``` syntax
     * typedef struct tagLOADPARMS32 { 
     *   LPSTR lpEnvAddress;  // address of environment strings 
     *   LPSTR lpCmdLine;     // address of command line 
     *   LPSTR lpCmdShow;     // how to show new program 
     *   DWORD dwReserved;    // must be zero 
     * } LOADPARMS32;
     * ```
     * 
     * <table>
     * <tr>
     * <th>Member</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td><b>lpEnvAddress</b></td>
     * <td>Pointer to an array of null-terminated strings that supply the environment strings for the new process. The array has a value of NULL as its last entry. A value of NULL for this parameter causes the new process to start with the same environment as the calling process.</td>
     * </tr>
     * <tr>
     * <td><b>lpCmdLine</b></td>
     * <td>Pointer to a Pascal-style string that contains a correctly formed command line. The first byte of the string contains the number of bytes in the string. The remainder of the string contains the command line arguments, excluding the name of the child process. If there are no command line arguments, this parameter must point to a zero length string; it cannot be NULL.</td>
     * </tr>
     * <tr>
     * <td><b>lpCmdShow</b></td>
     * <td>Pointer to a structure containing two <b>WORD</b> values. The first value must always be set to two. The second value specifies how the application window is to be shown and is used to supply the <b>wShowWindow</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/ns-processthreadsapi-startupinfoa">STARTUPINFO</a> structure to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-createprocessa">CreateProcess</a> function. See the description of the <i>nCmdShow</i> parameter of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-showwindow">ShowWindow</a> function for a list of acceptable values.</td>
     * </tr>
     * <tr>
     * <td><b>dwReserved</b></td>
     * <td>This parameter is reserved; it must be zero.</td>
     * </tr>
     * </table>
     *  
     * 
     * Applications should use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-createprocessa">CreateProcess</a> function instead of 
     * <b>LoadModule</b>. The 
     * <b>LoadModule</b> function calls 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-createprocessa">CreateProcess</a> by forming the parameters as follows.
     * 				
     * 
     * <table>
     * <tr>
     * <th>CreateProcess parameter</th>
     * <th>Argument used</th>
     * </tr>
     * <tr>
     * <td><i>lpszApplicationName</i></td>
     * <td><i>lpModuleName</i></td>
     * </tr>
     * <tr>
     * <td><i>lpszCommandLine</i></td>
     * <td><i>lpParameterBlock</i>.<b>lpCmdLine</b></td>
     * </tr>
     * <tr>
     * <td><i>lpProcessAttributes</i></td>
     * <td>NULL</td>
     * </tr>
     * <tr>
     * <td><i>lpThreadAttributes</i></td>
     * <td>NULL</td>
     * </tr>
     * <tr>
     * <td><i>bInheritHandles</i></td>
     * <td>FALSE</td>
     * </tr>
     * <tr>
     * <td><i>dwCreationFlags</i></td>
     * <td>0</td>
     * </tr>
     * <tr>
     * <td><i>lpEnvironment</i></td>
     * <td><i>lpParameterBlock</i>.<b>lpEnvAddress</b></td>
     * </tr>
     * <tr>
     * <td><i>lpCurrentDirectory</i></td>
     * <td>NULL</td>
     * </tr>
     * <tr>
     * <td><i>lpStartupInfo</i></td>
     * <td>The structure is initialized to zero. The <b>cb</b> member is set to the size of the structure. The <b>wShowWindow</b> member is set to the value of the second word of <i>lpParameterBlock</i>.<b>lpCmdShow</b>.</td>
     * </tr>
     * <tr>
     * <td><i>lpProcessInformation</i><b>.hProcess</b></td>
     * <td>The handle is immediately closed.</td>
     * </tr>
     * <tr>
     * <td><i>lpProcessInformation</i><b>.hThread</b></td>
     * <td>The handle is immediately closed.</td>
     * </tr>
     * </table>
     * @param {Integer} ImageFileHandle 
     * @param {Integer} BaseOffset 
     * @param {Integer} ModuleSize 
     * @param {PWSTR} ModuleName 
     * @param {PWSTR} ImageName 
     * @param {Integer} CheckSum 
     * @param {Integer} TimeDateStamp 
     * @param {Pointer} Context_ 
     * @param {Integer} ContextSize 
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
     * @see https://learn.microsoft.com/windows/win32/api//content/winbase/nf-winbase-loadmodule
     */
    LoadModule(ImageFileHandle, BaseOffset, ModuleSize, ModuleName, ImageName, CheckSum, TimeDateStamp, Context_, ContextSize) {
        ModuleName := ModuleName is String ? StrPtr(ModuleName) : ModuleName
        ImageName := ImageName is String ? StrPtr(ImageName) : ImageName

        result := ComCall(10, this, "uint", ImageFileHandle, "uint", BaseOffset, "uint", ModuleSize, "ptr", ModuleName, "ptr", ImageName, "uint", CheckSum, "uint", TimeDateStamp, "ptr", Context_, "uint", ContextSize, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PWSTR} ImageBaseName 
     * @param {Integer} BaseOffset 
     * @param {Pointer} Context_ 
     * @param {Integer} ContextSize 
     * @returns {HRESULT} 
     */
    UnloadModule(ImageBaseName, BaseOffset, Context_, ContextSize) {
        ImageBaseName := ImageBaseName is String ? StrPtr(ImageBaseName) : ImageBaseName

        result := ComCall(11, this, "ptr", ImageBaseName, "uint", BaseOffset, "ptr", Context_, "uint", ContextSize, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} Error 
     * @param {Integer} Level 
     * @param {Pointer} Context_ 
     * @param {Integer} ContextSize 
     * @returns {HRESULT} 
     */
    SystemError(Error, Level, Context_, ContextSize) {
        result := ComCall(12, this, "uint", Error, "uint", Level, "ptr", Context_, "uint", ContextSize, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} Status_ 
     * @returns {HRESULT} 
     */
    SessionStatus(Status_) {
        result := ComCall(13, this, "uint", Status_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @param {Integer} Argument 
     * @param {Pointer} Context_ 
     * @param {Integer} ContextSize 
     * @returns {HRESULT} 
     */
    ChangeDebuggeeState(Flags, Argument, Context_, ContextSize) {
        result := ComCall(14, this, "uint", Flags, "uint", Argument, "ptr", Context_, "uint", ContextSize, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @param {Integer} Argument 
     * @param {Pointer} Context_ 
     * @param {Integer} ContextSize 
     * @returns {HRESULT} 
     */
    ChangeEngineState(Flags, Argument, Context_, ContextSize) {
        result := ComCall(15, this, "uint", Flags, "uint", Argument, "ptr", Context_, "uint", ContextSize, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @param {Integer} Argument 
     * @returns {HRESULT} 
     */
    ChangeSymbolState(Flags, Argument) {
        result := ComCall(16, this, "uint", Flags, "uint", Argument, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
