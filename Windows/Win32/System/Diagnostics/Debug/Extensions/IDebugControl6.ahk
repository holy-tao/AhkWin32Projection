#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugControl6 extends IUnknown{
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
     * 
     * @returns {HRESULT} 
     */
    GetInterrupt() {
        result := ComCall(3, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     */
    SetInterrupt(Flags) {
        result := ComCall(4, this, "uint", Flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} Seconds 
     * @returns {HRESULT} 
     */
    GetInterruptTimeout(Seconds) {
        result := ComCall(5, this, "uint*", Seconds, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Seconds 
     * @returns {HRESULT} 
     */
    SetInterruptTimeout(Seconds) {
        result := ComCall(6, this, "uint", Seconds, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PSTR} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<UInt32>} FileSize 
     * @param {Pointer<BOOL>} Append 
     * @returns {HRESULT} 
     */
    GetLogFile(Buffer, BufferSize, FileSize, Append) {
        result := ComCall(7, this, "ptr", Buffer, "uint", BufferSize, "uint*", FileSize, "ptr", Append, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PSTR} File 
     * @param {BOOL} Append 
     * @returns {HRESULT} 
     */
    OpenLogFile(File, Append) {
        result := ComCall(8, this, "ptr", File, "int", Append, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    CloseLogFile() {
        result := ComCall(9, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} Mask 
     * @returns {HRESULT} 
     */
    GetLogMask(Mask) {
        result := ComCall(10, this, "uint*", Mask, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Mask 
     * @returns {HRESULT} 
     */
    SetLogMask(Mask) {
        result := ComCall(11, this, "uint", Mask, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PSTR} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<UInt32>} InputSize 
     * @returns {HRESULT} 
     */
    Input(Buffer, BufferSize, InputSize) {
        result := ComCall(12, this, "ptr", Buffer, "uint", BufferSize, "uint*", InputSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PSTR} Buffer 
     * @returns {HRESULT} 
     */
    ReturnInput(Buffer) {
        result := ComCall(13, this, "ptr", Buffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Mask 
     * @param {PSTR} Format 
     * @returns {HRESULT} 
     */
    Output(Mask, Format) {
        result := ComCall(14, this, "uint", Mask, "ptr", Format, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Mask 
     * @param {PSTR} Format 
     * @param {Pointer<SByte>} Args 
     * @returns {HRESULT} 
     */
    OutputVaList(Mask, Format, Args) {
        result := ComCall(15, this, "uint", Mask, "ptr", Format, "char*", Args, "int")
        if(result != 0)
            throw OSError(result)

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
        result := ComCall(16, this, "uint", OutputControl, "uint", Mask, "ptr", Format, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} OutputControl 
     * @param {Integer} Mask 
     * @param {PSTR} Format 
     * @param {Pointer<SByte>} Args 
     * @returns {HRESULT} 
     */
    ControlledOutputVaList(OutputControl, Mask, Format, Args) {
        result := ComCall(17, this, "uint", OutputControl, "uint", Mask, "ptr", Format, "char*", Args, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} OutputControl 
     * @param {PSTR} Format 
     * @returns {HRESULT} 
     */
    OutputPrompt(OutputControl, Format) {
        result := ComCall(18, this, "uint", OutputControl, "ptr", Format, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} OutputControl 
     * @param {PSTR} Format 
     * @param {Pointer<SByte>} Args 
     * @returns {HRESULT} 
     */
    OutputPromptVaList(OutputControl, Format, Args) {
        result := ComCall(19, this, "uint", OutputControl, "ptr", Format, "char*", Args, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PSTR} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<UInt32>} TextSize 
     * @returns {HRESULT} 
     */
    GetPromptText(Buffer, BufferSize, TextSize) {
        result := ComCall(20, this, "ptr", Buffer, "uint", BufferSize, "uint*", TextSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} OutputControl 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     */
    OutputCurrentState(OutputControl, Flags) {
        result := ComCall(21, this, "uint", OutputControl, "uint", Flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} OutputControl 
     * @returns {HRESULT} 
     */
    OutputVersionInformation(OutputControl) {
        result := ComCall(22, this, "uint", OutputControl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves a handle to a notification event.
     * @param {Pointer<UInt64>} Handle 
     * @returns {HRESULT} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>. 
     * 
     * If the operation fails, the function returns a system error code.
     * @see https://docs.microsoft.com/windows/win32/api//clusapi/nf-clusapi-getnotifyeventhandle
     */
    GetNotifyEventHandle(Handle) {
        result := ComCall(23, this, "uint*", Handle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Handle 
     * @returns {HRESULT} 
     */
    SetNotifyEventHandle(Handle) {
        result := ComCall(24, this, "uint", Handle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {PSTR} Instr 
     * @param {Pointer<UInt64>} EndOffset 
     * @returns {HRESULT} 
     */
    Assemble(Offset, Instr, EndOffset) {
        result := ComCall(25, this, "uint", Offset, "ptr", Instr, "uint*", EndOffset, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Integer} Flags 
     * @param {PSTR} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<UInt32>} DisassemblySize 
     * @param {Pointer<UInt64>} EndOffset 
     * @returns {HRESULT} 
     */
    Disassemble(Offset, Flags, Buffer, BufferSize, DisassemblySize, EndOffset) {
        result := ComCall(26, this, "uint", Offset, "uint", Flags, "ptr", Buffer, "uint", BufferSize, "uint*", DisassemblySize, "uint*", EndOffset, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt64>} Offset 
     * @returns {HRESULT} 
     */
    GetDisassembleEffectiveOffset(Offset) {
        result := ComCall(27, this, "uint*", Offset, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} OutputControl 
     * @param {Integer} Offset 
     * @param {Integer} Flags 
     * @param {Pointer<UInt64>} EndOffset 
     * @returns {HRESULT} 
     */
    OutputDisassembly(OutputControl, Offset, Flags, EndOffset) {
        result := ComCall(28, this, "uint", OutputControl, "uint", Offset, "uint", Flags, "uint*", EndOffset, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} OutputControl 
     * @param {Integer} PreviousLines 
     * @param {Integer} TotalLines 
     * @param {Integer} Offset 
     * @param {Integer} Flags 
     * @param {Pointer<UInt32>} OffsetLine 
     * @param {Pointer<UInt64>} StartOffset 
     * @param {Pointer<UInt64>} EndOffset 
     * @param {Pointer<UInt64>} LineOffsets 
     * @returns {HRESULT} 
     */
    OutputDisassemblyLines(OutputControl, PreviousLines, TotalLines, Offset, Flags, OffsetLine, StartOffset, EndOffset, LineOffsets) {
        result := ComCall(29, this, "uint", OutputControl, "uint", PreviousLines, "uint", TotalLines, "uint", Offset, "uint", Flags, "uint*", OffsetLine, "uint*", StartOffset, "uint*", EndOffset, "uint*", LineOffsets, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Integer} Delta 
     * @param {Pointer<UInt64>} NearOffset 
     * @returns {HRESULT} 
     */
    GetNearInstruction(Offset, Delta, NearOffset) {
        result := ComCall(30, this, "uint", Offset, "int", Delta, "uint*", NearOffset, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} FrameOffset 
     * @param {Integer} StackOffset 
     * @param {Integer} InstructionOffset 
     * @param {Pointer<DEBUG_STACK_FRAME>} Frames 
     * @param {Integer} FramesSize 
     * @param {Pointer<UInt32>} FramesFilled 
     * @returns {HRESULT} 
     */
    GetStackTrace(FrameOffset, StackOffset, InstructionOffset, Frames, FramesSize, FramesFilled) {
        result := ComCall(31, this, "uint", FrameOffset, "uint", StackOffset, "uint", InstructionOffset, "ptr", Frames, "uint", FramesSize, "uint*", FramesFilled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt64>} Offset 
     * @returns {HRESULT} 
     */
    GetReturnOffset(Offset) {
        result := ComCall(32, this, "uint*", Offset, "int")
        if(result != 0)
            throw OSError(result)

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
        result := ComCall(33, this, "uint", OutputControl, "ptr", Frames, "uint", FramesSize, "uint", Flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} Class 
     * @param {Pointer<UInt32>} Qualifier 
     * @returns {HRESULT} 
     */
    GetDebuggeeType(Class, Qualifier) {
        result := ComCall(34, this, "uint*", Class, "uint*", Qualifier, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} Type 
     * @returns {HRESULT} 
     */
    GetActualProcessorType(Type) {
        result := ComCall(35, this, "uint*", Type, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} Type 
     * @returns {HRESULT} 
     */
    GetExecutingProcessorType(Type) {
        result := ComCall(36, this, "uint*", Type, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} Number 
     * @returns {HRESULT} 
     */
    GetNumberPossibleExecutingProcessorTypes(Number) {
        result := ComCall(37, this, "uint*", Number, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Start 
     * @param {Integer} Count 
     * @param {Pointer<UInt32>} Types 
     * @returns {HRESULT} 
     */
    GetPossibleExecutingProcessorTypes(Start, Count, Types) {
        result := ComCall(38, this, "uint", Start, "uint", Count, "uint*", Types, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} Number 
     * @returns {HRESULT} 
     */
    GetNumberProcessors(Number) {
        result := ComCall(39, this, "uint*", Number, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} PlatformId 
     * @param {Pointer<UInt32>} Major 
     * @param {Pointer<UInt32>} Minor 
     * @param {PSTR} ServicePackString 
     * @param {Integer} ServicePackStringSize 
     * @param {Pointer<UInt32>} ServicePackStringUsed 
     * @param {Pointer<UInt32>} ServicePackNumber 
     * @param {PSTR} BuildString 
     * @param {Integer} BuildStringSize 
     * @param {Pointer<UInt32>} BuildStringUsed 
     * @returns {HRESULT} 
     */
    GetSystemVersion(PlatformId, Major, Minor, ServicePackString, ServicePackStringSize, ServicePackStringUsed, ServicePackNumber, BuildString, BuildStringSize, BuildStringUsed) {
        result := ComCall(40, this, "uint*", PlatformId, "uint*", Major, "uint*", Minor, "ptr", ServicePackString, "uint", ServicePackStringSize, "uint*", ServicePackStringUsed, "uint*", ServicePackNumber, "ptr", BuildString, "uint", BuildStringSize, "uint*", BuildStringUsed, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} Size 
     * @returns {HRESULT} 
     */
    GetPageSize(Size) {
        result := ComCall(41, this, "uint*", Size, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    IsPointer64Bit() {
        result := ComCall(42, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} Code 
     * @param {Pointer<UInt64>} Arg1 
     * @param {Pointer<UInt64>} Arg2 
     * @param {Pointer<UInt64>} Arg3 
     * @param {Pointer<UInt64>} Arg4 
     * @returns {HRESULT} 
     */
    ReadBugCheckData(Code, Arg1, Arg2, Arg3, Arg4) {
        result := ComCall(43, this, "uint*", Code, "uint*", Arg1, "uint*", Arg2, "uint*", Arg3, "uint*", Arg4, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} Number 
     * @returns {HRESULT} 
     */
    GetNumberSupportedProcessorTypes(Number) {
        result := ComCall(44, this, "uint*", Number, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Start 
     * @param {Integer} Count 
     * @param {Pointer<UInt32>} Types 
     * @returns {HRESULT} 
     */
    GetSupportedProcessorTypes(Start, Count, Types) {
        result := ComCall(45, this, "uint", Start, "uint", Count, "uint*", Types, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Type 
     * @param {PSTR} FullNameBuffer 
     * @param {Integer} FullNameBufferSize 
     * @param {Pointer<UInt32>} FullNameSize 
     * @param {PSTR} AbbrevNameBuffer 
     * @param {Integer} AbbrevNameBufferSize 
     * @param {Pointer<UInt32>} AbbrevNameSize 
     * @returns {HRESULT} 
     */
    GetProcessorTypeNames(Type, FullNameBuffer, FullNameBufferSize, FullNameSize, AbbrevNameBuffer, AbbrevNameBufferSize, AbbrevNameSize) {
        result := ComCall(46, this, "uint", Type, "ptr", FullNameBuffer, "uint", FullNameBufferSize, "uint*", FullNameSize, "ptr", AbbrevNameBuffer, "uint", AbbrevNameBufferSize, "uint*", AbbrevNameSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} Type 
     * @returns {HRESULT} 
     */
    GetEffectiveProcessorType(Type) {
        result := ComCall(47, this, "uint*", Type, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Type 
     * @returns {HRESULT} 
     */
    SetEffectiveProcessorType(Type) {
        result := ComCall(48, this, "uint", Type, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} Status 
     * @returns {HRESULT} 
     */
    GetExecutionStatus(Status) {
        result := ComCall(49, this, "uint*", Status, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Status 
     * @returns {HRESULT} 
     */
    SetExecutionStatus(Status) {
        result := ComCall(50, this, "uint", Status, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} Level 
     * @returns {HRESULT} 
     */
    GetCodeLevel(Level) {
        result := ComCall(51, this, "uint*", Level, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Level 
     * @returns {HRESULT} 
     */
    SetCodeLevel(Level) {
        result := ComCall(52, this, "uint", Level, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} Options 
     * @returns {HRESULT} 
     */
    GetEngineOptions(Options) {
        result := ComCall(53, this, "uint*", Options, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Options 
     * @returns {HRESULT} 
     */
    AddEngineOptions(Options) {
        result := ComCall(54, this, "uint", Options, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Options 
     * @returns {HRESULT} 
     */
    RemoveEngineOptions(Options) {
        result := ComCall(55, this, "uint", Options, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Options 
     * @returns {HRESULT} 
     */
    SetEngineOptions(Options) {
        result := ComCall(56, this, "uint", Options, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} OutputLevel 
     * @param {Pointer<UInt32>} BreakLevel 
     * @returns {HRESULT} 
     */
    GetSystemErrorControl(OutputLevel, BreakLevel) {
        result := ComCall(57, this, "uint*", OutputLevel, "uint*", BreakLevel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} OutputLevel 
     * @param {Integer} BreakLevel 
     * @returns {HRESULT} 
     */
    SetSystemErrorControl(OutputLevel, BreakLevel) {
        result := ComCall(58, this, "uint", OutputLevel, "uint", BreakLevel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Slot 
     * @param {PSTR} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<UInt32>} MacroSize 
     * @returns {HRESULT} 
     */
    GetTextMacro(Slot, Buffer, BufferSize, MacroSize) {
        result := ComCall(59, this, "uint", Slot, "ptr", Buffer, "uint", BufferSize, "uint*", MacroSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Slot 
     * @param {PSTR} Macro 
     * @returns {HRESULT} 
     */
    SetTextMacro(Slot, Macro) {
        result := ComCall(60, this, "uint", Slot, "ptr", Macro, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} Radix 
     * @returns {HRESULT} 
     */
    GetRadix(Radix) {
        result := ComCall(61, this, "uint*", Radix, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Radix 
     * @returns {HRESULT} 
     */
    SetRadix(Radix) {
        result := ComCall(62, this, "uint", Radix, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PSTR} Expression 
     * @param {Integer} DesiredType 
     * @param {Pointer<DEBUG_VALUE>} Value 
     * @param {Pointer<UInt32>} RemainderIndex 
     * @returns {HRESULT} 
     */
    Evaluate(Expression, DesiredType, Value, RemainderIndex) {
        result := ComCall(63, this, "ptr", Expression, "uint", DesiredType, "ptr", Value, "uint*", RemainderIndex, "int")
        if(result != 0)
            throw OSError(result)

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
        result := ComCall(64, this, "ptr", In_R, "uint", OutType, "ptr", Out, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Count 
     * @param {Pointer<DEBUG_VALUE>} In_R 
     * @param {Pointer<UInt32>} OutTypes 
     * @param {Pointer<DEBUG_VALUE>} Out 
     * @returns {HRESULT} 
     */
    CoerceValues(Count, In_R, OutTypes, Out) {
        result := ComCall(65, this, "uint", Count, "ptr", In_R, "uint*", OutTypes, "ptr", Out, "int")
        if(result != 0)
            throw OSError(result)

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
        result := ComCall(66, this, "uint", OutputControl, "ptr", Command, "uint", Flags, "int")
        if(result != 0)
            throw OSError(result)

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
        result := ComCall(67, this, "uint", OutputControl, "ptr", CommandFile, "uint", Flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} Number 
     * @returns {HRESULT} 
     */
    GetNumberBreakpoints(Number) {
        result := ComCall(68, this, "uint*", Number, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Pointer<IDebugBreakpoint>} Bp 
     * @returns {HRESULT} 
     */
    GetBreakpointByIndex(Index, Bp) {
        result := ComCall(69, this, "uint", Index, "ptr", Bp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Id 
     * @param {Pointer<IDebugBreakpoint>} Bp 
     * @returns {HRESULT} 
     */
    GetBreakpointById(Id, Bp) {
        result := ComCall(70, this, "uint", Id, "ptr", Bp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Count 
     * @param {Pointer<UInt32>} Ids 
     * @param {Integer} Start 
     * @param {Pointer<DEBUG_BREAKPOINT_PARAMETERS>} Params 
     * @returns {HRESULT} 
     */
    GetBreakpointParameters(Count, Ids, Start, Params) {
        result := ComCall(71, this, "uint", Count, "uint*", Ids, "uint", Start, "ptr", Params, "int")
        if(result != 0)
            throw OSError(result)

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
        result := ComCall(72, this, "uint", Type, "uint", DesiredId, "ptr", Bp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDebugBreakpoint>} Bp 
     * @returns {HRESULT} 
     */
    RemoveBreakpoint(Bp) {
        result := ComCall(73, this, "ptr", Bp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PSTR} Path 
     * @param {Integer} Flags 
     * @param {Pointer<UInt64>} Handle 
     * @returns {HRESULT} 
     */
    AddExtension(Path, Flags, Handle) {
        result := ComCall(74, this, "ptr", Path, "uint", Flags, "uint*", Handle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Handle 
     * @returns {HRESULT} 
     */
    RemoveExtension(Handle) {
        result := ComCall(75, this, "uint", Handle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PSTR} Path 
     * @param {Pointer<UInt64>} Handle 
     * @returns {HRESULT} 
     */
    GetExtensionByPath(Path, Handle) {
        result := ComCall(76, this, "ptr", Path, "uint*", Handle, "int")
        if(result != 0)
            throw OSError(result)

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
        result := ComCall(77, this, "uint", Handle, "ptr", Function, "ptr", Arguments, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Handle 
     * @param {PSTR} FuncName 
     * @param {Pointer<FARPROC>} Function 
     * @returns {HRESULT} 
     */
    GetExtensionFunction(Handle, FuncName, Function) {
        result := ComCall(78, this, "uint", Handle, "ptr", FuncName, "ptr", Function, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<WINDBG_EXTENSION_APIS32>} Api 
     * @returns {HRESULT} 
     */
    GetWindbgExtensionApis32(Api) {
        result := ComCall(79, this, "ptr", Api, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<WINDBG_EXTENSION_APIS64>} Api 
     * @returns {HRESULT} 
     */
    GetWindbgExtensionApis64(Api) {
        result := ComCall(80, this, "ptr", Api, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} SpecificEvents 
     * @param {Pointer<UInt32>} SpecificExceptions 
     * @param {Pointer<UInt32>} ArbitraryExceptions 
     * @returns {HRESULT} 
     */
    GetNumberEventFilters(SpecificEvents, SpecificExceptions, ArbitraryExceptions) {
        result := ComCall(81, this, "uint*", SpecificEvents, "uint*", SpecificExceptions, "uint*", ArbitraryExceptions, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {PSTR} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<UInt32>} TextSize 
     * @returns {HRESULT} 
     */
    GetEventFilterText(Index, Buffer, BufferSize, TextSize) {
        result := ComCall(82, this, "uint", Index, "ptr", Buffer, "uint", BufferSize, "uint*", TextSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {PSTR} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<UInt32>} CommandSize 
     * @returns {HRESULT} 
     */
    GetEventFilterCommand(Index, Buffer, BufferSize, CommandSize) {
        result := ComCall(83, this, "uint", Index, "ptr", Buffer, "uint", BufferSize, "uint*", CommandSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {PSTR} Command 
     * @returns {HRESULT} 
     */
    SetEventFilterCommand(Index, Command) {
        result := ComCall(84, this, "uint", Index, "ptr", Command, "int")
        if(result != 0)
            throw OSError(result)

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
        result := ComCall(85, this, "uint", Start, "uint", Count, "ptr", Params, "int")
        if(result != 0)
            throw OSError(result)

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
        result := ComCall(86, this, "uint", Start, "uint", Count, "ptr", Params, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {PSTR} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<UInt32>} ArgumentSize 
     * @returns {HRESULT} 
     */
    GetSpecificFilterArgument(Index, Buffer, BufferSize, ArgumentSize) {
        result := ComCall(87, this, "uint", Index, "ptr", Buffer, "uint", BufferSize, "uint*", ArgumentSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {PSTR} Argument 
     * @returns {HRESULT} 
     */
    SetSpecificFilterArgument(Index, Argument) {
        result := ComCall(88, this, "uint", Index, "ptr", Argument, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Count 
     * @param {Pointer<UInt32>} Codes 
     * @param {Integer} Start 
     * @param {Pointer<DEBUG_EXCEPTION_FILTER_PARAMETERS>} Params 
     * @returns {HRESULT} 
     */
    GetExceptionFilterParameters(Count, Codes, Start, Params) {
        result := ComCall(89, this, "uint", Count, "uint*", Codes, "uint", Start, "ptr", Params, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Count 
     * @param {Pointer<DEBUG_EXCEPTION_FILTER_PARAMETERS>} Params 
     * @returns {HRESULT} 
     */
    SetExceptionFilterParameters(Count, Params) {
        result := ComCall(90, this, "uint", Count, "ptr", Params, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {PSTR} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<UInt32>} CommandSize 
     * @returns {HRESULT} 
     */
    GetExceptionFilterSecondCommand(Index, Buffer, BufferSize, CommandSize) {
        result := ComCall(91, this, "uint", Index, "ptr", Buffer, "uint", BufferSize, "uint*", CommandSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {PSTR} Command 
     * @returns {HRESULT} 
     */
    SetExceptionFilterSecondCommand(Index, Command) {
        result := ComCall(92, this, "uint", Index, "ptr", Command, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @param {Integer} Timeout 
     * @returns {HRESULT} 
     */
    WaitForEvent(Flags, Timeout) {
        result := ComCall(93, this, "uint", Flags, "uint", Timeout, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} Type 
     * @param {Pointer<UInt32>} ProcessId 
     * @param {Pointer<UInt32>} ThreadId 
     * @param {Pointer} ExtraInformation 
     * @param {Integer} ExtraInformationSize 
     * @param {Pointer<UInt32>} ExtraInformationUsed 
     * @param {PSTR} Description 
     * @param {Integer} DescriptionSize 
     * @param {Pointer<UInt32>} DescriptionUsed 
     * @returns {HRESULT} 
     */
    GetLastEventInformation(Type, ProcessId, ThreadId, ExtraInformation, ExtraInformationSize, ExtraInformationUsed, Description, DescriptionSize, DescriptionUsed) {
        result := ComCall(94, this, "uint*", Type, "uint*", ProcessId, "uint*", ThreadId, "ptr", ExtraInformation, "uint", ExtraInformationSize, "uint*", ExtraInformationUsed, "ptr", Description, "uint", DescriptionSize, "uint*", DescriptionUsed, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} TimeDate 
     * @returns {HRESULT} 
     */
    GetCurrentTimeDate(TimeDate) {
        result := ComCall(95, this, "uint*", TimeDate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} UpTime 
     * @returns {HRESULT} 
     */
    GetCurrentSystemUpTime(UpTime) {
        result := ComCall(96, this, "uint*", UpTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} FormatFlags 
     * @returns {HRESULT} 
     */
    GetDumpFormatFlags(FormatFlags) {
        result := ComCall(97, this, "uint*", FormatFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} NumRepl 
     * @returns {HRESULT} 
     */
    GetNumberTextReplacements(NumRepl) {
        result := ComCall(98, this, "uint*", NumRepl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PSTR} SrcText 
     * @param {Integer} Index 
     * @param {PSTR} SrcBuffer 
     * @param {Integer} SrcBufferSize 
     * @param {Pointer<UInt32>} SrcSize 
     * @param {PSTR} DstBuffer 
     * @param {Integer} DstBufferSize 
     * @param {Pointer<UInt32>} DstSize 
     * @returns {HRESULT} 
     */
    GetTextReplacement(SrcText, Index, SrcBuffer, SrcBufferSize, SrcSize, DstBuffer, DstBufferSize, DstSize) {
        result := ComCall(99, this, "ptr", SrcText, "uint", Index, "ptr", SrcBuffer, "uint", SrcBufferSize, "uint*", SrcSize, "ptr", DstBuffer, "uint", DstBufferSize, "uint*", DstSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PSTR} SrcText 
     * @param {PSTR} DstText 
     * @returns {HRESULT} 
     */
    SetTextReplacement(SrcText, DstText) {
        result := ComCall(100, this, "ptr", SrcText, "ptr", DstText, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RemoveTextReplacements() {
        result := ComCall(101, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} OutputControl 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     */
    OutputTextReplacements(OutputControl, Flags) {
        result := ComCall(102, this, "uint", OutputControl, "uint", Flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} Options 
     * @returns {HRESULT} 
     */
    GetAssemblyOptions(Options) {
        result := ComCall(103, this, "uint*", Options, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Options 
     * @returns {HRESULT} 
     */
    AddAssemblyOptions(Options) {
        result := ComCall(104, this, "uint", Options, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Options 
     * @returns {HRESULT} 
     */
    RemoveAssemblyOptions(Options) {
        result := ComCall(105, this, "uint", Options, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Options 
     * @returns {HRESULT} 
     */
    SetAssemblyOptions(Options) {
        result := ComCall(106, this, "uint", Options, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} Flags 
     * @returns {HRESULT} 
     */
    GetExpressionSyntax(Flags) {
        result := ComCall(107, this, "uint*", Flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     */
    SetExpressionSyntax(Flags) {
        result := ComCall(108, this, "uint", Flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PSTR} AbbrevName 
     * @returns {HRESULT} 
     */
    SetExpressionSyntaxByName(AbbrevName) {
        result := ComCall(109, this, "ptr", AbbrevName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} Number 
     * @returns {HRESULT} 
     */
    GetNumberExpressionSyntaxes(Number) {
        result := ComCall(110, this, "uint*", Number, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {PSTR} FullNameBuffer 
     * @param {Integer} FullNameBufferSize 
     * @param {Pointer<UInt32>} FullNameSize 
     * @param {PSTR} AbbrevNameBuffer 
     * @param {Integer} AbbrevNameBufferSize 
     * @param {Pointer<UInt32>} AbbrevNameSize 
     * @returns {HRESULT} 
     */
    GetExpressionSyntaxNames(Index, FullNameBuffer, FullNameBufferSize, FullNameSize, AbbrevNameBuffer, AbbrevNameBufferSize, AbbrevNameSize) {
        result := ComCall(111, this, "uint", Index, "ptr", FullNameBuffer, "uint", FullNameBufferSize, "uint*", FullNameSize, "ptr", AbbrevNameBuffer, "uint", AbbrevNameBufferSize, "uint*", AbbrevNameSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} Events 
     * @returns {HRESULT} 
     */
    GetNumberEvents(Events) {
        result := ComCall(112, this, "uint*", Events, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Integer} Which 
     * @param {PSTR} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<UInt32>} DescSize 
     * @returns {HRESULT} 
     */
    GetEventIndexDescription(Index, Which, Buffer, BufferSize, DescSize) {
        result := ComCall(113, this, "uint", Index, "uint", Which, "ptr", Buffer, "uint", BufferSize, "uint*", DescSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} Index 
     * @returns {HRESULT} 
     */
    GetCurrentEventIndex(Index) {
        result := ComCall(114, this, "uint*", Index, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Relation 
     * @param {Integer} Value 
     * @param {Pointer<UInt32>} NextIndex 
     * @returns {HRESULT} 
     */
    SetNextEventIndex(Relation, Value, NextIndex) {
        result := ComCall(115, this, "uint", Relation, "uint", Value, "uint*", NextIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<UInt32>} FileSize 
     * @param {Pointer<BOOL>} Append 
     * @returns {HRESULT} 
     */
    GetLogFileWide(Buffer, BufferSize, FileSize, Append) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(116, this, "ptr", Buffer, "uint", BufferSize, "uint*", FileSize, "ptr", Append, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(117, this, "ptr", File, "int", Append, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<UInt32>} InputSize 
     * @returns {HRESULT} 
     */
    InputWide(Buffer, BufferSize, InputSize) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(118, this, "ptr", Buffer, "uint", BufferSize, "uint*", InputSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} Buffer 
     * @returns {HRESULT} 
     */
    ReturnInputWide(Buffer) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(119, this, "ptr", Buffer, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(120, this, "uint", Mask, "ptr", Format, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Mask 
     * @param {PWSTR} Format 
     * @param {Pointer<SByte>} Args 
     * @returns {HRESULT} 
     */
    OutputVaListWide(Mask, Format, Args) {
        Format := Format is String ? StrPtr(Format) : Format

        result := ComCall(121, this, "uint", Mask, "ptr", Format, "char*", Args, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(122, this, "uint", OutputControl, "uint", Mask, "ptr", Format, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} OutputControl 
     * @param {Integer} Mask 
     * @param {PWSTR} Format 
     * @param {Pointer<SByte>} Args 
     * @returns {HRESULT} 
     */
    ControlledOutputVaListWide(OutputControl, Mask, Format, Args) {
        Format := Format is String ? StrPtr(Format) : Format

        result := ComCall(123, this, "uint", OutputControl, "uint", Mask, "ptr", Format, "char*", Args, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(124, this, "uint", OutputControl, "ptr", Format, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} OutputControl 
     * @param {PWSTR} Format 
     * @param {Pointer<SByte>} Args 
     * @returns {HRESULT} 
     */
    OutputPromptVaListWide(OutputControl, Format, Args) {
        Format := Format is String ? StrPtr(Format) : Format

        result := ComCall(125, this, "uint", OutputControl, "ptr", Format, "char*", Args, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<UInt32>} TextSize 
     * @returns {HRESULT} 
     */
    GetPromptTextWide(Buffer, BufferSize, TextSize) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(126, this, "ptr", Buffer, "uint", BufferSize, "uint*", TextSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {PWSTR} Instr 
     * @param {Pointer<UInt64>} EndOffset 
     * @returns {HRESULT} 
     */
    AssembleWide(Offset, Instr, EndOffset) {
        Instr := Instr is String ? StrPtr(Instr) : Instr

        result := ComCall(127, this, "uint", Offset, "ptr", Instr, "uint*", EndOffset, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Integer} Flags 
     * @param {PWSTR} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<UInt32>} DisassemblySize 
     * @param {Pointer<UInt64>} EndOffset 
     * @returns {HRESULT} 
     */
    DisassembleWide(Offset, Flags, Buffer, BufferSize, DisassemblySize, EndOffset) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(128, this, "uint", Offset, "uint", Flags, "ptr", Buffer, "uint", BufferSize, "uint*", DisassemblySize, "uint*", EndOffset, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Type 
     * @param {PWSTR} FullNameBuffer 
     * @param {Integer} FullNameBufferSize 
     * @param {Pointer<UInt32>} FullNameSize 
     * @param {PWSTR} AbbrevNameBuffer 
     * @param {Integer} AbbrevNameBufferSize 
     * @param {Pointer<UInt32>} AbbrevNameSize 
     * @returns {HRESULT} 
     */
    GetProcessorTypeNamesWide(Type, FullNameBuffer, FullNameBufferSize, FullNameSize, AbbrevNameBuffer, AbbrevNameBufferSize, AbbrevNameSize) {
        FullNameBuffer := FullNameBuffer is String ? StrPtr(FullNameBuffer) : FullNameBuffer
        AbbrevNameBuffer := AbbrevNameBuffer is String ? StrPtr(AbbrevNameBuffer) : AbbrevNameBuffer

        result := ComCall(129, this, "uint", Type, "ptr", FullNameBuffer, "uint", FullNameBufferSize, "uint*", FullNameSize, "ptr", AbbrevNameBuffer, "uint", AbbrevNameBufferSize, "uint*", AbbrevNameSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Slot 
     * @param {PWSTR} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<UInt32>} MacroSize 
     * @returns {HRESULT} 
     */
    GetTextMacroWide(Slot, Buffer, BufferSize, MacroSize) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(130, this, "uint", Slot, "ptr", Buffer, "uint", BufferSize, "uint*", MacroSize, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(131, this, "uint", Slot, "ptr", Macro, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} Expression 
     * @param {Integer} DesiredType 
     * @param {Pointer<DEBUG_VALUE>} Value 
     * @param {Pointer<UInt32>} RemainderIndex 
     * @returns {HRESULT} 
     */
    EvaluateWide(Expression, DesiredType, Value, RemainderIndex) {
        Expression := Expression is String ? StrPtr(Expression) : Expression

        result := ComCall(132, this, "ptr", Expression, "uint", DesiredType, "ptr", Value, "uint*", RemainderIndex, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(133, this, "uint", OutputControl, "ptr", Command, "uint", Flags, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(134, this, "uint", OutputControl, "ptr", CommandFile, "uint", Flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Pointer<IDebugBreakpoint2>} Bp 
     * @returns {HRESULT} 
     */
    GetBreakpointByIndex2(Index, Bp) {
        result := ComCall(135, this, "uint", Index, "ptr", Bp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Id 
     * @param {Pointer<IDebugBreakpoint2>} Bp 
     * @returns {HRESULT} 
     */
    GetBreakpointById2(Id, Bp) {
        result := ComCall(136, this, "uint", Id, "ptr", Bp, "int")
        if(result != 0)
            throw OSError(result)

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
        result := ComCall(137, this, "uint", Type, "uint", DesiredId, "ptr", Bp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDebugBreakpoint2>} Bp 
     * @returns {HRESULT} 
     */
    RemoveBreakpoint2(Bp) {
        result := ComCall(138, this, "ptr", Bp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} Path 
     * @param {Integer} Flags 
     * @param {Pointer<UInt64>} Handle 
     * @returns {HRESULT} 
     */
    AddExtensionWide(Path, Flags, Handle) {
        Path := Path is String ? StrPtr(Path) : Path

        result := ComCall(139, this, "ptr", Path, "uint", Flags, "uint*", Handle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} Path 
     * @param {Pointer<UInt64>} Handle 
     * @returns {HRESULT} 
     */
    GetExtensionByPathWide(Path, Handle) {
        Path := Path is String ? StrPtr(Path) : Path

        result := ComCall(140, this, "ptr", Path, "uint*", Handle, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(141, this, "uint", Handle, "ptr", Function, "ptr", Arguments, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Handle 
     * @param {PWSTR} FuncName 
     * @param {Pointer<FARPROC>} Function 
     * @returns {HRESULT} 
     */
    GetExtensionFunctionWide(Handle, FuncName, Function) {
        FuncName := FuncName is String ? StrPtr(FuncName) : FuncName

        result := ComCall(142, this, "uint", Handle, "ptr", FuncName, "ptr", Function, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {PWSTR} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<UInt32>} TextSize 
     * @returns {HRESULT} 
     */
    GetEventFilterTextWide(Index, Buffer, BufferSize, TextSize) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(143, this, "uint", Index, "ptr", Buffer, "uint", BufferSize, "uint*", TextSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {PWSTR} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<UInt32>} CommandSize 
     * @returns {HRESULT} 
     */
    GetEventFilterCommandWide(Index, Buffer, BufferSize, CommandSize) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(144, this, "uint", Index, "ptr", Buffer, "uint", BufferSize, "uint*", CommandSize, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(145, this, "uint", Index, "ptr", Command, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {PWSTR} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<UInt32>} ArgumentSize 
     * @returns {HRESULT} 
     */
    GetSpecificFilterArgumentWide(Index, Buffer, BufferSize, ArgumentSize) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(146, this, "uint", Index, "ptr", Buffer, "uint", BufferSize, "uint*", ArgumentSize, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(147, this, "uint", Index, "ptr", Argument, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {PWSTR} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<UInt32>} CommandSize 
     * @returns {HRESULT} 
     */
    GetExceptionFilterSecondCommandWide(Index, Buffer, BufferSize, CommandSize) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(148, this, "uint", Index, "ptr", Buffer, "uint", BufferSize, "uint*", CommandSize, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(149, this, "uint", Index, "ptr", Command, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} Type 
     * @param {Pointer<UInt32>} ProcessId 
     * @param {Pointer<UInt32>} ThreadId 
     * @param {Pointer} ExtraInformation 
     * @param {Integer} ExtraInformationSize 
     * @param {Pointer<UInt32>} ExtraInformationUsed 
     * @param {PWSTR} Description 
     * @param {Integer} DescriptionSize 
     * @param {Pointer<UInt32>} DescriptionUsed 
     * @returns {HRESULT} 
     */
    GetLastEventInformationWide(Type, ProcessId, ThreadId, ExtraInformation, ExtraInformationSize, ExtraInformationUsed, Description, DescriptionSize, DescriptionUsed) {
        Description := Description is String ? StrPtr(Description) : Description

        result := ComCall(150, this, "uint*", Type, "uint*", ProcessId, "uint*", ThreadId, "ptr", ExtraInformation, "uint", ExtraInformationSize, "uint*", ExtraInformationUsed, "ptr", Description, "uint", DescriptionSize, "uint*", DescriptionUsed, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} SrcText 
     * @param {Integer} Index 
     * @param {PWSTR} SrcBuffer 
     * @param {Integer} SrcBufferSize 
     * @param {Pointer<UInt32>} SrcSize 
     * @param {PWSTR} DstBuffer 
     * @param {Integer} DstBufferSize 
     * @param {Pointer<UInt32>} DstSize 
     * @returns {HRESULT} 
     */
    GetTextReplacementWide(SrcText, Index, SrcBuffer, SrcBufferSize, SrcSize, DstBuffer, DstBufferSize, DstSize) {
        SrcText := SrcText is String ? StrPtr(SrcText) : SrcText
        SrcBuffer := SrcBuffer is String ? StrPtr(SrcBuffer) : SrcBuffer
        DstBuffer := DstBuffer is String ? StrPtr(DstBuffer) : DstBuffer

        result := ComCall(151, this, "ptr", SrcText, "uint", Index, "ptr", SrcBuffer, "uint", SrcBufferSize, "uint*", SrcSize, "ptr", DstBuffer, "uint", DstBufferSize, "uint*", DstSize, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(152, this, "ptr", SrcText, "ptr", DstText, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} AbbrevName 
     * @returns {HRESULT} 
     */
    SetExpressionSyntaxByNameWide(AbbrevName) {
        AbbrevName := AbbrevName is String ? StrPtr(AbbrevName) : AbbrevName

        result := ComCall(153, this, "ptr", AbbrevName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {PWSTR} FullNameBuffer 
     * @param {Integer} FullNameBufferSize 
     * @param {Pointer<UInt32>} FullNameSize 
     * @param {PWSTR} AbbrevNameBuffer 
     * @param {Integer} AbbrevNameBufferSize 
     * @param {Pointer<UInt32>} AbbrevNameSize 
     * @returns {HRESULT} 
     */
    GetExpressionSyntaxNamesWide(Index, FullNameBuffer, FullNameBufferSize, FullNameSize, AbbrevNameBuffer, AbbrevNameBufferSize, AbbrevNameSize) {
        FullNameBuffer := FullNameBuffer is String ? StrPtr(FullNameBuffer) : FullNameBuffer
        AbbrevNameBuffer := AbbrevNameBuffer is String ? StrPtr(AbbrevNameBuffer) : AbbrevNameBuffer

        result := ComCall(154, this, "uint", Index, "ptr", FullNameBuffer, "uint", FullNameBufferSize, "uint*", FullNameSize, "ptr", AbbrevNameBuffer, "uint", AbbrevNameBufferSize, "uint*", AbbrevNameSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Integer} Which 
     * @param {PWSTR} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<UInt32>} DescSize 
     * @returns {HRESULT} 
     */
    GetEventIndexDescriptionWide(Index, Which, Buffer, BufferSize, DescSize) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(155, this, "uint", Index, "uint", Which, "ptr", Buffer, "uint", BufferSize, "uint*", DescSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PSTR} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<UInt32>} FileSize 
     * @param {Pointer<UInt32>} Flags 
     * @returns {HRESULT} 
     */
    GetLogFile2(Buffer, BufferSize, FileSize, Flags) {
        result := ComCall(156, this, "ptr", Buffer, "uint", BufferSize, "uint*", FileSize, "uint*", Flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PSTR} File 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     */
    OpenLogFile2(File, Flags) {
        result := ComCall(157, this, "ptr", File, "uint", Flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<UInt32>} FileSize 
     * @param {Pointer<UInt32>} Flags 
     * @returns {HRESULT} 
     */
    GetLogFile2Wide(Buffer, BufferSize, FileSize, Flags) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(158, this, "ptr", Buffer, "uint", BufferSize, "uint*", FileSize, "uint*", Flags, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(159, this, "ptr", File, "uint", Flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} PlatformId 
     * @param {Pointer<UInt32>} Win32Major 
     * @param {Pointer<UInt32>} Win32Minor 
     * @param {Pointer<UInt32>} KdMajor 
     * @param {Pointer<UInt32>} KdMinor 
     * @returns {HRESULT} 
     */
    GetSystemVersionValues(PlatformId, Win32Major, Win32Minor, KdMajor, KdMinor) {
        result := ComCall(160, this, "uint*", PlatformId, "uint*", Win32Major, "uint*", Win32Minor, "uint*", KdMajor, "uint*", KdMinor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Which 
     * @param {PSTR} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<UInt32>} StringSize 
     * @returns {HRESULT} 
     */
    GetSystemVersionString(Which, Buffer, BufferSize, StringSize) {
        result := ComCall(161, this, "uint", Which, "ptr", Buffer, "uint", BufferSize, "uint*", StringSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Which 
     * @param {PWSTR} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<UInt32>} StringSize 
     * @returns {HRESULT} 
     */
    GetSystemVersionStringWide(Which, Buffer, BufferSize, StringSize) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(162, this, "uint", Which, "ptr", Buffer, "uint", BufferSize, "uint*", StringSize, "int")
        if(result != 0)
            throw OSError(result)

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
     * @param {Pointer<UInt32>} FramesFilled 
     * @returns {HRESULT} 
     */
    GetContextStackTrace(StartContext, StartContextSize, Frames, FramesSize, FrameContexts, FrameContextsSize, FrameContextsEntrySize, FramesFilled) {
        result := ComCall(163, this, "ptr", StartContext, "uint", StartContextSize, "ptr", Frames, "uint", FramesSize, "ptr", FrameContexts, "uint", FrameContextsSize, "uint", FrameContextsEntrySize, "uint*", FramesFilled, "int")
        if(result != 0)
            throw OSError(result)

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
        result := ComCall(164, this, "uint", OutputControl, "ptr", Frames, "uint", FramesSize, "ptr", FrameContexts, "uint", FrameContextsSize, "uint", FrameContextsEntrySize, "uint", Flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} Type 
     * @param {Pointer<UInt32>} ProcessId 
     * @param {Pointer<UInt32>} ThreadId 
     * @param {Pointer} Context 
     * @param {Integer} ContextSize 
     * @param {Pointer<UInt32>} ContextUsed 
     * @param {Pointer} ExtraInformation 
     * @param {Integer} ExtraInformationSize 
     * @param {Pointer<UInt32>} ExtraInformationUsed 
     * @returns {HRESULT} 
     */
    GetStoredEventInformation(Type, ProcessId, ThreadId, Context, ContextSize, ContextUsed, ExtraInformation, ExtraInformationSize, ExtraInformationUsed) {
        result := ComCall(165, this, "uint*", Type, "uint*", ProcessId, "uint*", ThreadId, "ptr", Context, "uint", ContextSize, "uint*", ContextUsed, "ptr", ExtraInformation, "uint", ExtraInformationSize, "uint*", ExtraInformationUsed, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} Flags 
     * @param {Integer} WhichString 
     * @param {PSTR} String 
     * @param {Integer} StringSize 
     * @param {Pointer<UInt32>} StringNeeded 
     * @returns {HRESULT} 
     */
    GetManagedStatus(Flags, WhichString, String, StringSize, StringNeeded) {
        result := ComCall(166, this, "uint*", Flags, "uint", WhichString, "ptr", String, "uint", StringSize, "uint*", StringNeeded, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} Flags 
     * @param {Integer} WhichString 
     * @param {PWSTR} String 
     * @param {Integer} StringSize 
     * @param {Pointer<UInt32>} StringNeeded 
     * @returns {HRESULT} 
     */
    GetManagedStatusWide(Flags, WhichString, String, StringSize, StringNeeded) {
        String := String is String ? StrPtr(String) : String

        result := ComCall(167, this, "uint*", Flags, "uint", WhichString, "ptr", String, "uint", StringSize, "uint*", StringNeeded, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     */
    ResetManagedStatus(Flags) {
        result := ComCall(168, this, "uint", Flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} FrameOffset 
     * @param {Integer} StackOffset 
     * @param {Integer} InstructionOffset 
     * @param {Pointer<DEBUG_STACK_FRAME_EX>} Frames 
     * @param {Integer} FramesSize 
     * @param {Pointer<UInt32>} FramesFilled 
     * @returns {HRESULT} 
     */
    GetStackTraceEx(FrameOffset, StackOffset, InstructionOffset, Frames, FramesSize, FramesFilled) {
        result := ComCall(169, this, "uint", FrameOffset, "uint", StackOffset, "uint", InstructionOffset, "ptr", Frames, "uint", FramesSize, "uint*", FramesFilled, "int")
        if(result != 0)
            throw OSError(result)

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
        result := ComCall(170, this, "uint", OutputControl, "ptr", Frames, "uint", FramesSize, "uint", Flags, "int")
        if(result != 0)
            throw OSError(result)

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
     * @param {Pointer<UInt32>} FramesFilled 
     * @returns {HRESULT} 
     */
    GetContextStackTraceEx(StartContext, StartContextSize, Frames, FramesSize, FrameContexts, FrameContextsSize, FrameContextsEntrySize, FramesFilled) {
        result := ComCall(171, this, "ptr", StartContext, "uint", StartContextSize, "ptr", Frames, "uint", FramesSize, "ptr", FrameContexts, "uint", FrameContextsSize, "uint", FrameContextsEntrySize, "uint*", FramesFilled, "int")
        if(result != 0)
            throw OSError(result)

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
        result := ComCall(172, this, "uint", OutputControl, "ptr", Frames, "uint", FramesSize, "ptr", FrameContexts, "uint", FrameContextsSize, "uint", FrameContextsEntrySize, "uint", Flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} Guid 
     * @param {Pointer<IDebugBreakpoint3>} Bp 
     * @returns {HRESULT} 
     */
    GetBreakpointByGuid(Guid, Bp) {
        result := ComCall(173, this, "ptr", Guid, "ptr", Bp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} Status 
     * @returns {HRESULT} 
     */
    GetExecutionStatusEx(Status) {
        result := ComCall(174, this, "uint*", Status, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} SendsAttempted 
     * @param {Pointer<UInt32>} SecondsSinceLastResponse 
     * @returns {HRESULT} 
     */
    GetSynchronizationStatus(SendsAttempted, SecondsSinceLastResponse) {
        result := ComCall(175, this, "uint*", SendsAttempted, "uint*", SecondsSinceLastResponse, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
