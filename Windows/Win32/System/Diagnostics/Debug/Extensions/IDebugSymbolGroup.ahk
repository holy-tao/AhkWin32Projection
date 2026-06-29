#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DEBUG_SYMBOL_PARAMETERS.ahk" { DEBUG_SYMBOL_PARAMETERS }
#Import "..\..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IDebugSymbolGroup extends IUnknown {
    /**
     * The interface identifier for IDebugSymbolGroup
     * @type {Guid}
     */
    static IID := Guid("{f2528316-0f1a-4431-aeed-11d096e1e2ab}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugSymbolGroup interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetNumberSymbols    : IntPtr
        AddSymbol           : IntPtr
        RemoveSymbolByName  : IntPtr
        RemoveSymbolByIndex : IntPtr
        GetSymbolName       : IntPtr
        GetSymbolParameters : IntPtr
        ExpandSymbol        : IntPtr
        OutputSymbols       : IntPtr
        WriteSymbol         : IntPtr
        OutputAsType        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugSymbolGroup.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetNumberSymbols() {
        result := ComCall(3, this, "uint*", &_Number := 0, "HRESULT")
        return _Number
    }

    /**
     * 
     * @param {PSTR} Name 
     * @param {Pointer<Integer>} Index 
     * @returns {HRESULT} 
     */
    AddSymbol(Name, Index) {
        Name := Name is String ? StrPtr(Name) : Name

        IndexMarshal := Index is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "ptr", Name, IndexMarshal, Index, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} Name 
     * @returns {HRESULT} 
     */
    RemoveSymbolByName(Name) {
        Name := Name is String ? StrPtr(Name) : Name

        result := ComCall(5, this, "ptr", Name, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {HRESULT} 
     */
    RemoveSymbolByIndex(Index) {
        result := ComCall(6, this, "uint", Index, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {PSTR} _Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetSymbolName(Index, _Buffer, BufferSize) {
        _Buffer := _Buffer is String ? StrPtr(_Buffer) : _Buffer

        result := ComCall(7, this, "uint", Index, "ptr", _Buffer, "uint", BufferSize, "uint*", &NameSize := 0, "HRESULT")
        return NameSize
    }

    /**
     * 
     * @param {Integer} Start 
     * @param {Integer} Count 
     * @returns {DEBUG_SYMBOL_PARAMETERS} 
     */
    GetSymbolParameters(Start, Count) {
        Params := DEBUG_SYMBOL_PARAMETERS()
        result := ComCall(8, this, "uint", Start, "uint", Count, DEBUG_SYMBOL_PARAMETERS.Ptr, Params, "HRESULT")
        return Params
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {BOOL} Expand 
     * @returns {HRESULT} 
     */
    ExpandSymbol(Index, Expand) {
        result := ComCall(9, this, "uint", Index, BOOL, Expand, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} OutputControl 
     * @param {Integer} Flags 
     * @param {Integer} Start 
     * @param {Integer} Count 
     * @returns {HRESULT} 
     */
    OutputSymbols(OutputControl, Flags, Start, Count) {
        result := ComCall(10, this, "uint", OutputControl, "uint", Flags, "uint", Start, "uint", Count, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {PSTR} Value 
     * @returns {HRESULT} 
     */
    WriteSymbol(Index, Value) {
        Value := Value is String ? StrPtr(Value) : Value

        result := ComCall(11, this, "uint", Index, "ptr", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {PSTR} Type 
     * @returns {HRESULT} 
     */
    OutputAsType(Index, Type) {
        Type := Type is String ? StrPtr(Type) : Type

        result := ComCall(12, this, "uint", Index, "ptr", Type, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDebugSymbolGroup.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetNumberSymbols := CallbackCreate(GetMethod(implObj, "GetNumberSymbols"), flags, 2)
        this.vtbl.AddSymbol := CallbackCreate(GetMethod(implObj, "AddSymbol"), flags, 3)
        this.vtbl.RemoveSymbolByName := CallbackCreate(GetMethod(implObj, "RemoveSymbolByName"), flags, 2)
        this.vtbl.RemoveSymbolByIndex := CallbackCreate(GetMethod(implObj, "RemoveSymbolByIndex"), flags, 2)
        this.vtbl.GetSymbolName := CallbackCreate(GetMethod(implObj, "GetSymbolName"), flags, 5)
        this.vtbl.GetSymbolParameters := CallbackCreate(GetMethod(implObj, "GetSymbolParameters"), flags, 4)
        this.vtbl.ExpandSymbol := CallbackCreate(GetMethod(implObj, "ExpandSymbol"), flags, 3)
        this.vtbl.OutputSymbols := CallbackCreate(GetMethod(implObj, "OutputSymbols"), flags, 5)
        this.vtbl.WriteSymbol := CallbackCreate(GetMethod(implObj, "WriteSymbol"), flags, 3)
        this.vtbl.OutputAsType := CallbackCreate(GetMethod(implObj, "OutputAsType"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetNumberSymbols)
        CallbackFree(this.vtbl.AddSymbol)
        CallbackFree(this.vtbl.RemoveSymbolByName)
        CallbackFree(this.vtbl.RemoveSymbolByIndex)
        CallbackFree(this.vtbl.GetSymbolName)
        CallbackFree(this.vtbl.GetSymbolParameters)
        CallbackFree(this.vtbl.ExpandSymbol)
        CallbackFree(this.vtbl.OutputSymbols)
        CallbackFree(this.vtbl.WriteSymbol)
        CallbackFree(this.vtbl.OutputAsType)
    }
}
