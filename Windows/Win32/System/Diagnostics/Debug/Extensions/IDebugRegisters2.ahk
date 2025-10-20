#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugRegisters2 extends IUnknown{
    /**
     * The interface identifier for IDebugRegisters2
     * @type {Guid}
     */
    static IID => Guid("{1656afa9-19c6-4e3a-97e7-5dc9160cf9c4}")

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
    GetNumberRegisters(Number) {
        result := ComCall(3, this, "uint*", Number, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Register 
     * @param {PSTR} NameBuffer 
     * @param {Integer} NameBufferSize 
     * @param {Pointer<UInt32>} NameSize 
     * @param {Pointer<DEBUG_REGISTER_DESCRIPTION>} Desc 
     * @returns {HRESULT} 
     */
    GetDescription(Register, NameBuffer, NameBufferSize, NameSize, Desc) {
        result := ComCall(4, this, "uint", Register, "ptr", NameBuffer, "uint", NameBufferSize, "uint*", NameSize, "ptr", Desc, "int")
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
    GetIndexByName(Name, Index) {
        result := ComCall(5, this, "ptr", Name, "uint*", Index, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Register 
     * @param {Pointer<DEBUG_VALUE>} Value 
     * @returns {HRESULT} 
     */
    GetValue(Register, Value) {
        result := ComCall(6, this, "uint", Register, "ptr", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Register 
     * @param {Pointer<DEBUG_VALUE>} Value 
     * @returns {HRESULT} 
     */
    SetValue(Register, Value) {
        result := ComCall(7, this, "uint", Register, "ptr", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Count 
     * @param {Pointer<UInt32>} Indices 
     * @param {Integer} Start 
     * @param {Pointer<DEBUG_VALUE>} Values 
     * @returns {HRESULT} 
     */
    GetValues(Count, Indices, Start, Values) {
        result := ComCall(8, this, "uint", Count, "uint*", Indices, "uint", Start, "ptr", Values, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Count 
     * @param {Pointer<UInt32>} Indices 
     * @param {Integer} Start 
     * @param {Pointer<DEBUG_VALUE>} Values 
     * @returns {HRESULT} 
     */
    SetValues(Count, Indices, Start, Values) {
        result := ComCall(9, this, "uint", Count, "uint*", Indices, "uint", Start, "ptr", Values, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} OutputControl 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     */
    OutputRegisters(OutputControl, Flags) {
        result := ComCall(10, this, "uint", OutputControl, "uint", Flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt64>} Offset 
     * @returns {HRESULT} 
     */
    GetInstructionOffset(Offset) {
        result := ComCall(11, this, "uint*", Offset, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt64>} Offset 
     * @returns {HRESULT} 
     */
    GetStackOffset(Offset) {
        result := ComCall(12, this, "uint*", Offset, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt64>} Offset 
     * @returns {HRESULT} 
     */
    GetFrameOffset(Offset) {
        result := ComCall(13, this, "uint*", Offset, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Register 
     * @param {PWSTR} NameBuffer 
     * @param {Integer} NameBufferSize 
     * @param {Pointer<UInt32>} NameSize 
     * @param {Pointer<DEBUG_REGISTER_DESCRIPTION>} Desc 
     * @returns {HRESULT} 
     */
    GetDescriptionWide(Register, NameBuffer, NameBufferSize, NameSize, Desc) {
        NameBuffer := NameBuffer is String ? StrPtr(NameBuffer) : NameBuffer

        result := ComCall(14, this, "uint", Register, "ptr", NameBuffer, "uint", NameBufferSize, "uint*", NameSize, "ptr", Desc, "int")
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
    GetIndexByNameWide(Name, Index) {
        Name := Name is String ? StrPtr(Name) : Name

        result := ComCall(15, this, "ptr", Name, "uint*", Index, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} Number 
     * @returns {HRESULT} 
     */
    GetNumberPseudoRegisters(Number) {
        result := ComCall(16, this, "uint*", Number, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Register 
     * @param {PSTR} NameBuffer 
     * @param {Integer} NameBufferSize 
     * @param {Pointer<UInt32>} NameSize 
     * @param {Pointer<UInt64>} TypeModule 
     * @param {Pointer<UInt32>} TypeId 
     * @returns {HRESULT} 
     */
    GetPseudoDescription(Register, NameBuffer, NameBufferSize, NameSize, TypeModule, TypeId) {
        result := ComCall(17, this, "uint", Register, "ptr", NameBuffer, "uint", NameBufferSize, "uint*", NameSize, "uint*", TypeModule, "uint*", TypeId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Register 
     * @param {PWSTR} NameBuffer 
     * @param {Integer} NameBufferSize 
     * @param {Pointer<UInt32>} NameSize 
     * @param {Pointer<UInt64>} TypeModule 
     * @param {Pointer<UInt32>} TypeId 
     * @returns {HRESULT} 
     */
    GetPseudoDescriptionWide(Register, NameBuffer, NameBufferSize, NameSize, TypeModule, TypeId) {
        NameBuffer := NameBuffer is String ? StrPtr(NameBuffer) : NameBuffer

        result := ComCall(18, this, "uint", Register, "ptr", NameBuffer, "uint", NameBufferSize, "uint*", NameSize, "uint*", TypeModule, "uint*", TypeId, "int")
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
    GetPseudoIndexByName(Name, Index) {
        result := ComCall(19, this, "ptr", Name, "uint*", Index, "int")
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
    GetPseudoIndexByNameWide(Name, Index) {
        Name := Name is String ? StrPtr(Name) : Name

        result := ComCall(20, this, "ptr", Name, "uint*", Index, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Source 
     * @param {Integer} Count 
     * @param {Pointer<UInt32>} Indices 
     * @param {Integer} Start 
     * @param {Pointer<DEBUG_VALUE>} Values 
     * @returns {HRESULT} 
     */
    GetPseudoValues(Source, Count, Indices, Start, Values) {
        result := ComCall(21, this, "uint", Source, "uint", Count, "uint*", Indices, "uint", Start, "ptr", Values, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Source 
     * @param {Integer} Count 
     * @param {Pointer<UInt32>} Indices 
     * @param {Integer} Start 
     * @param {Pointer<DEBUG_VALUE>} Values 
     * @returns {HRESULT} 
     */
    SetPseudoValues(Source, Count, Indices, Start, Values) {
        result := ComCall(22, this, "uint", Source, "uint", Count, "uint*", Indices, "uint", Start, "ptr", Values, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Source 
     * @param {Integer} Count 
     * @param {Pointer<UInt32>} Indices 
     * @param {Integer} Start 
     * @param {Pointer<DEBUG_VALUE>} Values 
     * @returns {HRESULT} 
     */
    GetValues2(Source, Count, Indices, Start, Values) {
        result := ComCall(23, this, "uint", Source, "uint", Count, "uint*", Indices, "uint", Start, "ptr", Values, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Source 
     * @param {Integer} Count 
     * @param {Pointer<UInt32>} Indices 
     * @param {Integer} Start 
     * @param {Pointer<DEBUG_VALUE>} Values 
     * @returns {HRESULT} 
     */
    SetValues2(Source, Count, Indices, Start, Values) {
        result := ComCall(24, this, "uint", Source, "uint", Count, "uint*", Indices, "uint", Start, "ptr", Values, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} OutputControl 
     * @param {Integer} Source 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     */
    OutputRegisters2(OutputControl, Source, Flags) {
        result := ComCall(25, this, "uint", OutputControl, "uint", Source, "uint", Flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Source 
     * @param {Pointer<UInt64>} Offset 
     * @returns {HRESULT} 
     */
    GetInstructionOffset2(Source, Offset) {
        result := ComCall(26, this, "uint", Source, "uint*", Offset, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Source 
     * @param {Pointer<UInt64>} Offset 
     * @returns {HRESULT} 
     */
    GetStackOffset2(Source, Offset) {
        result := ComCall(27, this, "uint", Source, "uint*", Offset, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Source 
     * @param {Pointer<UInt64>} Offset 
     * @returns {HRESULT} 
     */
    GetFrameOffset2(Source, Offset) {
        result := ComCall(28, this, "uint", Source, "uint*", Offset, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
