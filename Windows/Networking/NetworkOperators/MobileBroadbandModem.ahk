#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMobileBroadbandModem.ahk
#Include .\IMobileBroadbandModem2.ahk
#Include .\IMobileBroadbandModem3.ahk
#Include .\IMobileBroadbandModem4.ahk
#Include .\IMobileBroadbandModemStatics.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\MobileBroadbandModem.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents a mobile broadband modem.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
  * > 
  * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandmodem
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class MobileBroadbandModem extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMobileBroadbandModem

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMobileBroadbandModem.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets a device selector for the mobile broadband modem.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandmodem.getdeviceselector
     */
    static GetDeviceSelector() {
        if (!MobileBroadbandModem.HasProp("__IMobileBroadbandModemStatics")) {
            activatableClassId := HSTRING.Create("Windows.Networking.NetworkOperators.MobileBroadbandModem")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMobileBroadbandModemStatics.IID)
            MobileBroadbandModem.__IMobileBroadbandModemStatics := IMobileBroadbandModemStatics(factoryPtr)
        }

        return MobileBroadbandModem.__IMobileBroadbandModemStatics.GetDeviceSelector()
    }

    /**
     * Determine if a mobile broadband device is a Wireless WAN device.
     * @param {HSTRING} deviceId The mobile broadband device ID
     * @returns {MobileBroadbandModem} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandmodem.fromid
     */
    static FromId(deviceId) {
        if (!MobileBroadbandModem.HasProp("__IMobileBroadbandModemStatics")) {
            activatableClassId := HSTRING.Create("Windows.Networking.NetworkOperators.MobileBroadbandModem")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMobileBroadbandModemStatics.IID)
            MobileBroadbandModem.__IMobileBroadbandModemStatics := IMobileBroadbandModemStatics(factoryPtr)
        }

        return MobileBroadbandModem.__IMobileBroadbandModemStatics.FromId(deviceId)
    }

    /**
     * Determines the default mobile broadband modem.
     * @returns {MobileBroadbandModem} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandmodem.getdefault
     */
    static GetDefault() {
        if (!MobileBroadbandModem.HasProp("__IMobileBroadbandModemStatics")) {
            activatableClassId := HSTRING.Create("Windows.Networking.NetworkOperators.MobileBroadbandModem")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMobileBroadbandModemStatics.IID)
            MobileBroadbandModem.__IMobileBroadbandModemStatics := IMobileBroadbandModemStatics(factoryPtr)
        }

        return MobileBroadbandModem.__IMobileBroadbandModemStatics.GetDefault()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the [MobileBroadbandAccount](mobilebroadbandaccount.md) associated currently with the mobile broadband modem.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandmodem.currentaccount
     * @type {MobileBroadbandAccount} 
     */
    CurrentAccount {
        get => this.get_CurrentAccount()
    }

    /**
     * Gets the [MobileBroadbandDeviceInformation](mobilebroadbanddeviceinformation.md) for the mobile broadband modem.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandmodem.deviceinformation
     * @type {MobileBroadbandDeviceInformation} 
     */
    DeviceInformation {
        get => this.get_DeviceInformation()
    }

    /**
     * Gets the maximum device service command size, in bytes, for the mobile broadband modem.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandmodem.maxdeviceservicecommandsizeinbytes
     * @type {Integer} 
     */
    MaxDeviceServiceCommandSizeInBytes {
        get => this.get_MaxDeviceServiceCommandSizeInBytes()
    }

    /**
     * Gets the maximum device service data size, in bytes, for the mobile broadband modem.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandmodem.maxdeviceservicedatasizeinbytes
     * @type {Integer} 
     */
    MaxDeviceServiceDataSizeInBytes {
        get => this.get_MaxDeviceServiceDataSizeInBytes()
    }

    /**
     * Gets a list of the device services available for the mobile broadband modem.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandmodem.deviceservices
     * @type {IVectorView<MobileBroadbandDeviceServiceInformation>} 
     */
    DeviceServices {
        get => this.get_DeviceServices()
    }

    /**
     * Gets a value indicating whether the mobile broadband modem allows a reset operation.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandmodem.isresetsupported
     * @type {Boolean} 
     */
    IsResetSupported {
        get => this.get_IsResetSupported()
    }

    /**
     * Gets an object that describes the mobile broadband network that this modem us currently attached to.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandmodem.currentnetwork
     * @type {MobileBroadbandNetwork} 
     */
    CurrentNetwork {
        get => this.get_CurrentNetwork()
    }

    /**
     * Gets a value indicating whether the mobile broadband modem is in emergency call mode.
     * @remarks
     * When an emergency call is made from a device (for example, when 911 is dialed within the United States), the mobile broadband modem enters emergency call mode. This permits the device to use the strongest available network to make the call, regardless of whether an active SIM card is present.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandmodem.isinemergencycallmode
     * @type {Boolean} 
     */
    IsInEmergencyCallMode {
        get => this.get_IsInEmergencyCallMode()
    }

    /**
     * Occurs when the mobile broadband modem either enters or exits emergency call mode.
     * @type {TypedEventHandler<MobileBroadbandModem, IInspectable>}
    */
    OnIsInEmergencyCallModeChanged {
        get {
            if(!this.HasProp("__OnIsInEmergencyCallModeChanged")){
                this.__OnIsInEmergencyCallModeChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{f2df3c8f-20b5-555c-a381-7e29d5ab51d7}"),
                    MobileBroadbandModem,
                    IInspectable
                )
                this.__OnIsInEmergencyCallModeChangedToken := this.add_IsInEmergencyCallModeChanged(this.__OnIsInEmergencyCallModeChanged.iface)
            }
            return this.__OnIsInEmergencyCallModeChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnIsInEmergencyCallModeChangedToken")) {
            this.remove_IsInEmergencyCallModeChanged(this.__OnIsInEmergencyCallModeChangedToken)
            this.__OnIsInEmergencyCallModeChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {MobileBroadbandAccount} 
     */
    get_CurrentAccount() {
        if (!this.HasProp("__IMobileBroadbandModem")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandModem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandModem := IMobileBroadbandModem(outPtr)
        }

        return this.__IMobileBroadbandModem.get_CurrentAccount()
    }

    /**
     * 
     * @returns {MobileBroadbandDeviceInformation} 
     */
    get_DeviceInformation() {
        if (!this.HasProp("__IMobileBroadbandModem")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandModem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandModem := IMobileBroadbandModem(outPtr)
        }

        return this.__IMobileBroadbandModem.get_DeviceInformation()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxDeviceServiceCommandSizeInBytes() {
        if (!this.HasProp("__IMobileBroadbandModem")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandModem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandModem := IMobileBroadbandModem(outPtr)
        }

        return this.__IMobileBroadbandModem.get_MaxDeviceServiceCommandSizeInBytes()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxDeviceServiceDataSizeInBytes() {
        if (!this.HasProp("__IMobileBroadbandModem")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandModem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandModem := IMobileBroadbandModem(outPtr)
        }

        return this.__IMobileBroadbandModem.get_MaxDeviceServiceDataSizeInBytes()
    }

    /**
     * 
     * @returns {IVectorView<MobileBroadbandDeviceServiceInformation>} 
     */
    get_DeviceServices() {
        if (!this.HasProp("__IMobileBroadbandModem")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandModem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandModem := IMobileBroadbandModem(outPtr)
        }

        return this.__IMobileBroadbandModem.get_DeviceServices()
    }

    /**
     * Gets a specific device service for the mobile broadband modem.
     * @param {Guid} deviceServiceId The unique device service identifier for the device service to be retrieved.
     * @returns {MobileBroadbandDeviceService} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandmodem.getdeviceservice
     */
    GetDeviceService(deviceServiceId) {
        if (!this.HasProp("__IMobileBroadbandModem")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandModem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandModem := IMobileBroadbandModem(outPtr)
        }

        return this.__IMobileBroadbandModem.GetDeviceService(deviceServiceId)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsResetSupported() {
        if (!this.HasProp("__IMobileBroadbandModem")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandModem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandModem := IMobileBroadbandModem(outPtr)
        }

        return this.__IMobileBroadbandModem.get_IsResetSupported()
    }

    /**
     * Asynchronously performs a reset operation on the mobile broadband modem.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandmodem.resetasync
     */
    ResetAsync() {
        if (!this.HasProp("__IMobileBroadbandModem")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandModem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandModem := IMobileBroadbandModem(outPtr)
        }

        return this.__IMobileBroadbandModem.ResetAsync()
    }

    /**
     * Asynchronously retrieves mobile broadband modem configuration information.
     * @returns {IAsyncOperation<MobileBroadbandModemConfiguration>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandmodem.getcurrentconfigurationasync
     */
    GetCurrentConfigurationAsync() {
        if (!this.HasProp("__IMobileBroadbandModem")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandModem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandModem := IMobileBroadbandModem(outPtr)
        }

        return this.__IMobileBroadbandModem.GetCurrentConfigurationAsync()
    }

    /**
     * 
     * @returns {MobileBroadbandNetwork} 
     */
    get_CurrentNetwork() {
        if (!this.HasProp("__IMobileBroadbandModem")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandModem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandModem := IMobileBroadbandModem(outPtr)
        }

        return this.__IMobileBroadbandModem.get_CurrentNetwork()
    }

    /**
     * Asynchronously retrieves a value indicating whether passthrough mode is enabled (for either the active or inactive slot, for Dual Sim Single Active devices).
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * >
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.eSIMManagement_8wekyb3d8bbwe**. For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandmodem.getispassthroughenabledasync
     */
    GetIsPassthroughEnabledAsync() {
        if (!this.HasProp("__IMobileBroadbandModem2")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandModem2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandModem2 := IMobileBroadbandModem2(outPtr)
        }

        return this.__IMobileBroadbandModem2.GetIsPassthroughEnabledAsync()
    }

    /**
     * Asynchronously enables or disables passthrough mode (for either the active or inactive slot, for Dual Sim Single Active devices).
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * >
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.eSIMManagement_8wekyb3d8bbwe**. For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
     * @remarks
     * Enabling passthrough mode allows the host to communicate with the SIM directly (the communication between the host and the SIM is *passthrough*). For example, to upgrade firmware. The miniport adapter doesn't send any application protocol data units (APDUs) to the card, and doesn't interfere at any time with the communication between the host and the SIM.
     * @param {Boolean} value A value of `true` to enable passthrough mode; `false` to disable it.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandmodem.setispassthroughenabledasync
     */
    SetIsPassthroughEnabledAsync(value) {
        if (!this.HasProp("__IMobileBroadbandModem2")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandModem2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandModem2 := IMobileBroadbandModem2(outPtr)
        }

        return this.__IMobileBroadbandModem2.SetIsPassthroughEnabledAsync(value)
    }

    /**
     * Asynchronously retrieves the Protocol Configuration Options (PCO) data for the modem.
     * @returns {IAsyncOperation<MobileBroadbandPco>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandmodem.trygetpcoasync
     */
    TryGetPcoAsync() {
        if (!this.HasProp("__IMobileBroadbandModem3")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandModem3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandModem3 := IMobileBroadbandModem3(outPtr)
        }

        return this.__IMobileBroadbandModem3.TryGetPcoAsync()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsInEmergencyCallMode() {
        if (!this.HasProp("__IMobileBroadbandModem3")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandModem3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandModem3 := IMobileBroadbandModem3(outPtr)
        }

        return this.__IMobileBroadbandModem3.get_IsInEmergencyCallMode()
    }

    /**
     * 
     * @param {TypedEventHandler<MobileBroadbandModem, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_IsInEmergencyCallModeChanged(handler) {
        if (!this.HasProp("__IMobileBroadbandModem3")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandModem3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandModem3 := IMobileBroadbandModem3(outPtr)
        }

        return this.__IMobileBroadbandModem3.add_IsInEmergencyCallModeChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_IsInEmergencyCallModeChanged(token) {
        if (!this.HasProp("__IMobileBroadbandModem3")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandModem3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandModem3 := IMobileBroadbandModem3(outPtr)
        }

        return this.__IMobileBroadbandModem3.remove_IsInEmergencyCallModeChanged(token)
    }

    /**
     * Asynchronously enables or disables passthrough mode.
     * @remarks
     * Enabling passthrough mode allows the host to communicate with the SIM directly (the communication between the host and the SIM is *passthrough*). For example, to upgrade firmware. The miniport adapter doesn't send any application protocol data units (APDUs) to the card, and doesn't interfere at any time with the communication between the host and the SIM.
     * @param {Boolean} value True if passthrough should be enabled; otherwise, false.
     * @param {Integer} slotindex 
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandmodem.setispassthroughenabledasync
     */
    SetIsPassthroughEnabledWithSlotIndexAsync(value, slotindex) {
        if (!this.HasProp("__IMobileBroadbandModem4")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandModem4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandModem4 := IMobileBroadbandModem4(outPtr)
        }

        return this.__IMobileBroadbandModem4.SetIsPassthroughEnabledWithSlotIndexAsync(value, slotindex)
    }

    /**
     * Gets a value indicating whether passthrough mode is enabled.
     * @param {Integer} slotindex 
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandmodem.getispassthroughenabledasync
     */
    GetIsPassthroughEnabledWithSlotIndexAsync(slotindex) {
        if (!this.HasProp("__IMobileBroadbandModem4")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandModem4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandModem4 := IMobileBroadbandModem4(outPtr)
        }

        return this.__IMobileBroadbandModem4.GetIsPassthroughEnabledWithSlotIndexAsync(slotindex)
    }

    /**
     * Enables or disables passthrough mode (for either the active or inactive slot, for Dual Sim Single Active devices).
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * >
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.eSIMManagement_8wekyb3d8bbwe**. For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
     * @remarks
     * Enabling passthrough mode allows the host to communicate with the SIM directly (the communication between the host and the SIM is *passthrough*). For example, to upgrade firmware. The miniport adapter doesn't send any application protocol data units (APDUs) to the card, and doesn't interfere at any time with the communication between the host and the SIM.
     * @param {Boolean} value A value of `true` to enable passthrough mode; `false` to disable it.
     * @param {Integer} slotindex The 0-based slot index (slot number) to enable or disable passthrough mode for.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandmodem.setispassthroughenabled
     */
    SetIsPassthroughEnabledWithSlotIndex(value, slotindex) {
        if (!this.HasProp("__IMobileBroadbandModem4")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandModem4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandModem4 := IMobileBroadbandModem4(outPtr)
        }

        return this.__IMobileBroadbandModem4.SetIsPassthroughEnabledWithSlotIndex(value, slotindex)
    }

    /**
     * Retrieves a value indicating whether passthrough mode is enabled (for either the active or inactive slot, for Dual Sim Single Active devices).
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * >
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.eSIMManagement_8wekyb3d8bbwe**. For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
     * @param {Integer} slotindex The 0-based slot index (slot number) to query about.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandmodem.getispassthroughenabled
     */
    GetIsPassthroughEnabledWithSlotIndex(slotindex) {
        if (!this.HasProp("__IMobileBroadbandModem4")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandModem4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandModem4 := IMobileBroadbandModem4(outPtr)
        }

        return this.__IMobileBroadbandModem4.GetIsPassthroughEnabledWithSlotIndex(slotindex)
    }

;@endregion Instance Methods
}
