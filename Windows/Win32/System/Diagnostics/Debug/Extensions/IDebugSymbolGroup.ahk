#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
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
     * @param {Pointer<Integer>} Number 
     * @returns {HRESULT} 
     */
    GetNumberSymbols(Number) {
        result := ComCall(3, this, "uint*", Number, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} Name 
     * @param {Pointer<Integer>} Index 
     * @returns {HRESULT} 
     */
    AddSymbol(Name, Index) {
        result := ComCall(4, this, "ptr", Name, "uint*", Index, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} Name 
     * @returns {HRESULT} 
     */
    RemoveSymbolByName(Name) {
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
     * @param {PSTR} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} NameSize 
     * @returns {HRESULT} 
     */
    GetSymbolName(Index, Buffer, BufferSize, NameSize) {
        result := ComCall(7, this, "uint", Index, "ptr", Buffer, "uint", BufferSize, "uint*", NameSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Start 
     * @param {Integer} Count 
     * @param {Pointer<DEBUG_SYMBOL_PARAMETERS>} Params 
     * @returns {HRESULT} 
     */
    GetSymbolParameters(Start, Count, Params) {
        result := ComCall(8, this, "uint", Start, "uint", Count, "ptr", Params, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {BOOL} Expand 
     * @returns {HRESULT} 
     */
    ExpandSymbol(Index, Expand) {
        result := ComCall(9, this, "uint", Index, "int", Expand, "HRESULT")
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
        result := ComCall(12, this, "uint", Index, "ptr", Type, "HRESULT")
        return result
    }
}
