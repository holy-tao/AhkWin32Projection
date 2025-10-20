#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
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
     * @param {Pointer<Integer>} Number 
     * @returns {HRESULT} 
     */
    GetNumberRegisters(Number) {
        result := ComCall(3, this, "uint*", Number, "HRESULT")
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
        result := ComCall(4, this, "uint", Register, "ptr", NameBuffer, "uint", NameBufferSize, "uint*", NameSize, "ptr", Desc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} Name 
     * @param {Pointer<Integer>} Index 
     * @returns {HRESULT} 
     */
    GetIndexByName(Name, Index) {
        result := ComCall(5, this, "ptr", Name, "uint*", Index, "HRESULT")
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
        result := ComCall(8, this, "uint", Count, "uint*", Indices, "uint", Start, "ptr", Values, "HRESULT")
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
        result := ComCall(9, this, "uint", Count, "uint*", Indices, "uint", Start, "ptr", Values, "HRESULT")
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
        result := ComCall(11, this, "uint*", Offset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Offset 
     * @returns {HRESULT} 
     */
    GetStackOffset(Offset) {
        result := ComCall(12, this, "uint*", Offset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Offset 
     * @returns {HRESULT} 
     */
    GetFrameOffset(Offset) {
        result := ComCall(13, this, "uint*", Offset, "HRESULT")
        return result
    }
}
