#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\GameInputRumbleParams.ahk" { GameInputRumbleParams }
#Import ".\GameInputBatteryState.ahk" { GameInputBatteryState }
#Import ".\GameInputForceFeedbackParams.ahk" { GameInputForceFeedbackParams }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IGameInputForceFeedbackEffect.ahk" { IGameInputForceFeedbackEffect }
#Import ".\IGameInputRawDeviceReport.ahk" { IGameInputRawDeviceReport }
#Import ".\GameInputRawDeviceReportKind.ahk" { GameInputRawDeviceReportKind }
#Import ".\GameInputHapticFeedbackParams.ahk" { GameInputHapticFeedbackParams }
#Import ".\GameInputDeviceInfo.ahk" { GameInputDeviceInfo }
#Import ".\GameInputDeviceStatus.ahk" { GameInputDeviceStatus }

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
export default struct IGameInputDevice extends IUnknown {
    /**
     * The interface identifier for IGameInputDevice
     * @type {Guid}
     */
    static IID := Guid("{31dd86fb-4c1b-408a-868f-439b3cd47125}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IGameInputDevice interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetDeviceInfo                   : IntPtr
        GetDeviceStatus                 : IntPtr
        GetBatteryState                 : IntPtr
        CreateForceFeedbackEffect       : IntPtr
        IsForceFeedbackMotorPoweredOn   : IntPtr
        SetForceFeedbackMotorGain       : IntPtr
        SetHapticMotorState             : IntPtr
        SetRumbleState                  : IntPtr
        SetInputSynchronizationState    : IntPtr
        SendInputSynchronizationHint    : IntPtr
        PowerOff                        : IntPtr
        CreateRawDeviceReport           : IntPtr
        GetRawDeviceFeature             : IntPtr
        SetRawDeviceFeature             : IntPtr
        SendRawDeviceOutput             : IntPtr
        SendRawDeviceOutputWithResponse : IntPtr
        ExecuteRawDeviceIoControl       : IntPtr
        AcquireExclusiveRawDeviceAccess : IntPtr
        ReleaseExclusiveRawDeviceAccess : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IGameInputDevice.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {Pointer<GameInputDeviceInfo>} 
     */
    GetDeviceInfo() {
        result := ComCall(3, this, GameInputDeviceInfo.Ptr)
        return result
    }

    /**
     * 
     * @returns {GameInputDeviceStatus} 
     */
    GetDeviceStatus() {
        result := ComCall(4, this, GameInputDeviceStatus)
        return result
    }

    /**
     * 
     * @param {Pointer<GameInputBatteryState>} state 
     * @returns {String} Nothing - always returns an empty string
     */
    GetBatteryState(state) {
        ComCall(5, this, GameInputBatteryState.Ptr, state)
    }

    /**
     * 
     * @param {Integer} motorIndex 
     * @param {Pointer<GameInputForceFeedbackParams>} params 
     * @returns {IGameInputForceFeedbackEffect} 
     */
    CreateForceFeedbackEffect(motorIndex, params) {
        result := ComCall(6, this, "uint", motorIndex, GameInputForceFeedbackParams.Ptr, params, "ptr*", &_effect := 0, "HRESULT")
        return IGameInputForceFeedbackEffect(_effect)
    }

    /**
     * 
     * @param {Integer} motorIndex 
     * @returns {Boolean} 
     */
    IsForceFeedbackMotorPoweredOn(motorIndex) {
        result := ComCall(7, this, "uint", motorIndex, Int32)
        return result
    }

    /**
     * 
     * @param {Integer} motorIndex 
     * @param {Float} masterGain 
     * @returns {String} Nothing - always returns an empty string
     */
    SetForceFeedbackMotorGain(motorIndex, masterGain) {
        ComCall(8, this, "uint", motorIndex, "float", masterGain)
    }

    /**
     * 
     * @param {Integer} motorIndex 
     * @param {Pointer<GameInputHapticFeedbackParams>} params 
     * @returns {HRESULT} 
     */
    SetHapticMotorState(motorIndex, params) {
        result := ComCall(9, this, "uint", motorIndex, GameInputHapticFeedbackParams.Ptr, params, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<GameInputRumbleParams>} params 
     * @returns {String} Nothing - always returns an empty string
     */
    SetRumbleState(params) {
        ComCall(10, this, GameInputRumbleParams.Ptr, params)
    }

    /**
     * 
     * @param {Integer} enabled 
     * @returns {String} Nothing - always returns an empty string
     */
    SetInputSynchronizationState(enabled) {
        ComCall(11, this, "char", enabled)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    SendInputSynchronizationHint() {
        ComCall(12, this)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    PowerOff() {
        ComCall(13, this)
    }

    /**
     * 
     * @param {Integer} reportId 
     * @param {GameInputRawDeviceReportKind} reportKind 
     * @returns {IGameInputRawDeviceReport} 
     */
    CreateRawDeviceReport(reportId, reportKind) {
        result := ComCall(14, this, "uint", reportId, GameInputRawDeviceReportKind, reportKind, "ptr*", &report := 0, "HRESULT")
        return IGameInputRawDeviceReport(report)
    }

    /**
     * 
     * @param {Integer} reportId 
     * @returns {IGameInputRawDeviceReport} 
     */
    GetRawDeviceFeature(reportId) {
        result := ComCall(15, this, "uint", reportId, "ptr*", &report := 0, "HRESULT")
        return IGameInputRawDeviceReport(report)
    }

    /**
     * 
     * @param {IGameInputRawDeviceReport} report 
     * @returns {HRESULT} 
     */
    SetRawDeviceFeature(report) {
        result := ComCall(16, this, "ptr", report, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IGameInputRawDeviceReport} report 
     * @returns {HRESULT} 
     */
    SendRawDeviceOutput(report) {
        result := ComCall(17, this, "ptr", report, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IGameInputRawDeviceReport} requestReport 
     * @returns {IGameInputRawDeviceReport} 
     */
    SendRawDeviceOutputWithResponse(requestReport) {
        result := ComCall(18, this, "ptr", requestReport, "ptr*", &responseReport := 0, "HRESULT")
        return IGameInputRawDeviceReport(responseReport)
    }

    /**
     * 
     * @param {Integer} controlCode 
     * @param {Pointer} inputBufferSize 
     * @param {Integer} inputBuffer 
     * @param {Pointer} outputBufferSize 
     * @param {Integer} outputBuffer 
     * @returns {Pointer} 
     */
    ExecuteRawDeviceIoControl(controlCode, inputBufferSize, inputBuffer, outputBufferSize, outputBuffer) {
        result := ComCall(19, this, "uint", controlCode, "ptr", inputBufferSize, "ptr", inputBuffer, "ptr", outputBufferSize, "ptr", outputBuffer, "ptr*", &outputSize := 0, "HRESULT")
        return outputSize
    }

    /**
     * 
     * @param {Integer} timeoutInMicroseconds 
     * @returns {Boolean} 
     */
    AcquireExclusiveRawDeviceAccess(timeoutInMicroseconds) {
        result := ComCall(20, this, "uint", timeoutInMicroseconds, Int32)
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    ReleaseExclusiveRawDeviceAccess() {
        ComCall(21, this)
    }

    Query(iid) {
        if (IGameInputDevice.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDeviceInfo := CallbackCreate(GetMethod(implObj, "GetDeviceInfo"), flags, 1)
        this.vtbl.GetDeviceStatus := CallbackCreate(GetMethod(implObj, "GetDeviceStatus"), flags, 1)
        this.vtbl.GetBatteryState := CallbackCreate(GetMethod(implObj, "GetBatteryState"), flags, 2)
        this.vtbl.CreateForceFeedbackEffect := CallbackCreate(GetMethod(implObj, "CreateForceFeedbackEffect"), flags, 4)
        this.vtbl.IsForceFeedbackMotorPoweredOn := CallbackCreate(GetMethod(implObj, "IsForceFeedbackMotorPoweredOn"), flags, 2)
        this.vtbl.SetForceFeedbackMotorGain := CallbackCreate(GetMethod(implObj, "SetForceFeedbackMotorGain"), flags, 3)
        this.vtbl.SetHapticMotorState := CallbackCreate(GetMethod(implObj, "SetHapticMotorState"), flags, 3)
        this.vtbl.SetRumbleState := CallbackCreate(GetMethod(implObj, "SetRumbleState"), flags, 2)
        this.vtbl.SetInputSynchronizationState := CallbackCreate(GetMethod(implObj, "SetInputSynchronizationState"), flags, 2)
        this.vtbl.SendInputSynchronizationHint := CallbackCreate(GetMethod(implObj, "SendInputSynchronizationHint"), flags, 1)
        this.vtbl.PowerOff := CallbackCreate(GetMethod(implObj, "PowerOff"), flags, 1)
        this.vtbl.CreateRawDeviceReport := CallbackCreate(GetMethod(implObj, "CreateRawDeviceReport"), flags, 4)
        this.vtbl.GetRawDeviceFeature := CallbackCreate(GetMethod(implObj, "GetRawDeviceFeature"), flags, 3)
        this.vtbl.SetRawDeviceFeature := CallbackCreate(GetMethod(implObj, "SetRawDeviceFeature"), flags, 2)
        this.vtbl.SendRawDeviceOutput := CallbackCreate(GetMethod(implObj, "SendRawDeviceOutput"), flags, 2)
        this.vtbl.SendRawDeviceOutputWithResponse := CallbackCreate(GetMethod(implObj, "SendRawDeviceOutputWithResponse"), flags, 3)
        this.vtbl.ExecuteRawDeviceIoControl := CallbackCreate(GetMethod(implObj, "ExecuteRawDeviceIoControl"), flags, 7)
        this.vtbl.AcquireExclusiveRawDeviceAccess := CallbackCreate(GetMethod(implObj, "AcquireExclusiveRawDeviceAccess"), flags, 2)
        this.vtbl.ReleaseExclusiveRawDeviceAccess := CallbackCreate(GetMethod(implObj, "ReleaseExclusiveRawDeviceAccess"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDeviceInfo)
        CallbackFree(this.vtbl.GetDeviceStatus)
        CallbackFree(this.vtbl.GetBatteryState)
        CallbackFree(this.vtbl.CreateForceFeedbackEffect)
        CallbackFree(this.vtbl.IsForceFeedbackMotorPoweredOn)
        CallbackFree(this.vtbl.SetForceFeedbackMotorGain)
        CallbackFree(this.vtbl.SetHapticMotorState)
        CallbackFree(this.vtbl.SetRumbleState)
        CallbackFree(this.vtbl.SetInputSynchronizationState)
        CallbackFree(this.vtbl.SendInputSynchronizationHint)
        CallbackFree(this.vtbl.PowerOff)
        CallbackFree(this.vtbl.CreateRawDeviceReport)
        CallbackFree(this.vtbl.GetRawDeviceFeature)
        CallbackFree(this.vtbl.SetRawDeviceFeature)
        CallbackFree(this.vtbl.SendRawDeviceOutput)
        CallbackFree(this.vtbl.SendRawDeviceOutputWithResponse)
        CallbackFree(this.vtbl.ExecuteRawDeviceIoControl)
        CallbackFree(this.vtbl.AcquireExclusiveRawDeviceAccess)
        CallbackFree(this.vtbl.ReleaseExclusiveRawDeviceAccess)
    }
}
