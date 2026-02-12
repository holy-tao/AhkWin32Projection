#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMobileBroadbandSarManager.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\MobileBroadbandSarManager.ahk
#Include .\MobileBroadbandTransmissionStateChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Contains the SAR configuration properties and the control method to change them on the device.
  * 
  * > [!NOTE]
  * > To use this API you will need to contact Microsoft to request the custom capability **microsoft.cellularSARConfiguration_8wekyb3d8bbwe**. For more info, see the **Custom capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#custom-capabilities) topic, and [Creating a custom capability to pair a driver with a Hardware Support App](/windows-hardware/drivers/devapps/creating-a-custom-capability-to-pair-driver-with-hsa).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandsarmanager
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class MobileBroadbandSarManager extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMobileBroadbandSarManager

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMobileBroadbandSarManager.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value indicating whether SAR backoff functionality is enabled on the device.
     * 
     * > [!NOTE]
     * > To use this API you will need to contact Microsoft to request the custom capability **microsoft.cellularSARConfiguration_8wekyb3d8bbwe**. For more info, see the **Custom capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#custom-capabilities) topic, and [Creating a custom capability to pair a driver with a Hardware Support App](/windows-hardware/drivers/devapps/creating-a-custom-capability-to-pair-driver-with-hsa).
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandsarmanager.isbackoffenabled
     * @type {Boolean} 
     */
    IsBackoffEnabled {
        get => this.get_IsBackoffEnabled()
    }

    /**
     * Gets a value indicating if WiFi and cellular SAR are integrated in the device.
     * 
     * > [!NOTE]
     * > To use this API you will need to contact Microsoft to request the custom capability **microsoft.cellularSARConfiguration_8wekyb3d8bbwe**. For more info, see the **Custom capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#custom-capabilities) topic, and [Creating a custom capability to pair a driver with a Hardware Support App](/windows-hardware/drivers/devapps/creating-a-custom-capability-to-pair-driver-with-hsa).
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandsarmanager.iswifihardwareintegrated
     * @type {Boolean} 
     */
    IsWiFiHardwareIntegrated {
        get => this.get_IsWiFiHardwareIntegrated()
    }

    /**
     * Gets a value indicating if SAR configuration is controlled by device hardware.
     * 
     * > [!NOTE]
     * > To use this API you will need to contact Microsoft to request the custom capability **microsoft.cellularSARConfiguration_8wekyb3d8bbwe**. For more info, see the **Custom capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#custom-capabilities) topic, and [Creating a custom capability to pair a driver with a Hardware Support App](/windows-hardware/drivers/devapps/creating-a-custom-capability-to-pair-driver-with-hsa).
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandsarmanager.issarcontrolledbyhardware
     * @type {Boolean} 
     */
    IsSarControlledByHardware {
        get => this.get_IsSarControlledByHardware()
    }

    /**
     * Gets the collection of current SAR configuration models for each antenna on the device. 
     * 
     * > [!NOTE]
     * > To use this API you will need to contact Microsoft to request the custom capability **microsoft.cellularSARConfiguration_8wekyb3d8bbwe**. For more info, see the **Custom capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#custom-capabilities) topic, and [Creating a custom capability to pair a driver with a Hardware Support App](/windows-hardware/drivers/devapps/creating-a-custom-capability-to-pair-driver-with-hsa).
     * @remarks
     * The size of this collection is guaranteed to be the same as the number of antennas on device.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandsarmanager.antennas
     * @type {IVectorView<MobileBroadbandAntennaSar>} 
     */
    Antennas {
        get => this.get_Antennas()
    }

    /**
     * Gets the time window of the hysteresis timer that is used to determine antenna's transmission state.
     * 
     * > [!NOTE]
     * > To use this API you will need to contact Microsoft to request the custom capability **microsoft.cellularSARConfiguration_8wekyb3d8bbwe**. For more info, see the **Custom capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#custom-capabilities) topic, and [Creating a custom capability to pair a driver with a Hardware Support App](/windows-hardware/drivers/devapps/creating-a-custom-capability-to-pair-driver-with-hsa).
     * @remarks
     * This value is in the range 1 ~ 5, in seconds.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandsarmanager.hysteresistimerperiod
     * @type {TimeSpan} 
     */
    HysteresisTimerPeriod {
        get => this.get_HysteresisTimerPeriod()
    }

    /**
     * Occurs when there is notification received from device that indicate a change in the current transmission state.
     * 
     * > [!NOTE]
     * > To use this API you will need to contact Microsoft to request the custom capability **microsoft.cellularSARConfiguration_8wekyb3d8bbwe**. For more info, see the **Custom capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#custom-capabilities) topic, and [Creating a custom capability to pair a driver with a Hardware Support App](/windows-hardware/drivers/devapps/creating-a-custom-capability-to-pair-driver-with-hsa).
     * @type {TypedEventHandler<MobileBroadbandSarManager, MobileBroadbandTransmissionStateChangedEventArgs>}
    */
    OnTransmissionStateChanged {
        get {
            if(!this.HasProp("__OnTransmissionStateChanged")){
                this.__OnTransmissionStateChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{540c4534-cd85-5abe-8013-13cb140ed18b}"),
                    MobileBroadbandSarManager,
                    MobileBroadbandTransmissionStateChangedEventArgs
                )
                this.__OnTransmissionStateChangedToken := this.add_TransmissionStateChanged(this.__OnTransmissionStateChanged.iface)
            }
            return this.__OnTransmissionStateChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnTransmissionStateChangedToken")) {
            this.remove_TransmissionStateChanged(this.__OnTransmissionStateChangedToken)
            this.__OnTransmissionStateChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsBackoffEnabled() {
        if (!this.HasProp("__IMobileBroadbandSarManager")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandSarManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandSarManager := IMobileBroadbandSarManager(outPtr)
        }

        return this.__IMobileBroadbandSarManager.get_IsBackoffEnabled()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsWiFiHardwareIntegrated() {
        if (!this.HasProp("__IMobileBroadbandSarManager")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandSarManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandSarManager := IMobileBroadbandSarManager(outPtr)
        }

        return this.__IMobileBroadbandSarManager.get_IsWiFiHardwareIntegrated()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSarControlledByHardware() {
        if (!this.HasProp("__IMobileBroadbandSarManager")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandSarManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandSarManager := IMobileBroadbandSarManager(outPtr)
        }

        return this.__IMobileBroadbandSarManager.get_IsSarControlledByHardware()
    }

    /**
     * 
     * @returns {IVectorView<MobileBroadbandAntennaSar>} 
     */
    get_Antennas() {
        if (!this.HasProp("__IMobileBroadbandSarManager")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandSarManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandSarManager := IMobileBroadbandSarManager(outPtr)
        }

        return this.__IMobileBroadbandSarManager.get_Antennas()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_HysteresisTimerPeriod() {
        if (!this.HasProp("__IMobileBroadbandSarManager")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandSarManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandSarManager := IMobileBroadbandSarManager(outPtr)
        }

        return this.__IMobileBroadbandSarManager.get_HysteresisTimerPeriod()
    }

    /**
     * 
     * @param {TypedEventHandler<MobileBroadbandSarManager, MobileBroadbandTransmissionStateChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_TransmissionStateChanged(handler) {
        if (!this.HasProp("__IMobileBroadbandSarManager")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandSarManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandSarManager := IMobileBroadbandSarManager(outPtr)
        }

        return this.__IMobileBroadbandSarManager.add_TransmissionStateChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_TransmissionStateChanged(token) {
        if (!this.HasProp("__IMobileBroadbandSarManager")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandSarManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandSarManager := IMobileBroadbandSarManager(outPtr)
        }

        return this.__IMobileBroadbandSarManager.remove_TransmissionStateChanged(token)
    }

    /**
     * Enables SAR backoff functionality on the device.
     * 
     * > [!NOTE]
     * > To use this API you will need to contact Microsoft to request the custom capability **microsoft.cellularSARConfiguration_8wekyb3d8bbwe**. For more info, see the **Custom capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#custom-capabilities) topic, and [Creating a custom capability to pair a driver with a Hardware Support App](/windows-hardware/drivers/devapps/creating-a-custom-capability-to-pair-driver-with-hsa).
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandsarmanager.enablebackoffasync
     */
    EnableBackoffAsync() {
        if (!this.HasProp("__IMobileBroadbandSarManager")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandSarManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandSarManager := IMobileBroadbandSarManager(outPtr)
        }

        return this.__IMobileBroadbandSarManager.EnableBackoffAsync()
    }

    /**
     * Disables SAR backoff functionality on the device.
     * 
     * > [!NOTE]
     * > To use this API you will need to contact Microsoft to request the custom capability **microsoft.cellularSARConfiguration_8wekyb3d8bbwe**. For more info, see the **Custom capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#custom-capabilities) topic, and [Creating a custom capability to pair a driver with a Hardware Support App](/windows-hardware/drivers/devapps/creating-a-custom-capability-to-pair-driver-with-hsa).
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandsarmanager.disablebackoffasync
     */
    DisableBackoffAsync() {
        if (!this.HasProp("__IMobileBroadbandSarManager")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandSarManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandSarManager := IMobileBroadbandSarManager(outPtr)
        }

        return this.__IMobileBroadbandSarManager.DisableBackoffAsync()
    }

    /**
     * Sends a request to the device to change the SAR configuration.  
     * 
     * > [!NOTE]
     * > This is a pre-release API. It will be fully usable in a future release, when the appropriate [MobileBroadbandAntennaSar](mobilebroadbandantennasar.md) constructor is available.
     * >
     * > To use this API you will need to contact Microsoft to request the custom capability **microsoft.cellularSARConfiguration_8wekyb3d8bbwe**. For more info, see the **Custom capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#custom-capabilities) topic, and [Creating a custom capability to pair a driver with a Hardware Support App](/windows-hardware/drivers/devapps/creating-a-custom-capability-to-pair-driver-with-hsa).
     * @remarks
     * **Note**
     * @param {IIterable<MobileBroadbandAntennaSar>} antennas The collection of antennas containing the SAR backoff property to configure.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandsarmanager.setconfigurationasync
     */
    SetConfigurationAsync(antennas) {
        if (!this.HasProp("__IMobileBroadbandSarManager")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandSarManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandSarManager := IMobileBroadbandSarManager(outPtr)
        }

        return this.__IMobileBroadbandSarManager.SetConfigurationAsync(antennas)
    }

    /**
     * Sets the device back to hardware control mode. The relevant SAR configuration values are reset to the hardware default settings.
     * 
     * > [!NOTE]
     * > To use this API you will need to contact Microsoft to request the custom capability **microsoft.cellularSARConfiguration_8wekyb3d8bbwe**. For more info, see the **Custom capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#custom-capabilities) topic, and [Creating a custom capability to pair a driver with a Hardware Support App](/windows-hardware/drivers/devapps/creating-a-custom-capability-to-pair-driver-with-hsa).
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandsarmanager.revertsartohardwarecontrolasync
     */
    RevertSarToHardwareControlAsync() {
        if (!this.HasProp("__IMobileBroadbandSarManager")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandSarManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandSarManager := IMobileBroadbandSarManager(outPtr)
        }

        return this.__IMobileBroadbandSarManager.RevertSarToHardwareControlAsync()
    }

    /**
     * Sets the hysteresis timer (1-5 seconds) used to determine if transmission activity is idle.
     * 
     * > [!NOTE]
     * > To use this API you will need to contact Microsoft to request the custom capability **microsoft.cellularSARConfiguration_8wekyb3d8bbwe**. For more info, see the **Custom capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#custom-capabilities) topic, and [Creating a custom capability to pair a driver with a Hardware Support App](/windows-hardware/drivers/devapps/creating-a-custom-capability-to-pair-driver-with-hsa).
     * @param {TimeSpan} timerPeriod //*  The time-window size ranging from 1 to 5 seconds.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandsarmanager.settransmissionstatechangedhysteresisasync
     */
    SetTransmissionStateChangedHysteresisAsync(timerPeriod) {
        if (!this.HasProp("__IMobileBroadbandSarManager")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandSarManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandSarManager := IMobileBroadbandSarManager(outPtr)
        }

        return this.__IMobileBroadbandSarManager.SetTransmissionStateChangedHysteresisAsync(timerPeriod)
    }

    /**
     * Gets a value that indicates whether the modem is transmitting or idle.
     * 
     * > [!NOTE]
     * > To use this API you will need to contact Microsoft to request the custom capability **microsoft.cellularSARConfiguration_8wekyb3d8bbwe**. For more info, see the **Custom capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#custom-capabilities) topic, and [Creating a custom capability to pair a driver with a Hardware Support App](/windows-hardware/drivers/devapps/creating-a-custom-capability-to-pair-driver-with-hsa).
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandsarmanager.getistransmittingasync
     */
    GetIsTransmittingAsync() {
        if (!this.HasProp("__IMobileBroadbandSarManager")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandSarManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandSarManager := IMobileBroadbandSarManager(outPtr)
        }

        return this.__IMobileBroadbandSarManager.GetIsTransmittingAsync()
    }

    /**
     * Starts monitoring the transmission state change on the device.
     * 
     * > [!NOTE]
     * > To use this API you will need to contact Microsoft to request the custom capability **microsoft.cellularSARConfiguration_8wekyb3d8bbwe**. For more info, see the **Custom capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#custom-capabilities) topic, and [Creating a custom capability to pair a driver with a Hardware Support App](/windows-hardware/drivers/devapps/creating-a-custom-capability-to-pair-driver-with-hsa).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandsarmanager.starttransmissionstatemonitoring
     */
    StartTransmissionStateMonitoring() {
        if (!this.HasProp("__IMobileBroadbandSarManager")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandSarManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandSarManager := IMobileBroadbandSarManager(outPtr)
        }

        return this.__IMobileBroadbandSarManager.StartTransmissionStateMonitoring()
    }

    /**
     * Stops monitoring the transmission state change on the device.
     * 
     * > [!NOTE]
     * > To use this API you will need to contact Microsoft to request the custom capability **microsoft.cellularSARConfiguration_8wekyb3d8bbwe**. For more info, see the **Custom capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#custom-capabilities) topic, and [Creating a custom capability to pair a driver with a Hardware Support App](/windows-hardware/drivers/devapps/creating-a-custom-capability-to-pair-driver-with-hsa).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandsarmanager.stoptransmissionstatemonitoring
     */
    StopTransmissionStateMonitoring() {
        if (!this.HasProp("__IMobileBroadbandSarManager")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandSarManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandSarManager := IMobileBroadbandSarManager(outPtr)
        }

        return this.__IMobileBroadbandSarManager.StopTransmissionStateMonitoring()
    }

;@endregion Instance Methods
}
