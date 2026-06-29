#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IBaseVideoMixer extends IUnknown {
    /**
     * The interface identifier for IBaseVideoMixer
     * @type {Guid}
     */
    static IID := Guid("{61ded640-e912-11ce-a099-00aa00479a58}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IBaseVideoMixer interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetLeadPin       : IntPtr
        GetLeadPin       : IntPtr
        GetInputPinCount : IntPtr
        IsUsingClock     : IntPtr
        SetUsingClock    : IntPtr
        GetClockPeriod   : IntPtr
        SetClockPeriod   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IBaseVideoMixer.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} _iPin 
     * @returns {HRESULT} 
     */
    SetLeadPin(_iPin) {
        result := ComCall(3, this, "int", _iPin, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetLeadPin() {
        result := ComCall(4, this, "int*", &piPin := 0, "HRESULT")
        return piPin
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetInputPinCount() {
        result := ComCall(5, this, "int*", &piPinCount := 0, "HRESULT")
        return piPinCount
    }

    /**
     * 
     * @returns {Integer} 
     */
    IsUsingClock() {
        result := ComCall(6, this, "int*", &pbValue := 0, "HRESULT")
        return pbValue
    }

    /**
     * 
     * @param {Integer} bValue 
     * @returns {HRESULT} 
     */
    SetUsingClock(bValue) {
        result := ComCall(7, this, "int", bValue, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetClockPeriod() {
        result := ComCall(8, this, "int*", &pbValue := 0, "HRESULT")
        return pbValue
    }

    /**
     * 
     * @param {Integer} bValue 
     * @returns {HRESULT} 
     */
    SetClockPeriod(bValue) {
        result := ComCall(9, this, "int", bValue, "HRESULT")
        return result
    }

    Query(iid) {
        if (IBaseVideoMixer.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetLeadPin := CallbackCreate(GetMethod(implObj, "SetLeadPin"), flags, 2)
        this.vtbl.GetLeadPin := CallbackCreate(GetMethod(implObj, "GetLeadPin"), flags, 2)
        this.vtbl.GetInputPinCount := CallbackCreate(GetMethod(implObj, "GetInputPinCount"), flags, 2)
        this.vtbl.IsUsingClock := CallbackCreate(GetMethod(implObj, "IsUsingClock"), flags, 2)
        this.vtbl.SetUsingClock := CallbackCreate(GetMethod(implObj, "SetUsingClock"), flags, 2)
        this.vtbl.GetClockPeriod := CallbackCreate(GetMethod(implObj, "GetClockPeriod"), flags, 2)
        this.vtbl.SetClockPeriod := CallbackCreate(GetMethod(implObj, "SetClockPeriod"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetLeadPin)
        CallbackFree(this.vtbl.GetLeadPin)
        CallbackFree(this.vtbl.GetInputPinCount)
        CallbackFree(this.vtbl.IsUsingClock)
        CallbackFree(this.vtbl.SetUsingClock)
        CallbackFree(this.vtbl.GetClockPeriod)
        CallbackFree(this.vtbl.SetClockPeriod)
    }
}
