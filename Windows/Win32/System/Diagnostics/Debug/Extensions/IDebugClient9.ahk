#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IDebugClient.ahk
#Include .\IDebugInputCallbacks.ahk
#Include .\IDebugOutputCallbacks.ahk
#Include .\IDebugEventCallbacks.ahk
#Include .\IDebugOutputCallbacksWide.ahk
#Include .\IDebugEventCallbacksWide.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugClient9 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugClient9
     * @type {Guid}
     */
    static IID => Guid("{2c24cd5b-4d9e-4df4-8a70-3d37440d119f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AttachKernel", "GetKernelConnectionOptions", "SetKernelConnectionOptions", "StartProcessServer", "ConnectProcessServer", "DisconnectProcessServer", "GetRunningProcessSystemIds", "GetRunningProcessSystemIdByExecutableName", "GetRunningProcessDescription", "AttachProcess", "CreateProcessA", "CreateProcessAndAttach", "GetProcessOptions", "AddProcessOptions", "RemoveProcessOptions", "SetProcessOptions", "OpenDumpFile", "WriteDumpFile", "ConnectSession", "StartServer", "OutputServers", "TerminateProcesses", "DetachProcesses", "EndSession", "GetExitCode", "DispatchCallbacks", "ExitDispatch", "CreateClient", "GetInputCallbacks", "SetInputCallbacks", "GetOutputCallbacks", "SetOutputCallbacks", "GetOutputMask", "SetOutputMask", "GetOtherOutputMask", "SetOtherOutputMask", "GetOutputWidth", "SetOutputWidth", "GetOutputLinePrefix", "SetOutputLinePrefix", "GetIdentity", "OutputIdentity", "GetEventCallbacks", "SetEventCallbacks", "FlushCallbacks", "WriteDumpFile2", "AddDumpInformationFile", "EndProcessServer", "WaitForProcessServerEnd", "IsKernelDebuggerEnabled", "TerminateCurrentProcess", "DetachCurrentProcess", "AbandonCurrentProcess", "GetRunningProcessSystemIdByExecutableNameWide", "GetRunningProcessDescriptionWide", "CreateProcessWide", "CreateProcessAndAttachWide", "OpenDumpFileWide", "WriteDumpFileWide", "AddDumpInformationFileWide", "GetNumberDumpFiles", "GetDumpFile", "GetDumpFileWide", "AttachKernelWide", "GetKernelConnectionOptionsWide", "SetKernelConnectionOptionsWide", "StartProcessServerWide", "ConnectProcessServerWide", "StartServerWide", "OutputServersWide", "GetOutputCallbacksWide", "SetOutputCallbacksWide", "GetOutputLinePrefixWide", "SetOutputLinePrefixWide", "GetIdentityWide", "OutputIdentityWide", "GetEventCallbacksWide", "SetEventCallbacksWide", "CreateProcess2", "CreateProcess2Wide", "CreateProcessAndAttach2", "CreateProcessAndAttach2Wide", "PushOutputLinePrefix", "PushOutputLinePrefixWide", "PopOutputLinePrefix", "GetNumberInputCallbacks", "GetNumberOutputCallbacks", "GetNumberEventCallbacks", "GetQuitLockString", "SetQuitLockString", "GetQuitLockStringWide", "SetQuitLockStringWide", "SetEventContextCallbacks", "SetClientContext", "OpenDumpFileWide2", "OpenDumpDirectoryWide", "OpenDumpDirectory"]

    /**
     * 
     * @param {Integer} Flags 
     * @param {PSTR} ConnectOptions 
     * @returns {HRESULT} 
     */
    AttachKernel(Flags, ConnectOptions) {
        ConnectOptions := ConnectOptions is String ? StrPtr(ConnectOptions) : ConnectOptions

        result := ComCall(3, this, "uint", Flags, "ptr", ConnectOptions, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PSTR} Buffer_ 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetKernelConnectionOptions(Buffer_, BufferSize) {
        Buffer_ := Buffer_ is String ? StrPtr(Buffer_) : Buffer_

        result := ComCall(4, this, "ptr", Buffer_, "uint", BufferSize, "uint*", &OptionsSize := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return OptionsSize
    }

    /**
     * 
     * @param {PSTR} Options 
     * @returns {HRESULT} 
     */
    SetKernelConnectionOptions(Options) {
        Options := Options is String ? StrPtr(Options) : Options

        result := ComCall(5, this, "ptr", Options, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @param {PSTR} Options 
     * @returns {HRESULT} 
     */
    StartProcessServer(Flags, Options) {
        static Reserved := 0 ;Reserved parameters must always be NULL

        Options := Options is String ? StrPtr(Options) : Options

        result := ComCall(6, this, "uint", Flags, "ptr", Options, "ptr", Reserved, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PSTR} RemoteOptions 
     * @returns {Integer} 
     */
    ConnectProcessServer(RemoteOptions) {
        RemoteOptions := RemoteOptions is String ? StrPtr(RemoteOptions) : RemoteOptions

        result := ComCall(7, this, "ptr", RemoteOptions, "uint*", &Server := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Server
    }

    /**
     * 
     * @param {Integer} Server 
     * @returns {HRESULT} 
     */
    DisconnectProcessServer(Server) {
        result := ComCall(8, this, "uint", Server, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} Server 
     * @param {Pointer<Integer>} Ids 
     * @param {Integer} Count 
     * @param {Pointer<Integer>} ActualCount 
     * @returns {HRESULT} 
     */
    GetRunningProcessSystemIds(Server, Ids, Count, ActualCount) {
        IdsMarshal := Ids is VarRef ? "uint*" : "ptr"
        ActualCountMarshal := ActualCount is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, "uint", Server, IdsMarshal, Ids, "uint", Count, ActualCountMarshal, ActualCount, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} Server 
     * @param {PSTR} ExeName 
     * @param {Integer} Flags 
     * @returns {Integer} 
     */
    GetRunningProcessSystemIdByExecutableName(Server, ExeName, Flags) {
        ExeName := ExeName is String ? StrPtr(ExeName) : ExeName

        result := ComCall(10, this, "uint", Server, "ptr", ExeName, "uint", Flags, "uint*", &Id := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Id
    }

    /**
     * 
     * @param {Integer} Server 
     * @param {Integer} SystemId 
     * @param {Integer} Flags 
     * @param {PSTR} ExeName 
     * @param {Integer} ExeNameSize 
     * @param {Pointer<Integer>} ActualExeNameSize 
     * @param {PSTR} Description 
     * @param {Integer} DescriptionSize 
     * @param {Pointer<Integer>} ActualDescriptionSize 
     * @returns {HRESULT} 
     */
    GetRunningProcessDescription(Server, SystemId, Flags, ExeName, ExeNameSize, ActualExeNameSize, Description, DescriptionSize, ActualDescriptionSize) {
        ExeName := ExeName is String ? StrPtr(ExeName) : ExeName
        Description := Description is String ? StrPtr(Description) : Description

        ActualExeNameSizeMarshal := ActualExeNameSize is VarRef ? "uint*" : "ptr"
        ActualDescriptionSizeMarshal := ActualDescriptionSize is VarRef ? "uint*" : "ptr"

        result := ComCall(11, this, "uint", Server, "uint", SystemId, "uint", Flags, "ptr", ExeName, "uint", ExeNameSize, ActualExeNameSizeMarshal, ActualExeNameSize, "ptr", Description, "uint", DescriptionSize, ActualDescriptionSizeMarshal, ActualDescriptionSize, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} Server 
     * @param {Integer} ProcessId 
     * @param {Integer} AttachFlags 
     * @returns {HRESULT} 
     */
    AttachProcess(Server, ProcessId, AttachFlags) {
        result := ComCall(12, this, "uint", Server, "uint", ProcessId, "uint", AttachFlags, "int")
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
     * @param {Integer} Server 
     * @param {PSTR} CommandLine 
     * @param {Integer} CreateFlags 
     * @returns {HRESULT} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * Note that the function returns before the process has finished initialization. If a required DLL cannot be located or fails to initialize, the process is terminated. To get the termination status of a process, call <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-getexitcodeprocess">GetExitCodeProcess</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/processthreadsapi/nf-processthreadsapi-createprocessa
     */
    CreateProcessA(Server, CommandLine, CreateFlags) {
        CommandLine := CommandLine is String ? StrPtr(CommandLine) : CommandLine

        result := ComCall(13, this, "uint", Server, "ptr", CommandLine, "uint", CreateFlags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} Server 
     * @param {PSTR} CommandLine 
     * @param {Integer} CreateFlags 
     * @param {Integer} ProcessId 
     * @param {Integer} AttachFlags 
     * @returns {HRESULT} 
     */
    CreateProcessAndAttach(Server, CommandLine, CreateFlags, ProcessId, AttachFlags) {
        CommandLine := CommandLine is String ? StrPtr(CommandLine) : CommandLine

        result := ComCall(14, this, "uint", Server, "ptr", CommandLine, "uint", CreateFlags, "uint", ProcessId, "uint", AttachFlags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetProcessOptions() {
        result := ComCall(15, this, "uint*", &Options := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Options
    }

    /**
     * 
     * @param {Integer} Options 
     * @returns {HRESULT} 
     */
    AddProcessOptions(Options) {
        result := ComCall(16, this, "uint", Options, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} Options 
     * @returns {HRESULT} 
     */
    RemoveProcessOptions(Options) {
        result := ComCall(17, this, "uint", Options, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} Options 
     * @returns {HRESULT} 
     */
    SetProcessOptions(Options) {
        result := ComCall(18, this, "uint", Options, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PSTR} DumpFile 
     * @returns {HRESULT} 
     */
    OpenDumpFile(DumpFile) {
        DumpFile := DumpFile is String ? StrPtr(DumpFile) : DumpFile

        result := ComCall(19, this, "ptr", DumpFile, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PSTR} DumpFile 
     * @param {Integer} Qualifier 
     * @returns {HRESULT} 
     */
    WriteDumpFile(DumpFile, Qualifier) {
        DumpFile := DumpFile is String ? StrPtr(DumpFile) : DumpFile

        result := ComCall(20, this, "ptr", DumpFile, "uint", Qualifier, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @param {Integer} HistoryLimit 
     * @returns {HRESULT} 
     */
    ConnectSession(Flags, HistoryLimit) {
        result := ComCall(21, this, "uint", Flags, "uint", HistoryLimit, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PSTR} Options 
     * @returns {HRESULT} 
     */
    StartServer(Options) {
        Options := Options is String ? StrPtr(Options) : Options

        result := ComCall(22, this, "ptr", Options, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} OutputControl 
     * @param {PSTR} Machine 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     */
    OutputServers(OutputControl, Machine, Flags) {
        Machine := Machine is String ? StrPtr(Machine) : Machine

        result := ComCall(23, this, "uint", OutputControl, "ptr", Machine, "uint", Flags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    TerminateProcesses() {
        result := ComCall(24, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    DetachProcesses() {
        result := ComCall(25, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Learn more about: EndSessionGrbit enumeration
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/extensible-storage-engine/endsessiongrbit-enumeration
     */
    EndSession(Flags) {
        result := ComCall(26, this, "uint", Flags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the termination status of the specified process.
     * @remarks
     * This function returns immediately. If the process has not terminated and the function succeeds, the status returned is <b>STILL_ACTIVE</b> (a macro for **STATUS_PENDING** (minwinbase.h)). If the process has terminated and the function succeeds, the status returned is one of the following values:
     * 
     * <ul>
     * <li>The exit value specified in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-exitprocess">ExitProcess</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-terminateprocess">TerminateProcess</a> function.</li>
     * <li>The return value from the <a href="https://docs.microsoft.com/cpp/cpp/main-function-command-line-args">main</a> or <a href="https://docs.microsoft.com/windows/win32/api/winbase/nf-winbase-winmain">WinMain</a> function of the process.</li>
     * <li>The exception value for an unhandled exception that caused the process to terminate.</li>
     * </ul>
     * 
     * > [!IMPORTANT]
     * > The **GetExitCodeProcess** function returns a valid error code defined by the application only after the thread terminates. Therefore, an application should not use **STILL_ACTIVE** (259) as an error code (**STILL_ACTIVE** is a macro for **STATUS_PENDING** (minwinbase.h)). If a thread returns **STILL_ACTIVE** (259) as an error code, then applications that test for that value could interpret it to mean that the thread is still running, and continue to test for the completion of the thread after the thread has terminated, which could put the application into an infinite loop.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/processthreadsapi/nf-processthreadsapi-getexitcodeprocess
     */
    GetExitCode() {
        result := ComCall(27, this, "uint*", &Code := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Code
    }

    /**
     * 
     * @param {Integer} Timeout 
     * @returns {HRESULT} 
     */
    DispatchCallbacks(Timeout) {
        result := ComCall(28, this, "uint", Timeout, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IDebugClient} Client 
     * @returns {HRESULT} 
     */
    ExitDispatch(Client) {
        result := ComCall(29, this, "ptr", Client, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IDebugClient} 
     */
    CreateClient() {
        result := ComCall(30, this, "ptr*", &Client := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDebugClient(Client)
    }

    /**
     * 
     * @returns {IDebugInputCallbacks} 
     */
    GetInputCallbacks() {
        result := ComCall(31, this, "ptr*", &Callbacks := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDebugInputCallbacks(Callbacks)
    }

    /**
     * 
     * @param {IDebugInputCallbacks} Callbacks 
     * @returns {HRESULT} 
     */
    SetInputCallbacks(Callbacks) {
        result := ComCall(32, this, "ptr", Callbacks, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IDebugOutputCallbacks} 
     */
    GetOutputCallbacks() {
        result := ComCall(33, this, "ptr*", &Callbacks := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDebugOutputCallbacks(Callbacks)
    }

    /**
     * 
     * @param {IDebugOutputCallbacks} Callbacks 
     * @returns {HRESULT} 
     */
    SetOutputCallbacks(Callbacks) {
        result := ComCall(34, this, "ptr", Callbacks, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetOutputMask() {
        result := ComCall(35, this, "uint*", &Mask := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Mask
    }

    /**
     * 
     * @param {Integer} Mask 
     * @returns {HRESULT} 
     */
    SetOutputMask(Mask) {
        result := ComCall(36, this, "uint", Mask, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IDebugClient} Client 
     * @returns {Integer} 
     */
    GetOtherOutputMask(Client) {
        result := ComCall(37, this, "ptr", Client, "uint*", &Mask := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Mask
    }

    /**
     * 
     * @param {IDebugClient} Client 
     * @param {Integer} Mask 
     * @returns {HRESULT} 
     */
    SetOtherOutputMask(Client, Mask) {
        result := ComCall(38, this, "ptr", Client, "uint", Mask, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetOutputWidth() {
        result := ComCall(39, this, "uint*", &Columns_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Columns_
    }

    /**
     * 
     * @param {Integer} Columns_ 
     * @returns {HRESULT} 
     */
    SetOutputWidth(Columns_) {
        result := ComCall(40, this, "uint", Columns_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PSTR} Buffer_ 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetOutputLinePrefix(Buffer_, BufferSize) {
        Buffer_ := Buffer_ is String ? StrPtr(Buffer_) : Buffer_

        result := ComCall(41, this, "ptr", Buffer_, "uint", BufferSize, "uint*", &PrefixSize := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PrefixSize
    }

    /**
     * 
     * @param {PSTR} Prefix 
     * @returns {HRESULT} 
     */
    SetOutputLinePrefix(Prefix) {
        Prefix := Prefix is String ? StrPtr(Prefix) : Prefix

        result := ComCall(42, this, "ptr", Prefix, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PSTR} Buffer_ 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetIdentity(Buffer_, BufferSize) {
        Buffer_ := Buffer_ is String ? StrPtr(Buffer_) : Buffer_

        result := ComCall(43, this, "ptr", Buffer_, "uint", BufferSize, "uint*", &IdentitySize := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IdentitySize
    }

    /**
     * 
     * @param {Integer} OutputControl 
     * @param {Integer} Flags 
     * @param {PSTR} Format 
     * @returns {HRESULT} 
     */
    OutputIdentity(OutputControl, Flags, Format) {
        Format := Format is String ? StrPtr(Format) : Format

        result := ComCall(44, this, "uint", OutputControl, "uint", Flags, "ptr", Format, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IDebugEventCallbacks} 
     */
    GetEventCallbacks() {
        result := ComCall(45, this, "ptr*", &Callbacks := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDebugEventCallbacks(Callbacks)
    }

    /**
     * 
     * @param {IDebugEventCallbacks} Callbacks 
     * @returns {HRESULT} 
     */
    SetEventCallbacks(Callbacks) {
        result := ComCall(46, this, "ptr", Callbacks, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    FlushCallbacks() {
        result := ComCall(47, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PSTR} DumpFile 
     * @param {Integer} Qualifier 
     * @param {Integer} FormatFlags 
     * @param {PSTR} Comment 
     * @returns {HRESULT} 
     */
    WriteDumpFile2(DumpFile, Qualifier, FormatFlags, Comment) {
        DumpFile := DumpFile is String ? StrPtr(DumpFile) : DumpFile
        Comment := Comment is String ? StrPtr(Comment) : Comment

        result := ComCall(48, this, "ptr", DumpFile, "uint", Qualifier, "uint", FormatFlags, "ptr", Comment, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PSTR} InfoFile 
     * @param {Integer} Type 
     * @returns {HRESULT} 
     */
    AddDumpInformationFile(InfoFile, Type) {
        InfoFile := InfoFile is String ? StrPtr(InfoFile) : InfoFile

        result := ComCall(49, this, "ptr", InfoFile, "uint", Type, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} Server 
     * @returns {HRESULT} 
     */
    EndProcessServer(Server) {
        result := ComCall(50, this, "uint", Server, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} Timeout 
     * @returns {HRESULT} 
     */
    WaitForProcessServerEnd(Timeout) {
        result := ComCall(51, this, "uint", Timeout, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    IsKernelDebuggerEnabled() {
        result := ComCall(52, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    TerminateCurrentProcess() {
        result := ComCall(53, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    DetachCurrentProcess() {
        result := ComCall(54, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    AbandonCurrentProcess() {
        result := ComCall(55, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} Server 
     * @param {PWSTR} ExeName 
     * @param {Integer} Flags 
     * @returns {Integer} 
     */
    GetRunningProcessSystemIdByExecutableNameWide(Server, ExeName, Flags) {
        ExeName := ExeName is String ? StrPtr(ExeName) : ExeName

        result := ComCall(56, this, "uint", Server, "ptr", ExeName, "uint", Flags, "uint*", &Id := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Id
    }

    /**
     * 
     * @param {Integer} Server 
     * @param {Integer} SystemId 
     * @param {Integer} Flags 
     * @param {PWSTR} ExeName 
     * @param {Integer} ExeNameSize 
     * @param {Pointer<Integer>} ActualExeNameSize 
     * @param {PWSTR} Description 
     * @param {Integer} DescriptionSize 
     * @param {Pointer<Integer>} ActualDescriptionSize 
     * @returns {HRESULT} 
     */
    GetRunningProcessDescriptionWide(Server, SystemId, Flags, ExeName, ExeNameSize, ActualExeNameSize, Description, DescriptionSize, ActualDescriptionSize) {
        ExeName := ExeName is String ? StrPtr(ExeName) : ExeName
        Description := Description is String ? StrPtr(Description) : Description

        ActualExeNameSizeMarshal := ActualExeNameSize is VarRef ? "uint*" : "ptr"
        ActualDescriptionSizeMarshal := ActualDescriptionSize is VarRef ? "uint*" : "ptr"

        result := ComCall(57, this, "uint", Server, "uint", SystemId, "uint", Flags, "ptr", ExeName, "uint", ExeNameSize, ActualExeNameSizeMarshal, ActualExeNameSize, "ptr", Description, "uint", DescriptionSize, ActualDescriptionSizeMarshal, ActualDescriptionSize, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} Server 
     * @param {PWSTR} CommandLine 
     * @param {Integer} CreateFlags 
     * @returns {HRESULT} 
     */
    CreateProcessWide(Server, CommandLine, CreateFlags) {
        CommandLine := CommandLine is String ? StrPtr(CommandLine) : CommandLine

        result := ComCall(58, this, "uint", Server, "ptr", CommandLine, "uint", CreateFlags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} Server 
     * @param {PWSTR} CommandLine 
     * @param {Integer} CreateFlags 
     * @param {Integer} ProcessId 
     * @param {Integer} AttachFlags 
     * @returns {HRESULT} 
     */
    CreateProcessAndAttachWide(Server, CommandLine, CreateFlags, ProcessId, AttachFlags) {
        CommandLine := CommandLine is String ? StrPtr(CommandLine) : CommandLine

        result := ComCall(59, this, "uint", Server, "ptr", CommandLine, "uint", CreateFlags, "uint", ProcessId, "uint", AttachFlags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PWSTR} FileName 
     * @param {Integer} FileHandle 
     * @returns {HRESULT} 
     */
    OpenDumpFileWide(FileName, FileHandle) {
        FileName := FileName is String ? StrPtr(FileName) : FileName

        result := ComCall(60, this, "ptr", FileName, "uint", FileHandle, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PWSTR} FileName 
     * @param {Integer} FileHandle 
     * @param {Integer} Qualifier 
     * @param {Integer} FormatFlags 
     * @param {PWSTR} Comment 
     * @returns {HRESULT} 
     */
    WriteDumpFileWide(FileName, FileHandle, Qualifier, FormatFlags, Comment) {
        FileName := FileName is String ? StrPtr(FileName) : FileName
        Comment := Comment is String ? StrPtr(Comment) : Comment

        result := ComCall(61, this, "ptr", FileName, "uint", FileHandle, "uint", Qualifier, "uint", FormatFlags, "ptr", Comment, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PWSTR} FileName 
     * @param {Integer} FileHandle 
     * @param {Integer} Type 
     * @returns {HRESULT} 
     */
    AddDumpInformationFileWide(FileName, FileHandle, Type) {
        FileName := FileName is String ? StrPtr(FileName) : FileName

        result := ComCall(62, this, "ptr", FileName, "uint", FileHandle, "uint", Type, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetNumberDumpFiles() {
        result := ComCall(63, this, "uint*", &Number_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Number_
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {PSTR} Buffer_ 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} NameSize 
     * @param {Pointer<Integer>} Handle_ 
     * @param {Pointer<Integer>} Type 
     * @returns {HRESULT} 
     */
    GetDumpFile(Index, Buffer_, BufferSize, NameSize, Handle_, Type) {
        Buffer_ := Buffer_ is String ? StrPtr(Buffer_) : Buffer_

        NameSizeMarshal := NameSize is VarRef ? "uint*" : "ptr"
        Handle_Marshal := Handle_ is VarRef ? "uint*" : "ptr"
        TypeMarshal := Type is VarRef ? "uint*" : "ptr"

        result := ComCall(64, this, "uint", Index, "ptr", Buffer_, "uint", BufferSize, NameSizeMarshal, NameSize, Handle_Marshal, Handle_, TypeMarshal, Type, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {PWSTR} Buffer_ 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} NameSize 
     * @param {Pointer<Integer>} Handle_ 
     * @param {Pointer<Integer>} Type 
     * @returns {HRESULT} 
     */
    GetDumpFileWide(Index, Buffer_, BufferSize, NameSize, Handle_, Type) {
        Buffer_ := Buffer_ is String ? StrPtr(Buffer_) : Buffer_

        NameSizeMarshal := NameSize is VarRef ? "uint*" : "ptr"
        Handle_Marshal := Handle_ is VarRef ? "uint*" : "ptr"
        TypeMarshal := Type is VarRef ? "uint*" : "ptr"

        result := ComCall(65, this, "uint", Index, "ptr", Buffer_, "uint", BufferSize, NameSizeMarshal, NameSize, Handle_Marshal, Handle_, TypeMarshal, Type, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @param {PWSTR} ConnectOptions 
     * @returns {HRESULT} 
     */
    AttachKernelWide(Flags, ConnectOptions) {
        ConnectOptions := ConnectOptions is String ? StrPtr(ConnectOptions) : ConnectOptions

        result := ComCall(66, this, "uint", Flags, "ptr", ConnectOptions, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PWSTR} Buffer_ 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetKernelConnectionOptionsWide(Buffer_, BufferSize) {
        Buffer_ := Buffer_ is String ? StrPtr(Buffer_) : Buffer_

        result := ComCall(67, this, "ptr", Buffer_, "uint", BufferSize, "uint*", &OptionsSize := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return OptionsSize
    }

    /**
     * 
     * @param {PWSTR} Options 
     * @returns {HRESULT} 
     */
    SetKernelConnectionOptionsWide(Options) {
        Options := Options is String ? StrPtr(Options) : Options

        result := ComCall(68, this, "ptr", Options, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @param {PWSTR} Options 
     * @returns {HRESULT} 
     */
    StartProcessServerWide(Flags, Options) {
        static Reserved := 0 ;Reserved parameters must always be NULL

        Options := Options is String ? StrPtr(Options) : Options

        result := ComCall(69, this, "uint", Flags, "ptr", Options, "ptr", Reserved, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PWSTR} RemoteOptions 
     * @returns {Integer} 
     */
    ConnectProcessServerWide(RemoteOptions) {
        RemoteOptions := RemoteOptions is String ? StrPtr(RemoteOptions) : RemoteOptions

        result := ComCall(70, this, "ptr", RemoteOptions, "uint*", &Server := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Server
    }

    /**
     * 
     * @param {PWSTR} Options 
     * @returns {HRESULT} 
     */
    StartServerWide(Options) {
        Options := Options is String ? StrPtr(Options) : Options

        result := ComCall(71, this, "ptr", Options, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} OutputControl 
     * @param {PWSTR} Machine 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     */
    OutputServersWide(OutputControl, Machine, Flags) {
        Machine := Machine is String ? StrPtr(Machine) : Machine

        result := ComCall(72, this, "uint", OutputControl, "ptr", Machine, "uint", Flags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IDebugOutputCallbacksWide} 
     */
    GetOutputCallbacksWide() {
        result := ComCall(73, this, "ptr*", &Callbacks := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDebugOutputCallbacksWide(Callbacks)
    }

    /**
     * 
     * @param {IDebugOutputCallbacksWide} Callbacks 
     * @returns {HRESULT} 
     */
    SetOutputCallbacksWide(Callbacks) {
        result := ComCall(74, this, "ptr", Callbacks, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PWSTR} Buffer_ 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetOutputLinePrefixWide(Buffer_, BufferSize) {
        Buffer_ := Buffer_ is String ? StrPtr(Buffer_) : Buffer_

        result := ComCall(75, this, "ptr", Buffer_, "uint", BufferSize, "uint*", &PrefixSize := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PrefixSize
    }

    /**
     * 
     * @param {PWSTR} Prefix 
     * @returns {HRESULT} 
     */
    SetOutputLinePrefixWide(Prefix) {
        Prefix := Prefix is String ? StrPtr(Prefix) : Prefix

        result := ComCall(76, this, "ptr", Prefix, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PWSTR} Buffer_ 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetIdentityWide(Buffer_, BufferSize) {
        Buffer_ := Buffer_ is String ? StrPtr(Buffer_) : Buffer_

        result := ComCall(77, this, "ptr", Buffer_, "uint", BufferSize, "uint*", &IdentitySize := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IdentitySize
    }

    /**
     * 
     * @param {Integer} OutputControl 
     * @param {Integer} Flags 
     * @param {PWSTR} Format 
     * @returns {HRESULT} 
     */
    OutputIdentityWide(OutputControl, Flags, Format) {
        Format := Format is String ? StrPtr(Format) : Format

        result := ComCall(78, this, "uint", OutputControl, "uint", Flags, "ptr", Format, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IDebugEventCallbacksWide} 
     */
    GetEventCallbacksWide() {
        result := ComCall(79, this, "ptr*", &Callbacks := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDebugEventCallbacksWide(Callbacks)
    }

    /**
     * 
     * @param {IDebugEventCallbacksWide} Callbacks 
     * @returns {HRESULT} 
     */
    SetEventCallbacksWide(Callbacks) {
        result := ComCall(80, this, "ptr", Callbacks, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} Server 
     * @param {PSTR} CommandLine 
     * @param {Pointer} OptionsBuffer 
     * @param {Integer} OptionsBufferSize 
     * @param {PSTR} InitialDirectory 
     * @param {PSTR} Environment 
     * @returns {HRESULT} 
     */
    CreateProcess2(Server, CommandLine, OptionsBuffer, OptionsBufferSize, InitialDirectory, Environment) {
        CommandLine := CommandLine is String ? StrPtr(CommandLine) : CommandLine
        InitialDirectory := InitialDirectory is String ? StrPtr(InitialDirectory) : InitialDirectory
        Environment := Environment is String ? StrPtr(Environment) : Environment

        result := ComCall(81, this, "uint", Server, "ptr", CommandLine, "ptr", OptionsBuffer, "uint", OptionsBufferSize, "ptr", InitialDirectory, "ptr", Environment, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} Server 
     * @param {PWSTR} CommandLine 
     * @param {Pointer} OptionsBuffer 
     * @param {Integer} OptionsBufferSize 
     * @param {PWSTR} InitialDirectory 
     * @param {PWSTR} Environment 
     * @returns {HRESULT} 
     */
    CreateProcess2Wide(Server, CommandLine, OptionsBuffer, OptionsBufferSize, InitialDirectory, Environment) {
        CommandLine := CommandLine is String ? StrPtr(CommandLine) : CommandLine
        InitialDirectory := InitialDirectory is String ? StrPtr(InitialDirectory) : InitialDirectory
        Environment := Environment is String ? StrPtr(Environment) : Environment

        result := ComCall(82, this, "uint", Server, "ptr", CommandLine, "ptr", OptionsBuffer, "uint", OptionsBufferSize, "ptr", InitialDirectory, "ptr", Environment, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} Server 
     * @param {PSTR} CommandLine 
     * @param {Pointer} OptionsBuffer 
     * @param {Integer} OptionsBufferSize 
     * @param {PSTR} InitialDirectory 
     * @param {PSTR} Environment 
     * @param {Integer} ProcessId 
     * @param {Integer} AttachFlags 
     * @returns {HRESULT} 
     */
    CreateProcessAndAttach2(Server, CommandLine, OptionsBuffer, OptionsBufferSize, InitialDirectory, Environment, ProcessId, AttachFlags) {
        CommandLine := CommandLine is String ? StrPtr(CommandLine) : CommandLine
        InitialDirectory := InitialDirectory is String ? StrPtr(InitialDirectory) : InitialDirectory
        Environment := Environment is String ? StrPtr(Environment) : Environment

        result := ComCall(83, this, "uint", Server, "ptr", CommandLine, "ptr", OptionsBuffer, "uint", OptionsBufferSize, "ptr", InitialDirectory, "ptr", Environment, "uint", ProcessId, "uint", AttachFlags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} Server 
     * @param {PWSTR} CommandLine 
     * @param {Pointer} OptionsBuffer 
     * @param {Integer} OptionsBufferSize 
     * @param {PWSTR} InitialDirectory 
     * @param {PWSTR} Environment 
     * @param {Integer} ProcessId 
     * @param {Integer} AttachFlags 
     * @returns {HRESULT} 
     */
    CreateProcessAndAttach2Wide(Server, CommandLine, OptionsBuffer, OptionsBufferSize, InitialDirectory, Environment, ProcessId, AttachFlags) {
        CommandLine := CommandLine is String ? StrPtr(CommandLine) : CommandLine
        InitialDirectory := InitialDirectory is String ? StrPtr(InitialDirectory) : InitialDirectory
        Environment := Environment is String ? StrPtr(Environment) : Environment

        result := ComCall(84, this, "uint", Server, "ptr", CommandLine, "ptr", OptionsBuffer, "uint", OptionsBufferSize, "ptr", InitialDirectory, "ptr", Environment, "uint", ProcessId, "uint", AttachFlags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PSTR} NewPrefix 
     * @returns {Integer} 
     */
    PushOutputLinePrefix(NewPrefix) {
        NewPrefix := NewPrefix is String ? StrPtr(NewPrefix) : NewPrefix

        result := ComCall(85, this, "ptr", NewPrefix, "uint*", &Handle_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Handle_
    }

    /**
     * 
     * @param {PWSTR} NewPrefix 
     * @returns {Integer} 
     */
    PushOutputLinePrefixWide(NewPrefix) {
        NewPrefix := NewPrefix is String ? StrPtr(NewPrefix) : NewPrefix

        result := ComCall(86, this, "ptr", NewPrefix, "uint*", &Handle_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Handle_
    }

    /**
     * 
     * @param {Integer} Handle_ 
     * @returns {HRESULT} 
     */
    PopOutputLinePrefix(Handle_) {
        result := ComCall(87, this, "uint", Handle_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetNumberInputCallbacks() {
        result := ComCall(88, this, "uint*", &Count := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Count
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetNumberOutputCallbacks() {
        result := ComCall(89, this, "uint*", &Count := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Count
    }

    /**
     * 
     * @param {Integer} EventFlags 
     * @returns {Integer} 
     */
    GetNumberEventCallbacks(EventFlags) {
        result := ComCall(90, this, "uint", EventFlags, "uint*", &Count := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Count
    }

    /**
     * 
     * @param {PSTR} Buffer_ 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetQuitLockString(Buffer_, BufferSize) {
        Buffer_ := Buffer_ is String ? StrPtr(Buffer_) : Buffer_

        result := ComCall(91, this, "ptr", Buffer_, "uint", BufferSize, "uint*", &StringSize := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StringSize
    }

    /**
     * 
     * @param {PSTR} String_ 
     * @returns {HRESULT} 
     */
    SetQuitLockString(String_) {
        String_ := String_ is String ? StrPtr(String_) : String_

        result := ComCall(92, this, "ptr", String_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PWSTR} Buffer_ 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetQuitLockStringWide(Buffer_, BufferSize) {
        Buffer_ := Buffer_ is String ? StrPtr(Buffer_) : Buffer_

        result := ComCall(93, this, "ptr", Buffer_, "uint", BufferSize, "uint*", &StringSize := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StringSize
    }

    /**
     * 
     * @param {PWSTR} String_ 
     * @returns {HRESULT} 
     */
    SetQuitLockStringWide(String_) {
        String_ := String_ is String ? StrPtr(String_) : String_

        result := ComCall(94, this, "ptr", String_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IDebugEventContextCallbacks} Callbacks 
     * @returns {HRESULT} 
     */
    SetEventContextCallbacks(Callbacks) {
        result := ComCall(95, this, "ptr", Callbacks, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer} Context_ 
     * @param {Integer} ContextSize 
     * @returns {HRESULT} 
     */
    SetClientContext(Context_, ContextSize) {
        result := ComCall(96, this, "ptr", Context_, "uint", ContextSize, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PWSTR} FileName 
     * @param {Integer} FileHandle 
     * @param {Integer} AlternateArch 
     * @returns {HRESULT} 
     */
    OpenDumpFileWide2(FileName, FileHandle, AlternateArch) {
        FileName := FileName is String ? StrPtr(FileName) : FileName

        result := ComCall(97, this, "ptr", FileName, "uint", FileHandle, "uint", AlternateArch, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PWSTR} DirName 
     * @param {Integer} AlternateArch 
     * @returns {HRESULT} 
     */
    OpenDumpDirectoryWide(DirName, AlternateArch) {
        DirName := DirName is String ? StrPtr(DirName) : DirName

        result := ComCall(98, this, "ptr", DirName, "uint", AlternateArch, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PSTR} DumpDir 
     * @param {Integer} AlternativeArch 
     * @returns {HRESULT} 
     */
    OpenDumpDirectory(DumpDir, AlternativeArch) {
        DumpDir := DumpDir is String ? StrPtr(DumpDir) : DumpDir

        result := ComCall(99, this, "ptr", DumpDir, "uint", AlternativeArch, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
