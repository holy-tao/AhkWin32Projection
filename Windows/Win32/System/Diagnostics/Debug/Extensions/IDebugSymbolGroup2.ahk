#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugSymbolGroup2 extends IUnknown{
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
     * 
     * @param {Pointer<UInt32>} Number 
     * @returns {HRESULT} 
     */
    GetNumberSymbols(Number) {
        result := ComCall(3, this, "uint*", Number, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PSTR} Name 
     * @param {Pointer<UInt32>} Index 
     * @returns {HRESULT} 
     */
    AddSymbol(Name, Index) {
        result := ComCall(4, this, "ptr", Name, "uint*", Index, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PSTR} Name 
     * @returns {HRESULT} 
     */
    RemoveSymbolByName(Name) {
        result := ComCall(5, this, "ptr", Name, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {HRESULT} 
     */
    RemoveSymbolByIndex(Index) {
        result := ComCall(6, this, "uint", Index, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {PSTR} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<UInt32>} NameSize 
     * @returns {HRESULT} 
     */
    GetSymbolName(Index, Buffer, BufferSize, NameSize) {
        result := ComCall(7, this, "uint", Index, "ptr", Buffer, "uint", BufferSize, "uint*", NameSize, "int")
        if(result != 0)
            throw OSError(result)

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
        result := ComCall(8, this, "uint", Start, "uint", Count, "ptr", Params, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {BOOL} Expand 
     * @returns {HRESULT} 
     */
    ExpandSymbol(Index, Expand) {
        result := ComCall(9, this, "uint", Index, "int", Expand, "int")
        if(result != 0)
            throw OSError(result)

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
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {PSTR} Value 
     * @returns {HRESULT} 
     */
    WriteSymbol(Index, Value) {
        result := ComCall(11, this, "uint", Index, "ptr", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {PSTR} Type 
     * @returns {HRESULT} 
     */
    OutputAsType(Index, Type) {
        result := ComCall(12, this, "uint", Index, "ptr", Type, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} Name 
     * @param {Pointer<UInt32>} Index 
     * @returns {HRESULT} 
     */
    AddSymbolWide(Name, Index) {
        Name := Name is String ? StrPtr(Name) : Name

        result := ComCall(13, this, "ptr", Name, "uint*", Index, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} Name 
     * @returns {HRESULT} 
     */
    RemoveSymbolByNameWide(Name) {
        Name := Name is String ? StrPtr(Name) : Name

        result := ComCall(14, this, "ptr", Name, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {PWSTR} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<UInt32>} NameSize 
     * @returns {HRESULT} 
     */
    GetSymbolNameWide(Index, Buffer, BufferSize, NameSize) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(15, this, "uint", Index, "ptr", Buffer, "uint", BufferSize, "uint*", NameSize, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(16, this, "uint", Index, "ptr", Value, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(17, this, "uint", Index, "ptr", Type, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {PSTR} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<UInt32>} NameSize 
     * @returns {HRESULT} 
     */
    GetSymbolTypeName(Index, Buffer, BufferSize, NameSize) {
        result := ComCall(18, this, "uint", Index, "ptr", Buffer, "uint", BufferSize, "uint*", NameSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {PWSTR} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<UInt32>} NameSize 
     * @returns {HRESULT} 
     */
    GetSymbolTypeNameWide(Index, Buffer, BufferSize, NameSize) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(19, this, "uint", Index, "ptr", Buffer, "uint", BufferSize, "uint*", NameSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Pointer<UInt32>} Size 
     * @returns {HRESULT} 
     */
    GetSymbolSize(Index, Size) {
        result := ComCall(20, this, "uint", Index, "uint*", Size, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Pointer<UInt64>} Offset 
     * @returns {HRESULT} 
     */
    GetSymbolOffset(Index, Offset) {
        result := ComCall(21, this, "uint", Index, "uint*", Offset, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Pointer<UInt32>} Register 
     * @returns {HRESULT} 
     */
    GetSymbolRegister(Index, Register) {
        result := ComCall(22, this, "uint", Index, "uint*", Register, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {PSTR} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<UInt32>} NameSize 
     * @returns {HRESULT} 
     */
    GetSymbolValueText(Index, Buffer, BufferSize, NameSize) {
        result := ComCall(23, this, "uint", Index, "ptr", Buffer, "uint", BufferSize, "uint*", NameSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {PWSTR} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<UInt32>} NameSize 
     * @returns {HRESULT} 
     */
    GetSymbolValueTextWide(Index, Buffer, BufferSize, NameSize) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(24, this, "uint", Index, "ptr", Buffer, "uint", BufferSize, "uint*", NameSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Pointer<DEBUG_SYMBOL_ENTRY>} Entry 
     * @returns {HRESULT} 
     */
    GetSymbolEntryInformation(Index, Entry) {
        result := ComCall(25, this, "uint", Index, "ptr", Entry, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
