#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\DEBUG_SYMBOL_PARAMETERS.ahk
#Include .\DEBUG_SYMBOL_ENTRY.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugSymbolGroup2 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugSymbolGroup2
     * @type {Guid}
     */
    static IID => Guid("{6a7ccc5f-fb5e-4dcc-b41c-6c20307bccc7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetNumberSymbols", "AddSymbol", "RemoveSymbolByName", "RemoveSymbolByIndex", "GetSymbolName", "GetSymbolParameters", "ExpandSymbol", "OutputSymbols", "WriteSymbol", "OutputAsType", "AddSymbolWide", "RemoveSymbolByNameWide", "GetSymbolNameWide", "WriteSymbolWide", "OutputAsTypeWide", "GetSymbolTypeName", "GetSymbolTypeNameWide", "GetSymbolSize", "GetSymbolOffset", "GetSymbolRegister", "GetSymbolValueText", "GetSymbolValueTextWide", "GetSymbolEntryInformation"]

    /**
     * 
     * @returns {Integer} 
     */
    GetNumberSymbols() {
        result := ComCall(3, this, "uint*", &Number := 0, "HRESULT")
        return Number
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
     * @param {PSTR} Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetSymbolName(Index, Buffer, BufferSize) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(7, this, "uint", Index, "ptr", Buffer, "uint", BufferSize, "uint*", &NameSize := 0, "HRESULT")
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
        result := ComCall(8, this, "uint", Start, "uint", Count, "ptr", Params, "HRESULT")
        return Params
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

    /**
     * 
     * @param {PWSTR} Name 
     * @param {Pointer<Integer>} Index 
     * @returns {HRESULT} 
     */
    AddSymbolWide(Name, Index) {
        Name := Name is String ? StrPtr(Name) : Name

        IndexMarshal := Index is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, "ptr", Name, IndexMarshal, Index, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} Name 
     * @returns {HRESULT} 
     */
    RemoveSymbolByNameWide(Name) {
        Name := Name is String ? StrPtr(Name) : Name

        result := ComCall(14, this, "ptr", Name, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {PWSTR} Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetSymbolNameWide(Index, Buffer, BufferSize) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(15, this, "uint", Index, "ptr", Buffer, "uint", BufferSize, "uint*", &NameSize := 0, "HRESULT")
        return NameSize
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {PWSTR} Value 
     * @returns {HRESULT} 
     */
    WriteSymbolWide(Index, Value) {
        Value := Value is String ? StrPtr(Value) : Value

        result := ComCall(16, this, "uint", Index, "ptr", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {PWSTR} Type 
     * @returns {HRESULT} 
     */
    OutputAsTypeWide(Index, Type) {
        Type := Type is String ? StrPtr(Type) : Type

        result := ComCall(17, this, "uint", Index, "ptr", Type, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {PSTR} Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetSymbolTypeName(Index, Buffer, BufferSize) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(18, this, "uint", Index, "ptr", Buffer, "uint", BufferSize, "uint*", &NameSize := 0, "HRESULT")
        return NameSize
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {PWSTR} Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetSymbolTypeNameWide(Index, Buffer, BufferSize) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(19, this, "uint", Index, "ptr", Buffer, "uint", BufferSize, "uint*", &NameSize := 0, "HRESULT")
        return NameSize
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {Integer} 
     */
    GetSymbolSize(Index) {
        result := ComCall(20, this, "uint", Index, "uint*", &Size := 0, "HRESULT")
        return Size
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {Integer} 
     */
    GetSymbolOffset(Index) {
        result := ComCall(21, this, "uint", Index, "uint*", &Offset := 0, "HRESULT")
        return Offset
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {Integer} 
     */
    GetSymbolRegister(Index) {
        result := ComCall(22, this, "uint", Index, "uint*", &Register := 0, "HRESULT")
        return Register
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {PSTR} Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetSymbolValueText(Index, Buffer, BufferSize) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(23, this, "uint", Index, "ptr", Buffer, "uint", BufferSize, "uint*", &NameSize := 0, "HRESULT")
        return NameSize
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {PWSTR} Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetSymbolValueTextWide(Index, Buffer, BufferSize) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(24, this, "uint", Index, "ptr", Buffer, "uint", BufferSize, "uint*", &NameSize := 0, "HRESULT")
        return NameSize
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {DEBUG_SYMBOL_ENTRY} 
     */
    GetSymbolEntryInformation(Index) {
        Entry := DEBUG_SYMBOL_ENTRY()
        result := ComCall(25, this, "uint", Index, "ptr", Entry, "HRESULT")
        return Entry
    }
}
