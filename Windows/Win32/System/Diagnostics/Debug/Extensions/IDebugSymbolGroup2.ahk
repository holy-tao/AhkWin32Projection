#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
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
        Name := Name is String ? StrPtr(Name) : Name

        result := ComCall(4, this, "ptr", Name, "uint*", Index, "HRESULT")
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
     * @param {Pointer<Integer>} NameSize 
     * @returns {HRESULT} 
     */
    GetSymbolName(Index, Buffer, BufferSize, NameSize) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

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

        result := ComCall(13, this, "ptr", Name, "uint*", Index, "HRESULT")
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
     * @param {Pointer<Integer>} NameSize 
     * @returns {HRESULT} 
     */
    GetSymbolNameWide(Index, Buffer, BufferSize, NameSize) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(15, this, "uint", Index, "ptr", Buffer, "uint", BufferSize, "uint*", NameSize, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} NameSize 
     * @returns {HRESULT} 
     */
    GetSymbolTypeName(Index, Buffer, BufferSize, NameSize) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(18, this, "uint", Index, "ptr", Buffer, "uint", BufferSize, "uint*", NameSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {PWSTR} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} NameSize 
     * @returns {HRESULT} 
     */
    GetSymbolTypeNameWide(Index, Buffer, BufferSize, NameSize) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(19, this, "uint", Index, "ptr", Buffer, "uint", BufferSize, "uint*", NameSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Pointer<Integer>} Size 
     * @returns {HRESULT} 
     */
    GetSymbolSize(Index, Size) {
        result := ComCall(20, this, "uint", Index, "uint*", Size, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Pointer<Integer>} Offset 
     * @returns {HRESULT} 
     */
    GetSymbolOffset(Index, Offset) {
        result := ComCall(21, this, "uint", Index, "uint*", Offset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Pointer<Integer>} Register 
     * @returns {HRESULT} 
     */
    GetSymbolRegister(Index, Register) {
        result := ComCall(22, this, "uint", Index, "uint*", Register, "HRESULT")
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
    GetSymbolValueText(Index, Buffer, BufferSize, NameSize) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(23, this, "uint", Index, "ptr", Buffer, "uint", BufferSize, "uint*", NameSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {PWSTR} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} NameSize 
     * @returns {HRESULT} 
     */
    GetSymbolValueTextWide(Index, Buffer, BufferSize, NameSize) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(24, this, "uint", Index, "ptr", Buffer, "uint", BufferSize, "uint*", NameSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Pointer<DEBUG_SYMBOL_ENTRY>} Entry 
     * @returns {HRESULT} 
     */
    GetSymbolEntryInformation(Index, Entry) {
        result := ComCall(25, this, "uint", Index, "ptr", Entry, "HRESULT")
        return result
    }
}
