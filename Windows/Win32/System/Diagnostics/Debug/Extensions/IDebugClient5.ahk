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
class IDebugClient5 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugClient5
     * @type {Guid}
     */
    static IID => Guid("{e3acb9d7-7ec2-4f0c-a0da-e81e0cbbe628}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AttachKernel", "GetKernelConnectionOptions", "SetKernelConnectionOptions", "StartProcessServer", "ConnectProcessServer", "DisconnectProcessServer", "GetRunningProcessSystemIds", "GetRunningProcessSystemIdByExecutableName", "GetRunningProcessDescription", "AttachProcess", "CreateProcessA", "CreateProcessAndAttach", "GetProcessOptions", "AddProcessOptions", "RemoveProcessOptions", "SetProcessOptions", "OpenDumpFile", "WriteDumpFile", "ConnectSession", "StartServer", "OutputServers", "TerminateProcesses", "DetachProcesses", "EndSession", "GetExitCode", "DispatchCallbacks", "ExitDispatch", "CreateClient", "GetInputCallbacks", "SetInputCallbacks", "GetOutputCallbacks", "SetOutputCallbacks", "GetOutputMask", "SetOutputMask", "GetOtherOutputMask", "SetOtherOutputMask", "GetOutputWidth", "SetOutputWidth", "GetOutputLinePrefix", "SetOutputLinePrefix", "GetIdentity", "OutputIdentity", "GetEventCallbacks", "SetEventCallbacks", "FlushCallbacks", "WriteDumpFile2", "AddDumpInformationFile", "EndProcessServer", "WaitForProcessServerEnd", "IsKernelDebuggerEnabled", "TerminateCurrentProcess", "DetachCurrentProcess", "AbandonCurrentProcess", "GetRunningProcessSystemIdByExecutableNameWide", "GetRunningProcessDescriptionWide", "CreateProcessWide", "CreateProcessAndAttachWide", "OpenDumpFileWide", "WriteDumpFileWide", "AddDumpInformationFileWide", "GetNumberDumpFiles", "GetDumpFile", "GetDumpFileWide", "AttachKernelWide", "GetKernelConnectionOptionsWide", "SetKernelConnectionOptionsWide", "StartProcessServerWide", "ConnectProcessServerWide", "StartServerWide", "OutputServersWide", "GetOutputCallbacksWide", "SetOutputCallbacksWide", "GetOutputLinePrefixWide", "SetOutputLinePrefixWide", "GetIdentityWide", "OutputIdentityWide", "GetEventCallbacksWide", "SetEventCallbacksWide", "CreateProcess2", "CreateProcess2Wide", "CreateProcessAndAttach2", "CreateProcessAndAttach2Wide", "PushOutputLinePrefix", "PushOutputLinePrefixWide", "PopOutputLinePrefix", "GetNumberInputCallbacks", "GetNumberOutputCallbacks", "GetNumberEventCallbacks", "GetQuitLockString", "SetQuitLockString", "GetQuitLockStringWide", "SetQuitLockStringWide"]

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
     * @param {PSTR} Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetKernelConnectionOptions(Buffer, BufferSize) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(4, this, "ptr", Buffer, "uint", BufferSize, "uint*", &OptionsSize := 0, "HRESULT")
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
     * Creates a new process and its primary thread. The new process runs in the security context of the calling process.
     * @param {Integer} Server 
     * @param {PSTR} CommandLine 
     * @param {Integer} CreateFlags 
     * @returns {HRESULT} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * Note that the function returns before the process has finished initialization. If a required DLL cannot be located or fails to initialize, the process is terminated. To get the termination status of a process, call <a href="/windows/desktop/api/processthreadsapi/nf-processthreadsapi-getexitcodeprocess">GetExitCodeProcess</a>.
     * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/nf-processthreadsapi-createprocessa
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
        result := ComCall(39, this, "uint*", &Columns := 0, "HRESULT")
        return Columns
    }

    /**
     * 
     * @param {Integer} Columns 
     * @returns {HRESULT} 
     */
    SetOutputWidth(Columns) {
        result := ComCall(40, this, "uint", Columns, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetOutputLinePrefix(Buffer, BufferSize) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(41, this, "ptr", Buffer, "uint", BufferSize, "uint*", &PrefixSize := 0, "HRESULT")
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
     * @param {PSTR} Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetIdentity(Buffer, BufferSize) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(43, this, "ptr", Buffer, "uint", BufferSize, "uint*", &IdentitySize := 0, "HRESULT")
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
        result := ComCall(63, this, "uint*", &Number := 0, "HRESULT")
        return Number
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {PSTR} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} NameSize 
     * @param {Pointer<Integer>} Handle 
     * @param {Pointer<Integer>} Type 
     * @returns {HRESULT} 
     */
    GetDumpFile(Index, Buffer, BufferSize, NameSize, Handle, Type) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        NameSizeMarshal := NameSize is VarRef ? "uint*" : "ptr"
        HandleMarshal := Handle is VarRef ? "uint*" : "ptr"
        TypeMarshal := Type is VarRef ? "uint*" : "ptr"

        result := ComCall(64, this, "uint", Index, "ptr", Buffer, "uint", BufferSize, NameSizeMarshal, NameSize, HandleMarshal, Handle, TypeMarshal, Type, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {PWSTR} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} NameSize 
     * @param {Pointer<Integer>} Handle 
     * @param {Pointer<Integer>} Type 
     * @returns {HRESULT} 
     */
    GetDumpFileWide(Index, Buffer, BufferSize, NameSize, Handle, Type) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        NameSizeMarshal := NameSize is VarRef ? "uint*" : "ptr"
        HandleMarshal := Handle is VarRef ? "uint*" : "ptr"
        TypeMarshal := Type is VarRef ? "uint*" : "ptr"

        result := ComCall(65, this, "uint", Index, "ptr", Buffer, "uint", BufferSize, NameSizeMarshal, NameSize, HandleMarshal, Handle, TypeMarshal, Type, "HRESULT")
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
     * @param {PWSTR} Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetKernelConnectionOptionsWide(Buffer, BufferSize) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(67, this, "ptr", Buffer, "uint", BufferSize, "uint*", &OptionsSize := 0, "HRESULT")
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
     * @param {PWSTR} Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetOutputLinePrefixWide(Buffer, BufferSize) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(75, this, "ptr", Buffer, "uint", BufferSize, "uint*", &PrefixSize := 0, "HRESULT")
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
     * @param {PWSTR} Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetIdentityWide(Buffer, BufferSize) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(77, this, "ptr", Buffer, "uint", BufferSize, "uint*", &IdentitySize := 0, "HRESULT")
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

        result := ComCall(81, this, "uint", Server, "ptr", CommandLine, "ptr", OptionsBuffer, "uint", OptionsBufferSize, "ptr", InitialDirectory, "ptr", Environment, "HRESULT")
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

        result := ComCall(82, this, "uint", Server, "ptr", CommandLine, "ptr", OptionsBuffer, "uint", OptionsBufferSize, "ptr", InitialDirectory, "ptr", Environment, "HRESULT")
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

        result := ComCall(83, this, "uint", Server, "ptr", CommandLine, "ptr", OptionsBuffer, "uint", OptionsBufferSize, "ptr", InitialDirectory, "ptr", Environment, "uint", ProcessId, "uint", AttachFlags, "HRESULT")
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

        result := ComCall(85, this, "ptr", NewPrefix, "uint*", &Handle := 0, "HRESULT")
        return Handle
    }

    /**
     * 
     * @param {PWSTR} NewPrefix 
     * @returns {Integer} 
     */
    PushOutputLinePrefixWide(NewPrefix) {
        NewPrefix := NewPrefix is String ? StrPtr(NewPrefix) : NewPrefix

        result := ComCall(86, this, "ptr", NewPrefix, "uint*", &Handle := 0, "HRESULT")
        return Handle
    }

    /**
     * 
     * @param {Integer} Handle 
     * @returns {HRESULT} 
     */
    PopOutputLinePrefix(Handle) {
        result := ComCall(87, this, "uint", Handle, "HRESULT")
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
     * @param {PSTR} Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetQuitLockString(Buffer, BufferSize) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(91, this, "ptr", Buffer, "uint", BufferSize, "uint*", &StringSize := 0, "HRESULT")
        return StringSize
    }

    /**
     * 
     * @param {PSTR} String 
     * @returns {HRESULT} 
     */
    SetQuitLockString(String) {
        String := String is String ? StrPtr(String) : String

        result := ComCall(92, this, "ptr", String, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetQuitLockStringWide(Buffer, BufferSize) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(93, this, "ptr", Buffer, "uint", BufferSize, "uint*", &StringSize := 0, "HRESULT")
        return StringSize
    }

    /**
     * 
     * @param {PWSTR} String 
     * @returns {HRESULT} 
     */
    SetQuitLockStringWide(String) {
        String := String is String ? StrPtr(String) : String

        result := ComCall(94, this, "ptr", String, "HRESULT")
        return result
    }
}
