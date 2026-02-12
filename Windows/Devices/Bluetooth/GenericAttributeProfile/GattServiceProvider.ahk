#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGattServiceProvider.ahk
#Include .\IGattServiceProvider2.ahk
#Include .\IGattServiceProviderStatics.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\GattServiceProvider.ahk
#Include .\GattServiceProviderAdvertisementStatusChangedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * This class is used to advertise a GATT service.
 * @remarks
 * After you've set up, and called [GattServiceProvider.StartAdvertising](/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattserviceprovider.startadvertising), devices can initiate connections. But there is no explicit functionality associated with this API to disconnect such a device. That's because as a platform there might be other GATT services active and using the device. If the device is in the Central role, then the device will disconnect when there are no longer any active GATT services being used on the connection. If the device is in the Peripheral role, then the device itself is in control of when to disconnect.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattserviceprovider
 * @namespace Windows.Devices.Bluetooth.GenericAttributeProfile
 * @version WindowsRuntime 1.4
 */
class GattServiceProvider extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGattServiceProvider

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGattServiceProvider.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a new GATT service with the specified serviceUuid
     * @param {Guid} serviceUuid The service UUID.
     * @returns {IAsyncOperation<GattServiceProviderResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattserviceprovider.createasync
     */
    static CreateAsync(serviceUuid) {
        if (!GattServiceProvider.HasProp("__IGattServiceProviderStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattServiceProvider")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattServiceProviderStatics.IID)
            GattServiceProvider.__IGattServiceProviderStatics := IGattServiceProviderStatics(factoryPtr)
        }

        return GattServiceProvider.__IGattServiceProviderStatics.CreateAsync(serviceUuid)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the GATT service.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattserviceprovider.service
     * @type {GattLocalService} 
     */
    Service {
        get => this.get_Service()
    }

    /**
     * Gets the advertisement status of this GATT service.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattserviceprovider.advertisementstatus
     * @type {Integer} 
     */
    AdvertisementStatus {
        get => this.get_AdvertisementStatus()
    }

    /**
     * An event that is triggered when the advertisement status has changed.
     * @type {TypedEventHandler<GattServiceProvider, GattServiceProviderAdvertisementStatusChangedEventArgs>}
    */
    OnAdvertisementStatusChanged {
        get {
            if(!this.HasProp("__OnAdvertisementStatusChanged")){
                this.__OnAdvertisementStatusChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{56ce41b0-2570-50d3-a1b1-7e4167e1fde7}"),
                    GattServiceProvider,
                    GattServiceProviderAdvertisementStatusChangedEventArgs
                )
                this.__OnAdvertisementStatusChangedToken := this.add_AdvertisementStatusChanged(this.__OnAdvertisementStatusChanged.iface)
            }
            return this.__OnAdvertisementStatusChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnAdvertisementStatusChangedToken")) {
            this.remove_AdvertisementStatusChanged(this.__OnAdvertisementStatusChangedToken)
            this.__OnAdvertisementStatusChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {GattLocalService} 
     */
    get_Service() {
        if (!this.HasProp("__IGattServiceProvider")) {
            if ((queryResult := this.QueryInterface(IGattServiceProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattServiceProvider := IGattServiceProvider(outPtr)
        }

        return this.__IGattServiceProvider.get_Service()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AdvertisementStatus() {
        if (!this.HasProp("__IGattServiceProvider")) {
            if ((queryResult := this.QueryInterface(IGattServiceProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattServiceProvider := IGattServiceProvider(outPtr)
        }

        return this.__IGattServiceProvider.get_AdvertisementStatus()
    }

    /**
     * 
     * @param {TypedEventHandler<GattServiceProvider, GattServiceProviderAdvertisementStatusChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_AdvertisementStatusChanged(handler) {
        if (!this.HasProp("__IGattServiceProvider")) {
            if ((queryResult := this.QueryInterface(IGattServiceProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattServiceProvider := IGattServiceProvider(outPtr)
        }

        return this.__IGattServiceProvider.add_AdvertisementStatusChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_AdvertisementStatusChanged(token) {
        if (!this.HasProp("__IGattServiceProvider")) {
            if ((queryResult := this.QueryInterface(IGattServiceProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattServiceProvider := IGattServiceProvider(outPtr)
        }

        return this.__IGattServiceProvider.remove_AdvertisementStatusChanged(token)
    }

    /**
     * Start advertising the GATT service.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattserviceprovider.startadvertising
     */
    StartAdvertising() {
        if (!this.HasProp("__IGattServiceProvider")) {
            if ((queryResult := this.QueryInterface(IGattServiceProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattServiceProvider := IGattServiceProvider(outPtr)
        }

        return this.__IGattServiceProvider.StartAdvertising()
    }

    /**
     * Start advertising the GATT service.
     * @param {GattServiceProviderAdvertisingParameters} parameters The advertising parameters.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattserviceprovider.startadvertising
     */
    StartAdvertisingWithParameters(parameters) {
        if (!this.HasProp("__IGattServiceProvider")) {
            if ((queryResult := this.QueryInterface(IGattServiceProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattServiceProvider := IGattServiceProvider(outPtr)
        }

        return this.__IGattServiceProvider.StartAdvertisingWithParameters(parameters)
    }

    /**
     * Stop advertising the GATT service.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattserviceprovider.stopadvertising
     */
    StopAdvertising() {
        if (!this.HasProp("__IGattServiceProvider")) {
            if ((queryResult := this.QueryInterface(IGattServiceProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattServiceProvider := IGattServiceProvider(outPtr)
        }

        return this.__IGattServiceProvider.StopAdvertising()
    }

    /**
     * 
     * @param {GattServiceProviderAdvertisingParameters} parameters 
     * @returns {HRESULT} 
     */
    UpdateAdvertisingParameters(parameters) {
        if (!this.HasProp("__IGattServiceProvider2")) {
            if ((queryResult := this.QueryInterface(IGattServiceProvider2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattServiceProvider2 := IGattServiceProvider2(outPtr)
        }

        return this.__IGattServiceProvider2.UpdateAdvertisingParameters(parameters)
    }

;@endregion Instance Methods
}
