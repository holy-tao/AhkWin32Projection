#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IDebugClient.ahk
#Include .\DEBUG_BREAKPOINT_PARAMETERS.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugBreakpoint3 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugBreakpoint3
     * @type {Guid}
     */
    static IID => Guid("{38f5c249-b448-43bb-9835-579d4ec02249}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetId", "GetType", "GetAdder", "GetFlags", "AddFlags", "RemoveFlags", "SetFlags", "GetOffset", "SetOffset", "GetDataParameters", "SetDataParameters", "GetPassCount", "SetPassCount", "GetCurrentPassCount", "GetMatchThreadId", "SetMatchThreadId", "GetCommand", "SetCommand", "GetOffsetExpression", "SetOffsetExpression", "GetParameters", "GetCommandWide", "SetCommandWide", "GetOffsetExpressionWide", "SetOffsetExpressionWide", "GetGuid"]

    /**
     * Returns the identifier string available in the volume's metadata.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/SecProv/getidentificationfield-win32-encryptablevolume
     */
    GetId() {
        result := ComCall(3, this, "uint*", &Id := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Id
    }

    /**
     * The GetTypeByName function retrieves a service type GUID for a network service specified by name. (Unicode)
     * @remarks
     * > [!NOTE]
     * > The nspapi.h header defines GetTypeByName as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Integer>} BreakType 
     * @param {Pointer<Integer>} ProcType 
     * @returns {HRESULT} If the function succeeds, the return value is zero.
     * 
     * If the function fails, the return value is SOCKET_ERROR( – 1). To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>, which returns the following extended error value.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SERVICE_DOES_NOT_EXIST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified service type is unknown.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/nspapi/nf-nspapi-gettypebynamew
     */
    GetType(BreakType, ProcType) {
        BreakTypeMarshal := BreakType is VarRef ? "uint*" : "ptr"
        ProcTypeMarshal := ProcType is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, BreakTypeMarshal, BreakType, ProcTypeMarshal, ProcType, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IDebugClient} 
     */
    GetAdder() {
        result := ComCall(5, this, "ptr*", &Adder := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDebugClient(Adder)
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetFlags() {
        result := ComCall(6, this, "uint*", &Flags := 0, "int")
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
    AddFlags(Flags) {
        result := ComCall(7, this, "uint", Flags, "int")
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
    RemoveFlags(Flags) {
        result := ComCall(8, this, "uint", Flags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Specifies how the recognizer interprets the ink and determines the result string.Call this function before processing the ink for the first time. Therefore, call the SetFlags function before calling the Process function.
     * @remarks
     * Prior to Microsoft Windows XP Tablet PC Edition Development Kit 1.7, Tablet PC Input Panel performed smart spacing. Starting with Tablet PC SDK 1.7, Input Panel continues to produce results with preliminary spacing recommendations. Tablet PC Input Panel's spacing results may however be changed by the recognizer's recommendations (results). The recognizer is able to do this by using text contextual information (based on the <a href="https://docs.microsoft.com/windows/desktop/api/recapis/nf-recapis-settextcontext">SetTextContext</a> call made by Input Panel) and its internal language model rules.
     * 
     * Input Panel is able to determine whether the recognizer is capable of doing auto-spacing by calling this function with the RECOFLAG_AUTOSPACE flag set. If the recognizer does not support auto-spacing, E_INVALIDARG is returned.
     * 
     * <div class="alert"><b>Note</b>  Only line mode is supported in the <b>SetFlags</b> function. Boxed mode, free mode, and single-line mode are not supported.</div>
     * <div> </div>
     * @param {Integer} Flags 
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>HRESULT value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The flag is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The recognizer does not support this function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to allocate memory to complete the operation.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The context is invalid or one of the parameters is an invalid pointer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/recapis/nf-recapis-setflags
     */
    SetFlags(Flags) {
        result := ComCall(9, this, "uint", Flags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetOffset() {
        result := ComCall(10, this, "uint*", &Offset := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Offset
    }

    /**
     * 
     * @param {Integer} Offset 
     * @returns {HRESULT} 
     */
    SetOffset(Offset) {
        result := ComCall(11, this, "uint", Offset, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Size_ 
     * @param {Pointer<Integer>} AccessType 
     * @returns {HRESULT} 
     */
    GetDataParameters(Size_, AccessType) {
        Size_Marshal := Size_ is VarRef ? "uint*" : "ptr"
        AccessTypeMarshal := AccessType is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, Size_Marshal, Size_, AccessTypeMarshal, AccessType, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} Size_ 
     * @param {Integer} AccessType 
     * @returns {HRESULT} 
     */
    SetDataParameters(Size_, AccessType) {
        result := ComCall(13, this, "uint", Size_, "uint", AccessType, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetPassCount() {
        result := ComCall(14, this, "uint*", &Count := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Count
    }

    /**
     * 
     * @param {Integer} Count 
     * @returns {HRESULT} 
     */
    SetPassCount(Count) {
        result := ComCall(15, this, "uint", Count, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetCurrentPassCount() {
        result := ComCall(16, this, "uint*", &Count := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Count
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetMatchThreadId() {
        result := ComCall(17, this, "uint*", &Id := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Id
    }

    /**
     * 
     * @param {Integer} Thread 
     * @returns {HRESULT} 
     */
    SetMatchThreadId(Thread) {
        result := ComCall(18, this, "uint", Thread, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the command-line string for the current process. (Unicode)
     * @remarks
     * The lifetime of the returned value is managed by the system, applications should not free or modify this value.
     * 
     * Console processes can use the <i>argc</i> and <i>argv</i> arguments of the <b>main</b> or <b>wmain</b> functions by implementing those as the program entry point.
     * GUI processes can use the <i>lpCmdLine</i> argument of the <a href="https://docs.microsoft.com/windows/win32/api/winbase/nf-winbase-winmain">WinMain</a> or wWinMain functions by implementing those as the program entry point.
     * 
     * To convert the command line to an <i>argv</i> style array of strings, pass the result from GetCommandLineW to
     * <a href="https://docs.microsoft.com/windows/win32/api/shellapi/nf-shellapi-commandlinetoargvw">CommandLineToArgvW</a>.
     * 
     * <div class="alert"><b>Note</b>  The name of the executable in the command line that the operating system provides to a process is not necessarily identical to that in the command line that the calling process gives to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-createprocessa">CreateProcess</a> function. The operating system may prepend a fully qualified path to an executable name that is provided without a fully qualified path.</div>
     * <div> </div>
     * 
     * > [!NOTE]
     * > The processenv.h header defines GetCommandLine as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {PSTR} Buffer_ 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/processenv/nf-processenv-getcommandlinew
     */
    GetCommand(Buffer_, BufferSize) {
        Buffer_ := Buffer_ is String ? StrPtr(Buffer_) : Buffer_

        result := ComCall(19, this, "ptr", Buffer_, "uint", BufferSize, "uint*", &CommandSize := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CommandSize
    }

    /**
     * 
     * @param {PSTR} Command 
     * @returns {HRESULT} 
     */
    SetCommand(Command) {
        Command := Command is String ? StrPtr(Command) : Command

        result := ComCall(20, this, "ptr", Command, "int")
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
    GetOffsetExpression(Buffer_, BufferSize) {
        Buffer_ := Buffer_ is String ? StrPtr(Buffer_) : Buffer_

        result := ComCall(21, this, "ptr", Buffer_, "uint", BufferSize, "uint*", &ExpressionSize := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ExpressionSize
    }

    /**
     * 
     * @param {PSTR} Expression 
     * @returns {HRESULT} 
     */
    SetOffsetExpression(Expression) {
        Expression := Expression is String ? StrPtr(Expression) : Expression

        result := ComCall(22, this, "ptr", Expression, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DEBUG_BREAKPOINT_PARAMETERS} 
     */
    GetParameters() {
        Params := DEBUG_BREAKPOINT_PARAMETERS()
        result := ComCall(23, this, "ptr", Params, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Params
    }

    /**
     * 
     * @param {PWSTR} Buffer_ 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetCommandWide(Buffer_, BufferSize) {
        Buffer_ := Buffer_ is String ? StrPtr(Buffer_) : Buffer_

        result := ComCall(24, this, "ptr", Buffer_, "uint", BufferSize, "uint*", &CommandSize := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CommandSize
    }

    /**
     * 
     * @param {PWSTR} Command 
     * @returns {HRESULT} 
     */
    SetCommandWide(Command) {
        Command := Command is String ? StrPtr(Command) : Command

        result := ComCall(25, this, "ptr", Command, "int")
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
    GetOffsetExpressionWide(Buffer_, BufferSize) {
        Buffer_ := Buffer_ is String ? StrPtr(Buffer_) : Buffer_

        result := ComCall(26, this, "ptr", Buffer_, "uint", BufferSize, "uint*", &ExpressionSize := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ExpressionSize
    }

    /**
     * 
     * @param {PWSTR} Expression 
     * @returns {HRESULT} 
     */
    SetOffsetExpressionWide(Expression) {
        Expression := Expression is String ? StrPtr(Expression) : Expression

        result := ComCall(27, this, "ptr", Expression, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the guide used for boxed, lined, or freeform input.
     * @returns {Guid} 
     * @see https://learn.microsoft.com/windows/win32/api//content/recapis/nf-recapis-getguide
     */
    GetGuid() {
        Guid := Guid()
        result := ComCall(28, this, "ptr", Guid, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Guid
    }
}
