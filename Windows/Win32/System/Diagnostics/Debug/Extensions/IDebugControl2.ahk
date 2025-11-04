#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
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
     * @param {Pointer<Integer>} Seconds 
     * @returns {HRESULT} 
     */
    GetInterruptTimeout(Seconds) {
        SecondsMarshal := Seconds is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, SecondsMarshal, Seconds, "HRESULT")
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

        FileSizeMarshal := FileSize is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, "ptr", Buffer, "uint", BufferSize, FileSizeMarshal, FileSize, "ptr", Append, "HRESULT")
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
        MaskMarshal := Mask is VarRef ? "uint*" : "ptr"

        result := ComCall(10, this, MaskMarshal, Mask, "HRESULT")
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

        InputSizeMarshal := InputSize is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, "ptr", Buffer, "uint", BufferSize, InputSizeMarshal, InputSize, "HRESULT")
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
     * @param {Pointer<Integer>} TextSize 
     * @returns {HRESULT} 
     */
    GetPromptText(Buffer, BufferSize, TextSize) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        TextSizeMarshal := TextSize is VarRef ? "uint*" : "ptr"

        result := ComCall(20, this, "ptr", Buffer, "uint", BufferSize, TextSizeMarshal, TextSize, "HRESULT")
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
        HandleMarshal := Handle is VarRef ? "uint*" : "ptr"

        result := ComCall(23, this, HandleMarshal, Handle, "HRESULT")
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

        EndOffsetMarshal := EndOffset is VarRef ? "uint*" : "ptr"

        result := ComCall(25, this, "uint", Offset, "ptr", Instr, EndOffsetMarshal, EndOffset, "HRESULT")
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

        DisassemblySizeMarshal := DisassemblySize is VarRef ? "uint*" : "ptr"
        EndOffsetMarshal := EndOffset is VarRef ? "uint*" : "ptr"

        result := ComCall(26, this, "uint", Offset, "uint", Flags, "ptr", Buffer, "uint", BufferSize, DisassemblySizeMarshal, DisassemblySize, EndOffsetMarshal, EndOffset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Offset 
     * @returns {HRESULT} 
     */
    GetDisassembleEffectiveOffset(Offset) {
        OffsetMarshal := Offset is VarRef ? "uint*" : "ptr"

        result := ComCall(27, this, OffsetMarshal, Offset, "HRESULT")
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
        EndOffsetMarshal := EndOffset is VarRef ? "uint*" : "ptr"

        result := ComCall(28, this, "uint", OutputControl, "uint", Offset, "uint", Flags, EndOffsetMarshal, EndOffset, "HRESULT")
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
     * @param {Pointer<Integer>} NearOffset 
     * @returns {HRESULT} 
     */
    GetNearInstruction(Offset, Delta, NearOffset) {
        NearOffsetMarshal := NearOffset is VarRef ? "uint*" : "ptr"

        result := ComCall(30, this, "uint", Offset, "int", Delta, NearOffsetMarshal, NearOffset, "HRESULT")
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
        FramesFilledMarshal := FramesFilled is VarRef ? "uint*" : "ptr"

        result := ComCall(31, this, "uint", FrameOffset, "uint", StackOffset, "uint", InstructionOffset, "ptr", Frames, "uint", FramesSize, FramesFilledMarshal, FramesFilled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Offset 
     * @returns {HRESULT} 
     */
    GetReturnOffset(Offset) {
        OffsetMarshal := Offset is VarRef ? "uint*" : "ptr"

        result := ComCall(32, this, OffsetMarshal, Offset, "HRESULT")
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
        ClassMarshal := Class is VarRef ? "uint*" : "ptr"
        QualifierMarshal := Qualifier is VarRef ? "uint*" : "ptr"

        result := ComCall(34, this, ClassMarshal, Class, QualifierMarshal, Qualifier, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Type 
     * @returns {HRESULT} 
     */
    GetActualProcessorType(Type) {
        TypeMarshal := Type is VarRef ? "uint*" : "ptr"

        result := ComCall(35, this, TypeMarshal, Type, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Type 
     * @returns {HRESULT} 
     */
    GetExecutingProcessorType(Type) {
        TypeMarshal := Type is VarRef ? "uint*" : "ptr"

        result := ComCall(36, this, TypeMarshal, Type, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Number 
     * @returns {HRESULT} 
     */
    GetNumberPossibleExecutingProcessorTypes(Number) {
        NumberMarshal := Number is VarRef ? "uint*" : "ptr"

        result := ComCall(37, this, NumberMarshal, Number, "HRESULT")
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
        TypesMarshal := Types is VarRef ? "uint*" : "ptr"

        result := ComCall(38, this, "uint", Start, "uint", Count, TypesMarshal, Types, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Number 
     * @returns {HRESULT} 
     */
    GetNumberProcessors(Number) {
        NumberMarshal := Number is VarRef ? "uint*" : "ptr"

        result := ComCall(39, this, NumberMarshal, Number, "HRESULT")
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
     * @param {Pointer<Integer>} Size 
     * @returns {HRESULT} 
     */
    GetPageSize(Size) {
        SizeMarshal := Size is VarRef ? "uint*" : "ptr"

        result := ComCall(41, this, SizeMarshal, Size, "HRESULT")
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
     * @param {Pointer<Integer>} Number 
     * @returns {HRESULT} 
     */
    GetNumberSupportedProcessorTypes(Number) {
        NumberMarshal := Number is VarRef ? "uint*" : "ptr"

        result := ComCall(44, this, NumberMarshal, Number, "HRESULT")
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
        TypesMarshal := Types is VarRef ? "uint*" : "ptr"

        result := ComCall(45, this, "uint", Start, "uint", Count, TypesMarshal, Types, "HRESULT")
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

        FullNameSizeMarshal := FullNameSize is VarRef ? "uint*" : "ptr"
        AbbrevNameSizeMarshal := AbbrevNameSize is VarRef ? "uint*" : "ptr"

        result := ComCall(46, this, "uint", Type, "ptr", FullNameBuffer, "uint", FullNameBufferSize, FullNameSizeMarshal, FullNameSize, "ptr", AbbrevNameBuffer, "uint", AbbrevNameBufferSize, AbbrevNameSizeMarshal, AbbrevNameSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Type 
     * @returns {HRESULT} 
     */
    GetEffectiveProcessorType(Type) {
        TypeMarshal := Type is VarRef ? "uint*" : "ptr"

        result := ComCall(47, this, TypeMarshal, Type, "HRESULT")
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
        StatusMarshal := Status is VarRef ? "uint*" : "ptr"

        result := ComCall(49, this, StatusMarshal, Status, "HRESULT")
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
        LevelMarshal := Level is VarRef ? "uint*" : "ptr"

        result := ComCall(51, this, LevelMarshal, Level, "HRESULT")
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
        OptionsMarshal := Options is VarRef ? "uint*" : "ptr"

        result := ComCall(53, this, OptionsMarshal, Options, "HRESULT")
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
     * @param {Pointer<Integer>} MacroSize 
     * @returns {HRESULT} 
     */
    GetTextMacro(Slot, Buffer, BufferSize, MacroSize) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        MacroSizeMarshal := MacroSize is VarRef ? "uint*" : "ptr"

        result := ComCall(59, this, "uint", Slot, "ptr", Buffer, "uint", BufferSize, MacroSizeMarshal, MacroSize, "HRESULT")
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
        RadixMarshal := Radix is VarRef ? "uint*" : "ptr"

        result := ComCall(61, this, RadixMarshal, Radix, "HRESULT")
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

        RemainderIndexMarshal := RemainderIndex is VarRef ? "uint*" : "ptr"

        result := ComCall(63, this, "ptr", Expression, "uint", DesiredType, "ptr", Value, RemainderIndexMarshal, RemainderIndex, "HRESULT")
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
        OutTypesMarshal := OutTypes is VarRef ? "uint*" : "ptr"

        result := ComCall(65, this, "uint", Count, "ptr", In_R, OutTypesMarshal, OutTypes, "ptr", Out, "HRESULT")
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
        NumberMarshal := Number is VarRef ? "uint*" : "ptr"

        result := ComCall(68, this, NumberMarshal, Number, "HRESULT")
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
        IdsMarshal := Ids is VarRef ? "uint*" : "ptr"

        result := ComCall(71, this, "uint", Count, IdsMarshal, Ids, "uint", Start, "ptr", Params, "HRESULT")
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

        HandleMarshal := Handle is VarRef ? "uint*" : "ptr"

        result := ComCall(74, this, "ptr", Path, "uint", Flags, HandleMarshal, Handle, "HRESULT")
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

        HandleMarshal := Handle is VarRef ? "uint*" : "ptr"

        result := ComCall(76, this, "ptr", Path, HandleMarshal, Handle, "HRESULT")
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

        FunctionMarshal := Function is VarRef ? "ptr*" : "ptr"

        result := ComCall(78, this, "uint", Handle, "ptr", FuncName, FunctionMarshal, Function, "HRESULT")
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
     * @param {Pointer<Integer>} TextSize 
     * @returns {HRESULT} 
     */
    GetEventFilterText(Index, Buffer, BufferSize, TextSize) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        TextSizeMarshal := TextSize is VarRef ? "uint*" : "ptr"

        result := ComCall(82, this, "uint", Index, "ptr", Buffer, "uint", BufferSize, TextSizeMarshal, TextSize, "HRESULT")
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

        CommandSizeMarshal := CommandSize is VarRef ? "uint*" : "ptr"

        result := ComCall(83, this, "uint", Index, "ptr", Buffer, "uint", BufferSize, CommandSizeMarshal, CommandSize, "HRESULT")
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

        ArgumentSizeMarshal := ArgumentSize is VarRef ? "uint*" : "ptr"

        result := ComCall(87, this, "uint", Index, "ptr", Buffer, "uint", BufferSize, ArgumentSizeMarshal, ArgumentSize, "HRESULT")
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
        CodesMarshal := Codes is VarRef ? "uint*" : "ptr"

        result := ComCall(89, this, "uint", Count, CodesMarshal, Codes, "uint", Start, "ptr", Params, "HRESULT")
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

        CommandSizeMarshal := CommandSize is VarRef ? "uint*" : "ptr"

        result := ComCall(91, this, "uint", Index, "ptr", Buffer, "uint", BufferSize, CommandSizeMarshal, CommandSize, "HRESULT")
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
     * @param {Pointer<Integer>} TimeDate 
     * @returns {HRESULT} 
     */
    GetCurrentTimeDate(TimeDate) {
        TimeDateMarshal := TimeDate is VarRef ? "uint*" : "ptr"

        result := ComCall(95, this, TimeDateMarshal, TimeDate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} UpTime 
     * @returns {HRESULT} 
     */
    GetCurrentSystemUpTime(UpTime) {
        UpTimeMarshal := UpTime is VarRef ? "uint*" : "ptr"

        result := ComCall(96, this, UpTimeMarshal, UpTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} FormatFlags 
     * @returns {HRESULT} 
     */
    GetDumpFormatFlags(FormatFlags) {
        FormatFlagsMarshal := FormatFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(97, this, FormatFlagsMarshal, FormatFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} NumRepl 
     * @returns {HRESULT} 
     */
    GetNumberTextReplacements(NumRepl) {
        NumReplMarshal := NumRepl is VarRef ? "uint*" : "ptr"

        result := ComCall(98, this, NumReplMarshal, NumRepl, "HRESULT")
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
