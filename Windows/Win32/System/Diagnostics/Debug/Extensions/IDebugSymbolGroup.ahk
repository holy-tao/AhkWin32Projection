#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\DEBUG_SYMBOL_PARAMETERS.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugSymbolGroup extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugSymbolGroup
     * @type {Guid}
     */
    static IID => Guid("{f2528316-0f1a-4431-aeed-11d096e1e2ab}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetNumberSymbols", "AddSymbol", "RemoveSymbolByName", "RemoveSymbolByIndex", "GetSymbolName", "GetSymbolParameters", "ExpandSymbol", "OutputSymbols", "WriteSymbol", "OutputAsType"]

    /**
     * 
     * @returns {Integer} 
     */
    GetNumberSymbols() {
        result := ComCall(3, this, "uint*", &Number_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Number_
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

        result := ComCall(4, this, "ptr", Name, IndexMarshal, Index, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PSTR} Name 
     * @returns {HRESULT} 
     */
    RemoveSymbolByName(Name) {
        Name := Name is String ? StrPtr(Name) : Name

        result := ComCall(5, this, "ptr", Name, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {HRESULT} 
     */
    RemoveSymbolByIndex(Index) {
        result := ComCall(6, this, "uint", Index, "int")
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
    GetSymbolName(Index, Buffer_, BufferSize) {
        Buffer_ := Buffer_ is String ? StrPtr(Buffer_) : Buffer_

        result := ComCall(7, this, "uint", Index, "ptr", Buffer_, "uint", BufferSize, "uint*", &NameSize := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
        result := ComCall(8, this, "uint", Start, "uint", Count, "ptr", Params, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Params
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {BOOL} Expand 
     * @returns {HRESULT} 
     */
    ExpandSymbol(Index, Expand) {
        result := ComCall(9, this, "uint", Index, "int", Expand, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
        result := ComCall(10, this, "uint", OutputControl, "uint", Flags, "uint", Start, "uint", Count, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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

        result := ComCall(11, this, "uint", Index, "ptr", Value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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

        result := ComCall(12, this, "uint", Index, "ptr", Type, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
