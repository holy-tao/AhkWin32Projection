#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\DEBUG_STACK_FRAME_EX.ahk" { DEBUG_STACK_FRAME_EX }
#Import ".\WINDBG_EXTENSION_APIS32.ahk" { WINDBG_EXTENSION_APIS32 }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DEBUG_SPECIFIC_FILTER_PARAMETERS.ahk" { DEBUG_SPECIFIC_FILTER_PARAMETERS }
#Import ".\DEBUG_EXCEPTION_FILTER_PARAMETERS.ahk" { DEBUG_EXCEPTION_FILTER_PARAMETERS }
#Import ".\WINDBG_EXTENSION_APIS64.ahk" { WINDBG_EXTENSION_APIS64 }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\IDebugBreakpoint2.ahk" { IDebugBreakpoint2 }
#Import ".\DEBUG_STACK_FRAME.ahk" { DEBUG_STACK_FRAME }
#Import "..\..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\DEBUG_BREAKPOINT_PARAMETERS.ahk" { DEBUG_BREAKPOINT_PARAMETERS }
#Import "..\..\..\..\Foundation\PSTR.ahk" { PSTR }
#Import ".\IDebugBreakpoint3.ahk" { IDebugBreakpoint3 }
#Import ".\IDebugBreakpoint.ahk" { IDebugBreakpoint }
#Import ".\DEBUG_VALUE.ahk" { DEBUG_VALUE }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IDebugControl6 extends IUnknown {
    /**
     * The interface identifier for IDebugControl6
     * @type {Guid}
     */
    static IID := Guid("{bc0d583f-126d-43a1-9cc4-a860ab1d537b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugControl6 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetInterrupt                             : IntPtr
        SetInterrupt                             : IntPtr
        GetInterruptTimeout                      : IntPtr
        SetInterruptTimeout                      : IntPtr
        GetLogFile                               : IntPtr
        OpenLogFile                              : IntPtr
        CloseLogFile                             : IntPtr
        GetLogMask                               : IntPtr
        SetLogMask                               : IntPtr
        Input                                    : IntPtr
        ReturnInput                              : IntPtr
        Output                                   : IntPtr
        OutputVaList                             : IntPtr
        ControlledOutput                         : IntPtr
        ControlledOutputVaList                   : IntPtr
        OutputPrompt                             : IntPtr
        OutputPromptVaList                       : IntPtr
        GetPromptText                            : IntPtr
        OutputCurrentState                       : IntPtr
        OutputVersionInformation                 : IntPtr
        GetNotifyEventHandle                     : IntPtr
        SetNotifyEventHandle                     : IntPtr
        Assemble                                 : IntPtr
        Disassemble                              : IntPtr
        GetDisassembleEffectiveOffset            : IntPtr
        OutputDisassembly                        : IntPtr
        OutputDisassemblyLines                   : IntPtr
        GetNearInstruction                       : IntPtr
        GetStackTrace                            : IntPtr
        GetReturnOffset                          : IntPtr
        OutputStackTrace                         : IntPtr
        GetDebuggeeType                          : IntPtr
        GetActualProcessorType                   : IntPtr
        GetExecutingProcessorType                : IntPtr
        GetNumberPossibleExecutingProcessorTypes : IntPtr
        GetPossibleExecutingProcessorTypes       : IntPtr
        GetNumberProcessors                      : IntPtr
        GetSystemVersion                         : IntPtr
        GetPageSize                              : IntPtr
        IsPointer64Bit                           : IntPtr
        ReadBugCheckData                         : IntPtr
        GetNumberSupportedProcessorTypes         : IntPtr
        GetSupportedProcessorTypes               : IntPtr
        GetProcessorTypeNames                    : IntPtr
        GetEffectiveProcessorType                : IntPtr
        SetEffectiveProcessorType                : IntPtr
        GetExecutionStatus                       : IntPtr
        SetExecutionStatus                       : IntPtr
        GetCodeLevel                             : IntPtr
        SetCodeLevel                             : IntPtr
        GetEngineOptions                         : IntPtr
        AddEngineOptions                         : IntPtr
        RemoveEngineOptions                      : IntPtr
        SetEngineOptions                         : IntPtr
        GetSystemErrorControl                    : IntPtr
        SetSystemErrorControl                    : IntPtr
        GetTextMacro                             : IntPtr
        SetTextMacro                             : IntPtr
        GetRadix                                 : IntPtr
        SetRadix                                 : IntPtr
        Evaluate                                 : IntPtr
        CoerceValue                              : IntPtr
        CoerceValues                             : IntPtr
        Execute                                  : IntPtr
        ExecuteCommandFile                       : IntPtr
        GetNumberBreakpoints                     : IntPtr
        GetBreakpointByIndex                     : IntPtr
        GetBreakpointById                        : IntPtr
        GetBreakpointParameters                  : IntPtr
        AddBreakpoint                            : IntPtr
        RemoveBreakpoint                         : IntPtr
        AddExtension                             : IntPtr
        RemoveExtension                          : IntPtr
        GetExtensionByPath                       : IntPtr
        CallExtension                            : IntPtr
        GetExtensionFunction                     : IntPtr
        GetWindbgExtensionApis32                 : IntPtr
        GetWindbgExtensionApis64                 : IntPtr
        GetNumberEventFilters                    : IntPtr
        GetEventFilterText                       : IntPtr
        GetEventFilterCommand                    : IntPtr
        SetEventFilterCommand                    : IntPtr
        GetSpecificFilterParameters              : IntPtr
        SetSpecificFilterParameters              : IntPtr
        GetSpecificFilterArgument                : IntPtr
        SetSpecificFilterArgument                : IntPtr
        GetExceptionFilterParameters             : IntPtr
        SetExceptionFilterParameters             : IntPtr
        GetExceptionFilterSecondCommand          : IntPtr
        SetExceptionFilterSecondCommand          : IntPtr
        WaitForEvent                             : IntPtr
        GetLastEventInformation                  : IntPtr
        GetCurrentTimeDate                       : IntPtr
        GetCurrentSystemUpTime                   : IntPtr
        GetDumpFormatFlags                       : IntPtr
        GetNumberTextReplacements                : IntPtr
        GetTextReplacement                       : IntPtr
        SetTextReplacement                       : IntPtr
        RemoveTextReplacements                   : IntPtr
        OutputTextReplacements                   : IntPtr
        GetAssemblyOptions                       : IntPtr
        AddAssemblyOptions                       : IntPtr
        RemoveAssemblyOptions                    : IntPtr
        SetAssemblyOptions                       : IntPtr
        GetExpressionSyntax                      : IntPtr
        SetExpressionSyntax                      : IntPtr
        SetExpressionSyntaxByName                : IntPtr
        GetNumberExpressionSyntaxes              : IntPtr
        GetExpressionSyntaxNames                 : IntPtr
        GetNumberEvents                          : IntPtr
        GetEventIndexDescription                 : IntPtr
        GetCurrentEventIndex                     : IntPtr
        SetNextEventIndex                        : IntPtr
        GetLogFileWide                           : IntPtr
        OpenLogFileWide                          : IntPtr
        InputWide                                : IntPtr
        ReturnInputWide                          : IntPtr
        OutputWide                               : IntPtr
        OutputVaListWide                         : IntPtr
        ControlledOutputWide                     : IntPtr
        ControlledOutputVaListWide               : IntPtr
        OutputPromptWide                         : IntPtr
        OutputPromptVaListWide                   : IntPtr
        GetPromptTextWide                        : IntPtr
        AssembleWide                             : IntPtr
        DisassembleWide                          : IntPtr
        GetProcessorTypeNamesWide                : IntPtr
        GetTextMacroWide                         : IntPtr
        SetTextMacroWide                         : IntPtr
        EvaluateWide                             : IntPtr
        ExecuteWide                              : IntPtr
        ExecuteCommandFileWide                   : IntPtr
        GetBreakpointByIndex2                    : IntPtr
        GetBreakpointById2                       : IntPtr
        AddBreakpoint2                           : IntPtr
        RemoveBreakpoint2                        : IntPtr
        AddExtensionWide                         : IntPtr
        GetExtensionByPathWide                   : IntPtr
        CallExtensionWide                        : IntPtr
        GetExtensionFunctionWide                 : IntPtr
        GetEventFilterTextWide                   : IntPtr
        GetEventFilterCommandWide                : IntPtr
        SetEventFilterCommandWide                : IntPtr
        GetSpecificFilterArgumentWide            : IntPtr
        SetSpecificFilterArgumentWide            : IntPtr
        GetExceptionFilterSecondCommandWide      : IntPtr
        SetExceptionFilterSecondCommandWide      : IntPtr
        GetLastEventInformationWide              : IntPtr
        GetTextReplacementWide                   : IntPtr
        SetTextReplacementWide                   : IntPtr
        SetExpressionSyntaxByNameWide            : IntPtr
        GetExpressionSyntaxNamesWide             : IntPtr
        GetEventIndexDescriptionWide             : IntPtr
        GetLogFile2                              : IntPtr
        OpenLogFile2                             : IntPtr
        GetLogFile2Wide                          : IntPtr
        OpenLogFile2Wide                         : IntPtr
        GetSystemVersionValues                   : IntPtr
        GetSystemVersionString                   : IntPtr
        GetSystemVersionStringWide               : IntPtr
        GetContextStackTrace                     : IntPtr
        OutputContextStackTrace                  : IntPtr
        GetStoredEventInformation                : IntPtr
        GetManagedStatus                         : IntPtr
        GetManagedStatusWide                     : IntPtr
        ResetManagedStatus                       : IntPtr
        GetStackTraceEx                          : IntPtr
        OutputStackTraceEx                       : IntPtr
        GetContextStackTraceEx                   : IntPtr
        OutputContextStackTraceEx                : IntPtr
        GetBreakpointByGuid                      : IntPtr
        GetExecutionStatusEx                     : IntPtr
        GetSynchronizationStatus                 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugControl6.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @param {PSTR} _Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} FileSize 
     * @param {Pointer<BOOL>} Append 
     * @returns {HRESULT} 
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

        result := ComCall(8, this, "ptr", _File, BOOL, Append, "HRESULT")
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

        result := ComCall(31, this, "uint", FrameOffset, "uint", StackOffset, "uint", InstructionOffset, DEBUG_STACK_FRAME.Ptr, Frames, "uint", FramesSize, FramesFilledMarshal, FramesFilled, "HRESULT")
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
        result := ComCall(33, this, "uint", OutputControl, DEBUG_STACK_FRAME.Ptr, Frames, "uint", FramesSize, "uint", Flags, "HRESULT")
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

        result := ComCall(63, this, "ptr", Expression, "uint", DesiredType, DEBUG_VALUE.Ptr, Value, RemainderIndexMarshal, RemainderIndex, "HRESULT")
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
        result := ComCall(64, this, DEBUG_VALUE.Ptr, _In, "uint", OutType, DEBUG_VALUE.Ptr, Out, "HRESULT")
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
        result := ComCall(65, this, "uint", Count, DEBUG_VALUE.Ptr, _In, OutTypesMarshal, OutTypes, DEBUG_VALUE.Ptr, Out, "HRESULT")
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
        result := ComCall(71, this, "uint", Count, IdsMarshal, Ids, "uint", Start, DEBUG_BREAKPOINT_PARAMETERS.Ptr, Params, "HRESULT")
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
        result := ComCall(79, this, WINDBG_EXTENSION_APIS32.Ptr, Api, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<WINDBG_EXTENSION_APIS64>} Api 
     * @returns {HRESULT} 
     */
    GetWindbgExtensionApis64(Api) {
        result := ComCall(80, this, WINDBG_EXTENSION_APIS64.Ptr, Api, "HRESULT")
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
        result := ComCall(85, this, "uint", Start, "uint", Count, DEBUG_SPECIFIC_FILTER_PARAMETERS.Ptr, Params, "HRESULT")
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
        result := ComCall(86, this, "uint", Start, "uint", Count, DEBUG_SPECIFIC_FILTER_PARAMETERS.Ptr, Params, "HRESULT")
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
        result := ComCall(89, this, "uint", Count, CodesMarshal, Codes, "uint", Start, DEBUG_EXCEPTION_FILTER_PARAMETERS.Ptr, Params, "HRESULT")
        return Params
    }

    /**
     * 
     * @param {Integer} Count 
     * @param {Pointer<DEBUG_EXCEPTION_FILTER_PARAMETERS>} Params 
     * @returns {HRESULT} 
     */
    SetExceptionFilterParameters(Count, Params) {
        result := ComCall(90, this, "uint", Count, DEBUG_EXCEPTION_FILTER_PARAMETERS.Ptr, Params, "HRESULT")
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
     * @param {Integer} ExtraInformation 
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
        result := ComCall(110, this, "uint*", &_Number := 0, "HRESULT")
        return _Number
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
     * @param {PSTR} _Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetEventIndexDescription(Index, Which, _Buffer, BufferSize) {
        _Buffer := _Buffer is String ? StrPtr(_Buffer) : _Buffer

        result := ComCall(113, this, "uint", Index, "uint", Which, "ptr", _Buffer, "uint", BufferSize, "uint*", &DescSize := 0, "HRESULT")
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
     * @param {PWSTR} _Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} FileSize 
     * @param {Pointer<BOOL>} Append 
     * @returns {HRESULT} 
     */
    GetLogFileWide(_Buffer, BufferSize, FileSize, Append) {
        _Buffer := _Buffer is String ? StrPtr(_Buffer) : _Buffer

        FileSizeMarshal := FileSize is VarRef ? "uint*" : "ptr"
        AppendMarshal := Append is VarRef ? "int*" : "ptr"

        result := ComCall(116, this, "ptr", _Buffer, "uint", BufferSize, FileSizeMarshal, FileSize, AppendMarshal, Append, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} _File 
     * @param {BOOL} Append 
     * @returns {HRESULT} 
     */
    OpenLogFileWide(_File, Append) {
        _File := _File is String ? StrPtr(_File) : _File

        result := ComCall(117, this, "ptr", _File, BOOL, Append, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} _Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    InputWide(_Buffer, BufferSize) {
        _Buffer := _Buffer is String ? StrPtr(_Buffer) : _Buffer

        result := ComCall(118, this, "ptr", _Buffer, "uint", BufferSize, "uint*", &InputSize := 0, "HRESULT")
        return InputSize
    }

    /**
     * 
     * @param {PWSTR} _Buffer 
     * @returns {HRESULT} 
     */
    ReturnInputWide(_Buffer) {
        _Buffer := _Buffer is String ? StrPtr(_Buffer) : _Buffer

        result := ComCall(119, this, "ptr", _Buffer, "HRESULT")
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
     * @param {PWSTR} _Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetPromptTextWide(_Buffer, BufferSize) {
        _Buffer := _Buffer is String ? StrPtr(_Buffer) : _Buffer

        result := ComCall(126, this, "ptr", _Buffer, "uint", BufferSize, "uint*", &TextSize := 0, "HRESULT")
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
     * @param {PWSTR} _Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} DisassemblySize 
     * @param {Pointer<Integer>} EndOffset 
     * @returns {HRESULT} 
     */
    DisassembleWide(Offset, Flags, _Buffer, BufferSize, DisassemblySize, EndOffset) {
        _Buffer := _Buffer is String ? StrPtr(_Buffer) : _Buffer

        DisassemblySizeMarshal := DisassemblySize is VarRef ? "uint*" : "ptr"
        EndOffsetMarshal := EndOffset is VarRef ? "uint*" : "ptr"

        result := ComCall(128, this, "uint", Offset, "uint", Flags, "ptr", _Buffer, "uint", BufferSize, DisassemblySizeMarshal, DisassemblySize, EndOffsetMarshal, EndOffset, "HRESULT")
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
     * @param {PWSTR} _Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetTextMacroWide(Slot, _Buffer, BufferSize) {
        _Buffer := _Buffer is String ? StrPtr(_Buffer) : _Buffer

        result := ComCall(130, this, "uint", Slot, "ptr", _Buffer, "uint", BufferSize, "uint*", &MacroSize := 0, "HRESULT")
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

        result := ComCall(132, this, "ptr", Expression, "uint", DesiredType, DEBUG_VALUE.Ptr, Value, RemainderIndexMarshal, RemainderIndex, "HRESULT")
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
     * @param {PWSTR} _Path 
     * @param {Integer} Flags 
     * @returns {Integer} 
     */
    AddExtensionWide(_Path, Flags) {
        _Path := _Path is String ? StrPtr(_Path) : _Path

        result := ComCall(139, this, "ptr", _Path, "uint", Flags, "uint*", &_Handle := 0, "HRESULT")
        return _Handle
    }

    /**
     * 
     * @param {PWSTR} _Path 
     * @returns {Integer} 
     */
    GetExtensionByPathWide(_Path) {
        _Path := _Path is String ? StrPtr(_Path) : _Path

        result := ComCall(140, this, "ptr", _Path, "uint*", &_Handle := 0, "HRESULT")
        return _Handle
    }

    /**
     * 
     * @param {Integer} _Handle 
     * @param {PWSTR} Function 
     * @param {PWSTR} Arguments 
     * @returns {HRESULT} 
     */
    CallExtensionWide(_Handle, Function, Arguments) {
        Function := Function is String ? StrPtr(Function) : Function
        Arguments := Arguments is String ? StrPtr(Arguments) : Arguments

        result := ComCall(141, this, "uint", _Handle, "ptr", Function, "ptr", Arguments, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} _Handle 
     * @param {PWSTR} FuncName 
     * @returns {Pointer<FARPROC>} 
     */
    GetExtensionFunctionWide(_Handle, FuncName) {
        FuncName := FuncName is String ? StrPtr(FuncName) : FuncName

        result := ComCall(142, this, "uint", _Handle, "ptr", FuncName, "ptr*", &Function := 0, "HRESULT")
        return Function
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {PWSTR} _Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetEventFilterTextWide(Index, _Buffer, BufferSize) {
        _Buffer := _Buffer is String ? StrPtr(_Buffer) : _Buffer

        result := ComCall(143, this, "uint", Index, "ptr", _Buffer, "uint", BufferSize, "uint*", &TextSize := 0, "HRESULT")
        return TextSize
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {PWSTR} _Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetEventFilterCommandWide(Index, _Buffer, BufferSize) {
        _Buffer := _Buffer is String ? StrPtr(_Buffer) : _Buffer

        result := ComCall(144, this, "uint", Index, "ptr", _Buffer, "uint", BufferSize, "uint*", &CommandSize := 0, "HRESULT")
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
     * @param {PWSTR} _Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetSpecificFilterArgumentWide(Index, _Buffer, BufferSize) {
        _Buffer := _Buffer is String ? StrPtr(_Buffer) : _Buffer

        result := ComCall(146, this, "uint", Index, "ptr", _Buffer, "uint", BufferSize, "uint*", &ArgumentSize := 0, "HRESULT")
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
     * @param {PWSTR} _Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetExceptionFilterSecondCommandWide(Index, _Buffer, BufferSize) {
        _Buffer := _Buffer is String ? StrPtr(_Buffer) : _Buffer

        result := ComCall(148, this, "uint", Index, "ptr", _Buffer, "uint", BufferSize, "uint*", &CommandSize := 0, "HRESULT")
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
     * @param {Integer} ExtraInformation 
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
     * @param {PWSTR} _Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetEventIndexDescriptionWide(Index, Which, _Buffer, BufferSize) {
        _Buffer := _Buffer is String ? StrPtr(_Buffer) : _Buffer

        result := ComCall(155, this, "uint", Index, "uint", Which, "ptr", _Buffer, "uint", BufferSize, "uint*", &DescSize := 0, "HRESULT")
        return DescSize
    }

    /**
     * 
     * @param {PSTR} _Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} FileSize 
     * @param {Pointer<Integer>} Flags 
     * @returns {HRESULT} 
     */
    GetLogFile2(_Buffer, BufferSize, FileSize, Flags) {
        _Buffer := _Buffer is String ? StrPtr(_Buffer) : _Buffer

        FileSizeMarshal := FileSize is VarRef ? "uint*" : "ptr"
        FlagsMarshal := Flags is VarRef ? "uint*" : "ptr"

        result := ComCall(156, this, "ptr", _Buffer, "uint", BufferSize, FileSizeMarshal, FileSize, FlagsMarshal, Flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} _File 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     */
    OpenLogFile2(_File, Flags) {
        _File := _File is String ? StrPtr(_File) : _File

        result := ComCall(157, this, "ptr", _File, "uint", Flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} _Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} FileSize 
     * @param {Pointer<Integer>} Flags 
     * @returns {HRESULT} 
     */
    GetLogFile2Wide(_Buffer, BufferSize, FileSize, Flags) {
        _Buffer := _Buffer is String ? StrPtr(_Buffer) : _Buffer

        FileSizeMarshal := FileSize is VarRef ? "uint*" : "ptr"
        FlagsMarshal := Flags is VarRef ? "uint*" : "ptr"

        result := ComCall(158, this, "ptr", _Buffer, "uint", BufferSize, FileSizeMarshal, FileSize, FlagsMarshal, Flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} _File 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     */
    OpenLogFile2Wide(_File, Flags) {
        _File := _File is String ? StrPtr(_File) : _File

        result := ComCall(159, this, "ptr", _File, "uint", Flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} _PlatformId 
     * @param {Pointer<Integer>} Win32Major 
     * @param {Pointer<Integer>} Win32Minor 
     * @param {Pointer<Integer>} KdMajor 
     * @param {Pointer<Integer>} KdMinor 
     * @returns {HRESULT} 
     */
    GetSystemVersionValues(_PlatformId, Win32Major, Win32Minor, KdMajor, KdMinor) {
        _PlatformIdMarshal := _PlatformId is VarRef ? "uint*" : "ptr"
        Win32MajorMarshal := Win32Major is VarRef ? "uint*" : "ptr"
        Win32MinorMarshal := Win32Minor is VarRef ? "uint*" : "ptr"
        KdMajorMarshal := KdMajor is VarRef ? "uint*" : "ptr"
        KdMinorMarshal := KdMinor is VarRef ? "uint*" : "ptr"

        result := ComCall(160, this, _PlatformIdMarshal, _PlatformId, Win32MajorMarshal, Win32Major, Win32MinorMarshal, Win32Minor, KdMajorMarshal, KdMajor, KdMinorMarshal, KdMinor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Which 
     * @param {PSTR} _Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetSystemVersionString(Which, _Buffer, BufferSize) {
        _Buffer := _Buffer is String ? StrPtr(_Buffer) : _Buffer

        result := ComCall(161, this, "uint", Which, "ptr", _Buffer, "uint", BufferSize, "uint*", &StringSize := 0, "HRESULT")
        return StringSize
    }

    /**
     * 
     * @param {Integer} Which 
     * @param {PWSTR} _Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetSystemVersionStringWide(Which, _Buffer, BufferSize) {
        _Buffer := _Buffer is String ? StrPtr(_Buffer) : _Buffer

        result := ComCall(162, this, "uint", Which, "ptr", _Buffer, "uint", BufferSize, "uint*", &StringSize := 0, "HRESULT")
        return StringSize
    }

    /**
     * 
     * @param {Integer} StartContext 
     * @param {Integer} StartContextSize 
     * @param {Pointer<DEBUG_STACK_FRAME>} Frames 
     * @param {Integer} FramesSize 
     * @param {Integer} FrameContexts 
     * @param {Integer} FrameContextsSize 
     * @param {Integer} FrameContextsEntrySize 
     * @param {Pointer<Integer>} FramesFilled 
     * @returns {HRESULT} 
     */
    GetContextStackTrace(StartContext, StartContextSize, Frames, FramesSize, FrameContexts, FrameContextsSize, FrameContextsEntrySize, FramesFilled) {
        FramesFilledMarshal := FramesFilled is VarRef ? "uint*" : "ptr"

        result := ComCall(163, this, "ptr", StartContext, "uint", StartContextSize, DEBUG_STACK_FRAME.Ptr, Frames, "uint", FramesSize, "ptr", FrameContexts, "uint", FrameContextsSize, "uint", FrameContextsEntrySize, FramesFilledMarshal, FramesFilled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} OutputControl 
     * @param {Pointer<DEBUG_STACK_FRAME>} Frames 
     * @param {Integer} FramesSize 
     * @param {Integer} FrameContexts 
     * @param {Integer} FrameContextsSize 
     * @param {Integer} FrameContextsEntrySize 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     */
    OutputContextStackTrace(OutputControl, Frames, FramesSize, FrameContexts, FrameContextsSize, FrameContextsEntrySize, Flags) {
        result := ComCall(164, this, "uint", OutputControl, DEBUG_STACK_FRAME.Ptr, Frames, "uint", FramesSize, "ptr", FrameContexts, "uint", FrameContextsSize, "uint", FrameContextsEntrySize, "uint", Flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Type 
     * @param {Pointer<Integer>} ProcessId 
     * @param {Pointer<Integer>} ThreadId 
     * @param {Integer} _Context 
     * @param {Integer} ContextSize 
     * @param {Pointer<Integer>} ContextUsed 
     * @param {Integer} ExtraInformation 
     * @param {Integer} ExtraInformationSize 
     * @param {Pointer<Integer>} ExtraInformationUsed 
     * @returns {HRESULT} 
     */
    GetStoredEventInformation(Type, ProcessId, ThreadId, _Context, ContextSize, ContextUsed, ExtraInformation, ExtraInformationSize, ExtraInformationUsed) {
        TypeMarshal := Type is VarRef ? "uint*" : "ptr"
        ProcessIdMarshal := ProcessId is VarRef ? "uint*" : "ptr"
        ThreadIdMarshal := ThreadId is VarRef ? "uint*" : "ptr"
        ContextUsedMarshal := ContextUsed is VarRef ? "uint*" : "ptr"
        ExtraInformationUsedMarshal := ExtraInformationUsed is VarRef ? "uint*" : "ptr"

        result := ComCall(165, this, TypeMarshal, Type, ProcessIdMarshal, ProcessId, ThreadIdMarshal, ThreadId, "ptr", _Context, "uint", ContextSize, ContextUsedMarshal, ContextUsed, "ptr", ExtraInformation, "uint", ExtraInformationSize, ExtraInformationUsedMarshal, ExtraInformationUsed, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Flags 
     * @param {Integer} WhichString 
     * @param {PSTR} _String 
     * @param {Integer} StringSize 
     * @param {Pointer<Integer>} StringNeeded 
     * @returns {HRESULT} 
     */
    GetManagedStatus(Flags, WhichString, _String, StringSize, StringNeeded) {
        _String := _String is String ? StrPtr(_String) : _String

        FlagsMarshal := Flags is VarRef ? "uint*" : "ptr"
        StringNeededMarshal := StringNeeded is VarRef ? "uint*" : "ptr"

        result := ComCall(166, this, FlagsMarshal, Flags, "uint", WhichString, "ptr", _String, "uint", StringSize, StringNeededMarshal, StringNeeded, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Flags 
     * @param {Integer} WhichString 
     * @param {PWSTR} _String 
     * @param {Integer} StringSize 
     * @param {Pointer<Integer>} StringNeeded 
     * @returns {HRESULT} 
     */
    GetManagedStatusWide(Flags, WhichString, _String, StringSize, StringNeeded) {
        _String := _String is String ? StrPtr(_String) : _String

        FlagsMarshal := Flags is VarRef ? "uint*" : "ptr"
        StringNeededMarshal := StringNeeded is VarRef ? "uint*" : "ptr"

        result := ComCall(167, this, FlagsMarshal, Flags, "uint", WhichString, "ptr", _String, "uint", StringSize, StringNeededMarshal, StringNeeded, "HRESULT")
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
        FramesFilledMarshal := FramesFilled is VarRef ? "uint*" : "ptr"

        result := ComCall(169, this, "uint", FrameOffset, "uint", StackOffset, "uint", InstructionOffset, DEBUG_STACK_FRAME_EX.Ptr, Frames, "uint", FramesSize, FramesFilledMarshal, FramesFilled, "HRESULT")
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
        result := ComCall(170, this, "uint", OutputControl, DEBUG_STACK_FRAME_EX.Ptr, Frames, "uint", FramesSize, "uint", Flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} StartContext 
     * @param {Integer} StartContextSize 
     * @param {Pointer<DEBUG_STACK_FRAME_EX>} Frames 
     * @param {Integer} FramesSize 
     * @param {Integer} FrameContexts 
     * @param {Integer} FrameContextsSize 
     * @param {Integer} FrameContextsEntrySize 
     * @param {Pointer<Integer>} FramesFilled 
     * @returns {HRESULT} 
     */
    GetContextStackTraceEx(StartContext, StartContextSize, Frames, FramesSize, FrameContexts, FrameContextsSize, FrameContextsEntrySize, FramesFilled) {
        FramesFilledMarshal := FramesFilled is VarRef ? "uint*" : "ptr"

        result := ComCall(171, this, "ptr", StartContext, "uint", StartContextSize, DEBUG_STACK_FRAME_EX.Ptr, Frames, "uint", FramesSize, "ptr", FrameContexts, "uint", FrameContextsSize, "uint", FrameContextsEntrySize, FramesFilledMarshal, FramesFilled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} OutputControl 
     * @param {Pointer<DEBUG_STACK_FRAME_EX>} Frames 
     * @param {Integer} FramesSize 
     * @param {Integer} FrameContexts 
     * @param {Integer} FrameContextsSize 
     * @param {Integer} FrameContextsEntrySize 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     */
    OutputContextStackTraceEx(OutputControl, Frames, FramesSize, FrameContexts, FrameContextsSize, FrameContextsEntrySize, Flags) {
        result := ComCall(172, this, "uint", OutputControl, DEBUG_STACK_FRAME_EX.Ptr, Frames, "uint", FramesSize, "ptr", FrameContexts, "uint", FrameContextsSize, "uint", FrameContextsEntrySize, "uint", Flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} Guid 
     * @returns {IDebugBreakpoint3} 
     */
    GetBreakpointByGuid(Guid) {
        result := ComCall(173, this, Guid.Ptr, Guid, "ptr*", &Bp := 0, "HRESULT")
        return IDebugBreakpoint3(Bp)
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetExecutionStatusEx() {
        result := ComCall(174, this, "uint*", &_Status := 0, "HRESULT")
        return _Status
    }

    /**
     * 
     * @param {Pointer<Integer>} SendsAttempted 
     * @param {Pointer<Integer>} SecondsSinceLastResponse 
     * @returns {HRESULT} 
     */
    GetSynchronizationStatus(SendsAttempted, SecondsSinceLastResponse) {
        SendsAttemptedMarshal := SendsAttempted is VarRef ? "uint*" : "ptr"
        SecondsSinceLastResponseMarshal := SecondsSinceLastResponse is VarRef ? "uint*" : "ptr"

        result := ComCall(175, this, SendsAttemptedMarshal, SendsAttempted, SecondsSinceLastResponseMarshal, SecondsSinceLastResponse, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDebugControl6.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetInterrupt := CallbackCreate(GetMethod(implObj, "GetInterrupt"), flags, 1)
        this.vtbl.SetInterrupt := CallbackCreate(GetMethod(implObj, "SetInterrupt"), flags, 2)
        this.vtbl.GetInterruptTimeout := CallbackCreate(GetMethod(implObj, "GetInterruptTimeout"), flags, 2)
        this.vtbl.SetInterruptTimeout := CallbackCreate(GetMethod(implObj, "SetInterruptTimeout"), flags, 2)
        this.vtbl.GetLogFile := CallbackCreate(GetMethod(implObj, "GetLogFile"), flags, 5)
        this.vtbl.OpenLogFile := CallbackCreate(GetMethod(implObj, "OpenLogFile"), flags, 3)
        this.vtbl.CloseLogFile := CallbackCreate(GetMethod(implObj, "CloseLogFile"), flags, 1)
        this.vtbl.GetLogMask := CallbackCreate(GetMethod(implObj, "GetLogMask"), flags, 2)
        this.vtbl.SetLogMask := CallbackCreate(GetMethod(implObj, "SetLogMask"), flags, 2)
        this.vtbl.Input := CallbackCreate(GetMethod(implObj, "Input"), flags, 4)
        this.vtbl.ReturnInput := CallbackCreate(GetMethod(implObj, "ReturnInput"), flags, 2)
        this.vtbl.Output := CallbackCreate(GetMethod(implObj, "Output"), flags, 3)
        this.vtbl.OutputVaList := CallbackCreate(GetMethod(implObj, "OutputVaList"), flags, 4)
        this.vtbl.ControlledOutput := CallbackCreate(GetMethod(implObj, "ControlledOutput"), flags, 4)
        this.vtbl.ControlledOutputVaList := CallbackCreate(GetMethod(implObj, "ControlledOutputVaList"), flags, 5)
        this.vtbl.OutputPrompt := CallbackCreate(GetMethod(implObj, "OutputPrompt"), flags, 3)
        this.vtbl.OutputPromptVaList := CallbackCreate(GetMethod(implObj, "OutputPromptVaList"), flags, 4)
        this.vtbl.GetPromptText := CallbackCreate(GetMethod(implObj, "GetPromptText"), flags, 4)
        this.vtbl.OutputCurrentState := CallbackCreate(GetMethod(implObj, "OutputCurrentState"), flags, 3)
        this.vtbl.OutputVersionInformation := CallbackCreate(GetMethod(implObj, "OutputVersionInformation"), flags, 2)
        this.vtbl.GetNotifyEventHandle := CallbackCreate(GetMethod(implObj, "GetNotifyEventHandle"), flags, 2)
        this.vtbl.SetNotifyEventHandle := CallbackCreate(GetMethod(implObj, "SetNotifyEventHandle"), flags, 2)
        this.vtbl.Assemble := CallbackCreate(GetMethod(implObj, "Assemble"), flags, 4)
        this.vtbl.Disassemble := CallbackCreate(GetMethod(implObj, "Disassemble"), flags, 7)
        this.vtbl.GetDisassembleEffectiveOffset := CallbackCreate(GetMethod(implObj, "GetDisassembleEffectiveOffset"), flags, 2)
        this.vtbl.OutputDisassembly := CallbackCreate(GetMethod(implObj, "OutputDisassembly"), flags, 5)
        this.vtbl.OutputDisassemblyLines := CallbackCreate(GetMethod(implObj, "OutputDisassemblyLines"), flags, 10)
        this.vtbl.GetNearInstruction := CallbackCreate(GetMethod(implObj, "GetNearInstruction"), flags, 4)
        this.vtbl.GetStackTrace := CallbackCreate(GetMethod(implObj, "GetStackTrace"), flags, 7)
        this.vtbl.GetReturnOffset := CallbackCreate(GetMethod(implObj, "GetReturnOffset"), flags, 2)
        this.vtbl.OutputStackTrace := CallbackCreate(GetMethod(implObj, "OutputStackTrace"), flags, 5)
        this.vtbl.GetDebuggeeType := CallbackCreate(GetMethod(implObj, "GetDebuggeeType"), flags, 3)
        this.vtbl.GetActualProcessorType := CallbackCreate(GetMethod(implObj, "GetActualProcessorType"), flags, 2)
        this.vtbl.GetExecutingProcessorType := CallbackCreate(GetMethod(implObj, "GetExecutingProcessorType"), flags, 2)
        this.vtbl.GetNumberPossibleExecutingProcessorTypes := CallbackCreate(GetMethod(implObj, "GetNumberPossibleExecutingProcessorTypes"), flags, 2)
        this.vtbl.GetPossibleExecutingProcessorTypes := CallbackCreate(GetMethod(implObj, "GetPossibleExecutingProcessorTypes"), flags, 4)
        this.vtbl.GetNumberProcessors := CallbackCreate(GetMethod(implObj, "GetNumberProcessors"), flags, 2)
        this.vtbl.GetSystemVersion := CallbackCreate(GetMethod(implObj, "GetSystemVersion"), flags, 11)
        this.vtbl.GetPageSize := CallbackCreate(GetMethod(implObj, "GetPageSize"), flags, 2)
        this.vtbl.IsPointer64Bit := CallbackCreate(GetMethod(implObj, "IsPointer64Bit"), flags, 1)
        this.vtbl.ReadBugCheckData := CallbackCreate(GetMethod(implObj, "ReadBugCheckData"), flags, 6)
        this.vtbl.GetNumberSupportedProcessorTypes := CallbackCreate(GetMethod(implObj, "GetNumberSupportedProcessorTypes"), flags, 2)
        this.vtbl.GetSupportedProcessorTypes := CallbackCreate(GetMethod(implObj, "GetSupportedProcessorTypes"), flags, 4)
        this.vtbl.GetProcessorTypeNames := CallbackCreate(GetMethod(implObj, "GetProcessorTypeNames"), flags, 8)
        this.vtbl.GetEffectiveProcessorType := CallbackCreate(GetMethod(implObj, "GetEffectiveProcessorType"), flags, 2)
        this.vtbl.SetEffectiveProcessorType := CallbackCreate(GetMethod(implObj, "SetEffectiveProcessorType"), flags, 2)
        this.vtbl.GetExecutionStatus := CallbackCreate(GetMethod(implObj, "GetExecutionStatus"), flags, 2)
        this.vtbl.SetExecutionStatus := CallbackCreate(GetMethod(implObj, "SetExecutionStatus"), flags, 2)
        this.vtbl.GetCodeLevel := CallbackCreate(GetMethod(implObj, "GetCodeLevel"), flags, 2)
        this.vtbl.SetCodeLevel := CallbackCreate(GetMethod(implObj, "SetCodeLevel"), flags, 2)
        this.vtbl.GetEngineOptions := CallbackCreate(GetMethod(implObj, "GetEngineOptions"), flags, 2)
        this.vtbl.AddEngineOptions := CallbackCreate(GetMethod(implObj, "AddEngineOptions"), flags, 2)
        this.vtbl.RemoveEngineOptions := CallbackCreate(GetMethod(implObj, "RemoveEngineOptions"), flags, 2)
        this.vtbl.SetEngineOptions := CallbackCreate(GetMethod(implObj, "SetEngineOptions"), flags, 2)
        this.vtbl.GetSystemErrorControl := CallbackCreate(GetMethod(implObj, "GetSystemErrorControl"), flags, 3)
        this.vtbl.SetSystemErrorControl := CallbackCreate(GetMethod(implObj, "SetSystemErrorControl"), flags, 3)
        this.vtbl.GetTextMacro := CallbackCreate(GetMethod(implObj, "GetTextMacro"), flags, 5)
        this.vtbl.SetTextMacro := CallbackCreate(GetMethod(implObj, "SetTextMacro"), flags, 3)
        this.vtbl.GetRadix := CallbackCreate(GetMethod(implObj, "GetRadix"), flags, 2)
        this.vtbl.SetRadix := CallbackCreate(GetMethod(implObj, "SetRadix"), flags, 2)
        this.vtbl.Evaluate := CallbackCreate(GetMethod(implObj, "Evaluate"), flags, 5)
        this.vtbl.CoerceValue := CallbackCreate(GetMethod(implObj, "CoerceValue"), flags, 4)
        this.vtbl.CoerceValues := CallbackCreate(GetMethod(implObj, "CoerceValues"), flags, 5)
        this.vtbl.Execute := CallbackCreate(GetMethod(implObj, "Execute"), flags, 4)
        this.vtbl.ExecuteCommandFile := CallbackCreate(GetMethod(implObj, "ExecuteCommandFile"), flags, 4)
        this.vtbl.GetNumberBreakpoints := CallbackCreate(GetMethod(implObj, "GetNumberBreakpoints"), flags, 2)
        this.vtbl.GetBreakpointByIndex := CallbackCreate(GetMethod(implObj, "GetBreakpointByIndex"), flags, 3)
        this.vtbl.GetBreakpointById := CallbackCreate(GetMethod(implObj, "GetBreakpointById"), flags, 3)
        this.vtbl.GetBreakpointParameters := CallbackCreate(GetMethod(implObj, "GetBreakpointParameters"), flags, 5)
        this.vtbl.AddBreakpoint := CallbackCreate(GetMethod(implObj, "AddBreakpoint"), flags, 4)
        this.vtbl.RemoveBreakpoint := CallbackCreate(GetMethod(implObj, "RemoveBreakpoint"), flags, 2)
        this.vtbl.AddExtension := CallbackCreate(GetMethod(implObj, "AddExtension"), flags, 4)
        this.vtbl.RemoveExtension := CallbackCreate(GetMethod(implObj, "RemoveExtension"), flags, 2)
        this.vtbl.GetExtensionByPath := CallbackCreate(GetMethod(implObj, "GetExtensionByPath"), flags, 3)
        this.vtbl.CallExtension := CallbackCreate(GetMethod(implObj, "CallExtension"), flags, 4)
        this.vtbl.GetExtensionFunction := CallbackCreate(GetMethod(implObj, "GetExtensionFunction"), flags, 4)
        this.vtbl.GetWindbgExtensionApis32 := CallbackCreate(GetMethod(implObj, "GetWindbgExtensionApis32"), flags, 2)
        this.vtbl.GetWindbgExtensionApis64 := CallbackCreate(GetMethod(implObj, "GetWindbgExtensionApis64"), flags, 2)
        this.vtbl.GetNumberEventFilters := CallbackCreate(GetMethod(implObj, "GetNumberEventFilters"), flags, 4)
        this.vtbl.GetEventFilterText := CallbackCreate(GetMethod(implObj, "GetEventFilterText"), flags, 5)
        this.vtbl.GetEventFilterCommand := CallbackCreate(GetMethod(implObj, "GetEventFilterCommand"), flags, 5)
        this.vtbl.SetEventFilterCommand := CallbackCreate(GetMethod(implObj, "SetEventFilterCommand"), flags, 3)
        this.vtbl.GetSpecificFilterParameters := CallbackCreate(GetMethod(implObj, "GetSpecificFilterParameters"), flags, 4)
        this.vtbl.SetSpecificFilterParameters := CallbackCreate(GetMethod(implObj, "SetSpecificFilterParameters"), flags, 4)
        this.vtbl.GetSpecificFilterArgument := CallbackCreate(GetMethod(implObj, "GetSpecificFilterArgument"), flags, 5)
        this.vtbl.SetSpecificFilterArgument := CallbackCreate(GetMethod(implObj, "SetSpecificFilterArgument"), flags, 3)
        this.vtbl.GetExceptionFilterParameters := CallbackCreate(GetMethod(implObj, "GetExceptionFilterParameters"), flags, 5)
        this.vtbl.SetExceptionFilterParameters := CallbackCreate(GetMethod(implObj, "SetExceptionFilterParameters"), flags, 3)
        this.vtbl.GetExceptionFilterSecondCommand := CallbackCreate(GetMethod(implObj, "GetExceptionFilterSecondCommand"), flags, 5)
        this.vtbl.SetExceptionFilterSecondCommand := CallbackCreate(GetMethod(implObj, "SetExceptionFilterSecondCommand"), flags, 3)
        this.vtbl.WaitForEvent := CallbackCreate(GetMethod(implObj, "WaitForEvent"), flags, 3)
        this.vtbl.GetLastEventInformation := CallbackCreate(GetMethod(implObj, "GetLastEventInformation"), flags, 10)
        this.vtbl.GetCurrentTimeDate := CallbackCreate(GetMethod(implObj, "GetCurrentTimeDate"), flags, 2)
        this.vtbl.GetCurrentSystemUpTime := CallbackCreate(GetMethod(implObj, "GetCurrentSystemUpTime"), flags, 2)
        this.vtbl.GetDumpFormatFlags := CallbackCreate(GetMethod(implObj, "GetDumpFormatFlags"), flags, 2)
        this.vtbl.GetNumberTextReplacements := CallbackCreate(GetMethod(implObj, "GetNumberTextReplacements"), flags, 2)
        this.vtbl.GetTextReplacement := CallbackCreate(GetMethod(implObj, "GetTextReplacement"), flags, 9)
        this.vtbl.SetTextReplacement := CallbackCreate(GetMethod(implObj, "SetTextReplacement"), flags, 3)
        this.vtbl.RemoveTextReplacements := CallbackCreate(GetMethod(implObj, "RemoveTextReplacements"), flags, 1)
        this.vtbl.OutputTextReplacements := CallbackCreate(GetMethod(implObj, "OutputTextReplacements"), flags, 3)
        this.vtbl.GetAssemblyOptions := CallbackCreate(GetMethod(implObj, "GetAssemblyOptions"), flags, 2)
        this.vtbl.AddAssemblyOptions := CallbackCreate(GetMethod(implObj, "AddAssemblyOptions"), flags, 2)
        this.vtbl.RemoveAssemblyOptions := CallbackCreate(GetMethod(implObj, "RemoveAssemblyOptions"), flags, 2)
        this.vtbl.SetAssemblyOptions := CallbackCreate(GetMethod(implObj, "SetAssemblyOptions"), flags, 2)
        this.vtbl.GetExpressionSyntax := CallbackCreate(GetMethod(implObj, "GetExpressionSyntax"), flags, 2)
        this.vtbl.SetExpressionSyntax := CallbackCreate(GetMethod(implObj, "SetExpressionSyntax"), flags, 2)
        this.vtbl.SetExpressionSyntaxByName := CallbackCreate(GetMethod(implObj, "SetExpressionSyntaxByName"), flags, 2)
        this.vtbl.GetNumberExpressionSyntaxes := CallbackCreate(GetMethod(implObj, "GetNumberExpressionSyntaxes"), flags, 2)
        this.vtbl.GetExpressionSyntaxNames := CallbackCreate(GetMethod(implObj, "GetExpressionSyntaxNames"), flags, 8)
        this.vtbl.GetNumberEvents := CallbackCreate(GetMethod(implObj, "GetNumberEvents"), flags, 2)
        this.vtbl.GetEventIndexDescription := CallbackCreate(GetMethod(implObj, "GetEventIndexDescription"), flags, 6)
        this.vtbl.GetCurrentEventIndex := CallbackCreate(GetMethod(implObj, "GetCurrentEventIndex"), flags, 2)
        this.vtbl.SetNextEventIndex := CallbackCreate(GetMethod(implObj, "SetNextEventIndex"), flags, 4)
        this.vtbl.GetLogFileWide := CallbackCreate(GetMethod(implObj, "GetLogFileWide"), flags, 5)
        this.vtbl.OpenLogFileWide := CallbackCreate(GetMethod(implObj, "OpenLogFileWide"), flags, 3)
        this.vtbl.InputWide := CallbackCreate(GetMethod(implObj, "InputWide"), flags, 4)
        this.vtbl.ReturnInputWide := CallbackCreate(GetMethod(implObj, "ReturnInputWide"), flags, 2)
        this.vtbl.OutputWide := CallbackCreate(GetMethod(implObj, "OutputWide"), flags, 3)
        this.vtbl.OutputVaListWide := CallbackCreate(GetMethod(implObj, "OutputVaListWide"), flags, 4)
        this.vtbl.ControlledOutputWide := CallbackCreate(GetMethod(implObj, "ControlledOutputWide"), flags, 4)
        this.vtbl.ControlledOutputVaListWide := CallbackCreate(GetMethod(implObj, "ControlledOutputVaListWide"), flags, 5)
        this.vtbl.OutputPromptWide := CallbackCreate(GetMethod(implObj, "OutputPromptWide"), flags, 3)
        this.vtbl.OutputPromptVaListWide := CallbackCreate(GetMethod(implObj, "OutputPromptVaListWide"), flags, 4)
        this.vtbl.GetPromptTextWide := CallbackCreate(GetMethod(implObj, "GetPromptTextWide"), flags, 4)
        this.vtbl.AssembleWide := CallbackCreate(GetMethod(implObj, "AssembleWide"), flags, 4)
        this.vtbl.DisassembleWide := CallbackCreate(GetMethod(implObj, "DisassembleWide"), flags, 7)
        this.vtbl.GetProcessorTypeNamesWide := CallbackCreate(GetMethod(implObj, "GetProcessorTypeNamesWide"), flags, 8)
        this.vtbl.GetTextMacroWide := CallbackCreate(GetMethod(implObj, "GetTextMacroWide"), flags, 5)
        this.vtbl.SetTextMacroWide := CallbackCreate(GetMethod(implObj, "SetTextMacroWide"), flags, 3)
        this.vtbl.EvaluateWide := CallbackCreate(GetMethod(implObj, "EvaluateWide"), flags, 5)
        this.vtbl.ExecuteWide := CallbackCreate(GetMethod(implObj, "ExecuteWide"), flags, 4)
        this.vtbl.ExecuteCommandFileWide := CallbackCreate(GetMethod(implObj, "ExecuteCommandFileWide"), flags, 4)
        this.vtbl.GetBreakpointByIndex2 := CallbackCreate(GetMethod(implObj, "GetBreakpointByIndex2"), flags, 3)
        this.vtbl.GetBreakpointById2 := CallbackCreate(GetMethod(implObj, "GetBreakpointById2"), flags, 3)
        this.vtbl.AddBreakpoint2 := CallbackCreate(GetMethod(implObj, "AddBreakpoint2"), flags, 4)
        this.vtbl.RemoveBreakpoint2 := CallbackCreate(GetMethod(implObj, "RemoveBreakpoint2"), flags, 2)
        this.vtbl.AddExtensionWide := CallbackCreate(GetMethod(implObj, "AddExtensionWide"), flags, 4)
        this.vtbl.GetExtensionByPathWide := CallbackCreate(GetMethod(implObj, "GetExtensionByPathWide"), flags, 3)
        this.vtbl.CallExtensionWide := CallbackCreate(GetMethod(implObj, "CallExtensionWide"), flags, 4)
        this.vtbl.GetExtensionFunctionWide := CallbackCreate(GetMethod(implObj, "GetExtensionFunctionWide"), flags, 4)
        this.vtbl.GetEventFilterTextWide := CallbackCreate(GetMethod(implObj, "GetEventFilterTextWide"), flags, 5)
        this.vtbl.GetEventFilterCommandWide := CallbackCreate(GetMethod(implObj, "GetEventFilterCommandWide"), flags, 5)
        this.vtbl.SetEventFilterCommandWide := CallbackCreate(GetMethod(implObj, "SetEventFilterCommandWide"), flags, 3)
        this.vtbl.GetSpecificFilterArgumentWide := CallbackCreate(GetMethod(implObj, "GetSpecificFilterArgumentWide"), flags, 5)
        this.vtbl.SetSpecificFilterArgumentWide := CallbackCreate(GetMethod(implObj, "SetSpecificFilterArgumentWide"), flags, 3)
        this.vtbl.GetExceptionFilterSecondCommandWide := CallbackCreate(GetMethod(implObj, "GetExceptionFilterSecondCommandWide"), flags, 5)
        this.vtbl.SetExceptionFilterSecondCommandWide := CallbackCreate(GetMethod(implObj, "SetExceptionFilterSecondCommandWide"), flags, 3)
        this.vtbl.GetLastEventInformationWide := CallbackCreate(GetMethod(implObj, "GetLastEventInformationWide"), flags, 10)
        this.vtbl.GetTextReplacementWide := CallbackCreate(GetMethod(implObj, "GetTextReplacementWide"), flags, 9)
        this.vtbl.SetTextReplacementWide := CallbackCreate(GetMethod(implObj, "SetTextReplacementWide"), flags, 3)
        this.vtbl.SetExpressionSyntaxByNameWide := CallbackCreate(GetMethod(implObj, "SetExpressionSyntaxByNameWide"), flags, 2)
        this.vtbl.GetExpressionSyntaxNamesWide := CallbackCreate(GetMethod(implObj, "GetExpressionSyntaxNamesWide"), flags, 8)
        this.vtbl.GetEventIndexDescriptionWide := CallbackCreate(GetMethod(implObj, "GetEventIndexDescriptionWide"), flags, 6)
        this.vtbl.GetLogFile2 := CallbackCreate(GetMethod(implObj, "GetLogFile2"), flags, 5)
        this.vtbl.OpenLogFile2 := CallbackCreate(GetMethod(implObj, "OpenLogFile2"), flags, 3)
        this.vtbl.GetLogFile2Wide := CallbackCreate(GetMethod(implObj, "GetLogFile2Wide"), flags, 5)
        this.vtbl.OpenLogFile2Wide := CallbackCreate(GetMethod(implObj, "OpenLogFile2Wide"), flags, 3)
        this.vtbl.GetSystemVersionValues := CallbackCreate(GetMethod(implObj, "GetSystemVersionValues"), flags, 6)
        this.vtbl.GetSystemVersionString := CallbackCreate(GetMethod(implObj, "GetSystemVersionString"), flags, 5)
        this.vtbl.GetSystemVersionStringWide := CallbackCreate(GetMethod(implObj, "GetSystemVersionStringWide"), flags, 5)
        this.vtbl.GetContextStackTrace := CallbackCreate(GetMethod(implObj, "GetContextStackTrace"), flags, 9)
        this.vtbl.OutputContextStackTrace := CallbackCreate(GetMethod(implObj, "OutputContextStackTrace"), flags, 8)
        this.vtbl.GetStoredEventInformation := CallbackCreate(GetMethod(implObj, "GetStoredEventInformation"), flags, 10)
        this.vtbl.GetManagedStatus := CallbackCreate(GetMethod(implObj, "GetManagedStatus"), flags, 6)
        this.vtbl.GetManagedStatusWide := CallbackCreate(GetMethod(implObj, "GetManagedStatusWide"), flags, 6)
        this.vtbl.ResetManagedStatus := CallbackCreate(GetMethod(implObj, "ResetManagedStatus"), flags, 2)
        this.vtbl.GetStackTraceEx := CallbackCreate(GetMethod(implObj, "GetStackTraceEx"), flags, 7)
        this.vtbl.OutputStackTraceEx := CallbackCreate(GetMethod(implObj, "OutputStackTraceEx"), flags, 5)
        this.vtbl.GetContextStackTraceEx := CallbackCreate(GetMethod(implObj, "GetContextStackTraceEx"), flags, 9)
        this.vtbl.OutputContextStackTraceEx := CallbackCreate(GetMethod(implObj, "OutputContextStackTraceEx"), flags, 8)
        this.vtbl.GetBreakpointByGuid := CallbackCreate(GetMethod(implObj, "GetBreakpointByGuid"), flags, 3)
        this.vtbl.GetExecutionStatusEx := CallbackCreate(GetMethod(implObj, "GetExecutionStatusEx"), flags, 2)
        this.vtbl.GetSynchronizationStatus := CallbackCreate(GetMethod(implObj, "GetSynchronizationStatus"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetInterrupt)
        CallbackFree(this.vtbl.SetInterrupt)
        CallbackFree(this.vtbl.GetInterruptTimeout)
        CallbackFree(this.vtbl.SetInterruptTimeout)
        CallbackFree(this.vtbl.GetLogFile)
        CallbackFree(this.vtbl.OpenLogFile)
        CallbackFree(this.vtbl.CloseLogFile)
        CallbackFree(this.vtbl.GetLogMask)
        CallbackFree(this.vtbl.SetLogMask)
        CallbackFree(this.vtbl.Input)
        CallbackFree(this.vtbl.ReturnInput)
        CallbackFree(this.vtbl.Output)
        CallbackFree(this.vtbl.OutputVaList)
        CallbackFree(this.vtbl.ControlledOutput)
        CallbackFree(this.vtbl.ControlledOutputVaList)
        CallbackFree(this.vtbl.OutputPrompt)
        CallbackFree(this.vtbl.OutputPromptVaList)
        CallbackFree(this.vtbl.GetPromptText)
        CallbackFree(this.vtbl.OutputCurrentState)
        CallbackFree(this.vtbl.OutputVersionInformation)
        CallbackFree(this.vtbl.GetNotifyEventHandle)
        CallbackFree(this.vtbl.SetNotifyEventHandle)
        CallbackFree(this.vtbl.Assemble)
        CallbackFree(this.vtbl.Disassemble)
        CallbackFree(this.vtbl.GetDisassembleEffectiveOffset)
        CallbackFree(this.vtbl.OutputDisassembly)
        CallbackFree(this.vtbl.OutputDisassemblyLines)
        CallbackFree(this.vtbl.GetNearInstruction)
        CallbackFree(this.vtbl.GetStackTrace)
        CallbackFree(this.vtbl.GetReturnOffset)
        CallbackFree(this.vtbl.OutputStackTrace)
        CallbackFree(this.vtbl.GetDebuggeeType)
        CallbackFree(this.vtbl.GetActualProcessorType)
        CallbackFree(this.vtbl.GetExecutingProcessorType)
        CallbackFree(this.vtbl.GetNumberPossibleExecutingProcessorTypes)
        CallbackFree(this.vtbl.GetPossibleExecutingProcessorTypes)
        CallbackFree(this.vtbl.GetNumberProcessors)
        CallbackFree(this.vtbl.GetSystemVersion)
        CallbackFree(this.vtbl.GetPageSize)
        CallbackFree(this.vtbl.IsPointer64Bit)
        CallbackFree(this.vtbl.ReadBugCheckData)
        CallbackFree(this.vtbl.GetNumberSupportedProcessorTypes)
        CallbackFree(this.vtbl.GetSupportedProcessorTypes)
        CallbackFree(this.vtbl.GetProcessorTypeNames)
        CallbackFree(this.vtbl.GetEffectiveProcessorType)
        CallbackFree(this.vtbl.SetEffectiveProcessorType)
        CallbackFree(this.vtbl.GetExecutionStatus)
        CallbackFree(this.vtbl.SetExecutionStatus)
        CallbackFree(this.vtbl.GetCodeLevel)
        CallbackFree(this.vtbl.SetCodeLevel)
        CallbackFree(this.vtbl.GetEngineOptions)
        CallbackFree(this.vtbl.AddEngineOptions)
        CallbackFree(this.vtbl.RemoveEngineOptions)
        CallbackFree(this.vtbl.SetEngineOptions)
        CallbackFree(this.vtbl.GetSystemErrorControl)
        CallbackFree(this.vtbl.SetSystemErrorControl)
        CallbackFree(this.vtbl.GetTextMacro)
        CallbackFree(this.vtbl.SetTextMacro)
        CallbackFree(this.vtbl.GetRadix)
        CallbackFree(this.vtbl.SetRadix)
        CallbackFree(this.vtbl.Evaluate)
        CallbackFree(this.vtbl.CoerceValue)
        CallbackFree(this.vtbl.CoerceValues)
        CallbackFree(this.vtbl.Execute)
        CallbackFree(this.vtbl.ExecuteCommandFile)
        CallbackFree(this.vtbl.GetNumberBreakpoints)
        CallbackFree(this.vtbl.GetBreakpointByIndex)
        CallbackFree(this.vtbl.GetBreakpointById)
        CallbackFree(this.vtbl.GetBreakpointParameters)
        CallbackFree(this.vtbl.AddBreakpoint)
        CallbackFree(this.vtbl.RemoveBreakpoint)
        CallbackFree(this.vtbl.AddExtension)
        CallbackFree(this.vtbl.RemoveExtension)
        CallbackFree(this.vtbl.GetExtensionByPath)
        CallbackFree(this.vtbl.CallExtension)
        CallbackFree(this.vtbl.GetExtensionFunction)
        CallbackFree(this.vtbl.GetWindbgExtensionApis32)
        CallbackFree(this.vtbl.GetWindbgExtensionApis64)
        CallbackFree(this.vtbl.GetNumberEventFilters)
        CallbackFree(this.vtbl.GetEventFilterText)
        CallbackFree(this.vtbl.GetEventFilterCommand)
        CallbackFree(this.vtbl.SetEventFilterCommand)
        CallbackFree(this.vtbl.GetSpecificFilterParameters)
        CallbackFree(this.vtbl.SetSpecificFilterParameters)
        CallbackFree(this.vtbl.GetSpecificFilterArgument)
        CallbackFree(this.vtbl.SetSpecificFilterArgument)
        CallbackFree(this.vtbl.GetExceptionFilterParameters)
        CallbackFree(this.vtbl.SetExceptionFilterParameters)
        CallbackFree(this.vtbl.GetExceptionFilterSecondCommand)
        CallbackFree(this.vtbl.SetExceptionFilterSecondCommand)
        CallbackFree(this.vtbl.WaitForEvent)
        CallbackFree(this.vtbl.GetLastEventInformation)
        CallbackFree(this.vtbl.GetCurrentTimeDate)
        CallbackFree(this.vtbl.GetCurrentSystemUpTime)
        CallbackFree(this.vtbl.GetDumpFormatFlags)
        CallbackFree(this.vtbl.GetNumberTextReplacements)
        CallbackFree(this.vtbl.GetTextReplacement)
        CallbackFree(this.vtbl.SetTextReplacement)
        CallbackFree(this.vtbl.RemoveTextReplacements)
        CallbackFree(this.vtbl.OutputTextReplacements)
        CallbackFree(this.vtbl.GetAssemblyOptions)
        CallbackFree(this.vtbl.AddAssemblyOptions)
        CallbackFree(this.vtbl.RemoveAssemblyOptions)
        CallbackFree(this.vtbl.SetAssemblyOptions)
        CallbackFree(this.vtbl.GetExpressionSyntax)
        CallbackFree(this.vtbl.SetExpressionSyntax)
        CallbackFree(this.vtbl.SetExpressionSyntaxByName)
        CallbackFree(this.vtbl.GetNumberExpressionSyntaxes)
        CallbackFree(this.vtbl.GetExpressionSyntaxNames)
        CallbackFree(this.vtbl.GetNumberEvents)
        CallbackFree(this.vtbl.GetEventIndexDescription)
        CallbackFree(this.vtbl.GetCurrentEventIndex)
        CallbackFree(this.vtbl.SetNextEventIndex)
        CallbackFree(this.vtbl.GetLogFileWide)
        CallbackFree(this.vtbl.OpenLogFileWide)
        CallbackFree(this.vtbl.InputWide)
        CallbackFree(this.vtbl.ReturnInputWide)
        CallbackFree(this.vtbl.OutputWide)
        CallbackFree(this.vtbl.OutputVaListWide)
        CallbackFree(this.vtbl.ControlledOutputWide)
        CallbackFree(this.vtbl.ControlledOutputVaListWide)
        CallbackFree(this.vtbl.OutputPromptWide)
        CallbackFree(this.vtbl.OutputPromptVaListWide)
        CallbackFree(this.vtbl.GetPromptTextWide)
        CallbackFree(this.vtbl.AssembleWide)
        CallbackFree(this.vtbl.DisassembleWide)
        CallbackFree(this.vtbl.GetProcessorTypeNamesWide)
        CallbackFree(this.vtbl.GetTextMacroWide)
        CallbackFree(this.vtbl.SetTextMacroWide)
        CallbackFree(this.vtbl.EvaluateWide)
        CallbackFree(this.vtbl.ExecuteWide)
        CallbackFree(this.vtbl.ExecuteCommandFileWide)
        CallbackFree(this.vtbl.GetBreakpointByIndex2)
        CallbackFree(this.vtbl.GetBreakpointById2)
        CallbackFree(this.vtbl.AddBreakpoint2)
        CallbackFree(this.vtbl.RemoveBreakpoint2)
        CallbackFree(this.vtbl.AddExtensionWide)
        CallbackFree(this.vtbl.GetExtensionByPathWide)
        CallbackFree(this.vtbl.CallExtensionWide)
        CallbackFree(this.vtbl.GetExtensionFunctionWide)
        CallbackFree(this.vtbl.GetEventFilterTextWide)
        CallbackFree(this.vtbl.GetEventFilterCommandWide)
        CallbackFree(this.vtbl.SetEventFilterCommandWide)
        CallbackFree(this.vtbl.GetSpecificFilterArgumentWide)
        CallbackFree(this.vtbl.SetSpecificFilterArgumentWide)
        CallbackFree(this.vtbl.GetExceptionFilterSecondCommandWide)
        CallbackFree(this.vtbl.SetExceptionFilterSecondCommandWide)
        CallbackFree(this.vtbl.GetLastEventInformationWide)
        CallbackFree(this.vtbl.GetTextReplacementWide)
        CallbackFree(this.vtbl.SetTextReplacementWide)
        CallbackFree(this.vtbl.SetExpressionSyntaxByNameWide)
        CallbackFree(this.vtbl.GetExpressionSyntaxNamesWide)
        CallbackFree(this.vtbl.GetEventIndexDescriptionWide)
        CallbackFree(this.vtbl.GetLogFile2)
        CallbackFree(this.vtbl.OpenLogFile2)
        CallbackFree(this.vtbl.GetLogFile2Wide)
        CallbackFree(this.vtbl.OpenLogFile2Wide)
        CallbackFree(this.vtbl.GetSystemVersionValues)
        CallbackFree(this.vtbl.GetSystemVersionString)
        CallbackFree(this.vtbl.GetSystemVersionStringWide)
        CallbackFree(this.vtbl.GetContextStackTrace)
        CallbackFree(this.vtbl.OutputContextStackTrace)
        CallbackFree(this.vtbl.GetStoredEventInformation)
        CallbackFree(this.vtbl.GetManagedStatus)
        CallbackFree(this.vtbl.GetManagedStatusWide)
        CallbackFree(this.vtbl.ResetManagedStatus)
        CallbackFree(this.vtbl.GetStackTraceEx)
        CallbackFree(this.vtbl.OutputStackTraceEx)
        CallbackFree(this.vtbl.GetContextStackTraceEx)
        CallbackFree(this.vtbl.OutputContextStackTraceEx)
        CallbackFree(this.vtbl.GetBreakpointByGuid)
        CallbackFree(this.vtbl.GetExecutionStatusEx)
        CallbackFree(this.vtbl.GetSynchronizationStatus)
    }
}
