#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\DIDEVICESTATE.ahk" { DIDEVICESTATE }
#Import ".\DIDRIVERVERSIONS.ahk" { DIDRIVERVERSIONS }
#Import ".\DIEFFECT.ahk" { DIEFFECT }
#Import ".\DIEFFESCAPE.ahk" { DIEFFESCAPE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
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
     * @param {Integer} param0 Specifies the version number of DirectInput that loaded the effect driver. For example, with DirectInput 5.0, the value of this parameter is 0x00000500.
     * @param {Integer} param1 Specifies the joystick ID number. The Microsoft Windows joystick subsystem allocates external IDs.
     * @param {Integer} param2 Specifies the availability of the device. This value is nonzero if access to the device is beginning, and zero if access to the device is ending.
     * @param {Integer} param3 Specifies the ID of the internal joystick. The device driver manages internal IDs.
     * @param {Pointer<Void>} param4 Points to a <a href="https://docs.microsoft.com/windows/desktop/api/dinputd/ns-dinputd-dihidffinitinfo">DIHIDFFINITINFO</a> structure that contains initialization information for the force feedback driver. The driver uses this information to distinguish between multiple devices and to query DirectInput for any other device attributes.
     * @returns {HRESULT} Returns S_OK if successful; otherwise, returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/dinputd/nf-dinputd-idirectinputeffectdriver-deviceid
     */
    DeviceID(param0, param1, param2, param3, param4) {
        param4Marshal := param4 is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, UInt32, param0, UInt32, param1, UInt32, param2, UInt32, param3, param4Marshal, param4, "HRESULT")
        return result
    }

    /**
     * The IDirectInputEffectDriver::GetVersions method obtains version information about the force-feedback hardware and driver.
     * @param {Pointer<DIDRIVERVERSIONS>} param0 Points to a <a href="https://docs.microsoft.com/windows/desktop/api/dinputd/ns-dinputd-didriverversions">DIDRIVERVERSIONS</a> structure that should be filled in with version information describing the hardware, firmware, and driver. DirectInput sets the <b>dwSize</b> member of the DIDRIVERVERSIONS structure to <b>sizeof</b>(DIDRIVERVERSIONS) before calling this method.
     * @returns {HRESULT} Returns S_OK if successful; otherwise, returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/dinputd/nf-dinputd-idirectinputeffectdriver-getversions
     */
    GetVersions(param0) {
        result := ComCall(4, this, DIDRIVERVERSIONS.Ptr, param0, "HRESULT")
        return result
    }

    /**
     * The IDirectInputEffectDriver::Escape method escapes to the driver. This method is called in response to an application invoking the IDirectInputEffect::Escape or IDirectInputDevice::Escape methods.
     * @param {Integer} param0 Indicates the joystick ID number being used.
     * @param {Integer} param1 Specifies the effect at which the command is directed, or zero if the command is directed at the device itself and not any particular effect.
     * @param {Pointer<DIEFFESCAPE>} param2 Points to a <a href="https://docs.microsoft.com/windows/desktop/api/dinput/ns-dinput-dieffescape">DIEFFESCAPE</a> structure that describes the command to be sent. On success, the <b>cbOutBuffer</b> member contains the number of output buffer bytes actually used.
     * @returns {HRESULT} Returns S_OK if successful; otherwise, returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/dinputd/nf-dinputd-idirectinputeffectdriver-escape
     */
    Escape(param0, param1, param2) {
        result := ComCall(5, this, UInt32, param0, UInt32, param1, DIEFFESCAPE.Ptr, param2, "HRESULT")
        return result
    }

    /**
     * The IDirectInputEffectDriver::SetGain method sets the overall device gain.
     * @param {Integer} param0 Indicates the joystick ID number being used.
     * @param {Integer} param1 Specifies the new gain value (1 to 10,000).
     * @returns {HRESULT} Returns S_OK if successful; otherwise, returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/dinputd/nf-dinputd-idirectinputeffectdriver-setgain
     */
    SetGain(param0, param1) {
        result := ComCall(6, this, UInt32, param0, UInt32, param1, "HRESULT")
        return result
    }

    /**
     * The IDirectInputEffectDriver::SendForceFeedbackCommand method changes the force-feedback state for the device.
     * @param {Integer} param0 Indicates the external joystick number being addressed.
     * @param {Integer} param1 Indicates which of the following commands is being sent:
     * @returns {HRESULT} Returns S_OK if successful; otherwise, returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/dinputd/nf-dinputd-idirectinputeffectdriver-sendforcefeedbackcommand
     */
    SendForceFeedbackCommand(param0, param1) {
        result := ComCall(7, this, UInt32, param0, UInt32, param1, "HRESULT")
        return result
    }

    /**
     * The IDirectInputEffectDriver::GetForceFeedbackState method retrieves the force-feedback state for the device.
     * @param {Integer} param0 Indicates the external joystick number being addressed.
     * @param {Pointer<DIDEVICESTATE>} param1 Points to a <a href="https://docs.microsoft.com/windows/desktop/api/dinputd/ns-dinputd-didevicestate">DIDEVICESTATE</a> structure that receives the device state. DirectInput sets the <b>dwSize</b> member of the DIDEVICESTATE structure to <b>sizeof</b>(DIDEVICESTATE) before calling this method.
     * @returns {HRESULT} Returns S_OK if successful; otherwise, returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/dinputd/nf-dinputd-idirectinputeffectdriver-getforcefeedbackstate
     */
    GetForceFeedbackState(param0, param1) {
        result := ComCall(8, this, UInt32, param0, DIDEVICESTATE.Ptr, param1, "HRESULT")
        return result
    }

    /**
     * The IDirectInputEffectDriver::DownloadEffect method sends an effect to the device.
     * @param {Integer} param0 Specifies the external joystick number being addressed.
     * @param {Integer} param1 Specifies the <b>dwEffectId</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/dinputd/ns-dinputd-dieffectattributes">DIEFFECTATTRIBUTES</a> structure associated with the effect the application is attempting to create. The DIEFFECTATTRIBUTES structure is stored in the registry under the corresponding effect registry key and can be any 32-bit value. DirectInput passes the 32-bit value to the driver with no interpretation.
     * @param {Pointer<Integer>} param2 On entry, this parameter is a pointer to the handle of the effect being downloaded. If this parameter points to a zero, then a new effect is downloaded. On exit, this parameter is a pointer to a <b>DWORD </b> that contains the new effect handle. On failure, the <b>DWORD</b> pointed to by this parameter is set to zero if the effect is lost, or left alone if the effect is still valid with its old parameters. Note that zero is never a valid effect handle.
     * @param {Pointer<DIEFFECT>} param3 Points to a DIEFFECT structure that describes the new effect. The axis and button values have been converted to object identifiers, which consist of the following:
     * @param {Integer} param4 Specifies which portions of the effect information have changed from the effect already applied to the device. This information is passed to drivers to allow for the optimization of effect modification. If an effect is being modified, a driver may be able to update the effect in its original position and transmit to the device only the information that has changed. Drivers are not, however, required to implement this optimization. All members in the DIEFFECT structure pointed to by the <i>peff</i> parameter are valid, and a driver may choose simply to update all parameters of the effect at each download. (For information about the DIEFFECT structure, see the DirectInput section of the stand alone DirectX SDK.) 
     * 
     * This parameter can be zero, one, or more of the following:
     * @returns {HRESULT} Returns S_OK if successful, or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/dinputd/nf-dinputd-idirectinputeffectdriver-downloadeffect
     */
    DownloadEffect(param0, param1, param2, param3, param4) {
        param2Marshal := param2 is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, UInt32, param0, UInt32, param1, param2Marshal, param2, DIEFFECT.Ptr, param3, UInt32, param4, "HRESULT")
        return result
    }

    /**
     * The IDirectInputEffectDriver::DestroyEffect method removes an effect from the device. If the effect is playing, the driver should stop it before unloading it.
     * @param {Integer} param0 Specifies the external joystick number being addressed.
     * @param {Integer} param1 Specifies the effect to be destroyed.
     * @returns {HRESULT} Returns S_OK if successful; otherwise, returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/dinputd/nf-dinputd-idirectinputeffectdriver-destroyeffect
     */
    DestroyEffect(param0, param1) {
        result := ComCall(10, this, UInt32, param0, UInt32, param1, "HRESULT")
        return result
    }

    /**
     * The IDirectInputEffectDriver::StartEffect method begins the playback of an effect. If the effect is already playing, it is restarted from the beginning.
     * @param {Integer} param0 Identifies the external joystick number being addressed
     * @param {Integer} param1 Specifies the effect to be played.
     * @param {Integer} param2 Specifies how the effect is to affect other effects. Only the mode listed below can be used; all other modes are reserved. For example, the driver never receives the DIES_NODOWNLOAD flag because it is managed by DirectInput and not the driver.  This parameter can be zero, one, or more of the following flags:
     * @param {Integer} param3 Specifies the number of times to perform the effect. If the value is INFINITE, then the effect should be repeated until explicitly stopped or paused.
     * @returns {HRESULT} Returns S_OK if successful; otherwise, returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/dinputd/nf-dinputd-idirectinputeffectdriver-starteffect
     */
    StartEffect(param0, param1, param2, param3) {
        result := ComCall(11, this, UInt32, param0, UInt32, param1, UInt32, param2, UInt32, param3, "HRESULT")
        return result
    }

    /**
     * The IDirectInputEffectDriver::StopEffect method halts the playback of an effect.
     * @param {Integer} param0 Indicates the external joystick number being addressed.
     * @param {Integer} param1 Specifies the effect to be stopped.
     * @returns {HRESULT} Returns S_OK if successful; otherwise, returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/dinputd/nf-dinputd-idirectinputeffectdriver-stopeffect
     */
    StopEffect(param0, param1) {
        result := ComCall(12, this, UInt32, param0, UInt32, param1, "HRESULT")
        return result
    }

    /**
     * The IDirectInputEffectDriver::GetEffectStatus method obtains information about the status of an effect.
     * @param {Integer} param0 Indicates the external joystick number being addressed.
     * @param {Integer} param1 Specifies the effect to be queried.
     * @param {Pointer<Integer>} param2 
     * @returns {HRESULT} Returns S_OK if successful; otherwise, returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/dinputd/nf-dinputd-idirectinputeffectdriver-geteffectstatus
     */
    GetEffectStatus(param0, param1, param2) {
        param2Marshal := param2 is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, UInt32, param0, UInt32, param1, param2Marshal, param2, "HRESULT")
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
