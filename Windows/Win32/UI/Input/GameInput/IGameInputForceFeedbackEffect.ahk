#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IGameInputDevice.ahk" { IGameInputDevice }
#Import ".\GameInputForceFeedbackParams.ahk" { GameInputForceFeedbackParams }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\GameInputFeedbackEffectState.ahk" { GameInputFeedbackEffectState }

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
export default struct IGameInputForceFeedbackEffect extends IUnknown {
    /**
     * The interface identifier for IGameInputForceFeedbackEffect
     * @type {Guid}
     */
    static IID := Guid("{51bda05e-f742-45d9-b085-9444ae48381d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IGameInputForceFeedbackEffect interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetDevice     : IntPtr
        GetMotorIndex : IntPtr
        GetGain       : IntPtr
        SetGain       : IntPtr
        GetParams     : IntPtr
        SetParams     : IntPtr
        GetState      : IntPtr
        SetState      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IGameInputForceFeedbackEffect.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<IGameInputDevice>} device 
     * @returns {String} Nothing - always returns an empty string
     */
    GetDevice(device) {
        ComCall(3, this, IGameInputDevice.Ptr, device)
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetMotorIndex() {
        result := ComCall(4, this, UInt32)
        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    GetGain() {
        result := ComCall(5, this, Float32)
        return result
    }

    /**
     * 
     * @param {Float} gain 
     * @returns {String} Nothing - always returns an empty string
     */
    SetGain(gain) {
        ComCall(6, this, "float", gain)
    }

    /**
     * 
     * @param {Pointer<GameInputForceFeedbackParams>} params 
     * @returns {String} Nothing - always returns an empty string
     */
    GetParams(params) {
        ComCall(7, this, GameInputForceFeedbackParams.Ptr, params)
    }

    /**
     * 
     * @param {Pointer<GameInputForceFeedbackParams>} params 
     * @returns {Boolean} 
     */
    SetParams(params) {
        result := ComCall(8, this, GameInputForceFeedbackParams.Ptr, params, Int32)
        return result
    }

    /**
     * 
     * @returns {GameInputFeedbackEffectState} 
     */
    GetState() {
        result := ComCall(9, this, GameInputFeedbackEffectState)
        return result
    }

    /**
     * 
     * @param {GameInputFeedbackEffectState} state 
     * @returns {String} Nothing - always returns an empty string
     */
    SetState(state) {
        ComCall(10, this, GameInputFeedbackEffectState, state)
    }

    Query(iid) {
        if (IGameInputForceFeedbackEffect.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDevice := CallbackCreate(GetMethod(implObj, "GetDevice"), flags, 2)
        this.vtbl.GetMotorIndex := CallbackCreate(GetMethod(implObj, "GetMotorIndex"), flags, 1)
        this.vtbl.GetGain := CallbackCreate(GetMethod(implObj, "GetGain"), flags, 1)
        this.vtbl.SetGain := CallbackCreate(GetMethod(implObj, "SetGain"), flags, 2)
        this.vtbl.GetParams := CallbackCreate(GetMethod(implObj, "GetParams"), flags, 2)
        this.vtbl.SetParams := CallbackCreate(GetMethod(implObj, "SetParams"), flags, 2)
        this.vtbl.GetState := CallbackCreate(GetMethod(implObj, "GetState"), flags, 1)
        this.vtbl.SetState := CallbackCreate(GetMethod(implObj, "SetState"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDevice)
        CallbackFree(this.vtbl.GetMotorIndex)
        CallbackFree(this.vtbl.GetGain)
        CallbackFree(this.vtbl.SetGain)
        CallbackFree(this.vtbl.GetParams)
        CallbackFree(this.vtbl.SetParams)
        CallbackFree(this.vtbl.GetState)
        CallbackFree(this.vtbl.SetState)
    }
}
