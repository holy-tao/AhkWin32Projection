#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\DEBUG_BREAKPOINT_PARAMETERS.ahk
#Include ..\..\..\Com\IUnknown.ahk
#Include ..\..\..\..\Foundation\PSTR.ahk
#Include .\IDebugClient.ahk
#Include ..\..\..\..\Foundation\HRESULT.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
class IDebugBreakpoint extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugBreakpoint
     * @type {Guid}
     */
    static IID => Guid("{5bd9d474-5975-423a-b88b-65a8e7110e65}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetId", "GetType", "GetAdder", "GetFlags", "AddFlags", "RemoveFlags", "SetFlags", "GetOffset", "SetOffset", "GetDataParameters", "SetDataParameters", "GetPassCount", "SetPassCount", "GetCurrentPassCount", "GetMatchThreadId", "SetMatchThreadId", "GetCommand", "SetCommand", "GetOffsetExpression", "SetOffsetExpression", "GetParameters"]

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
     * @see https://learn.microsoft.com/windows/win32/api/recapis/nf-recapis-setflags
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
     * @param {Pointer<Integer>} _Size 
     * @param {Pointer<Integer>} AccessType 
     * @returns {HRESULT} 
     */
    GetDataParameters(_Size, AccessType) {
        _SizeMarshal := _Size is VarRef ? "uint*" : "ptr"
        AccessTypeMarshal := AccessType is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, _SizeMarshal, _Size, AccessTypeMarshal, AccessType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} _Size 
     * @param {Integer} AccessType 
     * @returns {HRESULT} 
     */
    SetDataParameters(_Size, AccessType) {
        result := ComCall(13, this, "uint", _Size, "uint", AccessType, "HRESULT")
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
     * @param {PSTR} _Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetCommand(_Buffer, BufferSize) {
        _Buffer := _Buffer is String ? StrPtr(_Buffer) : _Buffer

        result := ComCall(19, this, "ptr", _Buffer, "uint", BufferSize, "uint*", &CommandSize := 0, "HRESULT")
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
     * @param {PSTR} _Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetOffsetExpression(_Buffer, BufferSize) {
        _Buffer := _Buffer is String ? StrPtr(_Buffer) : _Buffer

        result := ComCall(21, this, "ptr", _Buffer, "uint", BufferSize, "uint*", &ExpressionSize := 0, "HRESULT")
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
}
