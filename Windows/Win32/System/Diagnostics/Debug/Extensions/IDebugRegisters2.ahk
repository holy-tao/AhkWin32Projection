#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\DEBUG_VALUE.ahk
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
     * @returns {Integer} 
     */
    GetNumberRegisters() {
        result := ComCall(3, this, "uint*", &Number := 0, "HRESULT")
        return Number
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
     * @returns {Integer} 
     */
    GetIndexByName(Name) {
        Name := Name is String ? StrPtr(Name) : Name

        result := ComCall(5, this, "ptr", Name, "uint*", &Index := 0, "HRESULT")
        return Index
    }

    /**
     * 
     * @param {Integer} Register 
     * @returns {DEBUG_VALUE} 
     */
    GetValue(Register) {
        Value := DEBUG_VALUE()
        result := ComCall(6, this, "uint", Register, "ptr", Value, "HRESULT")
        return Value
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
     * @returns {DEBUG_VALUE} 
     */
    GetValues(Count, Indices, Start) {
        IndicesMarshal := Indices is VarRef ? "uint*" : "ptr"

        Values := DEBUG_VALUE()
        result := ComCall(8, this, "uint", Count, IndicesMarshal, Indices, "uint", Start, "ptr", Values, "HRESULT")
        return Values
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
     * @returns {Integer} 
     */
    GetInstructionOffset() {
        result := ComCall(11, this, "uint*", &Offset := 0, "HRESULT")
        return Offset
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetStackOffset() {
        result := ComCall(12, this, "uint*", &Offset := 0, "HRESULT")
        return Offset
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetFrameOffset() {
        result := ComCall(13, this, "uint*", &Offset := 0, "HRESULT")
        return Offset
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
     * @returns {Integer} 
     */
    GetIndexByNameWide(Name) {
        Name := Name is String ? StrPtr(Name) : Name

        result := ComCall(15, this, "ptr", Name, "uint*", &Index := 0, "HRESULT")
        return Index
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetNumberPseudoRegisters() {
        result := ComCall(16, this, "uint*", &Number := 0, "HRESULT")
        return Number
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
     * @returns {Integer} 
     */
    GetPseudoIndexByName(Name) {
        Name := Name is String ? StrPtr(Name) : Name

        result := ComCall(19, this, "ptr", Name, "uint*", &Index := 0, "HRESULT")
        return Index
    }

    /**
     * 
     * @param {PWSTR} Name 
     * @returns {Integer} 
     */
    GetPseudoIndexByNameWide(Name) {
        Name := Name is String ? StrPtr(Name) : Name

        result := ComCall(20, this, "ptr", Name, "uint*", &Index := 0, "HRESULT")
        return Index
    }

    /**
     * 
     * @param {Integer} Source 
     * @param {Integer} Count 
     * @param {Pointer<Integer>} Indices 
     * @param {Integer} Start 
     * @returns {DEBUG_VALUE} 
     */
    GetPseudoValues(Source, Count, Indices, Start) {
        IndicesMarshal := Indices is VarRef ? "uint*" : "ptr"

        Values := DEBUG_VALUE()
        result := ComCall(21, this, "uint", Source, "uint", Count, IndicesMarshal, Indices, "uint", Start, "ptr", Values, "HRESULT")
        return Values
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
     * @returns {DEBUG_VALUE} 
     */
    GetValues2(Source, Count, Indices, Start) {
        IndicesMarshal := Indices is VarRef ? "uint*" : "ptr"

        Values := DEBUG_VALUE()
        result := ComCall(23, this, "uint", Source, "uint", Count, IndicesMarshal, Indices, "uint", Start, "ptr", Values, "HRESULT")
        return Values
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
     * @returns {Integer} 
     */
    GetInstructionOffset2(Source) {
        result := ComCall(26, this, "uint", Source, "uint*", &Offset := 0, "HRESULT")
        return Offset
    }

    /**
     * 
     * @param {Integer} Source 
     * @returns {Integer} 
     */
    GetStackOffset2(Source) {
        result := ComCall(27, this, "uint", Source, "uint*", &Offset := 0, "HRESULT")
        return Offset
    }

    /**
     * 
     * @param {Integer} Source 
     * @returns {Integer} 
     */
    GetFrameOffset2(Source) {
        result := ComCall(28, this, "uint", Source, "uint*", &Offset := 0, "HRESULT")
        return Offset
    }
}
