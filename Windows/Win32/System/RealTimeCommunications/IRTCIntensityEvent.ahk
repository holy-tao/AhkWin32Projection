#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\RTC_AUDIO_DEVICE.ahk" { RTC_AUDIO_DEVICE }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 */
export default struct IRTCIntensityEvent extends IDispatch {
    /**
     * The interface identifier for IRTCIntensityEvent
     * @type {Guid}
     */
    static IID := Guid("{4c23bf51-390c-4992-a41d-41eec05b2a4b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRTCIntensityEvent interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Level     : IntPtr
        get_Min       : IntPtr
        get_Max       : IntPtr
        get_Direction : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRTCIntensityEvent.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    Level {
        get => this.get_Level()
    }

    /**
     * @type {Integer} 
     */
    Min {
        get => this.get_Min()
    }

    /**
     * @type {Integer} 
     */
    Max {
        get => this.get_Max()
    }

    /**
     * @type {RTC_AUDIO_DEVICE} 
     */
    Direction {
        get => this.get_Direction()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Level() {
        result := ComCall(7, this, "int*", &plLevel := 0, "HRESULT")
        return plLevel
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Min() {
        result := ComCall(8, this, "int*", &plMin := 0, "HRESULT")
        return plMin
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Max() {
        result := ComCall(9, this, "int*", &plMax := 0, "HRESULT")
        return plMax
    }

    /**
     * 
     * @returns {RTC_AUDIO_DEVICE} 
     */
    get_Direction() {
        result := ComCall(10, this, "int*", &penDirection := 0, "HRESULT")
        return penDirection
    }

    Query(iid) {
        if (IRTCIntensityEvent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Level := CallbackCreate(GetMethod(implObj, "get_Level"), flags, 2)
        this.vtbl.get_Min := CallbackCreate(GetMethod(implObj, "get_Min"), flags, 2)
        this.vtbl.get_Max := CallbackCreate(GetMethod(implObj, "get_Max"), flags, 2)
        this.vtbl.get_Direction := CallbackCreate(GetMethod(implObj, "get_Direction"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Level)
        CallbackFree(this.vtbl.get_Min)
        CallbackFree(this.vtbl.get_Max)
        CallbackFree(this.vtbl.get_Direction)
    }
}
