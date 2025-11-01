#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 * @version v4.0.30319
 */
class IGameInputDevice extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGameInputDevice
     * @type {Guid}
     */
    static IID => Guid("{31dd86fb-4c1b-408a-868f-439b3cd47125}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDeviceInfo", "GetDeviceStatus", "GetBatteryState", "CreateForceFeedbackEffect", "IsForceFeedbackMotorPoweredOn", "SetForceFeedbackMotorGain", "SetHapticMotorState", "SetRumbleState", "SetInputSynchronizationState", "SendInputSynchronizationHint", "PowerOff", "CreateRawDeviceReport", "GetRawDeviceFeature", "SetRawDeviceFeature", "SendRawDeviceOutput", "SendRawDeviceOutputWithResponse", "ExecuteRawDeviceIoControl", "AcquireExclusiveRawDeviceAccess", "ReleaseExclusiveRawDeviceAccess"]

    /**
     * 
     * @returns {Pointer<GameInputDeviceInfo>} 
     */
    GetDeviceInfo() {
        result := ComCall(3, this, "ptr")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetDeviceStatus() {
        result := ComCall(4, this, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<GameInputBatteryState>} state 
     * @returns {String} Nothing - always returns an empty string
     */
    GetBatteryState(state) {
        ComCall(5, this, "ptr", state)
    }

    /**
     * 
     * @param {Integer} motorIndex 
     * @param {Pointer<GameInputForceFeedbackParams>} params 
     * @param {Pointer<IGameInputForceFeedbackEffect>} effect 
     * @returns {HRESULT} 
     */
    CreateForceFeedbackEffect(motorIndex, params, effect) {
        result := ComCall(6, this, "uint", motorIndex, "ptr", params, "ptr*", effect, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} motorIndex 
     * @returns {Boolean} 
     */
    IsForceFeedbackMotorPoweredOn(motorIndex) {
        result := ComCall(7, this, "uint", motorIndex, "int")
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
        result := ComCall(9, this, "uint", motorIndex, "ptr", params, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<GameInputRumbleParams>} params 
     * @returns {String} Nothing - always returns an empty string
     */
    SetRumbleState(params) {
        ComCall(10, this, "ptr", params)
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
     * @param {Integer} reportKind 
     * @param {Pointer<IGameInputRawDeviceReport>} report 
     * @returns {HRESULT} 
     */
    CreateRawDeviceReport(reportId, reportKind, report) {
        result := ComCall(14, this, "uint", reportId, "int", reportKind, "ptr*", report, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} reportId 
     * @param {Pointer<IGameInputRawDeviceReport>} report 
     * @returns {HRESULT} 
     */
    GetRawDeviceFeature(reportId, report) {
        result := ComCall(15, this, "uint", reportId, "ptr*", report, "HRESULT")
        return result
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
     * @param {Pointer<IGameInputRawDeviceReport>} responseReport 
     * @returns {HRESULT} 
     */
    SendRawDeviceOutputWithResponse(requestReport, responseReport) {
        result := ComCall(18, this, "ptr", requestReport, "ptr*", responseReport, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} controlCode 
     * @param {Pointer} inputBufferSize 
     * @param {Pointer} inputBuffer 
     * @param {Pointer} outputBufferSize 
     * @param {Pointer} outputBuffer 
     * @param {Pointer<Pointer>} outputSize 
     * @returns {HRESULT} 
     */
    ExecuteRawDeviceIoControl(controlCode, inputBufferSize, inputBuffer, outputBufferSize, outputBuffer, outputSize) {
        result := ComCall(19, this, "uint", controlCode, "ptr", inputBufferSize, "ptr", inputBuffer, "ptr", outputBufferSize, "ptr", outputBuffer, "ptr*", outputSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} timeoutInMicroseconds 
     * @returns {Boolean} 
     */
    AcquireExclusiveRawDeviceAccess(timeoutInMicroseconds) {
        result := ComCall(20, this, "uint", timeoutInMicroseconds, "int")
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    ReleaseExclusiveRawDeviceAccess() {
        ComCall(21, this)
    }
}
