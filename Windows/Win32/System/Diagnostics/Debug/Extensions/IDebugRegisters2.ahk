#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DEBUG_VALUE.ahk" { DEBUG_VALUE }
#Import ".\DEBUG_REGISTER_DESCRIPTION.ahk" { DEBUG_REGISTER_DESCRIPTION }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IDebugRegisters2 extends IUnknown {
    /**
     * The interface identifier for IDebugRegisters2
     * @type {Guid}
     */
    static IID := Guid("{1656afa9-19c6-4e3a-97e7-5dc9160cf9c4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugRegisters2 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetNumberRegisters       : IntPtr
        GetDescription           : IntPtr
        GetIndexByName           : IntPtr
        GetValue                 : IntPtr
        SetValue                 : IntPtr
        GetValues                : IntPtr
        SetValues                : IntPtr
        OutputRegisters          : IntPtr
        GetInstructionOffset     : IntPtr
        GetStackOffset           : IntPtr
        GetFrameOffset           : IntPtr
        GetDescriptionWide       : IntPtr
        GetIndexByNameWide       : IntPtr
        GetNumberPseudoRegisters : IntPtr
        GetPseudoDescription     : IntPtr
        GetPseudoDescriptionWide : IntPtr
        GetPseudoIndexByName     : IntPtr
        GetPseudoIndexByNameWide : IntPtr
        GetPseudoValues          : IntPtr
        SetPseudoValues          : IntPtr
        GetValues2               : IntPtr
        SetValues2               : IntPtr
        OutputRegisters2         : IntPtr
        GetInstructionOffset2    : IntPtr
        GetStackOffset2          : IntPtr
        GetFrameOffset2          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugRegisters2.Vtbl()
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

        result := ComCall(14, this, "uint", Register, "ptr", NameBuffer, "uint", NameBufferSize, NameSizeMarshal, NameSize, DEBUG_REGISTER_DESCRIPTION.Ptr, Desc, "HRESULT")
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
        result := ComCall(16, this, "uint*", &_Number := 0, "HRESULT")
        return _Number
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
        result := ComCall(21, this, "uint", Source, "uint", Count, IndicesMarshal, Indices, "uint", Start, DEBUG_VALUE.Ptr, Values, "HRESULT")
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

        result := ComCall(22, this, "uint", Source, "uint", Count, IndicesMarshal, Indices, "uint", Start, DEBUG_VALUE.Ptr, Values, "HRESULT")
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
        result := ComCall(23, this, "uint", Source, "uint", Count, IndicesMarshal, Indices, "uint", Start, DEBUG_VALUE.Ptr, Values, "HRESULT")
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

        result := ComCall(24, this, "uint", Source, "uint", Count, IndicesMarshal, Indices, "uint", Start, DEBUG_VALUE.Ptr, Values, "HRESULT")
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

    Query(iid) {
        if (IDebugRegisters2.IID.Equals(iid)) {
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
        this.vtbl.GetDescriptionWide := CallbackCreate(GetMethod(implObj, "GetDescriptionWide"), flags, 6)
        this.vtbl.GetIndexByNameWide := CallbackCreate(GetMethod(implObj, "GetIndexByNameWide"), flags, 3)
        this.vtbl.GetNumberPseudoRegisters := CallbackCreate(GetMethod(implObj, "GetNumberPseudoRegisters"), flags, 2)
        this.vtbl.GetPseudoDescription := CallbackCreate(GetMethod(implObj, "GetPseudoDescription"), flags, 7)
        this.vtbl.GetPseudoDescriptionWide := CallbackCreate(GetMethod(implObj, "GetPseudoDescriptionWide"), flags, 7)
        this.vtbl.GetPseudoIndexByName := CallbackCreate(GetMethod(implObj, "GetPseudoIndexByName"), flags, 3)
        this.vtbl.GetPseudoIndexByNameWide := CallbackCreate(GetMethod(implObj, "GetPseudoIndexByNameWide"), flags, 3)
        this.vtbl.GetPseudoValues := CallbackCreate(GetMethod(implObj, "GetPseudoValues"), flags, 6)
        this.vtbl.SetPseudoValues := CallbackCreate(GetMethod(implObj, "SetPseudoValues"), flags, 6)
        this.vtbl.GetValues2 := CallbackCreate(GetMethod(implObj, "GetValues2"), flags, 6)
        this.vtbl.SetValues2 := CallbackCreate(GetMethod(implObj, "SetValues2"), flags, 6)
        this.vtbl.OutputRegisters2 := CallbackCreate(GetMethod(implObj, "OutputRegisters2"), flags, 4)
        this.vtbl.GetInstructionOffset2 := CallbackCreate(GetMethod(implObj, "GetInstructionOffset2"), flags, 3)
        this.vtbl.GetStackOffset2 := CallbackCreate(GetMethod(implObj, "GetStackOffset2"), flags, 3)
        this.vtbl.GetFrameOffset2 := CallbackCreate(GetMethod(implObj, "GetFrameOffset2"), flags, 3)
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
        CallbackFree(this.vtbl.GetDescriptionWide)
        CallbackFree(this.vtbl.GetIndexByNameWide)
        CallbackFree(this.vtbl.GetNumberPseudoRegisters)
        CallbackFree(this.vtbl.GetPseudoDescription)
        CallbackFree(this.vtbl.GetPseudoDescriptionWide)
        CallbackFree(this.vtbl.GetPseudoIndexByName)
        CallbackFree(this.vtbl.GetPseudoIndexByNameWide)
        CallbackFree(this.vtbl.GetPseudoValues)
        CallbackFree(this.vtbl.SetPseudoValues)
        CallbackFree(this.vtbl.GetValues2)
        CallbackFree(this.vtbl.SetValues2)
        CallbackFree(this.vtbl.OutputRegisters2)
        CallbackFree(this.vtbl.GetInstructionOffset2)
        CallbackFree(this.vtbl.GetStackOffset2)
        CallbackFree(this.vtbl.GetFrameOffset2)
    }
}
