#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDebugClient.ahk" { IDebugClient }
#Import ".\IDebugOutputCallbacks.ahk" { IDebugOutputCallbacks }
#Import ".\IDebugEventCallbacks.ahk" { IDebugEventCallbacks }
#Import ".\IDebugEventContextCallbacks.ahk" { IDebugEventContextCallbacks }
#Import ".\IDebugInputCallbacks.ahk" { IDebugInputCallbacks }
#Import "..\..\..\..\Foundation\PSTR.ahk" { PSTR }
#Import "..\..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IDebugEventCallbacksWide.ahk" { IDebugEventCallbacksWide }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }
#Import ".\IDebugOutputCallbacksWide.ahk" { IDebugOutputCallbacksWide }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IDebugClient9 extends IUnknown {
    /**
     * The interface identifier for IDebugClient9
     * @type {Guid}
     */
    static IID := Guid("{2c24cd5b-4d9e-4df4-8a70-3d37440d119f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugClient9 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AttachKernel                                  : IntPtr
        GetKernelConnectionOptions                    : IntPtr
        SetKernelConnectionOptions                    : IntPtr
        StartProcessServer                            : IntPtr
        ConnectProcessServer                          : IntPtr
        DisconnectProcessServer                       : IntPtr
        GetRunningProcessSystemIds                    : IntPtr
        GetRunningProcessSystemIdByExecutableName     : IntPtr
        GetRunningProcessDescription                  : IntPtr
        AttachProcess                                 : IntPtr
        CreateProcessA                                : IntPtr
        CreateProcessAndAttach                        : IntPtr
        GetProcessOptions                             : IntPtr
        AddProcessOptions                             : IntPtr
        RemoveProcessOptions                          : IntPtr
        SetProcessOptions                             : IntPtr
        OpenDumpFile                                  : IntPtr
        WriteDumpFile                                 : IntPtr
        ConnectSession                                : IntPtr
        StartServer                                   : IntPtr
        OutputServers                                 : IntPtr
        TerminateProcesses                            : IntPtr
        DetachProcesses                               : IntPtr
        EndSession                                    : IntPtr
        GetExitCode                                   : IntPtr
        DispatchCallbacks                             : IntPtr
        ExitDispatch                                  : IntPtr
        CreateClient                                  : IntPtr
        GetInputCallbacks                             : IntPtr
        SetInputCallbacks                             : IntPtr
        GetOutputCallbacks                            : IntPtr
        SetOutputCallbacks                            : IntPtr
        GetOutputMask                                 : IntPtr
        SetOutputMask                                 : IntPtr
        GetOtherOutputMask                            : IntPtr
        SetOtherOutputMask                            : IntPtr
        GetOutputWidth                                : IntPtr
        SetOutputWidth                                : IntPtr
        GetOutputLinePrefix                           : IntPtr
        SetOutputLinePrefix                           : IntPtr
        GetIdentity                                   : IntPtr
        OutputIdentity                                : IntPtr
        GetEventCallbacks                             : IntPtr
        SetEventCallbacks                             : IntPtr
        FlushCallbacks                                : IntPtr
        WriteDumpFile2                                : IntPtr
        AddDumpInformationFile                        : IntPtr
        EndProcessServer                              : IntPtr
        WaitForProcessServerEnd                       : IntPtr
        IsKernelDebuggerEnabled                       : IntPtr
        TerminateCurrentProcess                       : IntPtr
        DetachCurrentProcess                          : IntPtr
        AbandonCurrentProcess                         : IntPtr
        GetRunningProcessSystemIdByExecutableNameWide : IntPtr
        GetRunningProcessDescriptionWide              : IntPtr
        CreateProcessWide                             : IntPtr
        CreateProcessAndAttachWide                    : IntPtr
        OpenDumpFileWide                              : IntPtr
        WriteDumpFileWide                             : IntPtr
        AddDumpInformationFileWide                    : IntPtr
        GetNumberDumpFiles                            : IntPtr
        GetDumpFile                                   : IntPtr
        GetDumpFileWide                               : IntPtr
        AttachKernelWide                              : IntPtr
        GetKernelConnectionOptionsWide                : IntPtr
        SetKernelConnectionOptionsWide                : IntPtr
        StartProcessServerWide                        : IntPtr
        ConnectProcessServerWide                      : IntPtr
        StartServerWide                               : IntPtr
        OutputServersWide                             : IntPtr
        GetOutputCallbacksWide                        : IntPtr
        SetOutputCallbacksWide                        : IntPtr
        GetOutputLinePrefixWide                       : IntPtr
        SetOutputLinePrefixWide                       : IntPtr
        GetIdentityWide                               : IntPtr
        OutputIdentityWide                            : IntPtr
        GetEventCallbacksWide                         : IntPtr
        SetEventCallbacksWide                         : IntPtr
        CreateProcess2                                : IntPtr
        CreateProcess2Wide                            : IntPtr
        CreateProcessAndAttach2                       : IntPtr
        CreateProcessAndAttach2Wide                   : IntPtr
        PushOutputLinePrefix                          : IntPtr
        PushOutputLinePrefixWide                      : IntPtr
        PopOutputLinePrefix                           : IntPtr
        GetNumberInputCallbacks                       : IntPtr
        GetNumberOutputCallbacks                      : IntPtr
        GetNumberEventCallbacks                       : IntPtr
        GetQuitLockString                             : IntPtr
        SetQuitLockString                             : IntPtr
        GetQuitLockStringWide                         : IntPtr
        SetQuitLockStringWide                         : IntPtr
        SetEventContextCallbacks                      : IntPtr
        SetClientContext                              : IntPtr
        OpenDumpFileWide2                             : IntPtr
        OpenDumpDirectoryWide                         : IntPtr
        OpenDumpDirectory                             : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugClient9.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} Flags 
     * @param {PSTR} ConnectOptions 
     * @returns {HRESULT} 
     */
    AttachKernel(Flags, ConnectOptions) {
        ConnectOptions := ConnectOptions is String ? StrPtr(ConnectOptions) : ConnectOptions

        result := ComCall(3, this, "uint", Flags, "ptr", ConnectOptions, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} _Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetKernelConnectionOptions(_Buffer, BufferSize) {
        _Buffer := _Buffer is String ? StrPtr(_Buffer) : _Buffer

        result := ComCall(4, this, "ptr", _Buffer, "uint", BufferSize, "uint*", &OptionsSize := 0, "HRESULT")
        return OptionsSize
    }

    /**
     * 
     * @param {PSTR} Options 
     * @returns {HRESULT} 
     */
    SetKernelConnectionOptions(Options) {
        Options := Options is String ? StrPtr(Options) : Options

        result := ComCall(5, this, "ptr", Options, "HRESULT")
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

        result := ComCall(6, this, "uint", Flags, "ptr", Options, "ptr", Reserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} RemoteOptions 
     * @returns {Integer} 
     */
    ConnectProcessServer(RemoteOptions) {
        RemoteOptions := RemoteOptions is String ? StrPtr(RemoteOptions) : RemoteOptions

        result := ComCall(7, this, "ptr", RemoteOptions, "uint*", &Server := 0, "HRESULT")
        return Server
    }

    /**
     * 
     * @param {Integer} Server 
     * @returns {HRESULT} 
     */
    DisconnectProcessServer(Server) {
        result := ComCall(8, this, "uint", Server, "HRESULT")
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

        result := ComCall(9, this, "uint", Server, IdsMarshal, Ids, "uint", Count, ActualCountMarshal, ActualCount, "HRESULT")
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

        result := ComCall(10, this, "uint", Server, "ptr", ExeName, "uint", Flags, "uint*", &Id := 0, "HRESULT")
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

        result := ComCall(11, this, "uint", Server, "uint", SystemId, "uint", Flags, "ptr", ExeName, "uint", ExeNameSize, ActualExeNameSizeMarshal, ActualExeNameSize, "ptr", Description, "uint", DescriptionSize, ActualDescriptionSizeMarshal, ActualDescriptionSize, "HRESULT")
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
        result := ComCall(12, this, "uint", Server, "uint", ProcessId, "uint", AttachFlags, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-createprocessa
     */
    CreateProcessA(Server, CommandLine, CreateFlags) {
        CommandLine := CommandLine is String ? StrPtr(CommandLine) : CommandLine

        result := ComCall(13, this, "uint", Server, "ptr", CommandLine, "uint", CreateFlags, "HRESULT")
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

        result := ComCall(14, this, "uint", Server, "ptr", CommandLine, "uint", CreateFlags, "uint", ProcessId, "uint", AttachFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetProcessOptions() {
        result := ComCall(15, this, "uint*", &Options := 0, "HRESULT")
        return Options
    }

    /**
     * 
     * @param {Integer} Options 
     * @returns {HRESULT} 
     */
    AddProcessOptions(Options) {
        result := ComCall(16, this, "uint", Options, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Options 
     * @returns {HRESULT} 
     */
    RemoveProcessOptions(Options) {
        result := ComCall(17, this, "uint", Options, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Options 
     * @returns {HRESULT} 
     */
    SetProcessOptions(Options) {
        result := ComCall(18, this, "uint", Options, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} DumpFile 
     * @returns {HRESULT} 
     */
    OpenDumpFile(DumpFile) {
        DumpFile := DumpFile is String ? StrPtr(DumpFile) : DumpFile

        result := ComCall(19, this, "ptr", DumpFile, "HRESULT")
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

        result := ComCall(20, this, "ptr", DumpFile, "uint", Qualifier, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @param {Integer} HistoryLimit 
     * @returns {HRESULT} 
     */
    ConnectSession(Flags, HistoryLimit) {
        result := ComCall(21, this, "uint", Flags, "uint", HistoryLimit, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} Options 
     * @returns {HRESULT} 
     */
    StartServer(Options) {
        Options := Options is String ? StrPtr(Options) : Options

        result := ComCall(22, this, "ptr", Options, "HRESULT")
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

        result := ComCall(23, this, "uint", OutputControl, "ptr", Machine, "uint", Flags, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    TerminateProcesses() {
        result := ComCall(24, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    DetachProcesses() {
        result := ComCall(25, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     */
    EndSession(Flags) {
        result := ComCall(26, this, "uint", Flags, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetExitCode() {
        result := ComCall(27, this, "uint*", &Code := 0, "HRESULT")
        return Code
    }

    /**
     * 
     * @param {Integer} Timeout 
     * @returns {HRESULT} 
     */
    DispatchCallbacks(Timeout) {
        result := ComCall(28, this, "uint", Timeout, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDebugClient} Client 
     * @returns {HRESULT} 
     */
    ExitDispatch(Client) {
        result := ComCall(29, this, "ptr", Client, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IDebugClient} 
     */
    CreateClient() {
        result := ComCall(30, this, "ptr*", &Client := 0, "HRESULT")
        return IDebugClient(Client)
    }

    /**
     * 
     * @returns {IDebugInputCallbacks} 
     */
    GetInputCallbacks() {
        result := ComCall(31, this, "ptr*", &Callbacks := 0, "HRESULT")
        return IDebugInputCallbacks(Callbacks)
    }

    /**
     * 
     * @param {IDebugInputCallbacks} Callbacks 
     * @returns {HRESULT} 
     */
    SetInputCallbacks(Callbacks) {
        result := ComCall(32, this, "ptr", Callbacks, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IDebugOutputCallbacks} 
     */
    GetOutputCallbacks() {
        result := ComCall(33, this, "ptr*", &Callbacks := 0, "HRESULT")
        return IDebugOutputCallbacks(Callbacks)
    }

    /**
     * 
     * @param {IDebugOutputCallbacks} Callbacks 
     * @returns {HRESULT} 
     */
    SetOutputCallbacks(Callbacks) {
        result := ComCall(34, this, "ptr", Callbacks, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetOutputMask() {
        result := ComCall(35, this, "uint*", &Mask := 0, "HRESULT")
        return Mask
    }

    /**
     * 
     * @param {Integer} Mask 
     * @returns {HRESULT} 
     */
    SetOutputMask(Mask) {
        result := ComCall(36, this, "uint", Mask, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDebugClient} Client 
     * @returns {Integer} 
     */
    GetOtherOutputMask(Client) {
        result := ComCall(37, this, "ptr", Client, "uint*", &Mask := 0, "HRESULT")
        return Mask
    }

    /**
     * 
     * @param {IDebugClient} Client 
     * @param {Integer} Mask 
     * @returns {HRESULT} 
     */
    SetOtherOutputMask(Client, Mask) {
        result := ComCall(38, this, "ptr", Client, "uint", Mask, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetOutputWidth() {
        result := ComCall(39, this, "uint*", &_Columns := 0, "HRESULT")
        return _Columns
    }

    /**
     * 
     * @param {Integer} _Columns 
     * @returns {HRESULT} 
     */
    SetOutputWidth(_Columns) {
        result := ComCall(40, this, "uint", _Columns, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} _Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetOutputLinePrefix(_Buffer, BufferSize) {
        _Buffer := _Buffer is String ? StrPtr(_Buffer) : _Buffer

        result := ComCall(41, this, "ptr", _Buffer, "uint", BufferSize, "uint*", &PrefixSize := 0, "HRESULT")
        return PrefixSize
    }

    /**
     * 
     * @param {PSTR} Prefix 
     * @returns {HRESULT} 
     */
    SetOutputLinePrefix(Prefix) {
        Prefix := Prefix is String ? StrPtr(Prefix) : Prefix

        result := ComCall(42, this, "ptr", Prefix, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} _Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetIdentity(_Buffer, BufferSize) {
        _Buffer := _Buffer is String ? StrPtr(_Buffer) : _Buffer

        result := ComCall(43, this, "ptr", _Buffer, "uint", BufferSize, "uint*", &IdentitySize := 0, "HRESULT")
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

        result := ComCall(44, this, "uint", OutputControl, "uint", Flags, "ptr", Format, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IDebugEventCallbacks} 
     */
    GetEventCallbacks() {
        result := ComCall(45, this, "ptr*", &Callbacks := 0, "HRESULT")
        return IDebugEventCallbacks(Callbacks)
    }

    /**
     * 
     * @param {IDebugEventCallbacks} Callbacks 
     * @returns {HRESULT} 
     */
    SetEventCallbacks(Callbacks) {
        result := ComCall(46, this, "ptr", Callbacks, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    FlushCallbacks() {
        result := ComCall(47, this, "HRESULT")
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

        result := ComCall(48, this, "ptr", DumpFile, "uint", Qualifier, "uint", FormatFlags, "ptr", Comment, "HRESULT")
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

        result := ComCall(49, this, "ptr", InfoFile, "uint", Type, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Server 
     * @returns {HRESULT} 
     */
    EndProcessServer(Server) {
        result := ComCall(50, this, "uint", Server, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Timeout 
     * @returns {HRESULT} 
     */
    WaitForProcessServerEnd(Timeout) {
        result := ComCall(51, this, "uint", Timeout, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    IsKernelDebuggerEnabled() {
        result := ComCall(52, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    TerminateCurrentProcess() {
        result := ComCall(53, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    DetachCurrentProcess() {
        result := ComCall(54, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    AbandonCurrentProcess() {
        result := ComCall(55, this, "HRESULT")
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

        result := ComCall(56, this, "uint", Server, "ptr", ExeName, "uint", Flags, "uint*", &Id := 0, "HRESULT")
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

        result := ComCall(57, this, "uint", Server, "uint", SystemId, "uint", Flags, "ptr", ExeName, "uint", ExeNameSize, ActualExeNameSizeMarshal, ActualExeNameSize, "ptr", Description, "uint", DescriptionSize, ActualDescriptionSizeMarshal, ActualDescriptionSize, "HRESULT")
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

        result := ComCall(58, this, "uint", Server, "ptr", CommandLine, "uint", CreateFlags, "HRESULT")
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

        result := ComCall(59, this, "uint", Server, "ptr", CommandLine, "uint", CreateFlags, "uint", ProcessId, "uint", AttachFlags, "HRESULT")
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

        result := ComCall(60, this, "ptr", FileName, "uint", FileHandle, "HRESULT")
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

        result := ComCall(61, this, "ptr", FileName, "uint", FileHandle, "uint", Qualifier, "uint", FormatFlags, "ptr", Comment, "HRESULT")
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

        result := ComCall(62, this, "ptr", FileName, "uint", FileHandle, "uint", Type, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetNumberDumpFiles() {
        result := ComCall(63, this, "uint*", &_Number := 0, "HRESULT")
        return _Number
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {PSTR} _Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} NameSize 
     * @param {Pointer<Integer>} _Handle 
     * @param {Pointer<Integer>} Type 
     * @returns {HRESULT} 
     */
    GetDumpFile(Index, _Buffer, BufferSize, NameSize, _Handle, Type) {
        _Buffer := _Buffer is String ? StrPtr(_Buffer) : _Buffer

        NameSizeMarshal := NameSize is VarRef ? "uint*" : "ptr"
        _HandleMarshal := _Handle is VarRef ? "uint*" : "ptr"
        TypeMarshal := Type is VarRef ? "uint*" : "ptr"

        result := ComCall(64, this, "uint", Index, "ptr", _Buffer, "uint", BufferSize, NameSizeMarshal, NameSize, _HandleMarshal, _Handle, TypeMarshal, Type, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {PWSTR} _Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} NameSize 
     * @param {Pointer<Integer>} _Handle 
     * @param {Pointer<Integer>} Type 
     * @returns {HRESULT} 
     */
    GetDumpFileWide(Index, _Buffer, BufferSize, NameSize, _Handle, Type) {
        _Buffer := _Buffer is String ? StrPtr(_Buffer) : _Buffer

        NameSizeMarshal := NameSize is VarRef ? "uint*" : "ptr"
        _HandleMarshal := _Handle is VarRef ? "uint*" : "ptr"
        TypeMarshal := Type is VarRef ? "uint*" : "ptr"

        result := ComCall(65, this, "uint", Index, "ptr", _Buffer, "uint", BufferSize, NameSizeMarshal, NameSize, _HandleMarshal, _Handle, TypeMarshal, Type, "HRESULT")
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

        result := ComCall(66, this, "uint", Flags, "ptr", ConnectOptions, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} _Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetKernelConnectionOptionsWide(_Buffer, BufferSize) {
        _Buffer := _Buffer is String ? StrPtr(_Buffer) : _Buffer

        result := ComCall(67, this, "ptr", _Buffer, "uint", BufferSize, "uint*", &OptionsSize := 0, "HRESULT")
        return OptionsSize
    }

    /**
     * 
     * @param {PWSTR} Options 
     * @returns {HRESULT} 
     */
    SetKernelConnectionOptionsWide(Options) {
        Options := Options is String ? StrPtr(Options) : Options

        result := ComCall(68, this, "ptr", Options, "HRESULT")
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

        result := ComCall(69, this, "uint", Flags, "ptr", Options, "ptr", Reserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} RemoteOptions 
     * @returns {Integer} 
     */
    ConnectProcessServerWide(RemoteOptions) {
        RemoteOptions := RemoteOptions is String ? StrPtr(RemoteOptions) : RemoteOptions

        result := ComCall(70, this, "ptr", RemoteOptions, "uint*", &Server := 0, "HRESULT")
        return Server
    }

    /**
     * 
     * @param {PWSTR} Options 
     * @returns {HRESULT} 
     */
    StartServerWide(Options) {
        Options := Options is String ? StrPtr(Options) : Options

        result := ComCall(71, this, "ptr", Options, "HRESULT")
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

        result := ComCall(72, this, "uint", OutputControl, "ptr", Machine, "uint", Flags, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IDebugOutputCallbacksWide} 
     */
    GetOutputCallbacksWide() {
        result := ComCall(73, this, "ptr*", &Callbacks := 0, "HRESULT")
        return IDebugOutputCallbacksWide(Callbacks)
    }

    /**
     * 
     * @param {IDebugOutputCallbacksWide} Callbacks 
     * @returns {HRESULT} 
     */
    SetOutputCallbacksWide(Callbacks) {
        result := ComCall(74, this, "ptr", Callbacks, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} _Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetOutputLinePrefixWide(_Buffer, BufferSize) {
        _Buffer := _Buffer is String ? StrPtr(_Buffer) : _Buffer

        result := ComCall(75, this, "ptr", _Buffer, "uint", BufferSize, "uint*", &PrefixSize := 0, "HRESULT")
        return PrefixSize
    }

    /**
     * 
     * @param {PWSTR} Prefix 
     * @returns {HRESULT} 
     */
    SetOutputLinePrefixWide(Prefix) {
        Prefix := Prefix is String ? StrPtr(Prefix) : Prefix

        result := ComCall(76, this, "ptr", Prefix, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} _Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetIdentityWide(_Buffer, BufferSize) {
        _Buffer := _Buffer is String ? StrPtr(_Buffer) : _Buffer

        result := ComCall(77, this, "ptr", _Buffer, "uint", BufferSize, "uint*", &IdentitySize := 0, "HRESULT")
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

        result := ComCall(78, this, "uint", OutputControl, "uint", Flags, "ptr", Format, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IDebugEventCallbacksWide} 
     */
    GetEventCallbacksWide() {
        result := ComCall(79, this, "ptr*", &Callbacks := 0, "HRESULT")
        return IDebugEventCallbacksWide(Callbacks)
    }

    /**
     * 
     * @param {IDebugEventCallbacksWide} Callbacks 
     * @returns {HRESULT} 
     */
    SetEventCallbacksWide(Callbacks) {
        result := ComCall(80, this, "ptr", Callbacks, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Server 
     * @param {PSTR} CommandLine 
     * @param {Integer} OptionsBuffer 
     * @param {Integer} OptionsBufferSize 
     * @param {PSTR} InitialDirectory 
     * @param {PSTR} Environment 
     * @returns {HRESULT} 
     */
    CreateProcess2(Server, CommandLine, OptionsBuffer, OptionsBufferSize, InitialDirectory, Environment) {
        CommandLine := CommandLine is String ? StrPtr(CommandLine) : CommandLine
        InitialDirectory := InitialDirectory is String ? StrPtr(InitialDirectory) : InitialDirectory
        Environment := Environment is String ? StrPtr(Environment) : Environment

        result := ComCall(81, this, "uint", Server, "ptr", CommandLine, "ptr", OptionsBuffer, "uint", OptionsBufferSize, "ptr", InitialDirectory, "ptr", Environment, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Server 
     * @param {PWSTR} CommandLine 
     * @param {Integer} OptionsBuffer 
     * @param {Integer} OptionsBufferSize 
     * @param {PWSTR} InitialDirectory 
     * @param {PWSTR} Environment 
     * @returns {HRESULT} 
     */
    CreateProcess2Wide(Server, CommandLine, OptionsBuffer, OptionsBufferSize, InitialDirectory, Environment) {
        CommandLine := CommandLine is String ? StrPtr(CommandLine) : CommandLine
        InitialDirectory := InitialDirectory is String ? StrPtr(InitialDirectory) : InitialDirectory
        Environment := Environment is String ? StrPtr(Environment) : Environment

        result := ComCall(82, this, "uint", Server, "ptr", CommandLine, "ptr", OptionsBuffer, "uint", OptionsBufferSize, "ptr", InitialDirectory, "ptr", Environment, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Server 
     * @param {PSTR} CommandLine 
     * @param {Integer} OptionsBuffer 
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

        result := ComCall(83, this, "uint", Server, "ptr", CommandLine, "ptr", OptionsBuffer, "uint", OptionsBufferSize, "ptr", InitialDirectory, "ptr", Environment, "uint", ProcessId, "uint", AttachFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Server 
     * @param {PWSTR} CommandLine 
     * @param {Integer} OptionsBuffer 
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

        result := ComCall(84, this, "uint", Server, "ptr", CommandLine, "ptr", OptionsBuffer, "uint", OptionsBufferSize, "ptr", InitialDirectory, "ptr", Environment, "uint", ProcessId, "uint", AttachFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} NewPrefix 
     * @returns {Integer} 
     */
    PushOutputLinePrefix(NewPrefix) {
        NewPrefix := NewPrefix is String ? StrPtr(NewPrefix) : NewPrefix

        result := ComCall(85, this, "ptr", NewPrefix, "uint*", &_Handle := 0, "HRESULT")
        return _Handle
    }

    /**
     * 
     * @param {PWSTR} NewPrefix 
     * @returns {Integer} 
     */
    PushOutputLinePrefixWide(NewPrefix) {
        NewPrefix := NewPrefix is String ? StrPtr(NewPrefix) : NewPrefix

        result := ComCall(86, this, "ptr", NewPrefix, "uint*", &_Handle := 0, "HRESULT")
        return _Handle
    }

    /**
     * 
     * @param {Integer} _Handle 
     * @returns {HRESULT} 
     */
    PopOutputLinePrefix(_Handle) {
        result := ComCall(87, this, "uint", _Handle, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetNumberInputCallbacks() {
        result := ComCall(88, this, "uint*", &Count := 0, "HRESULT")
        return Count
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetNumberOutputCallbacks() {
        result := ComCall(89, this, "uint*", &Count := 0, "HRESULT")
        return Count
    }

    /**
     * 
     * @param {Integer} EventFlags 
     * @returns {Integer} 
     */
    GetNumberEventCallbacks(EventFlags) {
        result := ComCall(90, this, "uint", EventFlags, "uint*", &Count := 0, "HRESULT")
        return Count
    }

    /**
     * 
     * @param {PSTR} _Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetQuitLockString(_Buffer, BufferSize) {
        _Buffer := _Buffer is String ? StrPtr(_Buffer) : _Buffer

        result := ComCall(91, this, "ptr", _Buffer, "uint", BufferSize, "uint*", &StringSize := 0, "HRESULT")
        return StringSize
    }

    /**
     * 
     * @param {PSTR} _String 
     * @returns {HRESULT} 
     */
    SetQuitLockString(_String) {
        _String := _String is String ? StrPtr(_String) : _String

        result := ComCall(92, this, "ptr", _String, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} _Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetQuitLockStringWide(_Buffer, BufferSize) {
        _Buffer := _Buffer is String ? StrPtr(_Buffer) : _Buffer

        result := ComCall(93, this, "ptr", _Buffer, "uint", BufferSize, "uint*", &StringSize := 0, "HRESULT")
        return StringSize
    }

    /**
     * 
     * @param {PWSTR} _String 
     * @returns {HRESULT} 
     */
    SetQuitLockStringWide(_String) {
        _String := _String is String ? StrPtr(_String) : _String

        result := ComCall(94, this, "ptr", _String, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDebugEventContextCallbacks} Callbacks 
     * @returns {HRESULT} 
     */
    SetEventContextCallbacks(Callbacks) {
        result := ComCall(95, this, "ptr", Callbacks, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} _Context 
     * @param {Integer} ContextSize 
     * @returns {HRESULT} 
     */
    SetClientContext(_Context, ContextSize) {
        result := ComCall(96, this, "ptr", _Context, "uint", ContextSize, "HRESULT")
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

        result := ComCall(97, this, "ptr", FileName, "uint", FileHandle, "uint", AlternateArch, "HRESULT")
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

        result := ComCall(98, this, "ptr", DirName, "uint", AlternateArch, "HRESULT")
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

        result := ComCall(99, this, "ptr", DumpDir, "uint", AlternativeArch, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDebugClient9.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AttachKernel := CallbackCreate(GetMethod(implObj, "AttachKernel"), flags, 3)
        this.vtbl.GetKernelConnectionOptions := CallbackCreate(GetMethod(implObj, "GetKernelConnectionOptions"), flags, 4)
        this.vtbl.SetKernelConnectionOptions := CallbackCreate(GetMethod(implObj, "SetKernelConnectionOptions"), flags, 2)
        this.vtbl.StartProcessServer := CallbackCreate(GetMethod(implObj, "StartProcessServer"), flags, 4)
        this.vtbl.ConnectProcessServer := CallbackCreate(GetMethod(implObj, "ConnectProcessServer"), flags, 3)
        this.vtbl.DisconnectProcessServer := CallbackCreate(GetMethod(implObj, "DisconnectProcessServer"), flags, 2)
        this.vtbl.GetRunningProcessSystemIds := CallbackCreate(GetMethod(implObj, "GetRunningProcessSystemIds"), flags, 5)
        this.vtbl.GetRunningProcessSystemIdByExecutableName := CallbackCreate(GetMethod(implObj, "GetRunningProcessSystemIdByExecutableName"), flags, 5)
        this.vtbl.GetRunningProcessDescription := CallbackCreate(GetMethod(implObj, "GetRunningProcessDescription"), flags, 10)
        this.vtbl.AttachProcess := CallbackCreate(GetMethod(implObj, "AttachProcess"), flags, 4)
        this.vtbl.CreateProcessA := CallbackCreate(GetMethod(implObj, "CreateProcessA"), flags, 4)
        this.vtbl.CreateProcessAndAttach := CallbackCreate(GetMethod(implObj, "CreateProcessAndAttach"), flags, 6)
        this.vtbl.GetProcessOptions := CallbackCreate(GetMethod(implObj, "GetProcessOptions"), flags, 2)
        this.vtbl.AddProcessOptions := CallbackCreate(GetMethod(implObj, "AddProcessOptions"), flags, 2)
        this.vtbl.RemoveProcessOptions := CallbackCreate(GetMethod(implObj, "RemoveProcessOptions"), flags, 2)
        this.vtbl.SetProcessOptions := CallbackCreate(GetMethod(implObj, "SetProcessOptions"), flags, 2)
        this.vtbl.OpenDumpFile := CallbackCreate(GetMethod(implObj, "OpenDumpFile"), flags, 2)
        this.vtbl.WriteDumpFile := CallbackCreate(GetMethod(implObj, "WriteDumpFile"), flags, 3)
        this.vtbl.ConnectSession := CallbackCreate(GetMethod(implObj, "ConnectSession"), flags, 3)
        this.vtbl.StartServer := CallbackCreate(GetMethod(implObj, "StartServer"), flags, 2)
        this.vtbl.OutputServers := CallbackCreate(GetMethod(implObj, "OutputServers"), flags, 4)
        this.vtbl.TerminateProcesses := CallbackCreate(GetMethod(implObj, "TerminateProcesses"), flags, 1)
        this.vtbl.DetachProcesses := CallbackCreate(GetMethod(implObj, "DetachProcesses"), flags, 1)
        this.vtbl.EndSession := CallbackCreate(GetMethod(implObj, "EndSession"), flags, 2)
        this.vtbl.GetExitCode := CallbackCreate(GetMethod(implObj, "GetExitCode"), flags, 2)
        this.vtbl.DispatchCallbacks := CallbackCreate(GetMethod(implObj, "DispatchCallbacks"), flags, 2)
        this.vtbl.ExitDispatch := CallbackCreate(GetMethod(implObj, "ExitDispatch"), flags, 2)
        this.vtbl.CreateClient := CallbackCreate(GetMethod(implObj, "CreateClient"), flags, 2)
        this.vtbl.GetInputCallbacks := CallbackCreate(GetMethod(implObj, "GetInputCallbacks"), flags, 2)
        this.vtbl.SetInputCallbacks := CallbackCreate(GetMethod(implObj, "SetInputCallbacks"), flags, 2)
        this.vtbl.GetOutputCallbacks := CallbackCreate(GetMethod(implObj, "GetOutputCallbacks"), flags, 2)
        this.vtbl.SetOutputCallbacks := CallbackCreate(GetMethod(implObj, "SetOutputCallbacks"), flags, 2)
        this.vtbl.GetOutputMask := CallbackCreate(GetMethod(implObj, "GetOutputMask"), flags, 2)
        this.vtbl.SetOutputMask := CallbackCreate(GetMethod(implObj, "SetOutputMask"), flags, 2)
        this.vtbl.GetOtherOutputMask := CallbackCreate(GetMethod(implObj, "GetOtherOutputMask"), flags, 3)
        this.vtbl.SetOtherOutputMask := CallbackCreate(GetMethod(implObj, "SetOtherOutputMask"), flags, 3)
        this.vtbl.GetOutputWidth := CallbackCreate(GetMethod(implObj, "GetOutputWidth"), flags, 2)
        this.vtbl.SetOutputWidth := CallbackCreate(GetMethod(implObj, "SetOutputWidth"), flags, 2)
        this.vtbl.GetOutputLinePrefix := CallbackCreate(GetMethod(implObj, "GetOutputLinePrefix"), flags, 4)
        this.vtbl.SetOutputLinePrefix := CallbackCreate(GetMethod(implObj, "SetOutputLinePrefix"), flags, 2)
        this.vtbl.GetIdentity := CallbackCreate(GetMethod(implObj, "GetIdentity"), flags, 4)
        this.vtbl.OutputIdentity := CallbackCreate(GetMethod(implObj, "OutputIdentity"), flags, 4)
        this.vtbl.GetEventCallbacks := CallbackCreate(GetMethod(implObj, "GetEventCallbacks"), flags, 2)
        this.vtbl.SetEventCallbacks := CallbackCreate(GetMethod(implObj, "SetEventCallbacks"), flags, 2)
        this.vtbl.FlushCallbacks := CallbackCreate(GetMethod(implObj, "FlushCallbacks"), flags, 1)
        this.vtbl.WriteDumpFile2 := CallbackCreate(GetMethod(implObj, "WriteDumpFile2"), flags, 5)
        this.vtbl.AddDumpInformationFile := CallbackCreate(GetMethod(implObj, "AddDumpInformationFile"), flags, 3)
        this.vtbl.EndProcessServer := CallbackCreate(GetMethod(implObj, "EndProcessServer"), flags, 2)
        this.vtbl.WaitForProcessServerEnd := CallbackCreate(GetMethod(implObj, "WaitForProcessServerEnd"), flags, 2)
        this.vtbl.IsKernelDebuggerEnabled := CallbackCreate(GetMethod(implObj, "IsKernelDebuggerEnabled"), flags, 1)
        this.vtbl.TerminateCurrentProcess := CallbackCreate(GetMethod(implObj, "TerminateCurrentProcess"), flags, 1)
        this.vtbl.DetachCurrentProcess := CallbackCreate(GetMethod(implObj, "DetachCurrentProcess"), flags, 1)
        this.vtbl.AbandonCurrentProcess := CallbackCreate(GetMethod(implObj, "AbandonCurrentProcess"), flags, 1)
        this.vtbl.GetRunningProcessSystemIdByExecutableNameWide := CallbackCreate(GetMethod(implObj, "GetRunningProcessSystemIdByExecutableNameWide"), flags, 5)
        this.vtbl.GetRunningProcessDescriptionWide := CallbackCreate(GetMethod(implObj, "GetRunningProcessDescriptionWide"), flags, 10)
        this.vtbl.CreateProcessWide := CallbackCreate(GetMethod(implObj, "CreateProcessWide"), flags, 4)
        this.vtbl.CreateProcessAndAttachWide := CallbackCreate(GetMethod(implObj, "CreateProcessAndAttachWide"), flags, 6)
        this.vtbl.OpenDumpFileWide := CallbackCreate(GetMethod(implObj, "OpenDumpFileWide"), flags, 3)
        this.vtbl.WriteDumpFileWide := CallbackCreate(GetMethod(implObj, "WriteDumpFileWide"), flags, 6)
        this.vtbl.AddDumpInformationFileWide := CallbackCreate(GetMethod(implObj, "AddDumpInformationFileWide"), flags, 4)
        this.vtbl.GetNumberDumpFiles := CallbackCreate(GetMethod(implObj, "GetNumberDumpFiles"), flags, 2)
        this.vtbl.GetDumpFile := CallbackCreate(GetMethod(implObj, "GetDumpFile"), flags, 7)
        this.vtbl.GetDumpFileWide := CallbackCreate(GetMethod(implObj, "GetDumpFileWide"), flags, 7)
        this.vtbl.AttachKernelWide := CallbackCreate(GetMethod(implObj, "AttachKernelWide"), flags, 3)
        this.vtbl.GetKernelConnectionOptionsWide := CallbackCreate(GetMethod(implObj, "GetKernelConnectionOptionsWide"), flags, 4)
        this.vtbl.SetKernelConnectionOptionsWide := CallbackCreate(GetMethod(implObj, "SetKernelConnectionOptionsWide"), flags, 2)
        this.vtbl.StartProcessServerWide := CallbackCreate(GetMethod(implObj, "StartProcessServerWide"), flags, 4)
        this.vtbl.ConnectProcessServerWide := CallbackCreate(GetMethod(implObj, "ConnectProcessServerWide"), flags, 3)
        this.vtbl.StartServerWide := CallbackCreate(GetMethod(implObj, "StartServerWide"), flags, 2)
        this.vtbl.OutputServersWide := CallbackCreate(GetMethod(implObj, "OutputServersWide"), flags, 4)
        this.vtbl.GetOutputCallbacksWide := CallbackCreate(GetMethod(implObj, "GetOutputCallbacksWide"), flags, 2)
        this.vtbl.SetOutputCallbacksWide := CallbackCreate(GetMethod(implObj, "SetOutputCallbacksWide"), flags, 2)
        this.vtbl.GetOutputLinePrefixWide := CallbackCreate(GetMethod(implObj, "GetOutputLinePrefixWide"), flags, 4)
        this.vtbl.SetOutputLinePrefixWide := CallbackCreate(GetMethod(implObj, "SetOutputLinePrefixWide"), flags, 2)
        this.vtbl.GetIdentityWide := CallbackCreate(GetMethod(implObj, "GetIdentityWide"), flags, 4)
        this.vtbl.OutputIdentityWide := CallbackCreate(GetMethod(implObj, "OutputIdentityWide"), flags, 4)
        this.vtbl.GetEventCallbacksWide := CallbackCreate(GetMethod(implObj, "GetEventCallbacksWide"), flags, 2)
        this.vtbl.SetEventCallbacksWide := CallbackCreate(GetMethod(implObj, "SetEventCallbacksWide"), flags, 2)
        this.vtbl.CreateProcess2 := CallbackCreate(GetMethod(implObj, "CreateProcess2"), flags, 7)
        this.vtbl.CreateProcess2Wide := CallbackCreate(GetMethod(implObj, "CreateProcess2Wide"), flags, 7)
        this.vtbl.CreateProcessAndAttach2 := CallbackCreate(GetMethod(implObj, "CreateProcessAndAttach2"), flags, 9)
        this.vtbl.CreateProcessAndAttach2Wide := CallbackCreate(GetMethod(implObj, "CreateProcessAndAttach2Wide"), flags, 9)
        this.vtbl.PushOutputLinePrefix := CallbackCreate(GetMethod(implObj, "PushOutputLinePrefix"), flags, 3)
        this.vtbl.PushOutputLinePrefixWide := CallbackCreate(GetMethod(implObj, "PushOutputLinePrefixWide"), flags, 3)
        this.vtbl.PopOutputLinePrefix := CallbackCreate(GetMethod(implObj, "PopOutputLinePrefix"), flags, 2)
        this.vtbl.GetNumberInputCallbacks := CallbackCreate(GetMethod(implObj, "GetNumberInputCallbacks"), flags, 2)
        this.vtbl.GetNumberOutputCallbacks := CallbackCreate(GetMethod(implObj, "GetNumberOutputCallbacks"), flags, 2)
        this.vtbl.GetNumberEventCallbacks := CallbackCreate(GetMethod(implObj, "GetNumberEventCallbacks"), flags, 3)
        this.vtbl.GetQuitLockString := CallbackCreate(GetMethod(implObj, "GetQuitLockString"), flags, 4)
        this.vtbl.SetQuitLockString := CallbackCreate(GetMethod(implObj, "SetQuitLockString"), flags, 2)
        this.vtbl.GetQuitLockStringWide := CallbackCreate(GetMethod(implObj, "GetQuitLockStringWide"), flags, 4)
        this.vtbl.SetQuitLockStringWide := CallbackCreate(GetMethod(implObj, "SetQuitLockStringWide"), flags, 2)
        this.vtbl.SetEventContextCallbacks := CallbackCreate(GetMethod(implObj, "SetEventContextCallbacks"), flags, 2)
        this.vtbl.SetClientContext := CallbackCreate(GetMethod(implObj, "SetClientContext"), flags, 3)
        this.vtbl.OpenDumpFileWide2 := CallbackCreate(GetMethod(implObj, "OpenDumpFileWide2"), flags, 4)
        this.vtbl.OpenDumpDirectoryWide := CallbackCreate(GetMethod(implObj, "OpenDumpDirectoryWide"), flags, 3)
        this.vtbl.OpenDumpDirectory := CallbackCreate(GetMethod(implObj, "OpenDumpDirectory"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AttachKernel)
        CallbackFree(this.vtbl.GetKernelConnectionOptions)
        CallbackFree(this.vtbl.SetKernelConnectionOptions)
        CallbackFree(this.vtbl.StartProcessServer)
        CallbackFree(this.vtbl.ConnectProcessServer)
        CallbackFree(this.vtbl.DisconnectProcessServer)
        CallbackFree(this.vtbl.GetRunningProcessSystemIds)
        CallbackFree(this.vtbl.GetRunningProcessSystemIdByExecutableName)
        CallbackFree(this.vtbl.GetRunningProcessDescription)
        CallbackFree(this.vtbl.AttachProcess)
        CallbackFree(this.vtbl.CreateProcessA)
        CallbackFree(this.vtbl.CreateProcessAndAttach)
        CallbackFree(this.vtbl.GetProcessOptions)
        CallbackFree(this.vtbl.AddProcessOptions)
        CallbackFree(this.vtbl.RemoveProcessOptions)
        CallbackFree(this.vtbl.SetProcessOptions)
        CallbackFree(this.vtbl.OpenDumpFile)
        CallbackFree(this.vtbl.WriteDumpFile)
        CallbackFree(this.vtbl.ConnectSession)
        CallbackFree(this.vtbl.StartServer)
        CallbackFree(this.vtbl.OutputServers)
        CallbackFree(this.vtbl.TerminateProcesses)
        CallbackFree(this.vtbl.DetachProcesses)
        CallbackFree(this.vtbl.EndSession)
        CallbackFree(this.vtbl.GetExitCode)
        CallbackFree(this.vtbl.DispatchCallbacks)
        CallbackFree(this.vtbl.ExitDispatch)
        CallbackFree(this.vtbl.CreateClient)
        CallbackFree(this.vtbl.GetInputCallbacks)
        CallbackFree(this.vtbl.SetInputCallbacks)
        CallbackFree(this.vtbl.GetOutputCallbacks)
        CallbackFree(this.vtbl.SetOutputCallbacks)
        CallbackFree(this.vtbl.GetOutputMask)
        CallbackFree(this.vtbl.SetOutputMask)
        CallbackFree(this.vtbl.GetOtherOutputMask)
        CallbackFree(this.vtbl.SetOtherOutputMask)
        CallbackFree(this.vtbl.GetOutputWidth)
        CallbackFree(this.vtbl.SetOutputWidth)
        CallbackFree(this.vtbl.GetOutputLinePrefix)
        CallbackFree(this.vtbl.SetOutputLinePrefix)
        CallbackFree(this.vtbl.GetIdentity)
        CallbackFree(this.vtbl.OutputIdentity)
        CallbackFree(this.vtbl.GetEventCallbacks)
        CallbackFree(this.vtbl.SetEventCallbacks)
        CallbackFree(this.vtbl.FlushCallbacks)
        CallbackFree(this.vtbl.WriteDumpFile2)
        CallbackFree(this.vtbl.AddDumpInformationFile)
        CallbackFree(this.vtbl.EndProcessServer)
        CallbackFree(this.vtbl.WaitForProcessServerEnd)
        CallbackFree(this.vtbl.IsKernelDebuggerEnabled)
        CallbackFree(this.vtbl.TerminateCurrentProcess)
        CallbackFree(this.vtbl.DetachCurrentProcess)
        CallbackFree(this.vtbl.AbandonCurrentProcess)
        CallbackFree(this.vtbl.GetRunningProcessSystemIdByExecutableNameWide)
        CallbackFree(this.vtbl.GetRunningProcessDescriptionWide)
        CallbackFree(this.vtbl.CreateProcessWide)
        CallbackFree(this.vtbl.CreateProcessAndAttachWide)
        CallbackFree(this.vtbl.OpenDumpFileWide)
        CallbackFree(this.vtbl.WriteDumpFileWide)
        CallbackFree(this.vtbl.AddDumpInformationFileWide)
        CallbackFree(this.vtbl.GetNumberDumpFiles)
        CallbackFree(this.vtbl.GetDumpFile)
        CallbackFree(this.vtbl.GetDumpFileWide)
        CallbackFree(this.vtbl.AttachKernelWide)
        CallbackFree(this.vtbl.GetKernelConnectionOptionsWide)
        CallbackFree(this.vtbl.SetKernelConnectionOptionsWide)
        CallbackFree(this.vtbl.StartProcessServerWide)
        CallbackFree(this.vtbl.ConnectProcessServerWide)
        CallbackFree(this.vtbl.StartServerWide)
        CallbackFree(this.vtbl.OutputServersWide)
        CallbackFree(this.vtbl.GetOutputCallbacksWide)
        CallbackFree(this.vtbl.SetOutputCallbacksWide)
        CallbackFree(this.vtbl.GetOutputLinePrefixWide)
        CallbackFree(this.vtbl.SetOutputLinePrefixWide)
        CallbackFree(this.vtbl.GetIdentityWide)
        CallbackFree(this.vtbl.OutputIdentityWide)
        CallbackFree(this.vtbl.GetEventCallbacksWide)
        CallbackFree(this.vtbl.SetEventCallbacksWide)
        CallbackFree(this.vtbl.CreateProcess2)
        CallbackFree(this.vtbl.CreateProcess2Wide)
        CallbackFree(this.vtbl.CreateProcessAndAttach2)
        CallbackFree(this.vtbl.CreateProcessAndAttach2Wide)
        CallbackFree(this.vtbl.PushOutputLinePrefix)
        CallbackFree(this.vtbl.PushOutputLinePrefixWide)
        CallbackFree(this.vtbl.PopOutputLinePrefix)
        CallbackFree(this.vtbl.GetNumberInputCallbacks)
        CallbackFree(this.vtbl.GetNumberOutputCallbacks)
        CallbackFree(this.vtbl.GetNumberEventCallbacks)
        CallbackFree(this.vtbl.GetQuitLockString)
        CallbackFree(this.vtbl.SetQuitLockString)
        CallbackFree(this.vtbl.GetQuitLockStringWide)
        CallbackFree(this.vtbl.SetQuitLockStringWide)
        CallbackFree(this.vtbl.SetEventContextCallbacks)
        CallbackFree(this.vtbl.SetClientContext)
        CallbackFree(this.vtbl.OpenDumpFileWide2)
        CallbackFree(this.vtbl.OpenDumpDirectoryWide)
        CallbackFree(this.vtbl.OpenDumpDirectory)
    }
}
