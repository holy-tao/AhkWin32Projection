#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\DEBUG_VALUE.ahk
#Include .\IDebugBreakpoint.ahk
#Include .\DEBUG_BREAKPOINT_PARAMETERS.ahk
#Include .\DEBUG_SPECIFIC_FILTER_PARAMETERS.ahk
#Include .\DEBUG_EXCEPTION_FILTER_PARAMETERS.ahk
#Include .\IDebugBreakpoint2.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugControl4 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugControl4
     * @type {Guid}
     */
    static IID => Guid("{94e60ce9-9b41-4b19-9fc0-6d9eb35272b3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetInterrupt", "SetInterrupt", "GetInterruptTimeout", "SetInterruptTimeout", "GetLogFile", "OpenLogFile", "CloseLogFile", "GetLogMask", "SetLogMask", "Input", "ReturnInput", "Output", "OutputVaList", "ControlledOutput", "ControlledOutputVaList", "OutputPrompt", "OutputPromptVaList", "GetPromptText", "OutputCurrentState", "OutputVersionInformation", "GetNotifyEventHandle", "SetNotifyEventHandle", "Assemble", "Disassemble", "GetDisassembleEffectiveOffset", "OutputDisassembly", "OutputDisassemblyLines", "GetNearInstruction", "GetStackTrace", "GetReturnOffset", "OutputStackTrace", "GetDebuggeeType", "GetActualProcessorType", "GetExecutingProcessorType", "GetNumberPossibleExecutingProcessorTypes", "GetPossibleExecutingProcessorTypes", "GetNumberProcessors", "GetSystemVersion", "GetPageSize", "IsPointer64Bit", "ReadBugCheckData", "GetNumberSupportedProcessorTypes", "GetSupportedProcessorTypes", "GetProcessorTypeNames", "GetEffectiveProcessorType", "SetEffectiveProcessorType", "GetExecutionStatus", "SetExecutionStatus", "GetCodeLevel", "SetCodeLevel", "GetEngineOptions", "AddEngineOptions", "RemoveEngineOptions", "SetEngineOptions", "GetSystemErrorControl", "SetSystemErrorControl", "GetTextMacro", "SetTextMacro", "GetRadix", "SetRadix", "Evaluate", "CoerceValue", "CoerceValues", "Execute", "ExecuteCommandFile", "GetNumberBreakpoints", "GetBreakpointByIndex", "GetBreakpointById", "GetBreakpointParameters", "AddBreakpoint", "RemoveBreakpoint", "AddExtension", "RemoveExtension", "GetExtensionByPath", "CallExtension", "GetExtensionFunction", "GetWindbgExtensionApis32", "GetWindbgExtensionApis64", "GetNumberEventFilters", "GetEventFilterText", "GetEventFilterCommand", "SetEventFilterCommand", "GetSpecificFilterParameters", "SetSpecificFilterParameters", "GetSpecificFilterArgument", "SetSpecificFilterArgument", "GetExceptionFilterParameters", "SetExceptionFilterParameters", "GetExceptionFilterSecondCommand", "SetExceptionFilterSecondCommand", "WaitForEvent", "GetLastEventInformation", "GetCurrentTimeDate", "GetCurrentSystemUpTime", "GetDumpFormatFlags", "GetNumberTextReplacements", "GetTextReplacement", "SetTextReplacement", "RemoveTextReplacements", "OutputTextReplacements", "GetAssemblyOptions", "AddAssemblyOptions", "RemoveAssemblyOptions", "SetAssemblyOptions", "GetExpressionSyntax", "SetExpressionSyntax", "SetExpressionSyntaxByName", "GetNumberExpressionSyntaxes", "GetExpressionSyntaxNames", "GetNumberEvents", "GetEventIndexDescription", "GetCurrentEventIndex", "SetNextEventIndex", "GetLogFileWide", "OpenLogFileWide", "InputWide", "ReturnInputWide", "OutputWide", "OutputVaListWide", "ControlledOutputWide", "ControlledOutputVaListWide", "OutputPromptWide", "OutputPromptVaListWide", "GetPromptTextWide", "AssembleWide", "DisassembleWide", "GetProcessorTypeNamesWide", "GetTextMacroWide", "SetTextMacroWide", "EvaluateWide", "ExecuteWide", "ExecuteCommandFileWide", "GetBreakpointByIndex2", "GetBreakpointById2", "AddBreakpoint2", "RemoveBreakpoint2", "AddExtensionWide", "GetExtensionByPathWide", "CallExtensionWide", "GetExtensionFunctionWide", "GetEventFilterTextWide", "GetEventFilterCommandWide", "SetEventFilterCommandWide", "GetSpecificFilterArgumentWide", "SetSpecificFilterArgumentWide", "GetExceptionFilterSecondCommandWide", "SetExceptionFilterSecondCommandWide", "GetLastEventInformationWide", "GetTextReplacementWide", "SetTextReplacementWide", "SetExpressionSyntaxByNameWide", "GetExpressionSyntaxNamesWide", "GetEventIndexDescriptionWide", "GetLogFile2", "OpenLogFile2", "GetLogFile2Wide", "OpenLogFile2Wide", "GetSystemVersionValues", "GetSystemVersionString", "GetSystemVersionStringWide", "GetContextStackTrace", "OutputContextStackTrace", "GetStoredEventInformation", "GetManagedStatus", "GetManagedStatusWide", "ResetManagedStatus"]

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
     * 
     * @param {PSTR} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} FileSize 
     * @param {Pointer<BOOL>} Append 
     * @returns {HRESULT} 
     */
    GetLogFile(Buffer, BufferSize, FileSize, Append) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        FileSizeMarshal := FileSize is VarRef ? "uint*" : "ptr"
        AppendMarshal := Append is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, "ptr", Buffer, "uint", BufferSize, FileSizeMarshal, FileSize, AppendMarshal, Append, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} File 
     * @param {BOOL} Append 
     * @returns {HRESULT} 
     */
    OpenLogFile(File, Append) {
        File := File is String ? StrPtr(File) : File

        result := ComCall(8, this, "ptr", File, "int", Append, "HRESULT")
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
     * 
     * @param {PSTR} Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    Input(Buffer, BufferSize) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(12, this, "ptr", Buffer, "uint", BufferSize, "uint*", &InputSize := 0, "HRESULT")
        return InputSize
    }

    /**
     * 
     * @param {PSTR} Buffer 
     * @returns {HRESULT} 
     */
    ReturnInput(Buffer) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(13, this, "ptr", Buffer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Mask 
     * @param {PSTR} Format 
     * @returns {HRESULT} 
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
     * @param {PSTR} Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetPromptText(Buffer, BufferSize) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(20, this, "ptr", Buffer, "uint", BufferSize, "uint*", &TextSize := 0, "HRESULT")
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
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-getnotifyeventhandle
     */
    GetNotifyEventHandle() {
        result := ComCall(23, this, "uint*", &Handle := 0, "HRESULT")
        return Handle
    }

    /**
     * 
     * @param {Integer} Handle 
     * @returns {HRESULT} 
     */
    SetNotifyEventHandle(Handle) {
        result := ComCall(24, this, "uint", Handle, "HRESULT")
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
     * @param {PSTR} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} DisassemblySize 
     * @param {Pointer<Integer>} EndOffset 
     * @returns {HRESULT} 
     */
    Disassemble(Offset, Flags, Buffer, BufferSize, DisassemblySize, EndOffset) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        DisassemblySizeMarshal := DisassemblySize is VarRef ? "uint*" : "ptr"
        EndOffsetMarshal := EndOffset is VarRef ? "uint*" : "ptr"

        result := ComCall(26, this, "uint", Offset, "uint", Flags, "ptr", Buffer, "uint", BufferSize, DisassemblySizeMarshal, DisassemblySize, EndOffsetMarshal, EndOffset, "HRESULT")
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
     * @param {Pointer<Integer>} Class 
     * @param {Pointer<Integer>} Qualifier 
     * @returns {HRESULT} 
     */
    GetDebuggeeType(Class, Qualifier) {
        ClassMarshal := Class is VarRef ? "uint*" : "ptr"
        QualifierMarshal := Qualifier is VarRef ? "uint*" : "ptr"

        result := ComCall(34, this, ClassMarshal, Class, QualifierMarshal, Qualifier, "HRESULT")
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
        result := ComCall(37, this, "uint*", &Number := 0, "HRESULT")
        return Number
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
        result := ComCall(39, this, "uint*", &Number := 0, "HRESULT")
        return Number
    }

    /**
     * 
     * @param {Pointer<Integer>} PlatformId 
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
    GetSystemVersion(PlatformId, Major, Minor, ServicePackString, ServicePackStringSize, ServicePackStringUsed, ServicePackNumber, BuildString, BuildStringSize, BuildStringUsed) {
        ServicePackString := ServicePackString is String ? StrPtr(ServicePackString) : ServicePackString
        BuildString := BuildString is String ? StrPtr(BuildString) : BuildString

        PlatformIdMarshal := PlatformId is VarRef ? "uint*" : "ptr"
        MajorMarshal := Major is VarRef ? "uint*" : "ptr"
        MinorMarshal := Minor is VarRef ? "uint*" : "ptr"
        ServicePackStringUsedMarshal := ServicePackStringUsed is VarRef ? "uint*" : "ptr"
        ServicePackNumberMarshal := ServicePackNumber is VarRef ? "uint*" : "ptr"
        BuildStringUsedMarshal := BuildStringUsed is VarRef ? "uint*" : "ptr"

        result := ComCall(40, this, PlatformIdMarshal, PlatformId, MajorMarshal, Major, MinorMarshal, Minor, "ptr", ServicePackString, "uint", ServicePackStringSize, ServicePackStringUsedMarshal, ServicePackStringUsed, ServicePackNumberMarshal, ServicePackNumber, "ptr", BuildString, "uint", BuildStringSize, BuildStringUsedMarshal, BuildStringUsed, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetPageSize() {
        result := ComCall(41, this, "uint*", &Size := 0, "HRESULT")
        return Size
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
        result := ComCall(44, this, "uint*", &Number := 0, "HRESULT")
        return Number
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
        result := ComCall(49, this, "uint*", &Status := 0, "HRESULT")
        return Status
    }

    /**
     * 
     * @param {Integer} Status 
     * @returns {HRESULT} 
     */
    SetExecutionStatus(Status) {
        result := ComCall(50, this, "uint", Status, "HRESULT")
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
     * @param {PSTR} Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetTextMacro(Slot, Buffer, BufferSize) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(59, this, "uint", Slot, "ptr", Buffer, "uint", BufferSize, "uint*", &MacroSize := 0, "HRESULT")
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
     * 
     * @param {PSTR} Expression 
     * @param {Integer} DesiredType 
     * @param {Pointer<DEBUG_VALUE>} Value 
     * @param {Pointer<Integer>} RemainderIndex 
     * @returns {HRESULT} 
     */
    Evaluate(Expression, DesiredType, Value, RemainderIndex) {
        Expression := Expression is String ? StrPtr(Expression) : Expression

        RemainderIndexMarshal := RemainderIndex is VarRef ? "uint*" : "ptr"

        result := ComCall(63, this, "ptr", Expression, "uint", DesiredType, "ptr", Value, RemainderIndexMarshal, RemainderIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DEBUG_VALUE>} In_R 
     * @param {Integer} OutType 
     * @returns {DEBUG_VALUE} 
     */
    CoerceValue(In_R, OutType) {
        Out := DEBUG_VALUE()
        result := ComCall(64, this, "ptr", In_R, "uint", OutType, "ptr", Out, "HRESULT")
        return Out
    }

    /**
     * 
     * @param {Integer} Count 
     * @param {Pointer<DEBUG_VALUE>} In_R 
     * @param {Pointer<Integer>} OutTypes 
     * @returns {DEBUG_VALUE} 
     */
    CoerceValues(Count, In_R, OutTypes) {
        OutTypesMarshal := OutTypes is VarRef ? "uint*" : "ptr"

        Out := DEBUG_VALUE()
        result := ComCall(65, this, "uint", Count, "ptr", In_R, OutTypesMarshal, OutTypes, "ptr", Out, "HRESULT")
        return Out
    }

    /**
     * 
     * @param {Integer} OutputControl 
     * @param {PSTR} Command 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
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
        result := ComCall(68, this, "uint*", &Number := 0, "HRESULT")
        return Number
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
     * @param {PSTR} Path 
     * @param {Integer} Flags 
     * @returns {Integer} 
     */
    AddExtension(Path, Flags) {
        Path := Path is String ? StrPtr(Path) : Path

        result := ComCall(74, this, "ptr", Path, "uint", Flags, "uint*", &Handle := 0, "HRESULT")
        return Handle
    }

    /**
     * 
     * @param {Integer} Handle 
     * @returns {HRESULT} 
     */
    RemoveExtension(Handle) {
        result := ComCall(75, this, "uint", Handle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} Path 
     * @returns {Integer} 
     */
    GetExtensionByPath(Path) {
        Path := Path is String ? StrPtr(Path) : Path

        result := ComCall(76, this, "ptr", Path, "uint*", &Handle := 0, "HRESULT")
        return Handle
    }

    /**
     * 
     * @param {Integer} Handle 
     * @param {PSTR} Function 
     * @param {PSTR} Arguments 
     * @returns {HRESULT} 
     */
    CallExtension(Handle, Function, Arguments) {
        Function := Function is String ? StrPtr(Function) : Function
        Arguments := Arguments is String ? StrPtr(Arguments) : Arguments

        result := ComCall(77, this, "uint", Handle, "ptr", Function, "ptr", Arguments, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Handle 
     * @param {PSTR} FuncName 
     * @returns {Pointer<FARPROC>} 
     */
    GetExtensionFunction(Handle, FuncName) {
        FuncName := FuncName is String ? StrPtr(FuncName) : FuncName

        result := ComCall(78, this, "uint", Handle, "ptr", FuncName, "ptr*", &Function := 0, "HRESULT")
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
     * @param {PSTR} Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetEventFilterText(Index, Buffer, BufferSize) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(82, this, "uint", Index, "ptr", Buffer, "uint", BufferSize, "uint*", &TextSize := 0, "HRESULT")
        return TextSize
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {PSTR} Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetEventFilterCommand(Index, Buffer, BufferSize) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(83, this, "uint", Index, "ptr", Buffer, "uint", BufferSize, "uint*", &CommandSize := 0, "HRESULT")
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
     * @param {PSTR} Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetSpecificFilterArgument(Index, Buffer, BufferSize) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(87, this, "uint", Index, "ptr", Buffer, "uint", BufferSize, "uint*", &ArgumentSize := 0, "HRESULT")
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
     * @param {PSTR} Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetExceptionFilterSecondCommand(Index, Buffer, BufferSize) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(91, this, "uint", Index, "ptr", Buffer, "uint", BufferSize, "uint*", &CommandSize := 0, "HRESULT")
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

    /**
     * 
     * @returns {Integer} 
     */
    GetAssemblyOptions() {
        result := ComCall(103, this, "uint*", &Options := 0, "HRESULT")
        return Options
    }

    /**
     * 
     * @param {Integer} Options 
     * @returns {HRESULT} 
     */
    AddAssemblyOptions(Options) {
        result := ComCall(104, this, "uint", Options, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Options 
     * @returns {HRESULT} 
     */
    RemoveAssemblyOptions(Options) {
        result := ComCall(105, this, "uint", Options, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Options 
     * @returns {HRESULT} 
     */
    SetAssemblyOptions(Options) {
        result := ComCall(106, this, "uint", Options, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetExpressionSyntax() {
        result := ComCall(107, this, "uint*", &Flags := 0, "HRESULT")
        return Flags
    }

    /**
     * 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     */
    SetExpressionSyntax(Flags) {
        result := ComCall(108, this, "uint", Flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} AbbrevName 
     * @returns {HRESULT} 
     */
    SetExpressionSyntaxByName(AbbrevName) {
        AbbrevName := AbbrevName is String ? StrPtr(AbbrevName) : AbbrevName

        result := ComCall(109, this, "ptr", AbbrevName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetNumberExpressionSyntaxes() {
        result := ComCall(110, this, "uint*", &Number := 0, "HRESULT")
        return Number
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {PSTR} FullNameBuffer 
     * @param {Integer} FullNameBufferSize 
     * @param {Pointer<Integer>} FullNameSize 
     * @param {PSTR} AbbrevNameBuffer 
     * @param {Integer} AbbrevNameBufferSize 
     * @param {Pointer<Integer>} AbbrevNameSize 
     * @returns {HRESULT} 
     */
    GetExpressionSyntaxNames(Index, FullNameBuffer, FullNameBufferSize, FullNameSize, AbbrevNameBuffer, AbbrevNameBufferSize, AbbrevNameSize) {
        FullNameBuffer := FullNameBuffer is String ? StrPtr(FullNameBuffer) : FullNameBuffer
        AbbrevNameBuffer := AbbrevNameBuffer is String ? StrPtr(AbbrevNameBuffer) : AbbrevNameBuffer

        FullNameSizeMarshal := FullNameSize is VarRef ? "uint*" : "ptr"
        AbbrevNameSizeMarshal := AbbrevNameSize is VarRef ? "uint*" : "ptr"

        result := ComCall(111, this, "uint", Index, "ptr", FullNameBuffer, "uint", FullNameBufferSize, FullNameSizeMarshal, FullNameSize, "ptr", AbbrevNameBuffer, "uint", AbbrevNameBufferSize, AbbrevNameSizeMarshal, AbbrevNameSize, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetNumberEvents() {
        result := ComCall(112, this, "uint*", &Events := 0, "HRESULT")
        return Events
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Integer} Which 
     * @param {PSTR} Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetEventIndexDescription(Index, Which, Buffer, BufferSize) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(113, this, "uint", Index, "uint", Which, "ptr", Buffer, "uint", BufferSize, "uint*", &DescSize := 0, "HRESULT")
        return DescSize
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetCurrentEventIndex() {
        result := ComCall(114, this, "uint*", &Index := 0, "HRESULT")
        return Index
    }

    /**
     * 
     * @param {Integer} Relation 
     * @param {Integer} Value 
     * @returns {Integer} 
     */
    SetNextEventIndex(Relation, Value) {
        result := ComCall(115, this, "uint", Relation, "uint", Value, "uint*", &NextIndex := 0, "HRESULT")
        return NextIndex
    }

    /**
     * 
     * @param {PWSTR} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} FileSize 
     * @param {Pointer<BOOL>} Append 
     * @returns {HRESULT} 
     */
    GetLogFileWide(Buffer, BufferSize, FileSize, Append) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        FileSizeMarshal := FileSize is VarRef ? "uint*" : "ptr"
        AppendMarshal := Append is VarRef ? "int*" : "ptr"

        result := ComCall(116, this, "ptr", Buffer, "uint", BufferSize, FileSizeMarshal, FileSize, AppendMarshal, Append, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} File 
     * @param {BOOL} Append 
     * @returns {HRESULT} 
     */
    OpenLogFileWide(File, Append) {
        File := File is String ? StrPtr(File) : File

        result := ComCall(117, this, "ptr", File, "int", Append, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    InputWide(Buffer, BufferSize) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(118, this, "ptr", Buffer, "uint", BufferSize, "uint*", &InputSize := 0, "HRESULT")
        return InputSize
    }

    /**
     * 
     * @param {PWSTR} Buffer 
     * @returns {HRESULT} 
     */
    ReturnInputWide(Buffer) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(119, this, "ptr", Buffer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Mask 
     * @param {PWSTR} Format 
     * @returns {HRESULT} 
     */
    OutputWide(Mask, Format) {
        Format := Format is String ? StrPtr(Format) : Format

        result := ComCall(120, this, "uint", Mask, "ptr", Format, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Mask 
     * @param {PWSTR} Format 
     * @param {Pointer<Integer>} Args 
     * @returns {HRESULT} 
     */
    OutputVaListWide(Mask, Format, Args) {
        Format := Format is String ? StrPtr(Format) : Format

        ArgsMarshal := Args is VarRef ? "char*" : "ptr"

        result := ComCall(121, this, "uint", Mask, "ptr", Format, ArgsMarshal, Args, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} OutputControl 
     * @param {Integer} Mask 
     * @param {PWSTR} Format 
     * @returns {HRESULT} 
     */
    ControlledOutputWide(OutputControl, Mask, Format) {
        Format := Format is String ? StrPtr(Format) : Format

        result := ComCall(122, this, "uint", OutputControl, "uint", Mask, "ptr", Format, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} OutputControl 
     * @param {Integer} Mask 
     * @param {PWSTR} Format 
     * @param {Pointer<Integer>} Args 
     * @returns {HRESULT} 
     */
    ControlledOutputVaListWide(OutputControl, Mask, Format, Args) {
        Format := Format is String ? StrPtr(Format) : Format

        ArgsMarshal := Args is VarRef ? "char*" : "ptr"

        result := ComCall(123, this, "uint", OutputControl, "uint", Mask, "ptr", Format, ArgsMarshal, Args, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} OutputControl 
     * @param {PWSTR} Format 
     * @returns {HRESULT} 
     */
    OutputPromptWide(OutputControl, Format) {
        Format := Format is String ? StrPtr(Format) : Format

        result := ComCall(124, this, "uint", OutputControl, "ptr", Format, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} OutputControl 
     * @param {PWSTR} Format 
     * @param {Pointer<Integer>} Args 
     * @returns {HRESULT} 
     */
    OutputPromptVaListWide(OutputControl, Format, Args) {
        Format := Format is String ? StrPtr(Format) : Format

        ArgsMarshal := Args is VarRef ? "char*" : "ptr"

        result := ComCall(125, this, "uint", OutputControl, "ptr", Format, ArgsMarshal, Args, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetPromptTextWide(Buffer, BufferSize) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(126, this, "ptr", Buffer, "uint", BufferSize, "uint*", &TextSize := 0, "HRESULT")
        return TextSize
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {PWSTR} Instr 
     * @returns {Integer} 
     */
    AssembleWide(Offset, Instr) {
        Instr := Instr is String ? StrPtr(Instr) : Instr

        result := ComCall(127, this, "uint", Offset, "ptr", Instr, "uint*", &EndOffset := 0, "HRESULT")
        return EndOffset
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Integer} Flags 
     * @param {PWSTR} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} DisassemblySize 
     * @param {Pointer<Integer>} EndOffset 
     * @returns {HRESULT} 
     */
    DisassembleWide(Offset, Flags, Buffer, BufferSize, DisassemblySize, EndOffset) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        DisassemblySizeMarshal := DisassemblySize is VarRef ? "uint*" : "ptr"
        EndOffsetMarshal := EndOffset is VarRef ? "uint*" : "ptr"

        result := ComCall(128, this, "uint", Offset, "uint", Flags, "ptr", Buffer, "uint", BufferSize, DisassemblySizeMarshal, DisassemblySize, EndOffsetMarshal, EndOffset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Type 
     * @param {PWSTR} FullNameBuffer 
     * @param {Integer} FullNameBufferSize 
     * @param {Pointer<Integer>} FullNameSize 
     * @param {PWSTR} AbbrevNameBuffer 
     * @param {Integer} AbbrevNameBufferSize 
     * @param {Pointer<Integer>} AbbrevNameSize 
     * @returns {HRESULT} 
     */
    GetProcessorTypeNamesWide(Type, FullNameBuffer, FullNameBufferSize, FullNameSize, AbbrevNameBuffer, AbbrevNameBufferSize, AbbrevNameSize) {
        FullNameBuffer := FullNameBuffer is String ? StrPtr(FullNameBuffer) : FullNameBuffer
        AbbrevNameBuffer := AbbrevNameBuffer is String ? StrPtr(AbbrevNameBuffer) : AbbrevNameBuffer

        FullNameSizeMarshal := FullNameSize is VarRef ? "uint*" : "ptr"
        AbbrevNameSizeMarshal := AbbrevNameSize is VarRef ? "uint*" : "ptr"

        result := ComCall(129, this, "uint", Type, "ptr", FullNameBuffer, "uint", FullNameBufferSize, FullNameSizeMarshal, FullNameSize, "ptr", AbbrevNameBuffer, "uint", AbbrevNameBufferSize, AbbrevNameSizeMarshal, AbbrevNameSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Slot 
     * @param {PWSTR} Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetTextMacroWide(Slot, Buffer, BufferSize) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(130, this, "uint", Slot, "ptr", Buffer, "uint", BufferSize, "uint*", &MacroSize := 0, "HRESULT")
        return MacroSize
    }

    /**
     * 
     * @param {Integer} Slot 
     * @param {PWSTR} Macro 
     * @returns {HRESULT} 
     */
    SetTextMacroWide(Slot, Macro) {
        Macro := Macro is String ? StrPtr(Macro) : Macro

        result := ComCall(131, this, "uint", Slot, "ptr", Macro, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} Expression 
     * @param {Integer} DesiredType 
     * @param {Pointer<DEBUG_VALUE>} Value 
     * @param {Pointer<Integer>} RemainderIndex 
     * @returns {HRESULT} 
     */
    EvaluateWide(Expression, DesiredType, Value, RemainderIndex) {
        Expression := Expression is String ? StrPtr(Expression) : Expression

        RemainderIndexMarshal := RemainderIndex is VarRef ? "uint*" : "ptr"

        result := ComCall(132, this, "ptr", Expression, "uint", DesiredType, "ptr", Value, RemainderIndexMarshal, RemainderIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} OutputControl 
     * @param {PWSTR} Command 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     */
    ExecuteWide(OutputControl, Command, Flags) {
        Command := Command is String ? StrPtr(Command) : Command

        result := ComCall(133, this, "uint", OutputControl, "ptr", Command, "uint", Flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} OutputControl 
     * @param {PWSTR} CommandFile 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     */
    ExecuteCommandFileWide(OutputControl, CommandFile, Flags) {
        CommandFile := CommandFile is String ? StrPtr(CommandFile) : CommandFile

        result := ComCall(134, this, "uint", OutputControl, "ptr", CommandFile, "uint", Flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {IDebugBreakpoint2} 
     */
    GetBreakpointByIndex2(Index) {
        result := ComCall(135, this, "uint", Index, "ptr*", &Bp := 0, "HRESULT")
        return IDebugBreakpoint2(Bp)
    }

    /**
     * 
     * @param {Integer} Id 
     * @returns {IDebugBreakpoint2} 
     */
    GetBreakpointById2(Id) {
        result := ComCall(136, this, "uint", Id, "ptr*", &Bp := 0, "HRESULT")
        return IDebugBreakpoint2(Bp)
    }

    /**
     * 
     * @param {Integer} Type 
     * @param {Integer} DesiredId 
     * @returns {IDebugBreakpoint2} 
     */
    AddBreakpoint2(Type, DesiredId) {
        result := ComCall(137, this, "uint", Type, "uint", DesiredId, "ptr*", &Bp := 0, "HRESULT")
        return IDebugBreakpoint2(Bp)
    }

    /**
     * 
     * @param {IDebugBreakpoint2} Bp 
     * @returns {HRESULT} 
     */
    RemoveBreakpoint2(Bp) {
        result := ComCall(138, this, "ptr", Bp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} Path 
     * @param {Integer} Flags 
     * @returns {Integer} 
     */
    AddExtensionWide(Path, Flags) {
        Path := Path is String ? StrPtr(Path) : Path

        result := ComCall(139, this, "ptr", Path, "uint", Flags, "uint*", &Handle := 0, "HRESULT")
        return Handle
    }

    /**
     * 
     * @param {PWSTR} Path 
     * @returns {Integer} 
     */
    GetExtensionByPathWide(Path) {
        Path := Path is String ? StrPtr(Path) : Path

        result := ComCall(140, this, "ptr", Path, "uint*", &Handle := 0, "HRESULT")
        return Handle
    }

    /**
     * 
     * @param {Integer} Handle 
     * @param {PWSTR} Function 
     * @param {PWSTR} Arguments 
     * @returns {HRESULT} 
     */
    CallExtensionWide(Handle, Function, Arguments) {
        Function := Function is String ? StrPtr(Function) : Function
        Arguments := Arguments is String ? StrPtr(Arguments) : Arguments

        result := ComCall(141, this, "uint", Handle, "ptr", Function, "ptr", Arguments, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Handle 
     * @param {PWSTR} FuncName 
     * @returns {Pointer<FARPROC>} 
     */
    GetExtensionFunctionWide(Handle, FuncName) {
        FuncName := FuncName is String ? StrPtr(FuncName) : FuncName

        result := ComCall(142, this, "uint", Handle, "ptr", FuncName, "ptr*", &Function := 0, "HRESULT")
        return Function
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {PWSTR} Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetEventFilterTextWide(Index, Buffer, BufferSize) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(143, this, "uint", Index, "ptr", Buffer, "uint", BufferSize, "uint*", &TextSize := 0, "HRESULT")
        return TextSize
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {PWSTR} Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetEventFilterCommandWide(Index, Buffer, BufferSize) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(144, this, "uint", Index, "ptr", Buffer, "uint", BufferSize, "uint*", &CommandSize := 0, "HRESULT")
        return CommandSize
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {PWSTR} Command 
     * @returns {HRESULT} 
     */
    SetEventFilterCommandWide(Index, Command) {
        Command := Command is String ? StrPtr(Command) : Command

        result := ComCall(145, this, "uint", Index, "ptr", Command, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {PWSTR} Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetSpecificFilterArgumentWide(Index, Buffer, BufferSize) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(146, this, "uint", Index, "ptr", Buffer, "uint", BufferSize, "uint*", &ArgumentSize := 0, "HRESULT")
        return ArgumentSize
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {PWSTR} Argument 
     * @returns {HRESULT} 
     */
    SetSpecificFilterArgumentWide(Index, Argument) {
        Argument := Argument is String ? StrPtr(Argument) : Argument

        result := ComCall(147, this, "uint", Index, "ptr", Argument, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {PWSTR} Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetExceptionFilterSecondCommandWide(Index, Buffer, BufferSize) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(148, this, "uint", Index, "ptr", Buffer, "uint", BufferSize, "uint*", &CommandSize := 0, "HRESULT")
        return CommandSize
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {PWSTR} Command 
     * @returns {HRESULT} 
     */
    SetExceptionFilterSecondCommandWide(Index, Command) {
        Command := Command is String ? StrPtr(Command) : Command

        result := ComCall(149, this, "uint", Index, "ptr", Command, "HRESULT")
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
     * @param {PWSTR} Description 
     * @param {Integer} DescriptionSize 
     * @param {Pointer<Integer>} DescriptionUsed 
     * @returns {HRESULT} 
     */
    GetLastEventInformationWide(Type, ProcessId, ThreadId, ExtraInformation, ExtraInformationSize, ExtraInformationUsed, Description, DescriptionSize, DescriptionUsed) {
        Description := Description is String ? StrPtr(Description) : Description

        TypeMarshal := Type is VarRef ? "uint*" : "ptr"
        ProcessIdMarshal := ProcessId is VarRef ? "uint*" : "ptr"
        ThreadIdMarshal := ThreadId is VarRef ? "uint*" : "ptr"
        ExtraInformationUsedMarshal := ExtraInformationUsed is VarRef ? "uint*" : "ptr"
        DescriptionUsedMarshal := DescriptionUsed is VarRef ? "uint*" : "ptr"

        result := ComCall(150, this, TypeMarshal, Type, ProcessIdMarshal, ProcessId, ThreadIdMarshal, ThreadId, "ptr", ExtraInformation, "uint", ExtraInformationSize, ExtraInformationUsedMarshal, ExtraInformationUsed, "ptr", Description, "uint", DescriptionSize, DescriptionUsedMarshal, DescriptionUsed, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} SrcText 
     * @param {Integer} Index 
     * @param {PWSTR} SrcBuffer 
     * @param {Integer} SrcBufferSize 
     * @param {Pointer<Integer>} SrcSize 
     * @param {PWSTR} DstBuffer 
     * @param {Integer} DstBufferSize 
     * @param {Pointer<Integer>} DstSize 
     * @returns {HRESULT} 
     */
    GetTextReplacementWide(SrcText, Index, SrcBuffer, SrcBufferSize, SrcSize, DstBuffer, DstBufferSize, DstSize) {
        SrcText := SrcText is String ? StrPtr(SrcText) : SrcText
        SrcBuffer := SrcBuffer is String ? StrPtr(SrcBuffer) : SrcBuffer
        DstBuffer := DstBuffer is String ? StrPtr(DstBuffer) : DstBuffer

        SrcSizeMarshal := SrcSize is VarRef ? "uint*" : "ptr"
        DstSizeMarshal := DstSize is VarRef ? "uint*" : "ptr"

        result := ComCall(151, this, "ptr", SrcText, "uint", Index, "ptr", SrcBuffer, "uint", SrcBufferSize, SrcSizeMarshal, SrcSize, "ptr", DstBuffer, "uint", DstBufferSize, DstSizeMarshal, DstSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} SrcText 
     * @param {PWSTR} DstText 
     * @returns {HRESULT} 
     */
    SetTextReplacementWide(SrcText, DstText) {
        SrcText := SrcText is String ? StrPtr(SrcText) : SrcText
        DstText := DstText is String ? StrPtr(DstText) : DstText

        result := ComCall(152, this, "ptr", SrcText, "ptr", DstText, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} AbbrevName 
     * @returns {HRESULT} 
     */
    SetExpressionSyntaxByNameWide(AbbrevName) {
        AbbrevName := AbbrevName is String ? StrPtr(AbbrevName) : AbbrevName

        result := ComCall(153, this, "ptr", AbbrevName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {PWSTR} FullNameBuffer 
     * @param {Integer} FullNameBufferSize 
     * @param {Pointer<Integer>} FullNameSize 
     * @param {PWSTR} AbbrevNameBuffer 
     * @param {Integer} AbbrevNameBufferSize 
     * @param {Pointer<Integer>} AbbrevNameSize 
     * @returns {HRESULT} 
     */
    GetExpressionSyntaxNamesWide(Index, FullNameBuffer, FullNameBufferSize, FullNameSize, AbbrevNameBuffer, AbbrevNameBufferSize, AbbrevNameSize) {
        FullNameBuffer := FullNameBuffer is String ? StrPtr(FullNameBuffer) : FullNameBuffer
        AbbrevNameBuffer := AbbrevNameBuffer is String ? StrPtr(AbbrevNameBuffer) : AbbrevNameBuffer

        FullNameSizeMarshal := FullNameSize is VarRef ? "uint*" : "ptr"
        AbbrevNameSizeMarshal := AbbrevNameSize is VarRef ? "uint*" : "ptr"

        result := ComCall(154, this, "uint", Index, "ptr", FullNameBuffer, "uint", FullNameBufferSize, FullNameSizeMarshal, FullNameSize, "ptr", AbbrevNameBuffer, "uint", AbbrevNameBufferSize, AbbrevNameSizeMarshal, AbbrevNameSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Integer} Which 
     * @param {PWSTR} Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetEventIndexDescriptionWide(Index, Which, Buffer, BufferSize) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(155, this, "uint", Index, "uint", Which, "ptr", Buffer, "uint", BufferSize, "uint*", &DescSize := 0, "HRESULT")
        return DescSize
    }

    /**
     * 
     * @param {PSTR} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} FileSize 
     * @param {Pointer<Integer>} Flags 
     * @returns {HRESULT} 
     */
    GetLogFile2(Buffer, BufferSize, FileSize, Flags) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        FileSizeMarshal := FileSize is VarRef ? "uint*" : "ptr"
        FlagsMarshal := Flags is VarRef ? "uint*" : "ptr"

        result := ComCall(156, this, "ptr", Buffer, "uint", BufferSize, FileSizeMarshal, FileSize, FlagsMarshal, Flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} File 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     */
    OpenLogFile2(File, Flags) {
        File := File is String ? StrPtr(File) : File

        result := ComCall(157, this, "ptr", File, "uint", Flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} FileSize 
     * @param {Pointer<Integer>} Flags 
     * @returns {HRESULT} 
     */
    GetLogFile2Wide(Buffer, BufferSize, FileSize, Flags) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        FileSizeMarshal := FileSize is VarRef ? "uint*" : "ptr"
        FlagsMarshal := Flags is VarRef ? "uint*" : "ptr"

        result := ComCall(158, this, "ptr", Buffer, "uint", BufferSize, FileSizeMarshal, FileSize, FlagsMarshal, Flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} File 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     */
    OpenLogFile2Wide(File, Flags) {
        File := File is String ? StrPtr(File) : File

        result := ComCall(159, this, "ptr", File, "uint", Flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} PlatformId 
     * @param {Pointer<Integer>} Win32Major 
     * @param {Pointer<Integer>} Win32Minor 
     * @param {Pointer<Integer>} KdMajor 
     * @param {Pointer<Integer>} KdMinor 
     * @returns {HRESULT} 
     */
    GetSystemVersionValues(PlatformId, Win32Major, Win32Minor, KdMajor, KdMinor) {
        PlatformIdMarshal := PlatformId is VarRef ? "uint*" : "ptr"
        Win32MajorMarshal := Win32Major is VarRef ? "uint*" : "ptr"
        Win32MinorMarshal := Win32Minor is VarRef ? "uint*" : "ptr"
        KdMajorMarshal := KdMajor is VarRef ? "uint*" : "ptr"
        KdMinorMarshal := KdMinor is VarRef ? "uint*" : "ptr"

        result := ComCall(160, this, PlatformIdMarshal, PlatformId, Win32MajorMarshal, Win32Major, Win32MinorMarshal, Win32Minor, KdMajorMarshal, KdMajor, KdMinorMarshal, KdMinor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Which 
     * @param {PSTR} Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetSystemVersionString(Which, Buffer, BufferSize) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(161, this, "uint", Which, "ptr", Buffer, "uint", BufferSize, "uint*", &StringSize := 0, "HRESULT")
        return StringSize
    }

    /**
     * 
     * @param {Integer} Which 
     * @param {PWSTR} Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetSystemVersionStringWide(Which, Buffer, BufferSize) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(162, this, "uint", Which, "ptr", Buffer, "uint", BufferSize, "uint*", &StringSize := 0, "HRESULT")
        return StringSize
    }

    /**
     * 
     * @param {Pointer} StartContext 
     * @param {Integer} StartContextSize 
     * @param {Pointer<DEBUG_STACK_FRAME>} Frames 
     * @param {Integer} FramesSize 
     * @param {Pointer} FrameContexts 
     * @param {Integer} FrameContextsSize 
     * @param {Integer} FrameContextsEntrySize 
     * @param {Pointer<Integer>} FramesFilled 
     * @returns {HRESULT} 
     */
    GetContextStackTrace(StartContext, StartContextSize, Frames, FramesSize, FrameContexts, FrameContextsSize, FrameContextsEntrySize, FramesFilled) {
        FramesFilledMarshal := FramesFilled is VarRef ? "uint*" : "ptr"

        result := ComCall(163, this, "ptr", StartContext, "uint", StartContextSize, "ptr", Frames, "uint", FramesSize, "ptr", FrameContexts, "uint", FrameContextsSize, "uint", FrameContextsEntrySize, FramesFilledMarshal, FramesFilled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} OutputControl 
     * @param {Pointer<DEBUG_STACK_FRAME>} Frames 
     * @param {Integer} FramesSize 
     * @param {Pointer} FrameContexts 
     * @param {Integer} FrameContextsSize 
     * @param {Integer} FrameContextsEntrySize 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     */
    OutputContextStackTrace(OutputControl, Frames, FramesSize, FrameContexts, FrameContextsSize, FrameContextsEntrySize, Flags) {
        result := ComCall(164, this, "uint", OutputControl, "ptr", Frames, "uint", FramesSize, "ptr", FrameContexts, "uint", FrameContextsSize, "uint", FrameContextsEntrySize, "uint", Flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Type 
     * @param {Pointer<Integer>} ProcessId 
     * @param {Pointer<Integer>} ThreadId 
     * @param {Pointer} Context 
     * @param {Integer} ContextSize 
     * @param {Pointer<Integer>} ContextUsed 
     * @param {Pointer} ExtraInformation 
     * @param {Integer} ExtraInformationSize 
     * @param {Pointer<Integer>} ExtraInformationUsed 
     * @returns {HRESULT} 
     */
    GetStoredEventInformation(Type, ProcessId, ThreadId, Context, ContextSize, ContextUsed, ExtraInformation, ExtraInformationSize, ExtraInformationUsed) {
        TypeMarshal := Type is VarRef ? "uint*" : "ptr"
        ProcessIdMarshal := ProcessId is VarRef ? "uint*" : "ptr"
        ThreadIdMarshal := ThreadId is VarRef ? "uint*" : "ptr"
        ContextUsedMarshal := ContextUsed is VarRef ? "uint*" : "ptr"
        ExtraInformationUsedMarshal := ExtraInformationUsed is VarRef ? "uint*" : "ptr"

        result := ComCall(165, this, TypeMarshal, Type, ProcessIdMarshal, ProcessId, ThreadIdMarshal, ThreadId, "ptr", Context, "uint", ContextSize, ContextUsedMarshal, ContextUsed, "ptr", ExtraInformation, "uint", ExtraInformationSize, ExtraInformationUsedMarshal, ExtraInformationUsed, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Flags 
     * @param {Integer} WhichString 
     * @param {PSTR} String 
     * @param {Integer} StringSize 
     * @param {Pointer<Integer>} StringNeeded 
     * @returns {HRESULT} 
     */
    GetManagedStatus(Flags, WhichString, String, StringSize, StringNeeded) {
        String := String is String ? StrPtr(String) : String

        FlagsMarshal := Flags is VarRef ? "uint*" : "ptr"
        StringNeededMarshal := StringNeeded is VarRef ? "uint*" : "ptr"

        result := ComCall(166, this, FlagsMarshal, Flags, "uint", WhichString, "ptr", String, "uint", StringSize, StringNeededMarshal, StringNeeded, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Flags 
     * @param {Integer} WhichString 
     * @param {PWSTR} String 
     * @param {Integer} StringSize 
     * @param {Pointer<Integer>} StringNeeded 
     * @returns {HRESULT} 
     */
    GetManagedStatusWide(Flags, WhichString, String, StringSize, StringNeeded) {
        String := String is String ? StrPtr(String) : String

        FlagsMarshal := Flags is VarRef ? "uint*" : "ptr"
        StringNeededMarshal := StringNeeded is VarRef ? "uint*" : "ptr"

        result := ComCall(167, this, FlagsMarshal, Flags, "uint", WhichString, "ptr", String, "uint", StringSize, StringNeededMarshal, StringNeeded, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     */
    ResetManagedStatus(Flags) {
        result := ComCall(168, this, "uint", Flags, "HRESULT")
        return result
    }
}
