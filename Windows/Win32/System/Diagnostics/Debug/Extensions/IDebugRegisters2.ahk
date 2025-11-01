#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugRegisters2 extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetNumberRegisters", "GetDescription", "GetIndexByName", "GetValue", "SetValue", "GetValues", "SetValues", "OutputRegisters", "GetInstructionOffset", "GetStackOffset", "GetFrameOffset", "GetDescriptionWide", "GetIndexByNameWide", "GetNumberPseudoRegisters", "GetPseudoDescription", "GetPseudoDescriptionWide", "GetPseudoIndexByName", "GetPseudoIndexByNameWide", "GetPseudoValues", "SetPseudoValues", "GetValues2", "SetValues2", "OutputRegisters2", "GetInstructionOffset2", "GetStackOffset2", "GetFrameOffset2"]

    /**
     * 
     * @param {Pointer<Integer>} Number 
     * @returns {HRESULT} 
     */
    GetNumberRegisters(Number) {
        NumberMarshal := Number is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, NumberMarshal, Number, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Register 
     * @param {PSTR} NameBuffer 
     * @param {Integer} NameBufferSize 
     * @param {Pointer<Integer>} NameSize 
     * @param {Pointer<DEBUG_REGISTER_DESCRIPTION>} Desc 
     * @returns {HRESULT} 
     */
    GetDescription(Register, NameBuffer, NameBufferSize, NameSize, Desc) {
        NameBuffer := NameBuffer is String ? StrPtr(NameBuffer) : NameBuffer

        NameSizeMarshal := NameSize is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "uint", Register, "ptr", NameBuffer, "uint", NameBufferSize, NameSizeMarshal, NameSize, "ptr", Desc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} Name 
     * @param {Pointer<Integer>} Index 
     * @returns {HRESULT} 
     */
    GetIndexByName(Name, Index) {
        Name := Name is String ? StrPtr(Name) : Name

        IndexMarshal := Index is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "ptr", Name, IndexMarshal, Index, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Register 
     * @param {Pointer<DEBUG_VALUE>} Value 
     * @returns {HRESULT} 
     */
    GetValue(Register, Value) {
        result := ComCall(6, this, "uint", Register, "ptr", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Register 
     * @param {Pointer<DEBUG_VALUE>} Value 
     * @returns {HRESULT} 
     */
    SetValue(Register, Value) {
        result := ComCall(7, this, "uint", Register, "ptr", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Count 
     * @param {Pointer<Integer>} Indices 
     * @param {Integer} Start 
     * @param {Pointer<DEBUG_VALUE>} Values 
     * @returns {HRESULT} 
     */
    GetValues(Count, Indices, Start, Values) {
        IndicesMarshal := Indices is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, "uint", Count, IndicesMarshal, Indices, "uint", Start, "ptr", Values, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Count 
     * @param {Pointer<Integer>} Indices 
     * @param {Integer} Start 
     * @param {Pointer<DEBUG_VALUE>} Values 
     * @returns {HRESULT} 
     */
    SetValues(Count, Indices, Start, Values) {
        IndicesMarshal := Indices is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, "uint", Count, IndicesMarshal, Indices, "uint", Start, "ptr", Values, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} OutputControl 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     */
    OutputRegisters(OutputControl, Flags) {
        result := ComCall(10, this, "uint", OutputControl, "uint", Flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Offset 
     * @returns {HRESULT} 
     */
    GetInstructionOffset(Offset) {
        OffsetMarshal := Offset is VarRef ? "uint*" : "ptr"

        result := ComCall(11, this, OffsetMarshal, Offset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Offset 
     * @returns {HRESULT} 
     */
    GetStackOffset(Offset) {
        OffsetMarshal := Offset is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, OffsetMarshal, Offset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Offset 
     * @returns {HRESULT} 
     */
    GetFrameOffset(Offset) {
        OffsetMarshal := Offset is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, OffsetMarshal, Offset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Register 
     * @param {PWSTR} NameBuffer 
     * @param {Integer} NameBufferSize 
     * @param {Pointer<Integer>} NameSize 
     * @param {Pointer<DEBUG_REGISTER_DESCRIPTION>} Desc 
     * @returns {HRESULT} 
     */
    GetDescriptionWide(Register, NameBuffer, NameBufferSize, NameSize, Desc) {
        NameBuffer := NameBuffer is String ? StrPtr(NameBuffer) : NameBuffer

        NameSizeMarshal := NameSize is VarRef ? "uint*" : "ptr"

        result := ComCall(14, this, "uint", Register, "ptr", NameBuffer, "uint", NameBufferSize, NameSizeMarshal, NameSize, "ptr", Desc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} Name 
     * @param {Pointer<Integer>} Index 
     * @returns {HRESULT} 
     */
    GetIndexByNameWide(Name, Index) {
        Name := Name is String ? StrPtr(Name) : Name

        IndexMarshal := Index is VarRef ? "uint*" : "ptr"

        result := ComCall(15, this, "ptr", Name, IndexMarshal, Index, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Number 
     * @returns {HRESULT} 
     */
    GetNumberPseudoRegisters(Number) {
        NumberMarshal := Number is VarRef ? "uint*" : "ptr"

        result := ComCall(16, this, NumberMarshal, Number, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Register 
     * @param {PSTR} NameBuffer 
     * @param {Integer} NameBufferSize 
     * @param {Pointer<Integer>} NameSize 
     * @param {Pointer<Integer>} TypeModule 
     * @param {Pointer<Integer>} TypeId 
     * @returns {HRESULT} 
     */
    GetPseudoDescription(Register, NameBuffer, NameBufferSize, NameSize, TypeModule, TypeId) {
        NameBuffer := NameBuffer is String ? StrPtr(NameBuffer) : NameBuffer

        NameSizeMarshal := NameSize is VarRef ? "uint*" : "ptr"
        TypeModuleMarshal := TypeModule is VarRef ? "uint*" : "ptr"
        TypeIdMarshal := TypeId is VarRef ? "uint*" : "ptr"

        result := ComCall(17, this, "uint", Register, "ptr", NameBuffer, "uint", NameBufferSize, NameSizeMarshal, NameSize, TypeModuleMarshal, TypeModule, TypeIdMarshal, TypeId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Register 
     * @param {PWSTR} NameBuffer 
     * @param {Integer} NameBufferSize 
     * @param {Pointer<Integer>} NameSize 
     * @param {Pointer<Integer>} TypeModule 
     * @param {Pointer<Integer>} TypeId 
     * @returns {HRESULT} 
     */
    GetPseudoDescriptionWide(Register, NameBuffer, NameBufferSize, NameSize, TypeModule, TypeId) {
        NameBuffer := NameBuffer is String ? StrPtr(NameBuffer) : NameBuffer

        NameSizeMarshal := NameSize is VarRef ? "uint*" : "ptr"
        TypeModuleMarshal := TypeModule is VarRef ? "uint*" : "ptr"
        TypeIdMarshal := TypeId is VarRef ? "uint*" : "ptr"

        result := ComCall(18, this, "uint", Register, "ptr", NameBuffer, "uint", NameBufferSize, NameSizeMarshal, NameSize, TypeModuleMarshal, TypeModule, TypeIdMarshal, TypeId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} Name 
     * @param {Pointer<Integer>} Index 
     * @returns {HRESULT} 
     */
    GetPseudoIndexByName(Name, Index) {
        Name := Name is String ? StrPtr(Name) : Name

        IndexMarshal := Index is VarRef ? "uint*" : "ptr"

        result := ComCall(19, this, "ptr", Name, IndexMarshal, Index, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} Name 
     * @param {Pointer<Integer>} Index 
     * @returns {HRESULT} 
     */
    GetPseudoIndexByNameWide(Name, Index) {
        Name := Name is String ? StrPtr(Name) : Name

        IndexMarshal := Index is VarRef ? "uint*" : "ptr"

        result := ComCall(20, this, "ptr", Name, IndexMarshal, Index, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Source 
     * @param {Integer} Count 
     * @param {Pointer<Integer>} Indices 
     * @param {Integer} Start 
     * @param {Pointer<DEBUG_VALUE>} Values 
     * @returns {HRESULT} 
     */
    GetPseudoValues(Source, Count, Indices, Start, Values) {
        IndicesMarshal := Indices is VarRef ? "uint*" : "ptr"

        result := ComCall(21, this, "uint", Source, "uint", Count, IndicesMarshal, Indices, "uint", Start, "ptr", Values, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Source 
     * @param {Integer} Count 
     * @param {Pointer<Integer>} Indices 
     * @param {Integer} Start 
     * @param {Pointer<DEBUG_VALUE>} Values 
     * @returns {HRESULT} 
     */
    SetPseudoValues(Source, Count, Indices, Start, Values) {
        IndicesMarshal := Indices is VarRef ? "uint*" : "ptr"

        result := ComCall(22, this, "uint", Source, "uint", Count, IndicesMarshal, Indices, "uint", Start, "ptr", Values, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Source 
     * @param {Integer} Count 
     * @param {Pointer<Integer>} Indices 
     * @param {Integer} Start 
     * @param {Pointer<DEBUG_VALUE>} Values 
     * @returns {HRESULT} 
     */
    GetValues2(Source, Count, Indices, Start, Values) {
        IndicesMarshal := Indices is VarRef ? "uint*" : "ptr"

        result := ComCall(23, this, "uint", Source, "uint", Count, IndicesMarshal, Indices, "uint", Start, "ptr", Values, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Source 
     * @param {Integer} Count 
     * @param {Pointer<Integer>} Indices 
     * @param {Integer} Start 
     * @param {Pointer<DEBUG_VALUE>} Values 
     * @returns {HRESULT} 
     */
    SetValues2(Source, Count, Indices, Start, Values) {
        IndicesMarshal := Indices is VarRef ? "uint*" : "ptr"

        result := ComCall(24, this, "uint", Source, "uint", Count, IndicesMarshal, Indices, "uint", Start, "ptr", Values, "HRESULT")
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
        result := ComCall(25, this, "uint", OutputControl, "uint", Source, "uint", Flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Source 
     * @param {Pointer<Integer>} Offset 
     * @returns {HRESULT} 
     */
    GetInstructionOffset2(Source, Offset) {
        OffsetMarshal := Offset is VarRef ? "uint*" : "ptr"

        result := ComCall(26, this, "uint", Source, OffsetMarshal, Offset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Source 
     * @param {Pointer<Integer>} Offset 
     * @returns {HRESULT} 
     */
    GetStackOffset2(Source, Offset) {
        OffsetMarshal := Offset is VarRef ? "uint*" : "ptr"

        result := ComCall(27, this, "uint", Source, OffsetMarshal, Offset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Source 
     * @param {Pointer<Integer>} Offset 
     * @returns {HRESULT} 
     */
    GetFrameOffset2(Source, Offset) {
        OffsetMarshal := Offset is VarRef ? "uint*" : "ptr"

        result := ComCall(28, this, "uint", Source, OffsetMarshal, Offset, "HRESULT")
        return result
    }
}
