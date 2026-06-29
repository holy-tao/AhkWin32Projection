#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DEBUG_VALUE.ahk" { DEBUG_VALUE }
#Import ".\DEBUG_REGISTER_DESCRIPTION.ahk" { DEBUG_REGISTER_DESCRIPTION }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IDebugRegisters extends IUnknown {
    /**
     * The interface identifier for IDebugRegisters
     * @type {Guid}
     */
    static IID := Guid("{ce289126-9e84-45a7-937e-67bb18691493}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugRegisters interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetNumberRegisters   : IntPtr
        GetDescription       : IntPtr
        GetIndexByName       : IntPtr
        GetValue             : IntPtr
        SetValue             : IntPtr
        GetValues            : IntPtr
        SetValues            : IntPtr
        OutputRegisters      : IntPtr
        GetInstructionOffset : IntPtr
        GetStackOffset       : IntPtr
        GetFrameOffset       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugRegisters.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetNumberRegisters() {
        result := ComCall(3, this, "uint*", &_Number := 0, "HRESULT")
        return _Number
    }

    /**
     * For current documentation on Windows Media codecs and digital signal processors, see Windows Media Audio and Video Codec and DSP APIs. | GetDescription
     * @param {Integer} Register 
     * @param {PSTR} NameBuffer 
     * @param {Integer} NameBufferSize 
     * @param {Pointer<Integer>} NameSize 
     * @param {Pointer<DEBUG_REGISTER_DESCRIPTION>} Desc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/wmformat/iwmcodecstrings-getdescription
     */
    GetDescription(Register, NameBuffer, NameBufferSize, NameSize, Desc) {
        NameBuffer := NameBuffer is String ? StrPtr(NameBuffer) : NameBuffer

        NameSizeMarshal := NameSize is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "uint", Register, "ptr", NameBuffer, "uint", NameBufferSize, NameSizeMarshal, NameSize, DEBUG_REGISTER_DESCRIPTION.Ptr, Desc, "HRESULT")
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
        result := ComCall(6, this, "uint", Register, DEBUG_VALUE.Ptr, Value, "HRESULT")
        return Value
    }

    /**
     * 
     * @param {Integer} Register 
     * @param {Pointer<DEBUG_VALUE>} Value 
     * @returns {HRESULT} 
     */
    SetValue(Register, Value) {
        result := ComCall(7, this, "uint", Register, DEBUG_VALUE.Ptr, Value, "HRESULT")
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
        result := ComCall(8, this, "uint", Count, IndicesMarshal, Indices, "uint", Start, DEBUG_VALUE.Ptr, Values, "HRESULT")
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

        result := ComCall(9, this, "uint", Count, IndicesMarshal, Indices, "uint", Start, DEBUG_VALUE.Ptr, Values, "HRESULT")
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

    Query(iid) {
        if (IDebugRegisters.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetNumberRegisters := CallbackCreate(GetMethod(implObj, "GetNumberRegisters"), flags, 2)
        this.vtbl.GetDescription := CallbackCreate(GetMethod(implObj, "GetDescription"), flags, 6)
        this.vtbl.GetIndexByName := CallbackCreate(GetMethod(implObj, "GetIndexByName"), flags, 3)
        this.vtbl.GetValue := CallbackCreate(GetMethod(implObj, "GetValue"), flags, 3)
        this.vtbl.SetValue := CallbackCreate(GetMethod(implObj, "SetValue"), flags, 3)
        this.vtbl.GetValues := CallbackCreate(GetMethod(implObj, "GetValues"), flags, 5)
        this.vtbl.SetValues := CallbackCreate(GetMethod(implObj, "SetValues"), flags, 5)
        this.vtbl.OutputRegisters := CallbackCreate(GetMethod(implObj, "OutputRegisters"), flags, 3)
        this.vtbl.GetInstructionOffset := CallbackCreate(GetMethod(implObj, "GetInstructionOffset"), flags, 2)
        this.vtbl.GetStackOffset := CallbackCreate(GetMethod(implObj, "GetStackOffset"), flags, 2)
        this.vtbl.GetFrameOffset := CallbackCreate(GetMethod(implObj, "GetFrameOffset"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetNumberRegisters)
        CallbackFree(this.vtbl.GetDescription)
        CallbackFree(this.vtbl.GetIndexByName)
        CallbackFree(this.vtbl.GetValue)
        CallbackFree(this.vtbl.SetValue)
        CallbackFree(this.vtbl.GetValues)
        CallbackFree(this.vtbl.SetValues)
        CallbackFree(this.vtbl.OutputRegisters)
        CallbackFree(this.vtbl.GetInstructionOffset)
        CallbackFree(this.vtbl.GetStackOffset)
        CallbackFree(this.vtbl.GetFrameOffset)
    }
}
