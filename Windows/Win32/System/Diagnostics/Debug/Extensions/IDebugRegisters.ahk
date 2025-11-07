#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\DEBUG_VALUE.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugRegisters extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugRegisters
     * @type {Guid}
     */
    static IID => Guid("{ce289126-9e84-45a7-937e-67bb18691493}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetNumberRegisters", "GetDescription", "GetIndexByName", "GetValue", "SetValue", "GetValues", "SetValues", "OutputRegisters", "GetInstructionOffset", "GetStackOffset", "GetFrameOffset"]

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
}
