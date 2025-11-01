#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugControl6 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugControl6
     * @type {Guid}
     */
    static IID => Guid("{bc0d583f-126d-43a1-9cc4-a860ab1d537b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetInterrupt", "SetInterrupt", "GetInterruptTimeout", "SetInterruptTimeout", "GetLogFile", "OpenLogFile", "CloseLogFile", "GetLogMask", "SetLogMask", "Input", "ReturnInput", "Output", "OutputVaList", "ControlledOutput", "ControlledOutputVaList", "OutputPrompt", "OutputPromptVaList", "GetPromptText", "OutputCurrentState", "OutputVersionInformation", "GetNotifyEventHandle", "SetNotifyEventHandle", "Assemble", "Disassemble", "GetDisassembleEffectiveOffset", "OutputDisassembly", "OutputDisassemblyLines", "GetNearInstruction", "GetStackTrace", "GetReturnOffset", "OutputStackTrace", "GetDebuggeeType", "GetActualProcessorType", "GetExecutingProcessorType", "GetNumberPossibleExecutingProcessorTypes", "GetPossibleExecutingProcessorTypes", "GetNumberProcessors", "GetSystemVersion", "GetPageSize", "IsPointer64Bit", "ReadBugCheckData", "GetNumberSupportedProcessorTypes", "GetSupportedProcessorTypes", "GetProcessorTypeNames", "GetEffectiveProcessorType", "SetEffectiveProcessorType", "GetExecutionStatus", "SetExecutionStatus", "GetCodeLevel", "SetCodeLevel", "GetEngineOptions", "AddEngineOptions", "RemoveEngineOptions", "SetEngineOptions", "GetSystemErrorControl", "SetSystemErrorControl", "GetTextMacro", "SetTextMacro", "GetRadix", "SetRadix", "Evaluate", "CoerceValue", "CoerceValues", "Execute", "ExecuteCommandFile", "GetNumberBreakpoints", "GetBreakpointByIndex", "GetBreakpointById", "GetBreakpointParameters", "AddBreakpoint", "RemoveBreakpoint", "AddExtension", "RemoveExtension", "GetExtensionByPath", "CallExtension", "GetExtensionFunction", "GetWindbgExtensionApis32", "GetWindbgExtensionApis64", "GetNumberEventFilters", "GetEventFilterText", "GetEventFilterCommand", "SetEventFilterCommand", "GetSpecificFilterParameters", "SetSpecificFilterParameters", "GetSpecificFilterArgument", "SetSpecificFilterArgument", "GetExceptionFilterParameters", "SetExceptionFilterParameters", "GetExceptionFilterSecondCommand", "SetExceptionFilterSecondCommand", "WaitForEvent", "GetLastEventInformation", "GetCurrentTimeDate", "GetCurrentSystemUpTime", "GetDumpFormatFlags", "GetNumberTextReplacements", "GetTextReplacement", "SetTextReplacement", "RemoveTextReplacements", "OutputTextReplacements", "GetAssemblyOptions", "AddAssemblyOptions", "RemoveAssemblyOptions", "SetAssemblyOptions", "GetExpressionSyntax", "SetExpressionSyntax", "SetExpressionSyntaxByName", "GetNumberExpressionSyntaxes", "GetExpressionSyntaxNames", "GetNumberEvents", "GetEventIndexDescription", "GetCurrentEventIndex", "SetNextEventIndex", "GetLogFileWide", "OpenLogFileWide", "InputWide", "ReturnInputWide", "OutputWide", "OutputVaListWide", "ControlledOutputWide", "ControlledOutputVaListWide", "OutputPromptWide", "OutputPromptVaListWide", "GetPromptTextWide", "AssembleWide", "DisassembleWide", "GetProcessorTypeNamesWide", "GetTextMacroWide", "SetTextMacroWide", "EvaluateWide", "ExecuteWide", "ExecuteCommandFileWide", "GetBreakpointByIndex2", "GetBreakpointById2", "AddBreakpoint2", "RemoveBreakpoint2", "AddExtensionWide", "GetExtensionByPathWide", "CallExtensionWide", "GetExtensionFunctionWide", "GetEventFilterTextWide", "GetEventFilterCommandWide", "SetEventFilterCommandWide", "GetSpecificFilterArgumentWide", "SetSpecificFilterArgumentWide", "GetExceptionFilterSecondCommandWide", "SetExceptionFilterSecondCommandWide", "GetLastEventInformationWide", "GetTextReplacementWide", "SetTextReplacementWide", "SetExpressionSyntaxByNameWide", "GetExpressionSyntaxNamesWide", "GetEventIndexDescriptionWide", "GetLogFile2", "OpenLogFile2", "GetLogFile2Wide", "OpenLogFile2Wide", "GetSystemVersionValues", "GetSystemVersionString", "GetSystemVersionStringWide", "GetContextStackTrace", "OutputContextStackTrace", "GetStoredEventInformation", "GetManagedStatus", "GetManagedStatusWide", "ResetManagedStatus", "GetStackTraceEx", "OutputStackTraceEx", "GetContextStackTraceEx", "OutputContextStackTraceEx", "GetBreakpointByGuid", "GetExecutionStatusEx", "GetSynchronizationStatus"]

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
     * @param {Pointer<Integer>} Seconds 
     * @returns {HRESULT} 
     */
    GetInterruptTimeout(Seconds) {
        result := ComCall(5, this, "uint*", Seconds, "HRESULT")
        return result
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

        result := ComCall(7, this, "ptr", Buffer, "uint", BufferSize, "uint*", FileSize, "ptr", Append, "HRESULT")
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
     * @param {Pointer<Integer>} Mask 
     * @returns {HRESULT} 
     */
    GetLogMask(Mask) {
        result := ComCall(10, this, "uint*", Mask, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} InputSize 
     * @returns {HRESULT} 
     */
    Input(Buffer, BufferSize, InputSize) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(12, this, "ptr", Buffer, "uint", BufferSize, "uint*", InputSize, "HRESULT")
        return result
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

        result := ComCall(15, this, "uint", Mask, "ptr", Format, "char*", Args, "HRESULT")
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

        result := ComCall(17, this, "uint", OutputControl, "uint", Mask, "ptr", Format, "char*", Args, "HRESULT")
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

        result := ComCall(19, this, "uint", OutputControl, "ptr", Format, "char*", Args, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} TextSize 
     * @returns {HRESULT} 
     */
    GetPromptText(Buffer, BufferSize, TextSize) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(20, this, "ptr", Buffer, "uint", BufferSize, "uint*", TextSize, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} Handle 
     * @returns {HRESULT} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>. 
     * 
     * If the operation fails, the function returns a system error code.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-getnotifyeventhandle
     */
    GetNotifyEventHandle(Handle) {
        result := ComCall(23, this, "uint*", Handle, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} EndOffset 
     * @returns {HRESULT} 
     */
    Assemble(Offset, Instr, EndOffset) {
        Instr := Instr is String ? StrPtr(Instr) : Instr

        result := ComCall(25, this, "uint", Offset, "ptr", Instr, "uint*", EndOffset, "HRESULT")
        return result
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

        result := ComCall(26, this, "uint", Offset, "uint", Flags, "ptr", Buffer, "uint", BufferSize, "uint*", DisassemblySize, "uint*", EndOffset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Offset 
     * @returns {HRESULT} 
     */
    GetDisassembleEffectiveOffset(Offset) {
        result := ComCall(27, this, "uint*", Offset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} OutputControl 
     * @param {Integer} Offset 
     * @param {Integer} Flags 
     * @param {Pointer<Integer>} EndOffset 
     * @returns {HRESULT} 
     */
    OutputDisassembly(OutputControl, Offset, Flags, EndOffset) {
        result := ComCall(28, this, "uint", OutputControl, "uint", Offset, "uint", Flags, "uint*", EndOffset, "HRESULT")
        return result
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
        result := ComCall(29, this, "uint", OutputControl, "uint", PreviousLines, "uint", TotalLines, "uint", Offset, "uint", Flags, "uint*", OffsetLine, "uint*", StartOffset, "uint*", EndOffset, "uint*", LineOffsets, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Integer} Delta 
     * @param {Pointer<Integer>} NearOffset 
     * @returns {HRESULT} 
     */
    GetNearInstruction(Offset, Delta, NearOffset) {
        result := ComCall(30, this, "uint", Offset, "int", Delta, "uint*", NearOffset, "HRESULT")
        return result
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
        result := ComCall(31, this, "uint", FrameOffset, "uint", StackOffset, "uint", InstructionOffset, "ptr", Frames, "uint", FramesSize, "uint*", FramesFilled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Offset 
     * @returns {HRESULT} 
     */
    GetReturnOffset(Offset) {
        result := ComCall(32, this, "uint*", Offset, "HRESULT")
        return result
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
        result := ComCall(34, this, "uint*", Class, "uint*", Qualifier, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Type 
     * @returns {HRESULT} 
     */
    GetActualProcessorType(Type) {
        result := ComCall(35, this, "uint*", Type, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Type 
     * @returns {HRESULT} 
     */
    GetExecutingProcessorType(Type) {
        result := ComCall(36, this, "uint*", Type, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Number 
     * @returns {HRESULT} 
     */
    GetNumberPossibleExecutingProcessorTypes(Number) {
        result := ComCall(37, this, "uint*", Number, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Start 
     * @param {Integer} Count 
     * @param {Pointer<Integer>} Types 
     * @returns {HRESULT} 
     */
    GetPossibleExecutingProcessorTypes(Start, Count, Types) {
        result := ComCall(38, this, "uint", Start, "uint", Count, "uint*", Types, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Number 
     * @returns {HRESULT} 
     */
    GetNumberProcessors(Number) {
        result := ComCall(39, this, "uint*", Number, "HRESULT")
        return result
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

        result := ComCall(40, this, "uint*", PlatformId, "uint*", Major, "uint*", Minor, "ptr", ServicePackString, "uint", ServicePackStringSize, "uint*", ServicePackStringUsed, "uint*", ServicePackNumber, "ptr", BuildString, "uint", BuildStringSize, "uint*", BuildStringUsed, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Size 
     * @returns {HRESULT} 
     */
    GetPageSize(Size) {
        result := ComCall(41, this, "uint*", Size, "HRESULT")
        return result
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
        result := ComCall(43, this, "uint*", Code, "uint*", Arg1, "uint*", Arg2, "uint*", Arg3, "uint*", Arg4, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Number 
     * @returns {HRESULT} 
     */
    GetNumberSupportedProcessorTypes(Number) {
        result := ComCall(44, this, "uint*", Number, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Start 
     * @param {Integer} Count 
     * @param {Pointer<Integer>} Types 
     * @returns {HRESULT} 
     */
    GetSupportedProcessorTypes(Start, Count, Types) {
        result := ComCall(45, this, "uint", Start, "uint", Count, "uint*", Types, "HRESULT")
        return result
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

        result := ComCall(46, this, "uint", Type, "ptr", FullNameBuffer, "uint", FullNameBufferSize, "uint*", FullNameSize, "ptr", AbbrevNameBuffer, "uint", AbbrevNameBufferSize, "uint*", AbbrevNameSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Type 
     * @returns {HRESULT} 
     */
    GetEffectiveProcessorType(Type) {
        result := ComCall(47, this, "uint*", Type, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} Status 
     * @returns {HRESULT} 
     */
    GetExecutionStatus(Status) {
        result := ComCall(49, this, "uint*", Status, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} Level 
     * @returns {HRESULT} 
     */
    GetCodeLevel(Level) {
        result := ComCall(51, this, "uint*", Level, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} Options 
     * @returns {HRESULT} 
     */
    GetEngineOptions(Options) {
        result := ComCall(53, this, "uint*", Options, "HRESULT")
        return result
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
        result := ComCall(57, this, "uint*", OutputLevel, "uint*", BreakLevel, "HRESULT")
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
     * @param {Pointer<Integer>} MacroSize 
     * @returns {HRESULT} 
     */
    GetTextMacro(Slot, Buffer, BufferSize, MacroSize) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(59, this, "uint", Slot, "ptr", Buffer, "uint", BufferSize, "uint*", MacroSize, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} Radix 
     * @returns {HRESULT} 
     */
    GetRadix(Radix) {
        result := ComCall(61, this, "uint*", Radix, "HRESULT")
        return result
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

        result := ComCall(63, this, "ptr", Expression, "uint", DesiredType, "ptr", Value, "uint*", RemainderIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DEBUG_VALUE>} In_R 
     * @param {Integer} OutType 
     * @param {Pointer<DEBUG_VALUE>} Out 
     * @returns {HRESULT} 
     */
    CoerceValue(In_R, OutType, Out) {
        result := ComCall(64, this, "ptr", In_R, "uint", OutType, "ptr", Out, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Count 
     * @param {Pointer<DEBUG_VALUE>} In_R 
     * @param {Pointer<Integer>} OutTypes 
     * @param {Pointer<DEBUG_VALUE>} Out 
     * @returns {HRESULT} 
     */
    CoerceValues(Count, In_R, OutTypes, Out) {
        result := ComCall(65, this, "uint", Count, "ptr", In_R, "uint*", OutTypes, "ptr", Out, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} Number 
     * @returns {HRESULT} 
     */
    GetNumberBreakpoints(Number) {
        result := ComCall(68, this, "uint*", Number, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Pointer<IDebugBreakpoint>} Bp 
     * @returns {HRESULT} 
     */
    GetBreakpointByIndex(Index, Bp) {
        result := ComCall(69, this, "uint", Index, "ptr*", Bp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Id 
     * @param {Pointer<IDebugBreakpoint>} Bp 
     * @returns {HRESULT} 
     */
    GetBreakpointById(Id, Bp) {
        result := ComCall(70, this, "uint", Id, "ptr*", Bp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Count 
     * @param {Pointer<Integer>} Ids 
     * @param {Integer} Start 
     * @param {Pointer<DEBUG_BREAKPOINT_PARAMETERS>} Params 
     * @returns {HRESULT} 
     */
    GetBreakpointParameters(Count, Ids, Start, Params) {
        result := ComCall(71, this, "uint", Count, "uint*", Ids, "uint", Start, "ptr", Params, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Type 
     * @param {Integer} DesiredId 
     * @param {Pointer<IDebugBreakpoint>} Bp 
     * @returns {HRESULT} 
     */
    AddBreakpoint(Type, DesiredId, Bp) {
        result := ComCall(72, this, "uint", Type, "uint", DesiredId, "ptr*", Bp, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} Handle 
     * @returns {HRESULT} 
     */
    AddExtension(Path, Flags, Handle) {
        Path := Path is String ? StrPtr(Path) : Path

        result := ComCall(74, this, "ptr", Path, "uint", Flags, "uint*", Handle, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} Handle 
     * @returns {HRESULT} 
     */
    GetExtensionByPath(Path, Handle) {
        Path := Path is String ? StrPtr(Path) : Path

        result := ComCall(76, this, "ptr", Path, "uint*", Handle, "HRESULT")
        return result
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
     * @param {Pointer<Pointer<FARPROC>>} Function 
     * @returns {HRESULT} 
     */
    GetExtensionFunction(Handle, FuncName, Function) {
        FuncName := FuncName is String ? StrPtr(FuncName) : FuncName

        result := ComCall(78, this, "uint", Handle, "ptr", FuncName, "ptr*", Function, "HRESULT")
        return result
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
        result := ComCall(81, this, "uint*", SpecificEvents, "uint*", SpecificExceptions, "uint*", ArbitraryExceptions, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {PSTR} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} TextSize 
     * @returns {HRESULT} 
     */
    GetEventFilterText(Index, Buffer, BufferSize, TextSize) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(82, this, "uint", Index, "ptr", Buffer, "uint", BufferSize, "uint*", TextSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {PSTR} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} CommandSize 
     * @returns {HRESULT} 
     */
    GetEventFilterCommand(Index, Buffer, BufferSize, CommandSize) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(83, this, "uint", Index, "ptr", Buffer, "uint", BufferSize, "uint*", CommandSize, "HRESULT")
        return result
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
     * @param {Pointer<DEBUG_SPECIFIC_FILTER_PARAMETERS>} Params 
     * @returns {HRESULT} 
     */
    GetSpecificFilterParameters(Start, Count, Params) {
        result := ComCall(85, this, "uint", Start, "uint", Count, "ptr", Params, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} ArgumentSize 
     * @returns {HRESULT} 
     */
    GetSpecificFilterArgument(Index, Buffer, BufferSize, ArgumentSize) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(87, this, "uint", Index, "ptr", Buffer, "uint", BufferSize, "uint*", ArgumentSize, "HRESULT")
        return result
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
     * @param {Pointer<DEBUG_EXCEPTION_FILTER_PARAMETERS>} Params 
     * @returns {HRESULT} 
     */
    GetExceptionFilterParameters(Count, Codes, Start, Params) {
        result := ComCall(89, this, "uint", Count, "uint*", Codes, "uint", Start, "ptr", Params, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} CommandSize 
     * @returns {HRESULT} 
     */
    GetExceptionFilterSecondCommand(Index, Buffer, BufferSize, CommandSize) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(91, this, "uint", Index, "ptr", Buffer, "uint", BufferSize, "uint*", CommandSize, "HRESULT")
        return result
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

        result := ComCall(94, this, "uint*", Type, "uint*", ProcessId, "uint*", ThreadId, "ptr", ExtraInformation, "uint", ExtraInformationSize, "uint*", ExtraInformationUsed, "ptr", Description, "uint", DescriptionSize, "uint*", DescriptionUsed, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} TimeDate 
     * @returns {HRESULT} 
     */
    GetCurrentTimeDate(TimeDate) {
        result := ComCall(95, this, "uint*", TimeDate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} UpTime 
     * @returns {HRESULT} 
     */
    GetCurrentSystemUpTime(UpTime) {
        result := ComCall(96, this, "uint*", UpTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} FormatFlags 
     * @returns {HRESULT} 
     */
    GetDumpFormatFlags(FormatFlags) {
        result := ComCall(97, this, "uint*", FormatFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} NumRepl 
     * @returns {HRESULT} 
     */
    GetNumberTextReplacements(NumRepl) {
        result := ComCall(98, this, "uint*", NumRepl, "HRESULT")
        return result
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

        result := ComCall(99, this, "ptr", SrcText, "uint", Index, "ptr", SrcBuffer, "uint", SrcBufferSize, "uint*", SrcSize, "ptr", DstBuffer, "uint", DstBufferSize, "uint*", DstSize, "HRESULT")
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
     * @param {Pointer<Integer>} Options 
     * @returns {HRESULT} 
     */
    GetAssemblyOptions(Options) {
        result := ComCall(103, this, "uint*", Options, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} Flags 
     * @returns {HRESULT} 
     */
    GetExpressionSyntax(Flags) {
        result := ComCall(107, this, "uint*", Flags, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} Number 
     * @returns {HRESULT} 
     */
    GetNumberExpressionSyntaxes(Number) {
        result := ComCall(110, this, "uint*", Number, "HRESULT")
        return result
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

        result := ComCall(111, this, "uint", Index, "ptr", FullNameBuffer, "uint", FullNameBufferSize, "uint*", FullNameSize, "ptr", AbbrevNameBuffer, "uint", AbbrevNameBufferSize, "uint*", AbbrevNameSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Events 
     * @returns {HRESULT} 
     */
    GetNumberEvents(Events) {
        result := ComCall(112, this, "uint*", Events, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Integer} Which 
     * @param {PSTR} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} DescSize 
     * @returns {HRESULT} 
     */
    GetEventIndexDescription(Index, Which, Buffer, BufferSize, DescSize) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(113, this, "uint", Index, "uint", Which, "ptr", Buffer, "uint", BufferSize, "uint*", DescSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Index 
     * @returns {HRESULT} 
     */
    GetCurrentEventIndex(Index) {
        result := ComCall(114, this, "uint*", Index, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Relation 
     * @param {Integer} Value 
     * @param {Pointer<Integer>} NextIndex 
     * @returns {HRESULT} 
     */
    SetNextEventIndex(Relation, Value, NextIndex) {
        result := ComCall(115, this, "uint", Relation, "uint", Value, "uint*", NextIndex, "HRESULT")
        return result
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

        result := ComCall(116, this, "ptr", Buffer, "uint", BufferSize, "uint*", FileSize, "ptr", Append, "HRESULT")
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
     * @param {Pointer<Integer>} InputSize 
     * @returns {HRESULT} 
     */
    InputWide(Buffer, BufferSize, InputSize) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(118, this, "ptr", Buffer, "uint", BufferSize, "uint*", InputSize, "HRESULT")
        return result
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

        result := ComCall(121, this, "uint", Mask, "ptr", Format, "char*", Args, "HRESULT")
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

        result := ComCall(123, this, "uint", OutputControl, "uint", Mask, "ptr", Format, "char*", Args, "HRESULT")
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

        result := ComCall(125, this, "uint", OutputControl, "ptr", Format, "char*", Args, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} TextSize 
     * @returns {HRESULT} 
     */
    GetPromptTextWide(Buffer, BufferSize, TextSize) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(126, this, "ptr", Buffer, "uint", BufferSize, "uint*", TextSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {PWSTR} Instr 
     * @param {Pointer<Integer>} EndOffset 
     * @returns {HRESULT} 
     */
    AssembleWide(Offset, Instr, EndOffset) {
        Instr := Instr is String ? StrPtr(Instr) : Instr

        result := ComCall(127, this, "uint", Offset, "ptr", Instr, "uint*", EndOffset, "HRESULT")
        return result
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

        result := ComCall(128, this, "uint", Offset, "uint", Flags, "ptr", Buffer, "uint", BufferSize, "uint*", DisassemblySize, "uint*", EndOffset, "HRESULT")
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

        result := ComCall(129, this, "uint", Type, "ptr", FullNameBuffer, "uint", FullNameBufferSize, "uint*", FullNameSize, "ptr", AbbrevNameBuffer, "uint", AbbrevNameBufferSize, "uint*", AbbrevNameSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Slot 
     * @param {PWSTR} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} MacroSize 
     * @returns {HRESULT} 
     */
    GetTextMacroWide(Slot, Buffer, BufferSize, MacroSize) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(130, this, "uint", Slot, "ptr", Buffer, "uint", BufferSize, "uint*", MacroSize, "HRESULT")
        return result
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

        result := ComCall(132, this, "ptr", Expression, "uint", DesiredType, "ptr", Value, "uint*", RemainderIndex, "HRESULT")
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
     * @param {Pointer<IDebugBreakpoint2>} Bp 
     * @returns {HRESULT} 
     */
    GetBreakpointByIndex2(Index, Bp) {
        result := ComCall(135, this, "uint", Index, "ptr*", Bp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Id 
     * @param {Pointer<IDebugBreakpoint2>} Bp 
     * @returns {HRESULT} 
     */
    GetBreakpointById2(Id, Bp) {
        result := ComCall(136, this, "uint", Id, "ptr*", Bp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Type 
     * @param {Integer} DesiredId 
     * @param {Pointer<IDebugBreakpoint2>} Bp 
     * @returns {HRESULT} 
     */
    AddBreakpoint2(Type, DesiredId, Bp) {
        result := ComCall(137, this, "uint", Type, "uint", DesiredId, "ptr*", Bp, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} Handle 
     * @returns {HRESULT} 
     */
    AddExtensionWide(Path, Flags, Handle) {
        Path := Path is String ? StrPtr(Path) : Path

        result := ComCall(139, this, "ptr", Path, "uint", Flags, "uint*", Handle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} Path 
     * @param {Pointer<Integer>} Handle 
     * @returns {HRESULT} 
     */
    GetExtensionByPathWide(Path, Handle) {
        Path := Path is String ? StrPtr(Path) : Path

        result := ComCall(140, this, "ptr", Path, "uint*", Handle, "HRESULT")
        return result
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
     * @param {Pointer<Pointer<FARPROC>>} Function 
     * @returns {HRESULT} 
     */
    GetExtensionFunctionWide(Handle, FuncName, Function) {
        FuncName := FuncName is String ? StrPtr(FuncName) : FuncName

        result := ComCall(142, this, "uint", Handle, "ptr", FuncName, "ptr*", Function, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {PWSTR} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} TextSize 
     * @returns {HRESULT} 
     */
    GetEventFilterTextWide(Index, Buffer, BufferSize, TextSize) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(143, this, "uint", Index, "ptr", Buffer, "uint", BufferSize, "uint*", TextSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {PWSTR} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} CommandSize 
     * @returns {HRESULT} 
     */
    GetEventFilterCommandWide(Index, Buffer, BufferSize, CommandSize) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(144, this, "uint", Index, "ptr", Buffer, "uint", BufferSize, "uint*", CommandSize, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} ArgumentSize 
     * @returns {HRESULT} 
     */
    GetSpecificFilterArgumentWide(Index, Buffer, BufferSize, ArgumentSize) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(146, this, "uint", Index, "ptr", Buffer, "uint", BufferSize, "uint*", ArgumentSize, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} CommandSize 
     * @returns {HRESULT} 
     */
    GetExceptionFilterSecondCommandWide(Index, Buffer, BufferSize, CommandSize) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(148, this, "uint", Index, "ptr", Buffer, "uint", BufferSize, "uint*", CommandSize, "HRESULT")
        return result
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

        result := ComCall(150, this, "uint*", Type, "uint*", ProcessId, "uint*", ThreadId, "ptr", ExtraInformation, "uint", ExtraInformationSize, "uint*", ExtraInformationUsed, "ptr", Description, "uint", DescriptionSize, "uint*", DescriptionUsed, "HRESULT")
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

        result := ComCall(151, this, "ptr", SrcText, "uint", Index, "ptr", SrcBuffer, "uint", SrcBufferSize, "uint*", SrcSize, "ptr", DstBuffer, "uint", DstBufferSize, "uint*", DstSize, "HRESULT")
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

        result := ComCall(154, this, "uint", Index, "ptr", FullNameBuffer, "uint", FullNameBufferSize, "uint*", FullNameSize, "ptr", AbbrevNameBuffer, "uint", AbbrevNameBufferSize, "uint*", AbbrevNameSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Integer} Which 
     * @param {PWSTR} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} DescSize 
     * @returns {HRESULT} 
     */
    GetEventIndexDescriptionWide(Index, Which, Buffer, BufferSize, DescSize) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(155, this, "uint", Index, "uint", Which, "ptr", Buffer, "uint", BufferSize, "uint*", DescSize, "HRESULT")
        return result
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

        result := ComCall(156, this, "ptr", Buffer, "uint", BufferSize, "uint*", FileSize, "uint*", Flags, "HRESULT")
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

        result := ComCall(158, this, "ptr", Buffer, "uint", BufferSize, "uint*", FileSize, "uint*", Flags, "HRESULT")
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
        result := ComCall(160, this, "uint*", PlatformId, "uint*", Win32Major, "uint*", Win32Minor, "uint*", KdMajor, "uint*", KdMinor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Which 
     * @param {PSTR} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} StringSize 
     * @returns {HRESULT} 
     */
    GetSystemVersionString(Which, Buffer, BufferSize, StringSize) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(161, this, "uint", Which, "ptr", Buffer, "uint", BufferSize, "uint*", StringSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Which 
     * @param {PWSTR} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} StringSize 
     * @returns {HRESULT} 
     */
    GetSystemVersionStringWide(Which, Buffer, BufferSize, StringSize) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(162, this, "uint", Which, "ptr", Buffer, "uint", BufferSize, "uint*", StringSize, "HRESULT")
        return result
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
        result := ComCall(163, this, "ptr", StartContext, "uint", StartContextSize, "ptr", Frames, "uint", FramesSize, "ptr", FrameContexts, "uint", FrameContextsSize, "uint", FrameContextsEntrySize, "uint*", FramesFilled, "HRESULT")
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
        result := ComCall(165, this, "uint*", Type, "uint*", ProcessId, "uint*", ThreadId, "ptr", Context, "uint", ContextSize, "uint*", ContextUsed, "ptr", ExtraInformation, "uint", ExtraInformationSize, "uint*", ExtraInformationUsed, "HRESULT")
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

        result := ComCall(166, this, "uint*", Flags, "uint", WhichString, "ptr", String, "uint", StringSize, "uint*", StringNeeded, "HRESULT")
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

        result := ComCall(167, this, "uint*", Flags, "uint", WhichString, "ptr", String, "uint", StringSize, "uint*", StringNeeded, "HRESULT")
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

    /**
     * 
     * @param {Integer} FrameOffset 
     * @param {Integer} StackOffset 
     * @param {Integer} InstructionOffset 
     * @param {Pointer<DEBUG_STACK_FRAME_EX>} Frames 
     * @param {Integer} FramesSize 
     * @param {Pointer<Integer>} FramesFilled 
     * @returns {HRESULT} 
     */
    GetStackTraceEx(FrameOffset, StackOffset, InstructionOffset, Frames, FramesSize, FramesFilled) {
        result := ComCall(169, this, "uint", FrameOffset, "uint", StackOffset, "uint", InstructionOffset, "ptr", Frames, "uint", FramesSize, "uint*", FramesFilled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} OutputControl 
     * @param {Pointer<DEBUG_STACK_FRAME_EX>} Frames 
     * @param {Integer} FramesSize 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     */
    OutputStackTraceEx(OutputControl, Frames, FramesSize, Flags) {
        result := ComCall(170, this, "uint", OutputControl, "ptr", Frames, "uint", FramesSize, "uint", Flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} StartContext 
     * @param {Integer} StartContextSize 
     * @param {Pointer<DEBUG_STACK_FRAME_EX>} Frames 
     * @param {Integer} FramesSize 
     * @param {Pointer} FrameContexts 
     * @param {Integer} FrameContextsSize 
     * @param {Integer} FrameContextsEntrySize 
     * @param {Pointer<Integer>} FramesFilled 
     * @returns {HRESULT} 
     */
    GetContextStackTraceEx(StartContext, StartContextSize, Frames, FramesSize, FrameContexts, FrameContextsSize, FrameContextsEntrySize, FramesFilled) {
        result := ComCall(171, this, "ptr", StartContext, "uint", StartContextSize, "ptr", Frames, "uint", FramesSize, "ptr", FrameContexts, "uint", FrameContextsSize, "uint", FrameContextsEntrySize, "uint*", FramesFilled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} OutputControl 
     * @param {Pointer<DEBUG_STACK_FRAME_EX>} Frames 
     * @param {Integer} FramesSize 
     * @param {Pointer} FrameContexts 
     * @param {Integer} FrameContextsSize 
     * @param {Integer} FrameContextsEntrySize 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     */
    OutputContextStackTraceEx(OutputControl, Frames, FramesSize, FrameContexts, FrameContextsSize, FrameContextsEntrySize, Flags) {
        result := ComCall(172, this, "uint", OutputControl, "ptr", Frames, "uint", FramesSize, "ptr", FrameContexts, "uint", FrameContextsSize, "uint", FrameContextsEntrySize, "uint", Flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} Guid 
     * @param {Pointer<IDebugBreakpoint3>} Bp 
     * @returns {HRESULT} 
     */
    GetBreakpointByGuid(Guid, Bp) {
        result := ComCall(173, this, "ptr", Guid, "ptr*", Bp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Status 
     * @returns {HRESULT} 
     */
    GetExecutionStatusEx(Status) {
        result := ComCall(174, this, "uint*", Status, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} SendsAttempted 
     * @param {Pointer<Integer>} SecondsSinceLastResponse 
     * @returns {HRESULT} 
     */
    GetSynchronizationStatus(SendsAttempted, SecondsSinceLastResponse) {
        result := ComCall(175, this, "uint*", SendsAttempted, "uint*", SecondsSinceLastResponse, "HRESULT")
        return result
    }
}
