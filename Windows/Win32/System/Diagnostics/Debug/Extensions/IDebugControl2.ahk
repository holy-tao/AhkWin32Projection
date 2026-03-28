#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\DEBUG_VALUE.ahk
#Include .\IDebugBreakpoint.ahk
#Include .\DEBUG_BREAKPOINT_PARAMETERS.ahk
#Include .\DEBUG_SPECIFIC_FILTER_PARAMETERS.ahk
#Include .\DEBUG_EXCEPTION_FILTER_PARAMETERS.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugControl2 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugControl2
     * @type {Guid}
     */
    static IID => Guid("{d4366723-44df-4bed-8c7e-4c05424f4588}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetInterrupt", "SetInterrupt", "GetInterruptTimeout", "SetInterruptTimeout", "GetLogFile", "OpenLogFile", "CloseLogFile", "GetLogMask", "SetLogMask", "Input", "ReturnInput", "Output", "OutputVaList", "ControlledOutput", "ControlledOutputVaList", "OutputPrompt", "OutputPromptVaList", "GetPromptText", "OutputCurrentState", "OutputVersionInformation", "GetNotifyEventHandle", "SetNotifyEventHandle", "Assemble", "Disassemble", "GetDisassembleEffectiveOffset", "OutputDisassembly", "OutputDisassemblyLines", "GetNearInstruction", "GetStackTrace", "GetReturnOffset", "OutputStackTrace", "GetDebuggeeType", "GetActualProcessorType", "GetExecutingProcessorType", "GetNumberPossibleExecutingProcessorTypes", "GetPossibleExecutingProcessorTypes", "GetNumberProcessors", "GetSystemVersion", "GetPageSize", "IsPointer64Bit", "ReadBugCheckData", "GetNumberSupportedProcessorTypes", "GetSupportedProcessorTypes", "GetProcessorTypeNames", "GetEffectiveProcessorType", "SetEffectiveProcessorType", "GetExecutionStatus", "SetExecutionStatus", "GetCodeLevel", "SetCodeLevel", "GetEngineOptions", "AddEngineOptions", "RemoveEngineOptions", "SetEngineOptions", "GetSystemErrorControl", "SetSystemErrorControl", "GetTextMacro", "SetTextMacro", "GetRadix", "SetRadix", "Evaluate", "CoerceValue", "CoerceValues", "Execute", "ExecuteCommandFile", "GetNumberBreakpoints", "GetBreakpointByIndex", "GetBreakpointById", "GetBreakpointParameters", "AddBreakpoint", "RemoveBreakpoint", "AddExtension", "RemoveExtension", "GetExtensionByPath", "CallExtension", "GetExtensionFunction", "GetWindbgExtensionApis32", "GetWindbgExtensionApis64", "GetNumberEventFilters", "GetEventFilterText", "GetEventFilterCommand", "SetEventFilterCommand", "GetSpecificFilterParameters", "SetSpecificFilterParameters", "GetSpecificFilterArgument", "SetSpecificFilterArgument", "GetExceptionFilterParameters", "SetExceptionFilterParameters", "GetExceptionFilterSecondCommand", "SetExceptionFilterSecondCommand", "WaitForEvent", "GetLastEventInformation", "GetCurrentTimeDate", "GetCurrentSystemUpTime", "GetDumpFormatFlags", "GetNumberTextReplacements", "GetTextReplacement", "SetTextReplacement", "RemoveTextReplacements", "OutputTextReplacements"]

    /**
     * 
     * @returns {HRESULT} 
     */
    GetInterrupt() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     */
    SetInterrupt(Flags) {
        result := ComCall(4, this, "uint", Flags, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetInterruptTimeout() {
        result := ComCall(5, this, "uint*", &Seconds := 0, "HRESULT")
        return Seconds
    }

    /**
     * 
     * @param {Integer} Seconds 
     * @returns {HRESULT} 
     */
    SetInterruptTimeout(Seconds) {
        result := ComCall(6, this, "uint", Seconds, "HRESULT")
        return result
    }

    /**
     * Returns a buffer that contains metadata about a specified log and its current state, which is defined by the CLFS_INFORMATION structure.
     * @param {PSTR} _Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} FileSize 
     * @param {Pointer<BOOL>} Append 
     * @returns {HRESULT} If the function succeeds, the return value is nonzero.
     * 						
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     *  The following list identifies the possible error codes:
     * @see https://learn.microsoft.com/windows/win32/api/clfsw32/nf-clfsw32-getlogfileinformation
     */
    GetLogFile(_Buffer, BufferSize, FileSize, Append) {
        _Buffer := _Buffer is String ? StrPtr(_Buffer) : _Buffer

        FileSizeMarshal := FileSize is VarRef ? "uint*" : "ptr"
        AppendMarshal := Append is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, "ptr", _Buffer, "uint", BufferSize, FileSizeMarshal, FileSize, AppendMarshal, Append, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} _File 
     * @param {BOOL} Append 
     * @returns {HRESULT} 
     */
    OpenLogFile(_File, Append) {
        _File := _File is String ? StrPtr(_File) : _File

        result := ComCall(8, this, "ptr", _File, "int", Append, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    CloseLogFile() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetLogMask() {
        result := ComCall(10, this, "uint*", &Mask := 0, "HRESULT")
        return Mask
    }

    /**
     * 
     * @param {Integer} Mask 
     * @returns {HRESULT} 
     */
    SetLogMask(Mask) {
        result := ComCall(11, this, "uint", Mask, "HRESULT")
        return result
    }

    /**
     * This section provides the reference specifications for Input Feedback Configuration constants.
     * @param {PSTR} _Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/input_feedback/constants
     */
    Input(_Buffer, BufferSize) {
        _Buffer := _Buffer is String ? StrPtr(_Buffer) : _Buffer

        result := ComCall(12, this, "ptr", _Buffer, "uint", BufferSize, "uint*", &InputSize := 0, "HRESULT")
        return InputSize
    }

    /**
     * 
     * @param {PSTR} _Buffer 
     * @returns {HRESULT} 
     */
    ReturnInput(_Buffer) {
        _Buffer := _Buffer is String ? StrPtr(_Buffer) : _Buffer

        result := ComCall(13, this, "ptr", _Buffer, "HRESULT")
        return result
    }

    /**
     * Sends a string to the debugger for display. (Unicode)
     * @remarks
     * > [!IMPORTANT]
     * > To use this function, you must include the Windows.h header in your application (not debugapi.h).
     * 
     * In the past, the operating system did not return Unicode strings through **OutputDebugStringW** (ASCII strings were returned instead). To force **OutputDebugStringW** to return Unicode strings, debuggers are required to call the [**WaitForDebugEventEx**](nf-debugapi-waitfordebugeventex.md) function to opt into the new behavior. In this way, the operating system knows that the debugger supports Unicode and is specifically opting into receiving Unicode strings.
     * 
     * If the application does not have a debugger, and the filter mask allows it, the system debugger displays the string. To display the string, this function calls the [**DbgPrint**](/windows-hardware/drivers/ddi/wdm/nf-wdm-dbgprint) function. Prior to Windows Vista, content was not filtered by the system debugger.
     * 
     * If the application does not have a debugger and the system debugger is not active, **OutputDebugString** does nothing.
     * 
     * [**OutputDebugStringW**](nf-debugapi-outputdebugstringw.md) converts the specified string based on the current system locale information and passes it to **OutputDebugStringA** to be displayed.  As a result, some Unicode characters may not be displayed correctly.
     * 
     * Applications should send very minimal debug output and provide a way for the user to enable or disable its use. See [Event Tracing](/windows/win32/etw/event-tracing-portal) to learn more about tracing details.
     * 
     * Visual Studio has changed how it handles the display of these strings throughout its revision history. Refer to the Visual Studio documentation for details of how your version deals with this.
     * 
     * The debugapi.h header defines OutputDebugString as an alias that automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that is not encoding-neutral can lead to mismatches and compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Integer} Mask 
     * @param {PSTR} Format 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/debugapi/nf-debugapi-outputdebugstringw
     */
    Output(Mask, Format) {
        Format := Format is String ? StrPtr(Format) : Format

        result := ComCall(14, this, "uint", Mask, "ptr", Format, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Mask 
     * @param {PSTR} Format 
     * @param {Pointer<Integer>} Args 
     * @returns {HRESULT} 
     */
    OutputVaList(Mask, Format, Args) {
        Format := Format is String ? StrPtr(Format) : Format

        ArgsMarshal := Args is VarRef ? "char*" : "ptr"

        result := ComCall(15, this, "uint", Mask, "ptr", Format, ArgsMarshal, Args, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} OutputControl 
     * @param {Integer} Mask 
     * @param {PSTR} Format 
     * @returns {HRESULT} 
     */
    ControlledOutput(OutputControl, Mask, Format) {
        Format := Format is String ? StrPtr(Format) : Format

        result := ComCall(16, this, "uint", OutputControl, "uint", Mask, "ptr", Format, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} OutputControl 
     * @param {Integer} Mask 
     * @param {PSTR} Format 
     * @param {Pointer<Integer>} Args 
     * @returns {HRESULT} 
     */
    ControlledOutputVaList(OutputControl, Mask, Format, Args) {
        Format := Format is String ? StrPtr(Format) : Format

        ArgsMarshal := Args is VarRef ? "char*" : "ptr"

        result := ComCall(17, this, "uint", OutputControl, "uint", Mask, "ptr", Format, ArgsMarshal, Args, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} OutputControl 
     * @param {PSTR} Format 
     * @returns {HRESULT} 
     */
    OutputPrompt(OutputControl, Format) {
        Format := Format is String ? StrPtr(Format) : Format

        result := ComCall(18, this, "uint", OutputControl, "ptr", Format, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} OutputControl 
     * @param {PSTR} Format 
     * @param {Pointer<Integer>} Args 
     * @returns {HRESULT} 
     */
    OutputPromptVaList(OutputControl, Format, Args) {
        Format := Format is String ? StrPtr(Format) : Format

        ArgsMarshal := Args is VarRef ? "char*" : "ptr"

        result := ComCall(19, this, "uint", OutputControl, "ptr", Format, ArgsMarshal, Args, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} _Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetPromptText(_Buffer, BufferSize) {
        _Buffer := _Buffer is String ? StrPtr(_Buffer) : _Buffer

        result := ComCall(20, this, "ptr", _Buffer, "uint", BufferSize, "uint*", &TextSize := 0, "HRESULT")
        return TextSize
    }

    /**
     * 
     * @param {Integer} OutputControl 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     */
    OutputCurrentState(OutputControl, Flags) {
        result := ComCall(21, this, "uint", OutputControl, "uint", Flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} OutputControl 
     * @returns {HRESULT} 
     */
    OutputVersionInformation(OutputControl) {
        result := ComCall(22, this, "uint", OutputControl, "HRESULT")
        return result
    }

    /**
     * Retrieves a handle to a notification event.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/clusapi/nf-clusapi-getnotifyeventhandle
     */
    GetNotifyEventHandle() {
        result := ComCall(23, this, "uint*", &_Handle := 0, "HRESULT")
        return _Handle
    }

    /**
     * 
     * @param {Integer} _Handle 
     * @returns {HRESULT} 
     */
    SetNotifyEventHandle(_Handle) {
        result := ComCall(24, this, "uint", _Handle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {PSTR} Instr 
     * @returns {Integer} 
     */
    Assemble(Offset, Instr) {
        Instr := Instr is String ? StrPtr(Instr) : Instr

        result := ComCall(25, this, "uint", Offset, "ptr", Instr, "uint*", &EndOffset := 0, "HRESULT")
        return EndOffset
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Integer} Flags 
     * @param {PSTR} _Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} DisassemblySize 
     * @param {Pointer<Integer>} EndOffset 
     * @returns {HRESULT} 
     */
    Disassemble(Offset, Flags, _Buffer, BufferSize, DisassemblySize, EndOffset) {
        _Buffer := _Buffer is String ? StrPtr(_Buffer) : _Buffer

        DisassemblySizeMarshal := DisassemblySize is VarRef ? "uint*" : "ptr"
        EndOffsetMarshal := EndOffset is VarRef ? "uint*" : "ptr"

        result := ComCall(26, this, "uint", Offset, "uint", Flags, "ptr", _Buffer, "uint", BufferSize, DisassemblySizeMarshal, DisassemblySize, EndOffsetMarshal, EndOffset, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetDisassembleEffectiveOffset() {
        result := ComCall(27, this, "uint*", &Offset := 0, "HRESULT")
        return Offset
    }

    /**
     * 
     * @param {Integer} OutputControl 
     * @param {Integer} Offset 
     * @param {Integer} Flags 
     * @returns {Integer} 
     */
    OutputDisassembly(OutputControl, Offset, Flags) {
        result := ComCall(28, this, "uint", OutputControl, "uint", Offset, "uint", Flags, "uint*", &EndOffset := 0, "HRESULT")
        return EndOffset
    }

    /**
     * 
     * @param {Integer} OutputControl 
     * @param {Integer} PreviousLines 
     * @param {Integer} TotalLines 
     * @param {Integer} Offset 
     * @param {Integer} Flags 
     * @param {Pointer<Integer>} OffsetLine 
     * @param {Pointer<Integer>} StartOffset 
     * @param {Pointer<Integer>} EndOffset 
     * @param {Pointer<Integer>} LineOffsets 
     * @returns {HRESULT} 
     */
    OutputDisassemblyLines(OutputControl, PreviousLines, TotalLines, Offset, Flags, OffsetLine, StartOffset, EndOffset, LineOffsets) {
        OffsetLineMarshal := OffsetLine is VarRef ? "uint*" : "ptr"
        StartOffsetMarshal := StartOffset is VarRef ? "uint*" : "ptr"
        EndOffsetMarshal := EndOffset is VarRef ? "uint*" : "ptr"
        LineOffsetsMarshal := LineOffsets is VarRef ? "uint*" : "ptr"

        result := ComCall(29, this, "uint", OutputControl, "uint", PreviousLines, "uint", TotalLines, "uint", Offset, "uint", Flags, OffsetLineMarshal, OffsetLine, StartOffsetMarshal, StartOffset, EndOffsetMarshal, EndOffset, LineOffsetsMarshal, LineOffsets, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Integer} Delta 
     * @returns {Integer} 
     */
    GetNearInstruction(Offset, Delta) {
        result := ComCall(30, this, "uint", Offset, "int", Delta, "uint*", &NearOffset := 0, "HRESULT")
        return NearOffset
    }

    /**
     * 
     * @param {Integer} FrameOffset 
     * @param {Integer} StackOffset 
     * @param {Integer} InstructionOffset 
     * @param {Pointer<DEBUG_STACK_FRAME>} Frames 
     * @param {Integer} FramesSize 
     * @param {Pointer<Integer>} FramesFilled 
     * @returns {HRESULT} 
     */
    GetStackTrace(FrameOffset, StackOffset, InstructionOffset, Frames, FramesSize, FramesFilled) {
        FramesFilledMarshal := FramesFilled is VarRef ? "uint*" : "ptr"

        result := ComCall(31, this, "uint", FrameOffset, "uint", StackOffset, "uint", InstructionOffset, "ptr", Frames, "uint", FramesSize, FramesFilledMarshal, FramesFilled, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetReturnOffset() {
        result := ComCall(32, this, "uint*", &Offset := 0, "HRESULT")
        return Offset
    }

    /**
     * 
     * @param {Integer} OutputControl 
     * @param {Pointer<DEBUG_STACK_FRAME>} Frames 
     * @param {Integer} FramesSize 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     */
    OutputStackTrace(OutputControl, Frames, FramesSize, Flags) {
        result := ComCall(33, this, "uint", OutputControl, "ptr", Frames, "uint", FramesSize, "uint", Flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} _Class 
     * @param {Pointer<Integer>} Qualifier 
     * @returns {HRESULT} 
     */
    GetDebuggeeType(_Class, Qualifier) {
        _ClassMarshal := _Class is VarRef ? "uint*" : "ptr"
        QualifierMarshal := Qualifier is VarRef ? "uint*" : "ptr"

        result := ComCall(34, this, _ClassMarshal, _Class, QualifierMarshal, Qualifier, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetActualProcessorType() {
        result := ComCall(35, this, "uint*", &Type := 0, "HRESULT")
        return Type
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetExecutingProcessorType() {
        result := ComCall(36, this, "uint*", &Type := 0, "HRESULT")
        return Type
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetNumberPossibleExecutingProcessorTypes() {
        result := ComCall(37, this, "uint*", &_Number := 0, "HRESULT")
        return _Number
    }

    /**
     * 
     * @param {Integer} Start 
     * @param {Integer} Count 
     * @returns {Integer} 
     */
    GetPossibleExecutingProcessorTypes(Start, Count) {
        result := ComCall(38, this, "uint", Start, "uint", Count, "uint*", &Types := 0, "HRESULT")
        return Types
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetNumberProcessors() {
        result := ComCall(39, this, "uint*", &_Number := 0, "HRESULT")
        return _Number
    }

    /**
     * 
     * @param {Pointer<Integer>} _PlatformId 
     * @param {Pointer<Integer>} Major 
     * @param {Pointer<Integer>} Minor 
     * @param {PSTR} ServicePackString 
     * @param {Integer} ServicePackStringSize 
     * @param {Pointer<Integer>} ServicePackStringUsed 
     * @param {Pointer<Integer>} ServicePackNumber 
     * @param {PSTR} BuildString 
     * @param {Integer} BuildStringSize 
     * @param {Pointer<Integer>} BuildStringUsed 
     * @returns {HRESULT} 
     */
    GetSystemVersion(_PlatformId, Major, Minor, ServicePackString, ServicePackStringSize, ServicePackStringUsed, ServicePackNumber, BuildString, BuildStringSize, BuildStringUsed) {
        ServicePackString := ServicePackString is String ? StrPtr(ServicePackString) : ServicePackString
        BuildString := BuildString is String ? StrPtr(BuildString) : BuildString

        _PlatformIdMarshal := _PlatformId is VarRef ? "uint*" : "ptr"
        MajorMarshal := Major is VarRef ? "uint*" : "ptr"
        MinorMarshal := Minor is VarRef ? "uint*" : "ptr"
        ServicePackStringUsedMarshal := ServicePackStringUsed is VarRef ? "uint*" : "ptr"
        ServicePackNumberMarshal := ServicePackNumber is VarRef ? "uint*" : "ptr"
        BuildStringUsedMarshal := BuildStringUsed is VarRef ? "uint*" : "ptr"

        result := ComCall(40, this, _PlatformIdMarshal, _PlatformId, MajorMarshal, Major, MinorMarshal, Minor, "ptr", ServicePackString, "uint", ServicePackStringSize, ServicePackStringUsedMarshal, ServicePackStringUsed, ServicePackNumberMarshal, ServicePackNumber, "ptr", BuildString, "uint", BuildStringSize, BuildStringUsedMarshal, BuildStringUsed, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetPageSize() {
        result := ComCall(41, this, "uint*", &_Size := 0, "HRESULT")
        return _Size
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    IsPointer64Bit() {
        result := ComCall(42, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Code 
     * @param {Pointer<Integer>} Arg1 
     * @param {Pointer<Integer>} Arg2 
     * @param {Pointer<Integer>} Arg3 
     * @param {Pointer<Integer>} Arg4 
     * @returns {HRESULT} 
     */
    ReadBugCheckData(Code, Arg1, Arg2, Arg3, Arg4) {
        CodeMarshal := Code is VarRef ? "uint*" : "ptr"
        Arg1Marshal := Arg1 is VarRef ? "uint*" : "ptr"
        Arg2Marshal := Arg2 is VarRef ? "uint*" : "ptr"
        Arg3Marshal := Arg3 is VarRef ? "uint*" : "ptr"
        Arg4Marshal := Arg4 is VarRef ? "uint*" : "ptr"

        result := ComCall(43, this, CodeMarshal, Code, Arg1Marshal, Arg1, Arg2Marshal, Arg2, Arg3Marshal, Arg3, Arg4Marshal, Arg4, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetNumberSupportedProcessorTypes() {
        result := ComCall(44, this, "uint*", &_Number := 0, "HRESULT")
        return _Number
    }

    /**
     * 
     * @param {Integer} Start 
     * @param {Integer} Count 
     * @returns {Integer} 
     */
    GetSupportedProcessorTypes(Start, Count) {
        result := ComCall(45, this, "uint", Start, "uint", Count, "uint*", &Types := 0, "HRESULT")
        return Types
    }

    /**
     * 
     * @param {Integer} Type 
     * @param {PSTR} FullNameBuffer 
     * @param {Integer} FullNameBufferSize 
     * @param {Pointer<Integer>} FullNameSize 
     * @param {PSTR} AbbrevNameBuffer 
     * @param {Integer} AbbrevNameBufferSize 
     * @param {Pointer<Integer>} AbbrevNameSize 
     * @returns {HRESULT} 
     */
    GetProcessorTypeNames(Type, FullNameBuffer, FullNameBufferSize, FullNameSize, AbbrevNameBuffer, AbbrevNameBufferSize, AbbrevNameSize) {
        FullNameBuffer := FullNameBuffer is String ? StrPtr(FullNameBuffer) : FullNameBuffer
        AbbrevNameBuffer := AbbrevNameBuffer is String ? StrPtr(AbbrevNameBuffer) : AbbrevNameBuffer

        FullNameSizeMarshal := FullNameSize is VarRef ? "uint*" : "ptr"
        AbbrevNameSizeMarshal := AbbrevNameSize is VarRef ? "uint*" : "ptr"

        result := ComCall(46, this, "uint", Type, "ptr", FullNameBuffer, "uint", FullNameBufferSize, FullNameSizeMarshal, FullNameSize, "ptr", AbbrevNameBuffer, "uint", AbbrevNameBufferSize, AbbrevNameSizeMarshal, AbbrevNameSize, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetEffectiveProcessorType() {
        result := ComCall(47, this, "uint*", &Type := 0, "HRESULT")
        return Type
    }

    /**
     * 
     * @param {Integer} Type 
     * @returns {HRESULT} 
     */
    SetEffectiveProcessorType(Type) {
        result := ComCall(48, this, "uint", Type, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetExecutionStatus() {
        result := ComCall(49, this, "uint*", &_Status := 0, "HRESULT")
        return _Status
    }

    /**
     * 
     * @param {Integer} _Status 
     * @returns {HRESULT} 
     */
    SetExecutionStatus(_Status) {
        result := ComCall(50, this, "uint", _Status, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetCodeLevel() {
        result := ComCall(51, this, "uint*", &Level := 0, "HRESULT")
        return Level
    }

    /**
     * 
     * @param {Integer} Level 
     * @returns {HRESULT} 
     */
    SetCodeLevel(Level) {
        result := ComCall(52, this, "uint", Level, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetEngineOptions() {
        result := ComCall(53, this, "uint*", &Options := 0, "HRESULT")
        return Options
    }

    /**
     * 
     * @param {Integer} Options 
     * @returns {HRESULT} 
     */
    AddEngineOptions(Options) {
        result := ComCall(54, this, "uint", Options, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Options 
     * @returns {HRESULT} 
     */
    RemoveEngineOptions(Options) {
        result := ComCall(55, this, "uint", Options, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Options 
     * @returns {HRESULT} 
     */
    SetEngineOptions(Options) {
        result := ComCall(56, this, "uint", Options, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} OutputLevel 
     * @param {Pointer<Integer>} BreakLevel 
     * @returns {HRESULT} 
     */
    GetSystemErrorControl(OutputLevel, BreakLevel) {
        OutputLevelMarshal := OutputLevel is VarRef ? "uint*" : "ptr"
        BreakLevelMarshal := BreakLevel is VarRef ? "uint*" : "ptr"

        result := ComCall(57, this, OutputLevelMarshal, OutputLevel, BreakLevelMarshal, BreakLevel, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} OutputLevel 
     * @param {Integer} BreakLevel 
     * @returns {HRESULT} 
     */
    SetSystemErrorControl(OutputLevel, BreakLevel) {
        result := ComCall(58, this, "uint", OutputLevel, "uint", BreakLevel, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Slot 
     * @param {PSTR} _Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetTextMacro(Slot, _Buffer, BufferSize) {
        _Buffer := _Buffer is String ? StrPtr(_Buffer) : _Buffer

        result := ComCall(59, this, "uint", Slot, "ptr", _Buffer, "uint", BufferSize, "uint*", &MacroSize := 0, "HRESULT")
        return MacroSize
    }

    /**
     * 
     * @param {Integer} Slot 
     * @param {PSTR} Macro 
     * @returns {HRESULT} 
     */
    SetTextMacro(Slot, Macro) {
        Macro := Macro is String ? StrPtr(Macro) : Macro

        result := ComCall(60, this, "uint", Slot, "ptr", Macro, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetRadix() {
        result := ComCall(61, this, "uint*", &Radix := 0, "HRESULT")
        return Radix
    }

    /**
     * 
     * @param {Integer} Radix 
     * @returns {HRESULT} 
     */
    SetRadix(Radix) {
        result := ComCall(62, this, "uint", Radix, "HRESULT")
        return result
    }

    /**
     * Evaluates at the indexed sample location.
     * @remarks
     * Interpolation mode can be **linear** or **linear\_no\_perspective** on the variable. Use of **centroid** or **sample** is ignored. Attributes with constant interpolation are also allowed, in which case the sample index is ignored.
     * @param {PSTR} Expression 
     * @param {Integer} DesiredType 
     * @param {Pointer<DEBUG_VALUE>} Value 
     * @param {Pointer<Integer>} RemainderIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/direct3dhlsl/evaluateattributeatsample
     */
    Evaluate(Expression, DesiredType, Value, RemainderIndex) {
        Expression := Expression is String ? StrPtr(Expression) : Expression

        RemainderIndexMarshal := RemainderIndex is VarRef ? "uint*" : "ptr"

        result := ComCall(63, this, "ptr", Expression, "uint", DesiredType, "ptr", Value, RemainderIndexMarshal, RemainderIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DEBUG_VALUE>} _In 
     * @param {Integer} OutType 
     * @returns {DEBUG_VALUE} 
     */
    CoerceValue(_In, OutType) {
        Out := DEBUG_VALUE()
        result := ComCall(64, this, "ptr", _In, "uint", OutType, "ptr", Out, "HRESULT")
        return Out
    }

    /**
     * 
     * @param {Integer} Count 
     * @param {Pointer<DEBUG_VALUE>} _In 
     * @param {Pointer<Integer>} OutTypes 
     * @returns {DEBUG_VALUE} 
     */
    CoerceValues(Count, _In, OutTypes) {
        OutTypesMarshal := OutTypes is VarRef ? "uint*" : "ptr"

        Out := DEBUG_VALUE()
        result := ComCall(65, this, "uint", Count, "ptr", _In, OutTypesMarshal, OutTypes, "ptr", Out, "HRESULT")
        return Out
    }

    /**
     * Calls the DsReplicaConsistencyCheck function, which invokes the Knowledge Consistency Checker (KCC) to verify the replication topology.
     * @param {Integer} OutputControl 
     * @param {PSTR} Command 
     * @param {Integer} Flags 
     * @returns {HRESULT} This method does not return a value.
     * @see https://learn.microsoft.com/windows/win32/AD/executekcc-msad-domaincontroller
     */
    Execute(OutputControl, Command, Flags) {
        Command := Command is String ? StrPtr(Command) : Command

        result := ComCall(66, this, "uint", OutputControl, "ptr", Command, "uint", Flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} OutputControl 
     * @param {PSTR} CommandFile 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     */
    ExecuteCommandFile(OutputControl, CommandFile, Flags) {
        CommandFile := CommandFile is String ? StrPtr(CommandFile) : CommandFile

        result := ComCall(67, this, "uint", OutputControl, "ptr", CommandFile, "uint", Flags, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetNumberBreakpoints() {
        result := ComCall(68, this, "uint*", &_Number := 0, "HRESULT")
        return _Number
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {IDebugBreakpoint} 
     */
    GetBreakpointByIndex(Index) {
        result := ComCall(69, this, "uint", Index, "ptr*", &Bp := 0, "HRESULT")
        return IDebugBreakpoint(Bp)
    }

    /**
     * 
     * @param {Integer} Id 
     * @returns {IDebugBreakpoint} 
     */
    GetBreakpointById(Id) {
        result := ComCall(70, this, "uint", Id, "ptr*", &Bp := 0, "HRESULT")
        return IDebugBreakpoint(Bp)
    }

    /**
     * 
     * @param {Integer} Count 
     * @param {Pointer<Integer>} Ids 
     * @param {Integer} Start 
     * @returns {DEBUG_BREAKPOINT_PARAMETERS} 
     */
    GetBreakpointParameters(Count, Ids, Start) {
        IdsMarshal := Ids is VarRef ? "uint*" : "ptr"

        Params := DEBUG_BREAKPOINT_PARAMETERS()
        result := ComCall(71, this, "uint", Count, IdsMarshal, Ids, "uint", Start, "ptr", Params, "HRESULT")
        return Params
    }

    /**
     * 
     * @param {Integer} Type 
     * @param {Integer} DesiredId 
     * @returns {IDebugBreakpoint} 
     */
    AddBreakpoint(Type, DesiredId) {
        result := ComCall(72, this, "uint", Type, "uint", DesiredId, "ptr*", &Bp := 0, "HRESULT")
        return IDebugBreakpoint(Bp)
    }

    /**
     * 
     * @param {IDebugBreakpoint} Bp 
     * @returns {HRESULT} 
     */
    RemoveBreakpoint(Bp) {
        result := ComCall(73, this, "ptr", Bp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} _Path 
     * @param {Integer} Flags 
     * @returns {Integer} 
     */
    AddExtension(_Path, Flags) {
        _Path := _Path is String ? StrPtr(_Path) : _Path

        result := ComCall(74, this, "ptr", _Path, "uint", Flags, "uint*", &_Handle := 0, "HRESULT")
        return _Handle
    }

    /**
     * 
     * @param {Integer} _Handle 
     * @returns {HRESULT} 
     */
    RemoveExtension(_Handle) {
        result := ComCall(75, this, "uint", _Handle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} _Path 
     * @returns {Integer} 
     */
    GetExtensionByPath(_Path) {
        _Path := _Path is String ? StrPtr(_Path) : _Path

        result := ComCall(76, this, "ptr", _Path, "uint*", &_Handle := 0, "HRESULT")
        return _Handle
    }

    /**
     * 
     * @param {Integer} _Handle 
     * @param {PSTR} Function 
     * @param {PSTR} Arguments 
     * @returns {HRESULT} 
     */
    CallExtension(_Handle, Function, Arguments) {
        Function := Function is String ? StrPtr(Function) : Function
        Arguments := Arguments is String ? StrPtr(Arguments) : Arguments

        result := ComCall(77, this, "uint", _Handle, "ptr", Function, "ptr", Arguments, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} _Handle 
     * @param {PSTR} FuncName 
     * @returns {Pointer<FARPROC>} 
     */
    GetExtensionFunction(_Handle, FuncName) {
        FuncName := FuncName is String ? StrPtr(FuncName) : FuncName

        result := ComCall(78, this, "uint", _Handle, "ptr", FuncName, "ptr*", &Function := 0, "HRESULT")
        return Function
    }

    /**
     * 
     * @param {Pointer<WINDBG_EXTENSION_APIS32>} Api 
     * @returns {HRESULT} 
     */
    GetWindbgExtensionApis32(Api) {
        result := ComCall(79, this, "ptr", Api, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<WINDBG_EXTENSION_APIS64>} Api 
     * @returns {HRESULT} 
     */
    GetWindbgExtensionApis64(Api) {
        result := ComCall(80, this, "ptr", Api, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} SpecificEvents 
     * @param {Pointer<Integer>} SpecificExceptions 
     * @param {Pointer<Integer>} ArbitraryExceptions 
     * @returns {HRESULT} 
     */
    GetNumberEventFilters(SpecificEvents, SpecificExceptions, ArbitraryExceptions) {
        SpecificEventsMarshal := SpecificEvents is VarRef ? "uint*" : "ptr"
        SpecificExceptionsMarshal := SpecificExceptions is VarRef ? "uint*" : "ptr"
        ArbitraryExceptionsMarshal := ArbitraryExceptions is VarRef ? "uint*" : "ptr"

        result := ComCall(81, this, SpecificEventsMarshal, SpecificEvents, SpecificExceptionsMarshal, SpecificExceptions, ArbitraryExceptionsMarshal, ArbitraryExceptions, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {PSTR} _Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetEventFilterText(Index, _Buffer, BufferSize) {
        _Buffer := _Buffer is String ? StrPtr(_Buffer) : _Buffer

        result := ComCall(82, this, "uint", Index, "ptr", _Buffer, "uint", BufferSize, "uint*", &TextSize := 0, "HRESULT")
        return TextSize
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {PSTR} _Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetEventFilterCommand(Index, _Buffer, BufferSize) {
        _Buffer := _Buffer is String ? StrPtr(_Buffer) : _Buffer

        result := ComCall(83, this, "uint", Index, "ptr", _Buffer, "uint", BufferSize, "uint*", &CommandSize := 0, "HRESULT")
        return CommandSize
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {PSTR} Command 
     * @returns {HRESULT} 
     */
    SetEventFilterCommand(Index, Command) {
        Command := Command is String ? StrPtr(Command) : Command

        result := ComCall(84, this, "uint", Index, "ptr", Command, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Start 
     * @param {Integer} Count 
     * @returns {DEBUG_SPECIFIC_FILTER_PARAMETERS} 
     */
    GetSpecificFilterParameters(Start, Count) {
        Params := DEBUG_SPECIFIC_FILTER_PARAMETERS()
        result := ComCall(85, this, "uint", Start, "uint", Count, "ptr", Params, "HRESULT")
        return Params
    }

    /**
     * 
     * @param {Integer} Start 
     * @param {Integer} Count 
     * @param {Pointer<DEBUG_SPECIFIC_FILTER_PARAMETERS>} Params 
     * @returns {HRESULT} 
     */
    SetSpecificFilterParameters(Start, Count, Params) {
        result := ComCall(86, this, "uint", Start, "uint", Count, "ptr", Params, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {PSTR} _Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetSpecificFilterArgument(Index, _Buffer, BufferSize) {
        _Buffer := _Buffer is String ? StrPtr(_Buffer) : _Buffer

        result := ComCall(87, this, "uint", Index, "ptr", _Buffer, "uint", BufferSize, "uint*", &ArgumentSize := 0, "HRESULT")
        return ArgumentSize
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {PSTR} Argument 
     * @returns {HRESULT} 
     */
    SetSpecificFilterArgument(Index, Argument) {
        Argument := Argument is String ? StrPtr(Argument) : Argument

        result := ComCall(88, this, "uint", Index, "ptr", Argument, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Count 
     * @param {Pointer<Integer>} Codes 
     * @param {Integer} Start 
     * @returns {DEBUG_EXCEPTION_FILTER_PARAMETERS} 
     */
    GetExceptionFilterParameters(Count, Codes, Start) {
        CodesMarshal := Codes is VarRef ? "uint*" : "ptr"

        Params := DEBUG_EXCEPTION_FILTER_PARAMETERS()
        result := ComCall(89, this, "uint", Count, CodesMarshal, Codes, "uint", Start, "ptr", Params, "HRESULT")
        return Params
    }

    /**
     * 
     * @param {Integer} Count 
     * @param {Pointer<DEBUG_EXCEPTION_FILTER_PARAMETERS>} Params 
     * @returns {HRESULT} 
     */
    SetExceptionFilterParameters(Count, Params) {
        result := ComCall(90, this, "uint", Count, "ptr", Params, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {PSTR} _Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetExceptionFilterSecondCommand(Index, _Buffer, BufferSize) {
        _Buffer := _Buffer is String ? StrPtr(_Buffer) : _Buffer

        result := ComCall(91, this, "uint", Index, "ptr", _Buffer, "uint", BufferSize, "uint*", &CommandSize := 0, "HRESULT")
        return CommandSize
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {PSTR} Command 
     * @returns {HRESULT} 
     */
    SetExceptionFilterSecondCommand(Index, Command) {
        Command := Command is String ? StrPtr(Command) : Command

        result := ComCall(92, this, "uint", Index, "ptr", Command, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @param {Integer} Timeout 
     * @returns {HRESULT} 
     */
    WaitForEvent(Flags, Timeout) {
        result := ComCall(93, this, "uint", Flags, "uint", Timeout, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Type 
     * @param {Pointer<Integer>} ProcessId 
     * @param {Pointer<Integer>} ThreadId 
     * @param {Pointer} ExtraInformation 
     * @param {Integer} ExtraInformationSize 
     * @param {Pointer<Integer>} ExtraInformationUsed 
     * @param {PSTR} Description 
     * @param {Integer} DescriptionSize 
     * @param {Pointer<Integer>} DescriptionUsed 
     * @returns {HRESULT} 
     */
    GetLastEventInformation(Type, ProcessId, ThreadId, ExtraInformation, ExtraInformationSize, ExtraInformationUsed, Description, DescriptionSize, DescriptionUsed) {
        Description := Description is String ? StrPtr(Description) : Description

        TypeMarshal := Type is VarRef ? "uint*" : "ptr"
        ProcessIdMarshal := ProcessId is VarRef ? "uint*" : "ptr"
        ThreadIdMarshal := ThreadId is VarRef ? "uint*" : "ptr"
        ExtraInformationUsedMarshal := ExtraInformationUsed is VarRef ? "uint*" : "ptr"
        DescriptionUsedMarshal := DescriptionUsed is VarRef ? "uint*" : "ptr"

        result := ComCall(94, this, TypeMarshal, Type, ProcessIdMarshal, ProcessId, ThreadIdMarshal, ThreadId, "ptr", ExtraInformation, "uint", ExtraInformationSize, ExtraInformationUsedMarshal, ExtraInformationUsed, "ptr", Description, "uint", DescriptionSize, DescriptionUsedMarshal, DescriptionUsed, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetCurrentTimeDate() {
        result := ComCall(95, this, "uint*", &TimeDate := 0, "HRESULT")
        return TimeDate
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetCurrentSystemUpTime() {
        result := ComCall(96, this, "uint*", &UpTime := 0, "HRESULT")
        return UpTime
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetDumpFormatFlags() {
        result := ComCall(97, this, "uint*", &FormatFlags := 0, "HRESULT")
        return FormatFlags
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetNumberTextReplacements() {
        result := ComCall(98, this, "uint*", &NumRepl := 0, "HRESULT")
        return NumRepl
    }

    /**
     * 
     * @param {PSTR} SrcText 
     * @param {Integer} Index 
     * @param {PSTR} SrcBuffer 
     * @param {Integer} SrcBufferSize 
     * @param {Pointer<Integer>} SrcSize 
     * @param {PSTR} DstBuffer 
     * @param {Integer} DstBufferSize 
     * @param {Pointer<Integer>} DstSize 
     * @returns {HRESULT} 
     */
    GetTextReplacement(SrcText, Index, SrcBuffer, SrcBufferSize, SrcSize, DstBuffer, DstBufferSize, DstSize) {
        SrcText := SrcText is String ? StrPtr(SrcText) : SrcText
        SrcBuffer := SrcBuffer is String ? StrPtr(SrcBuffer) : SrcBuffer
        DstBuffer := DstBuffer is String ? StrPtr(DstBuffer) : DstBuffer

        SrcSizeMarshal := SrcSize is VarRef ? "uint*" : "ptr"
        DstSizeMarshal := DstSize is VarRef ? "uint*" : "ptr"

        result := ComCall(99, this, "ptr", SrcText, "uint", Index, "ptr", SrcBuffer, "uint", SrcBufferSize, SrcSizeMarshal, SrcSize, "ptr", DstBuffer, "uint", DstBufferSize, DstSizeMarshal, DstSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} SrcText 
     * @param {PSTR} DstText 
     * @returns {HRESULT} 
     */
    SetTextReplacement(SrcText, DstText) {
        SrcText := SrcText is String ? StrPtr(SrcText) : SrcText
        DstText := DstText is String ? StrPtr(DstText) : DstText

        result := ComCall(100, this, "ptr", SrcText, "ptr", DstText, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RemoveTextReplacements() {
        result := ComCall(101, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} OutputControl 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     */
    OutputTextReplacements(OutputControl, Flags) {
        result := ComCall(102, this, "uint", OutputControl, "uint", Flags, "HRESULT")
        return result
    }
}
