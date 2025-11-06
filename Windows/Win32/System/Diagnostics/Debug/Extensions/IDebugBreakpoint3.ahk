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
     * 
     * @returns {Integer} 
     */
    GetId() {
        result := ComCall(3, this, "uint*", &Id := 0, "HRESULT")
        return Id
    }

    /**
     * 
     * @param {Pointer<Integer>} BreakType 
     * @param {Pointer<Integer>} ProcType 
     * @returns {HRESULT} 
     */
    GetType(BreakType, ProcType) {
        BreakTypeMarshal := BreakType is VarRef ? "uint*" : "ptr"
        ProcTypeMarshal := ProcType is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, BreakTypeMarshal, BreakType, ProcTypeMarshal, ProcType, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IDebugClient} 
     */
    GetAdder() {
        result := ComCall(5, this, "ptr*", &Adder := 0, "HRESULT")
        return IDebugClient(Adder)
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetFlags() {
        result := ComCall(6, this, "uint*", &Flags := 0, "HRESULT")
        return Flags
    }

    /**
     * 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     */
    AddFlags(Flags) {
        result := ComCall(7, this, "uint", Flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     */
    RemoveFlags(Flags) {
        result := ComCall(8, this, "uint", Flags, "HRESULT")
        return result
    }

    /**
     * Specifies how the recognizer interprets the ink and determines the result string.Call this function before processing the ink for the first time. Therefore, call the SetFlags function before calling the Process function.
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
     * @see https://docs.microsoft.com/windows/win32/api//recapis/nf-recapis-setflags
     */
    SetFlags(Flags) {
        result := ComCall(9, this, "uint", Flags, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetOffset() {
        result := ComCall(10, this, "uint*", &Offset := 0, "HRESULT")
        return Offset
    }

    /**
     * 
     * @param {Integer} Offset 
     * @returns {HRESULT} 
     */
    SetOffset(Offset) {
        result := ComCall(11, this, "uint", Offset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Size 
     * @param {Pointer<Integer>} AccessType 
     * @returns {HRESULT} 
     */
    GetDataParameters(Size, AccessType) {
        SizeMarshal := Size is VarRef ? "uint*" : "ptr"
        AccessTypeMarshal := AccessType is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, SizeMarshal, Size, AccessTypeMarshal, AccessType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Size 
     * @param {Integer} AccessType 
     * @returns {HRESULT} 
     */
    SetDataParameters(Size, AccessType) {
        result := ComCall(13, this, "uint", Size, "uint", AccessType, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetPassCount() {
        result := ComCall(14, this, "uint*", &Count := 0, "HRESULT")
        return Count
    }

    /**
     * 
     * @param {Integer} Count 
     * @returns {HRESULT} 
     */
    SetPassCount(Count) {
        result := ComCall(15, this, "uint", Count, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetCurrentPassCount() {
        result := ComCall(16, this, "uint*", &Count := 0, "HRESULT")
        return Count
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetMatchThreadId() {
        result := ComCall(17, this, "uint*", &Id := 0, "HRESULT")
        return Id
    }

    /**
     * 
     * @param {Integer} Thread 
     * @returns {HRESULT} 
     */
    SetMatchThreadId(Thread) {
        result := ComCall(18, this, "uint", Thread, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetCommand(Buffer, BufferSize) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(19, this, "ptr", Buffer, "uint", BufferSize, "uint*", &CommandSize := 0, "HRESULT")
        return CommandSize
    }

    /**
     * 
     * @param {PSTR} Command 
     * @returns {HRESULT} 
     */
    SetCommand(Command) {
        Command := Command is String ? StrPtr(Command) : Command

        result := ComCall(20, this, "ptr", Command, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetOffsetExpression(Buffer, BufferSize) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(21, this, "ptr", Buffer, "uint", BufferSize, "uint*", &ExpressionSize := 0, "HRESULT")
        return ExpressionSize
    }

    /**
     * 
     * @param {PSTR} Expression 
     * @returns {HRESULT} 
     */
    SetOffsetExpression(Expression) {
        Expression := Expression is String ? StrPtr(Expression) : Expression

        result := ComCall(22, this, "ptr", Expression, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {DEBUG_BREAKPOINT_PARAMETERS} 
     */
    GetParameters() {
        Params := DEBUG_BREAKPOINT_PARAMETERS()
        result := ComCall(23, this, "ptr", Params, "HRESULT")
        return Params
    }

    /**
     * 
     * @param {PWSTR} Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetCommandWide(Buffer, BufferSize) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(24, this, "ptr", Buffer, "uint", BufferSize, "uint*", &CommandSize := 0, "HRESULT")
        return CommandSize
    }

    /**
     * 
     * @param {PWSTR} Command 
     * @returns {HRESULT} 
     */
    SetCommandWide(Command) {
        Command := Command is String ? StrPtr(Command) : Command

        result := ComCall(25, this, "ptr", Command, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetOffsetExpressionWide(Buffer, BufferSize) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(26, this, "ptr", Buffer, "uint", BufferSize, "uint*", &ExpressionSize := 0, "HRESULT")
        return ExpressionSize
    }

    /**
     * 
     * @param {PWSTR} Expression 
     * @returns {HRESULT} 
     */
    SetOffsetExpressionWide(Expression) {
        Expression := Expression is String ? StrPtr(Expression) : Expression

        result := ComCall(27, this, "ptr", Expression, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Guid} 
     */
    GetGuid() {
        Guid := Guid()
        result := ComCall(28, this, "ptr", Guid, "HRESULT")
        return Guid
    }
}
