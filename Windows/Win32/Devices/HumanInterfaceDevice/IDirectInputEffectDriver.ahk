#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\DIEFFECT.ahk" { DIEFFECT }
#Import ".\DIDRIVERVERSIONS.ahk" { DIDRIVERVERSIONS }
#Import ".\DIDEVICESTATE.ahk" { DIDEVICESTATE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DIEFFESCAPE.ahk" { DIEFFESCAPE }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * These three methods allow additional interfaces to be added to the DirectInputEffectDriver object without affecting the functionality of the original interface.
 * @see https://learn.microsoft.com/windows/win32/api/dinputd/nn-dinputd-idirectinputeffectdriver
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 */
export default struct IDirectInputEffectDriver extends IUnknown {
    /**
     * The interface identifier for IDirectInputEffectDriver
     * @type {Guid}
     */
    static IID := Guid("{02538130-898f-11d0-9ad0-00a0c9a06e35}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDirectInputEffectDriver interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        DeviceID                 : IntPtr
        GetVersions              : IntPtr
        Escape                   : IntPtr
        SetGain                  : IntPtr
        SendForceFeedbackCommand : IntPtr
        GetForceFeedbackState    : IntPtr
        DownloadEffect           : IntPtr
        DestroyEffect            : IntPtr
        StartEffect              : IntPtr
        StopEffect               : IntPtr
        GetEffectStatus          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDirectInputEffectDriver.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The IDirectInputEffectDriver::DeviceID method sends the driver the identity of the device.
     * @remarks
     * As an example of the <b>IDirectInputEffectDriver::DeviceID </b> method, if a device driver is passed <i>dwExternalID</i> = 2 and <i>dwInternalId</i> = 1, then unit 1 on the device corresponds to the joystick whose ID is 2.
     * @param {Integer} param0 
     * @param {Integer} param1 
     * @param {Integer} param2 
     * @param {Integer} param3 
     * @param {Pointer<Void>} param4 
     * @returns {HRESULT} Returns S_OK if successful; otherwise, returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/dinputd/nf-dinputd-idirectinputeffectdriver-deviceid
     */
    DeviceID(param0, param1, param2, param3, param4) {
        param4Marshal := param4 is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "uint", param0, "uint", param1, "uint", param2, "uint", param3, param4Marshal, param4, "HRESULT")
        return result
    }

    /**
     * The IDirectInputEffectDriver::GetVersions method obtains version information about the force-feedback hardware and driver.
     * @param {Pointer<DIDRIVERVERSIONS>} param0 
     * @returns {HRESULT} Returns S_OK if successful; otherwise, returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/dinputd/nf-dinputd-idirectinputeffectdriver-getversions
     */
    GetVersions(param0) {
        result := ComCall(4, this, DIDRIVERVERSIONS.Ptr, param0, "HRESULT")
        return result
    }

    /**
     * The IDirectInputEffectDriver::Escape method escapes to the driver. This method is called in response to an application invoking the IDirectInputEffect::Escape or IDirectInputDevice::Escape methods.
     * @param {Integer} param0 
     * @param {Integer} param1 
     * @param {Pointer<DIEFFESCAPE>} param2 
     * @returns {HRESULT} Returns S_OK if successful; otherwise, returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/dinputd/nf-dinputd-idirectinputeffectdriver-escape
     */
    Escape(param0, param1, param2) {
        result := ComCall(5, this, "uint", param0, "uint", param1, DIEFFESCAPE.Ptr, param2, "HRESULT")
        return result
    }

    /**
     * The IDirectInputEffectDriver::SetGain method sets the overall device gain.
     * @param {Integer} param0 
     * @param {Integer} param1 
     * @returns {HRESULT} Returns S_OK if successful; otherwise, returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/dinputd/nf-dinputd-idirectinputeffectdriver-setgain
     */
    SetGain(param0, param1) {
        result := ComCall(6, this, "uint", param0, "uint", param1, "HRESULT")
        return result
    }

    /**
     * The IDirectInputEffectDriver::SendForceFeedbackCommand method changes the force-feedback state for the device.
     * @param {Integer} param0 
     * @param {Integer} param1 
     * @returns {HRESULT} Returns S_OK if successful; otherwise, returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/dinputd/nf-dinputd-idirectinputeffectdriver-sendforcefeedbackcommand
     */
    SendForceFeedbackCommand(param0, param1) {
        result := ComCall(7, this, "uint", param0, "uint", param1, "HRESULT")
        return result
    }

    /**
     * The IDirectInputEffectDriver::GetForceFeedbackState method retrieves the force-feedback state for the device.
     * @param {Integer} param0 
     * @param {Pointer<DIDEVICESTATE>} param1 
     * @returns {HRESULT} Returns S_OK if successful; otherwise, returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/dinputd/nf-dinputd-idirectinputeffectdriver-getforcefeedbackstate
     */
    GetForceFeedbackState(param0, param1) {
        result := ComCall(8, this, "uint", param0, DIDEVICESTATE.Ptr, param1, "HRESULT")
        return result
    }

    /**
     * The IDirectInputEffectDriver::DownloadEffect method sends an effect to the device.
     * @param {Integer} param0 
     * @param {Integer} param1 
     * @param {Pointer<Integer>} param2 
     * @param {Pointer<DIEFFECT>} param3 
     * @param {Integer} param4 
     * @returns {HRESULT} Returns S_OK if successful, or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/dinputd/nf-dinputd-idirectinputeffectdriver-downloadeffect
     */
    DownloadEffect(param0, param1, param2, param3, param4) {
        param2Marshal := param2 is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, "uint", param0, "uint", param1, param2Marshal, param2, DIEFFECT.Ptr, param3, "uint", param4, "HRESULT")
        return result
    }

    /**
     * The IDirectInputEffectDriver::DestroyEffect method removes an effect from the device. If the effect is playing, the driver should stop it before unloading it.
     * @param {Integer} param0 
     * @param {Integer} param1 
     * @returns {HRESULT} Returns S_OK if successful; otherwise, returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/dinputd/nf-dinputd-idirectinputeffectdriver-destroyeffect
     */
    DestroyEffect(param0, param1) {
        result := ComCall(10, this, "uint", param0, "uint", param1, "HRESULT")
        return result
    }

    /**
     * The IDirectInputEffectDriver::StartEffect method begins the playback of an effect. If the effect is already playing, it is restarted from the beginning.
     * @param {Integer} param0 
     * @param {Integer} param1 
     * @param {Integer} param2 
     * @param {Integer} param3 
     * @returns {HRESULT} Returns S_OK if successful; otherwise, returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/dinputd/nf-dinputd-idirectinputeffectdriver-starteffect
     */
    StartEffect(param0, param1, param2, param3) {
        result := ComCall(11, this, "uint", param0, "uint", param1, "uint", param2, "uint", param3, "HRESULT")
        return result
    }

    /**
     * The IDirectInputEffectDriver::StopEffect method halts the playback of an effect.
     * @param {Integer} param0 
     * @param {Integer} param1 
     * @returns {HRESULT} Returns S_OK if successful; otherwise, returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/dinputd/nf-dinputd-idirectinputeffectdriver-stopeffect
     */
    StopEffect(param0, param1) {
        result := ComCall(12, this, "uint", param0, "uint", param1, "HRESULT")
        return result
    }

    /**
     * The IDirectInputEffectDriver::GetEffectStatus method obtains information about the status of an effect.
     * @param {Integer} param0 
     * @param {Integer} param1 
     * @param {Pointer<Integer>} param2 
     * @returns {HRESULT} Returns S_OK if successful; otherwise, returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/dinputd/nf-dinputd-idirectinputeffectdriver-geteffectstatus
     */
    GetEffectStatus(param0, param1, param2) {
        param2Marshal := param2 is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, "uint", param0, "uint", param1, param2Marshal, param2, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDirectInputEffectDriver.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.DeviceID := CallbackCreate(GetMethod(implObj, "DeviceID"), flags, 6)
        this.vtbl.GetVersions := CallbackCreate(GetMethod(implObj, "GetVersions"), flags, 2)
        this.vtbl.Escape := CallbackCreate(GetMethod(implObj, "Escape"), flags, 4)
        this.vtbl.SetGain := CallbackCreate(GetMethod(implObj, "SetGain"), flags, 3)
        this.vtbl.SendForceFeedbackCommand := CallbackCreate(GetMethod(implObj, "SendForceFeedbackCommand"), flags, 3)
        this.vtbl.GetForceFeedbackState := CallbackCreate(GetMethod(implObj, "GetForceFeedbackState"), flags, 3)
        this.vtbl.DownloadEffect := CallbackCreate(GetMethod(implObj, "DownloadEffect"), flags, 6)
        this.vtbl.DestroyEffect := CallbackCreate(GetMethod(implObj, "DestroyEffect"), flags, 3)
        this.vtbl.StartEffect := CallbackCreate(GetMethod(implObj, "StartEffect"), flags, 5)
        this.vtbl.StopEffect := CallbackCreate(GetMethod(implObj, "StopEffect"), flags, 3)
        this.vtbl.GetEffectStatus := CallbackCreate(GetMethod(implObj, "GetEffectStatus"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.DeviceID)
        CallbackFree(this.vtbl.GetVersions)
        CallbackFree(this.vtbl.Escape)
        CallbackFree(this.vtbl.SetGain)
        CallbackFree(this.vtbl.SendForceFeedbackCommand)
        CallbackFree(this.vtbl.GetForceFeedbackState)
        CallbackFree(this.vtbl.DownloadEffect)
        CallbackFree(this.vtbl.DestroyEffect)
        CallbackFree(this.vtbl.StartEffect)
        CallbackFree(this.vtbl.StopEffect)
        CallbackFree(this.vtbl.GetEffectStatus)
    }
}
