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
        result := ComCall(3, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     */
    SetInterrupt(Flags) {
        result := ComCall(4, this, "uint", Flags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetInterruptTimeout() {
        result := ComCall(5, this, "uint*", &Seconds := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Seconds
    }

    /**
     * 
     * @param {Integer} Seconds 
     * @returns {HRESULT} 
     */
    SetInterruptTimeout(Seconds) {
        result := ComCall(6, this, "uint", Seconds, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Returns a buffer that contains metadata about a specified log and its current state, which is defined by the CLFS_INFORMATION structure.
     * @param {PSTR} Buffer_ 
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
     * @see https://learn.microsoft.com/windows/win32/api//content/clfsw32/nf-clfsw32-getlogfileinformation
     */
    GetLogFile(Buffer_, BufferSize, FileSize, Append) {
        Buffer_ := Buffer_ is String ? StrPtr(Buffer_) : Buffer_

        FileSizeMarshal := FileSize is VarRef ? "uint*" : "ptr"
        AppendMarshal := Append is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, "ptr", Buffer_, "uint", BufferSize, FileSizeMarshal, FileSize, AppendMarshal, Append, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PSTR} File_ 
     * @param {BOOL} Append 
     * @returns {HRESULT} 
     */
    OpenLogFile(File_, Append) {
        File_ := File_ is String ? StrPtr(File_) : File_

        result := ComCall(8, this, "ptr", File_, "int", Append, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    CloseLogFile() {
        result := ComCall(9, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetLogMask() {
        result := ComCall(10, this, "uint*", &Mask := 0, "int")
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
    SetLogMask(Mask) {
        result := ComCall(11, this, "uint", Mask, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * This section provides the reference specifications for Input Feedback Configuration constants.
     * @param {PSTR} Buffer_ 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/input_feedback/constants
     */
    Input(Buffer_, BufferSize) {
        Buffer_ := Buffer_ is String ? StrPtr(Buffer_) : Buffer_

        result := ComCall(12, this, "ptr", Buffer_, "uint", BufferSize, "uint*", &InputSize := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return InputSize
    }

    /**
     * 
     * @param {PSTR} Buffer_ 
     * @returns {HRESULT} 
     */
    ReturnInput(Buffer_) {
        Buffer_ := Buffer_ is String ? StrPtr(Buffer_) : Buffer_

        result := ComCall(13, this, "ptr", Buffer_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * OutputData: generates an OutputData Object that captures the information about the data frame that needs to be returned after the execution of the R function embedded into the stored procedure.
     * @param {Integer} Mask 
     * @param {PSTR} Format 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/machine-learning/r/reference/sqlrutils/outputdata
     */
    Output(Mask, Format) {
        Format := Format is String ? StrPtr(Format) : Format

        result := ComCall(14, this, "uint", Mask, "ptr", Format, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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

        result := ComCall(15, this, "uint", Mask, "ptr", Format, ArgsMarshal, Args, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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

        result := ComCall(16, this, "uint", OutputControl, "uint", Mask, "ptr", Format, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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

        result := ComCall(17, this, "uint", OutputControl, "uint", Mask, "ptr", Format, ArgsMarshal, Args, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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

        result := ComCall(18, this, "uint", OutputControl, "ptr", Format, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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

        result := ComCall(19, this, "uint", OutputControl, "ptr", Format, ArgsMarshal, Args, "int")
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
    GetPromptText(Buffer_, BufferSize) {
        Buffer_ := Buffer_ is String ? StrPtr(Buffer_) : Buffer_

        result := ComCall(20, this, "ptr", Buffer_, "uint", BufferSize, "uint*", &TextSize := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TextSize
    }

    /**
     * 
     * @param {Integer} OutputControl 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     */
    OutputCurrentState(OutputControl, Flags) {
        result := ComCall(21, this, "uint", OutputControl, "uint", Flags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} OutputControl 
     * @returns {HRESULT} 
     */
    OutputVersionInformation(OutputControl) {
        result := ComCall(22, this, "uint", OutputControl, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves a handle to a notification event.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/clusapi/nf-clusapi-getnotifyeventhandle
     */
    GetNotifyEventHandle() {
        result := ComCall(23, this, "uint*", &Handle_ := 0, "int")
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
    SetNotifyEventHandle(Handle_) {
        result := ComCall(24, this, "uint", Handle_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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

        result := ComCall(25, this, "uint", Offset, "ptr", Instr, "uint*", &EndOffset := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return EndOffset
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Integer} Flags 
     * @param {PSTR} Buffer_ 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} DisassemblySize 
     * @param {Pointer<Integer>} EndOffset 
     * @returns {HRESULT} 
     */
    Disassemble(Offset, Flags, Buffer_, BufferSize, DisassemblySize, EndOffset) {
        Buffer_ := Buffer_ is String ? StrPtr(Buffer_) : Buffer_

        DisassemblySizeMarshal := DisassemblySize is VarRef ? "uint*" : "ptr"
        EndOffsetMarshal := EndOffset is VarRef ? "uint*" : "ptr"

        result := ComCall(26, this, "uint", Offset, "uint", Flags, "ptr", Buffer_, "uint", BufferSize, DisassemblySizeMarshal, DisassemblySize, EndOffsetMarshal, EndOffset, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetDisassembleEffectiveOffset() {
        result := ComCall(27, this, "uint*", &Offset := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
        result := ComCall(28, this, "uint", OutputControl, "uint", Offset, "uint", Flags, "uint*", &EndOffset := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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

        result := ComCall(29, this, "uint", OutputControl, "uint", PreviousLines, "uint", TotalLines, "uint", Offset, "uint", Flags, OffsetLineMarshal, OffsetLine, StartOffsetMarshal, StartOffset, EndOffsetMarshal, EndOffset, LineOffsetsMarshal, LineOffsets, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Integer} Delta 
     * @returns {Integer} 
     */
    GetNearInstruction(Offset, Delta) {
        result := ComCall(30, this, "uint", Offset, "int", Delta, "uint*", &NearOffset := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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

        result := ComCall(31, this, "uint", FrameOffset, "uint", StackOffset, "uint", InstructionOffset, "ptr", Frames, "uint", FramesSize, FramesFilledMarshal, FramesFilled, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetReturnOffset() {
        result := ComCall(32, this, "uint*", &Offset := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
        result := ComCall(33, this, "uint", OutputControl, "ptr", Frames, "uint", FramesSize, "uint", Flags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Class_ 
     * @param {Pointer<Integer>} Qualifier 
     * @returns {HRESULT} 
     */
    GetDebuggeeType(Class_, Qualifier) {
        Class_Marshal := Class_ is VarRef ? "uint*" : "ptr"
        QualifierMarshal := Qualifier is VarRef ? "uint*" : "ptr"

        result := ComCall(34, this, Class_Marshal, Class_, QualifierMarshal, Qualifier, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetActualProcessorType() {
        result := ComCall(35, this, "uint*", &Type := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Type
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetExecutingProcessorType() {
        result := ComCall(36, this, "uint*", &Type := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Type
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetNumberPossibleExecutingProcessorTypes() {
        result := ComCall(37, this, "uint*", &Number_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Number_
    }

    /**
     * 
     * @param {Integer} Start 
     * @param {Integer} Count 
     * @returns {Integer} 
     */
    GetPossibleExecutingProcessorTypes(Start, Count) {
        result := ComCall(38, this, "uint", Start, "uint", Count, "uint*", &Types := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Types
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetNumberProcessors() {
        result := ComCall(39, this, "uint*", &Number_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Number_
    }

    /**
     * 
     * @param {Pointer<Integer>} PlatformId_ 
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
    GetSystemVersion(PlatformId_, Major, Minor, ServicePackString, ServicePackStringSize, ServicePackStringUsed, ServicePackNumber, BuildString, BuildStringSize, BuildStringUsed) {
        ServicePackString := ServicePackString is String ? StrPtr(ServicePackString) : ServicePackString
        BuildString := BuildString is String ? StrPtr(BuildString) : BuildString

        PlatformId_Marshal := PlatformId_ is VarRef ? "uint*" : "ptr"
        MajorMarshal := Major is VarRef ? "uint*" : "ptr"
        MinorMarshal := Minor is VarRef ? "uint*" : "ptr"
        ServicePackStringUsedMarshal := ServicePackStringUsed is VarRef ? "uint*" : "ptr"
        ServicePackNumberMarshal := ServicePackNumber is VarRef ? "uint*" : "ptr"
        BuildStringUsedMarshal := BuildStringUsed is VarRef ? "uint*" : "ptr"

        result := ComCall(40, this, PlatformId_Marshal, PlatformId_, MajorMarshal, Major, MinorMarshal, Minor, "ptr", ServicePackString, "uint", ServicePackStringSize, ServicePackStringUsedMarshal, ServicePackStringUsed, ServicePackNumberMarshal, ServicePackNumber, "ptr", BuildString, "uint", BuildStringSize, BuildStringUsedMarshal, BuildStringUsed, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetPageSize() {
        result := ComCall(41, this, "uint*", &Size_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Size_
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    IsPointer64Bit() {
        result := ComCall(42, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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

        result := ComCall(43, this, CodeMarshal, Code, Arg1Marshal, Arg1, Arg2Marshal, Arg2, Arg3Marshal, Arg3, Arg4Marshal, Arg4, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetNumberSupportedProcessorTypes() {
        result := ComCall(44, this, "uint*", &Number_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Number_
    }

    /**
     * 
     * @param {Integer} Start 
     * @param {Integer} Count 
     * @returns {Integer} 
     */
    GetSupportedProcessorTypes(Start, Count) {
        result := ComCall(45, this, "uint", Start, "uint", Count, "uint*", &Types := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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

        result := ComCall(46, this, "uint", Type, "ptr", FullNameBuffer, "uint", FullNameBufferSize, FullNameSizeMarshal, FullNameSize, "ptr", AbbrevNameBuffer, "uint", AbbrevNameBufferSize, AbbrevNameSizeMarshal, AbbrevNameSize, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetEffectiveProcessorType() {
        result := ComCall(47, this, "uint*", &Type := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Type
    }

    /**
     * 
     * @param {Integer} Type 
     * @returns {HRESULT} 
     */
    SetEffectiveProcessorType(Type) {
        result := ComCall(48, this, "uint", Type, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetExecutionStatus() {
        result := ComCall(49, this, "uint*", &Status_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Status_
    }

    /**
     * 
     * @param {Integer} Status_ 
     * @returns {HRESULT} 
     */
    SetExecutionStatus(Status_) {
        result := ComCall(50, this, "uint", Status_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetCodeLevel() {
        result := ComCall(51, this, "uint*", &Level := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Level
    }

    /**
     * 
     * @param {Integer} Level 
     * @returns {HRESULT} 
     */
    SetCodeLevel(Level) {
        result := ComCall(52, this, "uint", Level, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetEngineOptions() {
        result := ComCall(53, this, "uint*", &Options := 0, "int")
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
    AddEngineOptions(Options) {
        result := ComCall(54, this, "uint", Options, "int")
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
    RemoveEngineOptions(Options) {
        result := ComCall(55, this, "uint", Options, "int")
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
    SetEngineOptions(Options) {
        result := ComCall(56, this, "uint", Options, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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

        result := ComCall(57, this, OutputLevelMarshal, OutputLevel, BreakLevelMarshal, BreakLevel, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} Slot 
     * @param {PSTR} Buffer_ 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetTextMacro(Slot, Buffer_, BufferSize) {
        Buffer_ := Buffer_ is String ? StrPtr(Buffer_) : Buffer_

        result := ComCall(59, this, "uint", Slot, "ptr", Buffer_, "uint", BufferSize, "uint*", &MacroSize := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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

        result := ComCall(60, this, "uint", Slot, "ptr", Macro, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetRadix() {
        result := ComCall(61, this, "uint*", &Radix := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Radix
    }

    /**
     * 
     * @param {Integer} Radix 
     * @returns {HRESULT} 
     */
    SetRadix(Radix) {
        result := ComCall(62, this, "uint", Radix, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/ktop-src/direct3dhlsl/evaluateattributeatsample
     */
    Evaluate(Expression, DesiredType, Value, RemainderIndex) {
        Expression := Expression is String ? StrPtr(Expression) : Expression

        RemainderIndexMarshal := RemainderIndex is VarRef ? "uint*" : "ptr"

        result := ComCall(63, this, "ptr", Expression, "uint", DesiredType, "ptr", Value, RemainderIndexMarshal, RemainderIndex, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<DEBUG_VALUE>} In_ 
     * @param {Integer} OutType 
     * @returns {DEBUG_VALUE} 
     */
    CoerceValue(In_, OutType) {
        Out := DEBUG_VALUE()
        result := ComCall(64, this, "ptr", In_, "uint", OutType, "ptr", Out, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Out
    }

    /**
     * 
     * @param {Integer} Count 
     * @param {Pointer<DEBUG_VALUE>} In_ 
     * @param {Pointer<Integer>} OutTypes 
     * @returns {DEBUG_VALUE} 
     */
    CoerceValues(Count, In_, OutTypes) {
        OutTypesMarshal := OutTypes is VarRef ? "uint*" : "ptr"

        Out := DEBUG_VALUE()
        result := ComCall(65, this, "uint", Count, "ptr", In_, OutTypesMarshal, OutTypes, "ptr", Out, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Out
    }

    /**
     * Learn how to run SQL Server stored procedures with RPC, and process return codes and output parameters in this example.
     * @param {Integer} OutputControl 
     * @param {PSTR} Command 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/connect/oledb/ole-db-how-to/results/execute-stored-procedure-with-rpc-and-process-output
     */
    Execute(OutputControl, Command, Flags) {
        Command := Command is String ? StrPtr(Command) : Command

        result := ComCall(66, this, "uint", OutputControl, "ptr", Command, "uint", Flags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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

        result := ComCall(67, this, "uint", OutputControl, "ptr", CommandFile, "uint", Flags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetNumberBreakpoints() {
        result := ComCall(68, this, "uint*", &Number_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Number_
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {IDebugBreakpoint} 
     */
    GetBreakpointByIndex(Index) {
        result := ComCall(69, this, "uint", Index, "ptr*", &Bp := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDebugBreakpoint(Bp)
    }

    /**
     * 
     * @param {Integer} Id 
     * @returns {IDebugBreakpoint} 
     */
    GetBreakpointById(Id) {
        result := ComCall(70, this, "uint", Id, "ptr*", &Bp := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
        result := ComCall(71, this, "uint", Count, IdsMarshal, Ids, "uint", Start, "ptr", Params, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Params
    }

    /**
     * 
     * @param {Integer} Type 
     * @param {Integer} DesiredId 
     * @returns {IDebugBreakpoint} 
     */
    AddBreakpoint(Type, DesiredId) {
        result := ComCall(72, this, "uint", Type, "uint", DesiredId, "ptr*", &Bp := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDebugBreakpoint(Bp)
    }

    /**
     * 
     * @param {IDebugBreakpoint} Bp 
     * @returns {HRESULT} 
     */
    RemoveBreakpoint(Bp) {
        result := ComCall(73, this, "ptr", Bp, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PSTR} Path_ 
     * @param {Integer} Flags 
     * @returns {Integer} 
     */
    AddExtension(Path_, Flags) {
        Path_ := Path_ is String ? StrPtr(Path_) : Path_

        result := ComCall(74, this, "ptr", Path_, "uint", Flags, "uint*", &Handle_ := 0, "int")
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
    RemoveExtension(Handle_) {
        result := ComCall(75, this, "uint", Handle_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PSTR} Path_ 
     * @returns {Integer} 
     */
    GetExtensionByPath(Path_) {
        Path_ := Path_ is String ? StrPtr(Path_) : Path_

        result := ComCall(76, this, "ptr", Path_, "uint*", &Handle_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Handle_
    }

    /**
     * 
     * @param {Integer} Handle_ 
     * @param {PSTR} Function 
     * @param {PSTR} Arguments 
     * @returns {HRESULT} 
     */
    CallExtension(Handle_, Function, Arguments) {
        Function := Function is String ? StrPtr(Function) : Function
        Arguments := Arguments is String ? StrPtr(Arguments) : Arguments

        result := ComCall(77, this, "uint", Handle_, "ptr", Function, "ptr", Arguments, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} Handle_ 
     * @param {PSTR} FuncName 
     * @returns {Pointer<FARPROC>} 
     */
    GetExtensionFunction(Handle_, FuncName) {
        FuncName := FuncName is String ? StrPtr(FuncName) : FuncName

        result := ComCall(78, this, "uint", Handle_, "ptr", FuncName, "ptr*", &Function := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Function
    }

    /**
     * 
     * @param {Pointer<WINDBG_EXTENSION_APIS32>} Api 
     * @returns {HRESULT} 
     */
    GetWindbgExtensionApis32(Api) {
        result := ComCall(79, this, "ptr", Api, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<WINDBG_EXTENSION_APIS64>} Api 
     * @returns {HRESULT} 
     */
    GetWindbgExtensionApis64(Api) {
        result := ComCall(80, this, "ptr", Api, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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

        result := ComCall(81, this, SpecificEventsMarshal, SpecificEvents, SpecificExceptionsMarshal, SpecificExceptions, ArbitraryExceptionsMarshal, ArbitraryExceptions, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {PSTR} Buffer_ 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetEventFilterText(Index, Buffer_, BufferSize) {
        Buffer_ := Buffer_ is String ? StrPtr(Buffer_) : Buffer_

        result := ComCall(82, this, "uint", Index, "ptr", Buffer_, "uint", BufferSize, "uint*", &TextSize := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TextSize
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {PSTR} Buffer_ 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetEventFilterCommand(Index, Buffer_, BufferSize) {
        Buffer_ := Buffer_ is String ? StrPtr(Buffer_) : Buffer_

        result := ComCall(83, this, "uint", Index, "ptr", Buffer_, "uint", BufferSize, "uint*", &CommandSize := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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

        result := ComCall(84, this, "uint", Index, "ptr", Command, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
        result := ComCall(85, this, "uint", Start, "uint", Count, "ptr", Params, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
        result := ComCall(86, this, "uint", Start, "uint", Count, "ptr", Params, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {PSTR} Buffer_ 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetSpecificFilterArgument(Index, Buffer_, BufferSize) {
        Buffer_ := Buffer_ is String ? StrPtr(Buffer_) : Buffer_

        result := ComCall(87, this, "uint", Index, "ptr", Buffer_, "uint", BufferSize, "uint*", &ArgumentSize := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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

        result := ComCall(88, this, "uint", Index, "ptr", Argument, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
        result := ComCall(89, this, "uint", Count, CodesMarshal, Codes, "uint", Start, "ptr", Params, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Params
    }

    /**
     * 
     * @param {Integer} Count 
     * @param {Pointer<DEBUG_EXCEPTION_FILTER_PARAMETERS>} Params 
     * @returns {HRESULT} 
     */
    SetExceptionFilterParameters(Count, Params) {
        result := ComCall(90, this, "uint", Count, "ptr", Params, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {PSTR} Buffer_ 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetExceptionFilterSecondCommand(Index, Buffer_, BufferSize) {
        Buffer_ := Buffer_ is String ? StrPtr(Buffer_) : Buffer_

        result := ComCall(91, this, "uint", Index, "ptr", Buffer_, "uint", BufferSize, "uint*", &CommandSize := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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

        result := ComCall(92, this, "uint", Index, "ptr", Command, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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

        result := ComCall(94, this, TypeMarshal, Type, ProcessIdMarshal, ProcessId, ThreadIdMarshal, ThreadId, "ptr", ExtraInformation, "uint", ExtraInformationSize, ExtraInformationUsedMarshal, ExtraInformationUsed, "ptr", Description, "uint", DescriptionSize, DescriptionUsedMarshal, DescriptionUsed, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetCurrentTimeDate() {
        result := ComCall(95, this, "uint*", &TimeDate := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TimeDate
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetCurrentSystemUpTime() {
        result := ComCall(96, this, "uint*", &UpTime := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UpTime
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetDumpFormatFlags() {
        result := ComCall(97, this, "uint*", &FormatFlags := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return FormatFlags
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetNumberTextReplacements() {
        result := ComCall(98, this, "uint*", &NumRepl := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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

        result := ComCall(99, this, "ptr", SrcText, "uint", Index, "ptr", SrcBuffer, "uint", SrcBufferSize, SrcSizeMarshal, SrcSize, "ptr", DstBuffer, "uint", DstBufferSize, DstSizeMarshal, DstSize, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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

        result := ComCall(100, this, "ptr", SrcText, "ptr", DstText, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RemoveTextReplacements() {
        result := ComCall(101, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetAssemblyOptions() {
        result := ComCall(103, this, "uint*", &Options := 0, "int")
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
    AddAssemblyOptions(Options) {
        result := ComCall(104, this, "uint", Options, "int")
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
    RemoveAssemblyOptions(Options) {
        result := ComCall(105, this, "uint", Options, "int")
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
    SetAssemblyOptions(Options) {
        result := ComCall(106, this, "uint", Options, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetExpressionSyntax() {
        result := ComCall(107, this, "uint*", &Flags := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Flags
    }

    /**
     * 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     */
    SetExpressionSyntax(Flags) {
        result := ComCall(108, this, "uint", Flags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PSTR} AbbrevName 
     * @returns {HRESULT} 
     */
    SetExpressionSyntaxByName(AbbrevName) {
        AbbrevName := AbbrevName is String ? StrPtr(AbbrevName) : AbbrevName

        result := ComCall(109, this, "ptr", AbbrevName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetNumberExpressionSyntaxes() {
        result := ComCall(110, this, "uint*", &Number_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Number_
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

        result := ComCall(111, this, "uint", Index, "ptr", FullNameBuffer, "uint", FullNameBufferSize, FullNameSizeMarshal, FullNameSize, "ptr", AbbrevNameBuffer, "uint", AbbrevNameBufferSize, AbbrevNameSizeMarshal, AbbrevNameSize, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetNumberEvents() {
        result := ComCall(112, this, "uint*", &Events := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Events
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Integer} Which 
     * @param {PSTR} Buffer_ 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetEventIndexDescription(Index, Which, Buffer_, BufferSize) {
        Buffer_ := Buffer_ is String ? StrPtr(Buffer_) : Buffer_

        result := ComCall(113, this, "uint", Index, "uint", Which, "ptr", Buffer_, "uint", BufferSize, "uint*", &DescSize := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DescSize
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetCurrentEventIndex() {
        result := ComCall(114, this, "uint*", &Index := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Index
    }

    /**
     * 
     * @param {Integer} Relation 
     * @param {Integer} Value 
     * @returns {Integer} 
     */
    SetNextEventIndex(Relation, Value) {
        result := ComCall(115, this, "uint", Relation, "uint", Value, "uint*", &NextIndex := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return NextIndex
    }

    /**
     * 
     * @param {PWSTR} Buffer_ 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} FileSize 
     * @param {Pointer<BOOL>} Append 
     * @returns {HRESULT} 
     */
    GetLogFileWide(Buffer_, BufferSize, FileSize, Append) {
        Buffer_ := Buffer_ is String ? StrPtr(Buffer_) : Buffer_

        FileSizeMarshal := FileSize is VarRef ? "uint*" : "ptr"
        AppendMarshal := Append is VarRef ? "int*" : "ptr"

        result := ComCall(116, this, "ptr", Buffer_, "uint", BufferSize, FileSizeMarshal, FileSize, AppendMarshal, Append, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PWSTR} File_ 
     * @param {BOOL} Append 
     * @returns {HRESULT} 
     */
    OpenLogFileWide(File_, Append) {
        File_ := File_ is String ? StrPtr(File_) : File_

        result := ComCall(117, this, "ptr", File_, "int", Append, "int")
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
    InputWide(Buffer_, BufferSize) {
        Buffer_ := Buffer_ is String ? StrPtr(Buffer_) : Buffer_

        result := ComCall(118, this, "ptr", Buffer_, "uint", BufferSize, "uint*", &InputSize := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return InputSize
    }

    /**
     * 
     * @param {PWSTR} Buffer_ 
     * @returns {HRESULT} 
     */
    ReturnInputWide(Buffer_) {
        Buffer_ := Buffer_ is String ? StrPtr(Buffer_) : Buffer_

        result := ComCall(119, this, "ptr", Buffer_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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

        result := ComCall(121, this, "uint", Mask, "ptr", Format, ArgsMarshal, Args, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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

        result := ComCall(123, this, "uint", OutputControl, "uint", Mask, "ptr", Format, ArgsMarshal, Args, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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

        result := ComCall(125, this, "uint", OutputControl, "ptr", Format, ArgsMarshal, Args, "int")
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
    GetPromptTextWide(Buffer_, BufferSize) {
        Buffer_ := Buffer_ is String ? StrPtr(Buffer_) : Buffer_

        result := ComCall(126, this, "ptr", Buffer_, "uint", BufferSize, "uint*", &TextSize := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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

        result := ComCall(127, this, "uint", Offset, "ptr", Instr, "uint*", &EndOffset := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return EndOffset
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Integer} Flags 
     * @param {PWSTR} Buffer_ 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} DisassemblySize 
     * @param {Pointer<Integer>} EndOffset 
     * @returns {HRESULT} 
     */
    DisassembleWide(Offset, Flags, Buffer_, BufferSize, DisassemblySize, EndOffset) {
        Buffer_ := Buffer_ is String ? StrPtr(Buffer_) : Buffer_

        DisassemblySizeMarshal := DisassemblySize is VarRef ? "uint*" : "ptr"
        EndOffsetMarshal := EndOffset is VarRef ? "uint*" : "ptr"

        result := ComCall(128, this, "uint", Offset, "uint", Flags, "ptr", Buffer_, "uint", BufferSize, DisassemblySizeMarshal, DisassemblySize, EndOffsetMarshal, EndOffset, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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

        result := ComCall(129, this, "uint", Type, "ptr", FullNameBuffer, "uint", FullNameBufferSize, FullNameSizeMarshal, FullNameSize, "ptr", AbbrevNameBuffer, "uint", AbbrevNameBufferSize, AbbrevNameSizeMarshal, AbbrevNameSize, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} Slot 
     * @param {PWSTR} Buffer_ 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetTextMacroWide(Slot, Buffer_, BufferSize) {
        Buffer_ := Buffer_ is String ? StrPtr(Buffer_) : Buffer_

        result := ComCall(130, this, "uint", Slot, "ptr", Buffer_, "uint", BufferSize, "uint*", &MacroSize := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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

        result := ComCall(131, this, "uint", Slot, "ptr", Macro, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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

        result := ComCall(132, this, "ptr", Expression, "uint", DesiredType, "ptr", Value, RemainderIndexMarshal, RemainderIndex, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {IDebugBreakpoint2} 
     */
    GetBreakpointByIndex2(Index) {
        result := ComCall(135, this, "uint", Index, "ptr*", &Bp := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDebugBreakpoint2(Bp)
    }

    /**
     * 
     * @param {Integer} Id 
     * @returns {IDebugBreakpoint2} 
     */
    GetBreakpointById2(Id) {
        result := ComCall(136, this, "uint", Id, "ptr*", &Bp := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDebugBreakpoint2(Bp)
    }

    /**
     * 
     * @param {Integer} Type 
     * @param {Integer} DesiredId 
     * @returns {IDebugBreakpoint2} 
     */
    AddBreakpoint2(Type, DesiredId) {
        result := ComCall(137, this, "uint", Type, "uint", DesiredId, "ptr*", &Bp := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDebugBreakpoint2(Bp)
    }

    /**
     * 
     * @param {IDebugBreakpoint2} Bp 
     * @returns {HRESULT} 
     */
    RemoveBreakpoint2(Bp) {
        result := ComCall(138, this, "ptr", Bp, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PWSTR} Path_ 
     * @param {Integer} Flags 
     * @returns {Integer} 
     */
    AddExtensionWide(Path_, Flags) {
        Path_ := Path_ is String ? StrPtr(Path_) : Path_

        result := ComCall(139, this, "ptr", Path_, "uint", Flags, "uint*", &Handle_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Handle_
    }

    /**
     * 
     * @param {PWSTR} Path_ 
     * @returns {Integer} 
     */
    GetExtensionByPathWide(Path_) {
        Path_ := Path_ is String ? StrPtr(Path_) : Path_

        result := ComCall(140, this, "ptr", Path_, "uint*", &Handle_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Handle_
    }

    /**
     * 
     * @param {Integer} Handle_ 
     * @param {PWSTR} Function 
     * @param {PWSTR} Arguments 
     * @returns {HRESULT} 
     */
    CallExtensionWide(Handle_, Function, Arguments) {
        Function := Function is String ? StrPtr(Function) : Function
        Arguments := Arguments is String ? StrPtr(Arguments) : Arguments

        result := ComCall(141, this, "uint", Handle_, "ptr", Function, "ptr", Arguments, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} Handle_ 
     * @param {PWSTR} FuncName 
     * @returns {Pointer<FARPROC>} 
     */
    GetExtensionFunctionWide(Handle_, FuncName) {
        FuncName := FuncName is String ? StrPtr(FuncName) : FuncName

        result := ComCall(142, this, "uint", Handle_, "ptr", FuncName, "ptr*", &Function := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Function
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {PWSTR} Buffer_ 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetEventFilterTextWide(Index, Buffer_, BufferSize) {
        Buffer_ := Buffer_ is String ? StrPtr(Buffer_) : Buffer_

        result := ComCall(143, this, "uint", Index, "ptr", Buffer_, "uint", BufferSize, "uint*", &TextSize := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TextSize
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {PWSTR} Buffer_ 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetEventFilterCommandWide(Index, Buffer_, BufferSize) {
        Buffer_ := Buffer_ is String ? StrPtr(Buffer_) : Buffer_

        result := ComCall(144, this, "uint", Index, "ptr", Buffer_, "uint", BufferSize, "uint*", &CommandSize := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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

        result := ComCall(145, this, "uint", Index, "ptr", Command, "int")
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
     * @returns {Integer} 
     */
    GetSpecificFilterArgumentWide(Index, Buffer_, BufferSize) {
        Buffer_ := Buffer_ is String ? StrPtr(Buffer_) : Buffer_

        result := ComCall(146, this, "uint", Index, "ptr", Buffer_, "uint", BufferSize, "uint*", &ArgumentSize := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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

        result := ComCall(147, this, "uint", Index, "ptr", Argument, "int")
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
     * @returns {Integer} 
     */
    GetExceptionFilterSecondCommandWide(Index, Buffer_, BufferSize) {
        Buffer_ := Buffer_ is String ? StrPtr(Buffer_) : Buffer_

        result := ComCall(148, this, "uint", Index, "ptr", Buffer_, "uint", BufferSize, "uint*", &CommandSize := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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

        result := ComCall(149, this, "uint", Index, "ptr", Command, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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

        result := ComCall(150, this, TypeMarshal, Type, ProcessIdMarshal, ProcessId, ThreadIdMarshal, ThreadId, "ptr", ExtraInformation, "uint", ExtraInformationSize, ExtraInformationUsedMarshal, ExtraInformationUsed, "ptr", Description, "uint", DescriptionSize, DescriptionUsedMarshal, DescriptionUsed, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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

        result := ComCall(151, this, "ptr", SrcText, "uint", Index, "ptr", SrcBuffer, "uint", SrcBufferSize, SrcSizeMarshal, SrcSize, "ptr", DstBuffer, "uint", DstBufferSize, DstSizeMarshal, DstSize, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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

        result := ComCall(154, this, "uint", Index, "ptr", FullNameBuffer, "uint", FullNameBufferSize, FullNameSizeMarshal, FullNameSize, "ptr", AbbrevNameBuffer, "uint", AbbrevNameBufferSize, AbbrevNameSizeMarshal, AbbrevNameSize, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Integer} Which 
     * @param {PWSTR} Buffer_ 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetEventIndexDescriptionWide(Index, Which, Buffer_, BufferSize) {
        Buffer_ := Buffer_ is String ? StrPtr(Buffer_) : Buffer_

        result := ComCall(155, this, "uint", Index, "uint", Which, "ptr", Buffer_, "uint", BufferSize, "uint*", &DescSize := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DescSize
    }

    /**
     * 
     * @param {PSTR} Buffer_ 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} FileSize 
     * @param {Pointer<Integer>} Flags 
     * @returns {HRESULT} 
     */
    GetLogFile2(Buffer_, BufferSize, FileSize, Flags) {
        Buffer_ := Buffer_ is String ? StrPtr(Buffer_) : Buffer_

        FileSizeMarshal := FileSize is VarRef ? "uint*" : "ptr"
        FlagsMarshal := Flags is VarRef ? "uint*" : "ptr"

        result := ComCall(156, this, "ptr", Buffer_, "uint", BufferSize, FileSizeMarshal, FileSize, FlagsMarshal, Flags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PSTR} File_ 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     */
    OpenLogFile2(File_, Flags) {
        File_ := File_ is String ? StrPtr(File_) : File_

        result := ComCall(157, this, "ptr", File_, "uint", Flags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PWSTR} Buffer_ 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} FileSize 
     * @param {Pointer<Integer>} Flags 
     * @returns {HRESULT} 
     */
    GetLogFile2Wide(Buffer_, BufferSize, FileSize, Flags) {
        Buffer_ := Buffer_ is String ? StrPtr(Buffer_) : Buffer_

        FileSizeMarshal := FileSize is VarRef ? "uint*" : "ptr"
        FlagsMarshal := Flags is VarRef ? "uint*" : "ptr"

        result := ComCall(158, this, "ptr", Buffer_, "uint", BufferSize, FileSizeMarshal, FileSize, FlagsMarshal, Flags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PWSTR} File_ 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     */
    OpenLogFile2Wide(File_, Flags) {
        File_ := File_ is String ? StrPtr(File_) : File_

        result := ComCall(159, this, "ptr", File_, "uint", Flags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} PlatformId_ 
     * @param {Pointer<Integer>} Win32Major 
     * @param {Pointer<Integer>} Win32Minor 
     * @param {Pointer<Integer>} KdMajor 
     * @param {Pointer<Integer>} KdMinor 
     * @returns {HRESULT} 
     */
    GetSystemVersionValues(PlatformId_, Win32Major, Win32Minor, KdMajor, KdMinor) {
        PlatformId_Marshal := PlatformId_ is VarRef ? "uint*" : "ptr"
        Win32MajorMarshal := Win32Major is VarRef ? "uint*" : "ptr"
        Win32MinorMarshal := Win32Minor is VarRef ? "uint*" : "ptr"
        KdMajorMarshal := KdMajor is VarRef ? "uint*" : "ptr"
        KdMinorMarshal := KdMinor is VarRef ? "uint*" : "ptr"

        result := ComCall(160, this, PlatformId_Marshal, PlatformId_, Win32MajorMarshal, Win32Major, Win32MinorMarshal, Win32Minor, KdMajorMarshal, KdMajor, KdMinorMarshal, KdMinor, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} Which 
     * @param {PSTR} Buffer_ 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetSystemVersionString(Which, Buffer_, BufferSize) {
        Buffer_ := Buffer_ is String ? StrPtr(Buffer_) : Buffer_

        result := ComCall(161, this, "uint", Which, "ptr", Buffer_, "uint", BufferSize, "uint*", &StringSize := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StringSize
    }

    /**
     * 
     * @param {Integer} Which 
     * @param {PWSTR} Buffer_ 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetSystemVersionStringWide(Which, Buffer_, BufferSize) {
        Buffer_ := Buffer_ is String ? StrPtr(Buffer_) : Buffer_

        result := ComCall(162, this, "uint", Which, "ptr", Buffer_, "uint", BufferSize, "uint*", &StringSize := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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

        result := ComCall(163, this, "ptr", StartContext, "uint", StartContextSize, "ptr", Frames, "uint", FramesSize, "ptr", FrameContexts, "uint", FrameContextsSize, "uint", FrameContextsEntrySize, FramesFilledMarshal, FramesFilled, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Type 
     * @param {Pointer<Integer>} ProcessId 
     * @param {Pointer<Integer>} ThreadId 
     * @param {Pointer} Context_ 
     * @param {Integer} ContextSize 
     * @param {Pointer<Integer>} ContextUsed 
     * @param {Pointer} ExtraInformation 
     * @param {Integer} ExtraInformationSize 
     * @param {Pointer<Integer>} ExtraInformationUsed 
     * @returns {HRESULT} 
     */
    GetStoredEventInformation(Type, ProcessId, ThreadId, Context_, ContextSize, ContextUsed, ExtraInformation, ExtraInformationSize, ExtraInformationUsed) {
        TypeMarshal := Type is VarRef ? "uint*" : "ptr"
        ProcessIdMarshal := ProcessId is VarRef ? "uint*" : "ptr"
        ThreadIdMarshal := ThreadId is VarRef ? "uint*" : "ptr"
        ContextUsedMarshal := ContextUsed is VarRef ? "uint*" : "ptr"
        ExtraInformationUsedMarshal := ExtraInformationUsed is VarRef ? "uint*" : "ptr"

        result := ComCall(165, this, TypeMarshal, Type, ProcessIdMarshal, ProcessId, ThreadIdMarshal, ThreadId, "ptr", Context_, "uint", ContextSize, ContextUsedMarshal, ContextUsed, "ptr", ExtraInformation, "uint", ExtraInformationSize, ExtraInformationUsedMarshal, ExtraInformationUsed, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Flags 
     * @param {Integer} WhichString 
     * @param {PSTR} String_ 
     * @param {Integer} StringSize 
     * @param {Pointer<Integer>} StringNeeded 
     * @returns {HRESULT} 
     */
    GetManagedStatus(Flags, WhichString, String_, StringSize, StringNeeded) {
        String_ := String_ is String ? StrPtr(String_) : String_

        FlagsMarshal := Flags is VarRef ? "uint*" : "ptr"
        StringNeededMarshal := StringNeeded is VarRef ? "uint*" : "ptr"

        result := ComCall(166, this, FlagsMarshal, Flags, "uint", WhichString, "ptr", String_, "uint", StringSize, StringNeededMarshal, StringNeeded, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Flags 
     * @param {Integer} WhichString 
     * @param {PWSTR} String_ 
     * @param {Integer} StringSize 
     * @param {Pointer<Integer>} StringNeeded 
     * @returns {HRESULT} 
     */
    GetManagedStatusWide(Flags, WhichString, String_, StringSize, StringNeeded) {
        String_ := String_ is String ? StrPtr(String_) : String_

        FlagsMarshal := Flags is VarRef ? "uint*" : "ptr"
        StringNeededMarshal := StringNeeded is VarRef ? "uint*" : "ptr"

        result := ComCall(167, this, FlagsMarshal, Flags, "uint", WhichString, "ptr", String_, "uint", StringSize, StringNeededMarshal, StringNeeded, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     */
    ResetManagedStatus(Flags) {
        result := ComCall(168, this, "uint", Flags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
