#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DEBUG_BREAKPOINT_PARAMETERS.ahk" { DEBUG_BREAKPOINT_PARAMETERS }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }
#Import ".\IDebugClient.ahk" { IDebugClient }
#Import "..\..\..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IDebugBreakpoint2 extends IUnknown {
    /**
     * The interface identifier for IDebugBreakpoint2
     * @type {Guid}
     */
    static IID := Guid("{1b278d20-79f2-426e-a3f9-c1ddf375d48e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugBreakpoint2 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetId                   : IntPtr
        GetType                 : IntPtr
        GetAdder                : IntPtr
        GetFlags                : IntPtr
        AddFlags                : IntPtr
        RemoveFlags             : IntPtr
        SetFlags                : IntPtr
        GetOffset               : IntPtr
        SetOffset               : IntPtr
        GetDataParameters       : IntPtr
        SetDataParameters       : IntPtr
        GetPassCount            : IntPtr
        SetPassCount            : IntPtr
        GetCurrentPassCount     : IntPtr
        GetMatchThreadId        : IntPtr
        SetMatchThreadId        : IntPtr
        GetCommand              : IntPtr
        SetCommand              : IntPtr
        GetOffsetExpression     : IntPtr
        SetOffsetExpression     : IntPtr
        GetParameters           : IntPtr
        GetCommandWide          : IntPtr
        SetCommandWide          : IntPtr
        GetOffsetExpressionWide : IntPtr
        SetOffsetExpressionWide : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugBreakpoint2.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
        result := ComCall(23, this, DEBUG_BREAKPOINT_PARAMETERS.Ptr, Params, "HRESULT")
        return Params
    }

    /**
     * 
     * @param {PWSTR} _Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetCommandWide(_Buffer, BufferSize) {
        _Buffer := _Buffer is String ? StrPtr(_Buffer) : _Buffer

        result := ComCall(24, this, "ptr", _Buffer, "uint", BufferSize, "uint*", &CommandSize := 0, "HRESULT")
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
     * @param {PWSTR} _Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetOffsetExpressionWide(_Buffer, BufferSize) {
        _Buffer := _Buffer is String ? StrPtr(_Buffer) : _Buffer

        result := ComCall(26, this, "ptr", _Buffer, "uint", BufferSize, "uint*", &ExpressionSize := 0, "HRESULT")
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

    Query(iid) {
        if (IDebugBreakpoint2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetId := CallbackCreate(GetMethod(implObj, "GetId"), flags, 2)
        this.vtbl.GetType := CallbackCreate(GetMethod(implObj, "GetType"), flags, 3)
        this.vtbl.GetAdder := CallbackCreate(GetMethod(implObj, "GetAdder"), flags, 2)
        this.vtbl.GetFlags := CallbackCreate(GetMethod(implObj, "GetFlags"), flags, 2)
        this.vtbl.AddFlags := CallbackCreate(GetMethod(implObj, "AddFlags"), flags, 2)
        this.vtbl.RemoveFlags := CallbackCreate(GetMethod(implObj, "RemoveFlags"), flags, 2)
        this.vtbl.SetFlags := CallbackCreate(GetMethod(implObj, "SetFlags"), flags, 2)
        this.vtbl.GetOffset := CallbackCreate(GetMethod(implObj, "GetOffset"), flags, 2)
        this.vtbl.SetOffset := CallbackCreate(GetMethod(implObj, "SetOffset"), flags, 2)
        this.vtbl.GetDataParameters := CallbackCreate(GetMethod(implObj, "GetDataParameters"), flags, 3)
        this.vtbl.SetDataParameters := CallbackCreate(GetMethod(implObj, "SetDataParameters"), flags, 3)
        this.vtbl.GetPassCount := CallbackCreate(GetMethod(implObj, "GetPassCount"), flags, 2)
        this.vtbl.SetPassCount := CallbackCreate(GetMethod(implObj, "SetPassCount"), flags, 2)
        this.vtbl.GetCurrentPassCount := CallbackCreate(GetMethod(implObj, "GetCurrentPassCount"), flags, 2)
        this.vtbl.GetMatchThreadId := CallbackCreate(GetMethod(implObj, "GetMatchThreadId"), flags, 2)
        this.vtbl.SetMatchThreadId := CallbackCreate(GetMethod(implObj, "SetMatchThreadId"), flags, 2)
        this.vtbl.GetCommand := CallbackCreate(GetMethod(implObj, "GetCommand"), flags, 4)
        this.vtbl.SetCommand := CallbackCreate(GetMethod(implObj, "SetCommand"), flags, 2)
        this.vtbl.GetOffsetExpression := CallbackCreate(GetMethod(implObj, "GetOffsetExpression"), flags, 4)
        this.vtbl.SetOffsetExpression := CallbackCreate(GetMethod(implObj, "SetOffsetExpression"), flags, 2)
        this.vtbl.GetParameters := CallbackCreate(GetMethod(implObj, "GetParameters"), flags, 2)
        this.vtbl.GetCommandWide := CallbackCreate(GetMethod(implObj, "GetCommandWide"), flags, 4)
        this.vtbl.SetCommandWide := CallbackCreate(GetMethod(implObj, "SetCommandWide"), flags, 2)
        this.vtbl.GetOffsetExpressionWide := CallbackCreate(GetMethod(implObj, "GetOffsetExpressionWide"), flags, 4)
        this.vtbl.SetOffsetExpressionWide := CallbackCreate(GetMethod(implObj, "SetOffsetExpressionWide"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetId)
        CallbackFree(this.vtbl.GetType)
        CallbackFree(this.vtbl.GetAdder)
        CallbackFree(this.vtbl.GetFlags)
        CallbackFree(this.vtbl.AddFlags)
        CallbackFree(this.vtbl.RemoveFlags)
        CallbackFree(this.vtbl.SetFlags)
        CallbackFree(this.vtbl.GetOffset)
        CallbackFree(this.vtbl.SetOffset)
        CallbackFree(this.vtbl.GetDataParameters)
        CallbackFree(this.vtbl.SetDataParameters)
        CallbackFree(this.vtbl.GetPassCount)
        CallbackFree(this.vtbl.SetPassCount)
        CallbackFree(this.vtbl.GetCurrentPassCount)
        CallbackFree(this.vtbl.GetMatchThreadId)
        CallbackFree(this.vtbl.SetMatchThreadId)
        CallbackFree(this.vtbl.GetCommand)
        CallbackFree(this.vtbl.SetCommand)
        CallbackFree(this.vtbl.GetOffsetExpression)
        CallbackFree(this.vtbl.SetOffsetExpression)
        CallbackFree(this.vtbl.GetParameters)
        CallbackFree(this.vtbl.GetCommandWide)
        CallbackFree(this.vtbl.SetCommandWide)
        CallbackFree(this.vtbl.GetOffsetExpressionWide)
        CallbackFree(this.vtbl.SetOffsetExpressionWide)
    }
}
