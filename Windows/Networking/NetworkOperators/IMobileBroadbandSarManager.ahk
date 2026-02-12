#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\MobileBroadbandAntennaSar.ahk
#Include ..\..\Foundation\TimeSpan.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class IMobileBroadbandSarManager extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMobileBroadbandSarManager
     * @type {Guid}
     */
    static IID => Guid("{e5b26833-967e-40c9-a485-19c0dd209e22}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsBackoffEnabled", "get_IsWiFiHardwareIntegrated", "get_IsSarControlledByHardware", "get_Antennas", "get_HysteresisTimerPeriod", "add_TransmissionStateChanged", "remove_TransmissionStateChanged", "EnableBackoffAsync", "DisableBackoffAsync", "SetConfigurationAsync", "RevertSarToHardwareControlAsync", "SetTransmissionStateChangedHysteresisAsync", "GetIsTransmittingAsync", "StartTransmissionStateMonitoring", "StopTransmissionStateMonitoring"]

    /**
     * @type {Boolean} 
     */
    IsBackoffEnabled {
        get => this.get_IsBackoffEnabled()
    }

    /**
     * @type {Boolean} 
     */
    IsWiFiHardwareIntegrated {
        get => this.get_IsWiFiHardwareIntegrated()
    }

    /**
     * @type {Boolean} 
     */
    IsSarControlledByHardware {
        get => this.get_IsSarControlledByHardware()
    }

    /**
     * @type {IVectorView<MobileBroadbandAntennaSar>} 
     */
    Antennas {
        get => this.get_Antennas()
    }

    /**
     * @type {TimeSpan} 
     */
    HysteresisTimerPeriod {
        get => this.get_HysteresisTimerPeriod()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsBackoffEnabled() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsWiFiHardwareIntegrated() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSarControlledByHardware() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVectorView<MobileBroadbandAntennaSar>} 
     */
    get_Antennas() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(MobileBroadbandAntennaSar, value)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_HysteresisTimerPeriod() {
        value := TimeSpan()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {TypedEventHandler<MobileBroadbandSarManager, MobileBroadbandTransmissionStateChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_TransmissionStateChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(11, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_TransmissionStateChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(12, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IAsyncAction} 
     */
    EnableBackoffAsync() {
        result := ComCall(13, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * 
     * @returns {IAsyncAction} 
     */
    DisableBackoffAsync() {
        result := ComCall(14, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * 
     * @param {IIterable<MobileBroadbandAntennaSar>} antennas 
     * @returns {IAsyncAction} 
     */
    SetConfigurationAsync(antennas) {
        result := ComCall(15, this, "ptr", antennas, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * 
     * @returns {IAsyncAction} 
     */
    RevertSarToHardwareControlAsync() {
        result := ComCall(16, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * 
     * @param {TimeSpan} timerPeriod 
     * @returns {IAsyncAction} 
     */
    SetTransmissionStateChangedHysteresisAsync(timerPeriod) {
        result := ComCall(17, this, "ptr", timerPeriod, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * 
     * @returns {IAsyncOperation<Boolean>} 
     */
    GetIsTransmittingAsync() {
        result := ComCall(18, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    StartTransmissionStateMonitoring() {
        result := ComCall(19, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    StopTransmissionStateMonitoring() {
        result := ComCall(20, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
