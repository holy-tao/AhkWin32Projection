#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugControl3 extends IUnknown{
    /**
     * The interface identifier for IDebugControl3
     * @type {Guid}
     */
    static IID => Guid("{7df74a86-b03f-407f-90ab-a20dadcead08}")

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
}
