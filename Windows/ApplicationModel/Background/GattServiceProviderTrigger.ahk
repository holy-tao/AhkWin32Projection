#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBackgroundTrigger.ahk
#Include .\IGattServiceProviderTrigger.ahk
#Include .\IGattServiceProviderTriggerStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Constructs a Generic Attributes (GATT) service that can be persisted in the background.
 * @remarks
 * GATT defines a hierarchical data structure that is exposed to connected Bluetooth low energy (LE) devices.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.gattserviceprovidertrigger
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class GattServiceProviderTrigger extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBackgroundTrigger

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBackgroundTrigger.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a GATT provider service.
     * @param {HSTRING} triggerId The identifier for the trigger.
     * @param {Guid} serviceUuid The universally unique identifier for the trigger.
     * @returns {IAsyncOperation<GattServiceProviderTriggerResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.gattserviceprovidertrigger.createasync
     */
    static CreateAsync(triggerId, serviceUuid) {
        if (!GattServiceProviderTrigger.HasProp("__IGattServiceProviderTriggerStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Background.GattServiceProviderTrigger")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattServiceProviderTriggerStatics.IID)
            GattServiceProviderTrigger.__IGattServiceProviderTriggerStatics := IGattServiceProviderTriggerStatics(factoryPtr)
        }

        return GattServiceProviderTrigger.__IGattServiceProviderTriggerStatics.CreateAsync(triggerId, serviceUuid)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the trigger identifier.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.gattserviceprovidertrigger.triggerid
     * @type {HSTRING} 
     */
    TriggerId {
        get => this.get_TriggerId()
    }

    /**
     * Gets the service associated with this trigger.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.gattserviceprovidertrigger.service
     * @type {GattLocalService} 
     */
    Service {
        get => this.get_Service()
    }

    /**
     * Gets the advertising parameters which control whether the radio is connected/discoverable.
     * @remarks
     * When the device is discoverable, the service is published to a database so that other devices can see what services are available without having to connect to the device.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.gattserviceprovidertrigger.advertisingparameters
     * @type {GattServiceProviderAdvertisingParameters} 
     */
    AdvertisingParameters {
        get => this.get_AdvertisingParameters()
        set => this.put_AdvertisingParameters(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_TriggerId() {
        if (!this.HasProp("__IGattServiceProviderTrigger")) {
            if ((queryResult := this.QueryInterface(IGattServiceProviderTrigger.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattServiceProviderTrigger := IGattServiceProviderTrigger(outPtr)
        }

        return this.__IGattServiceProviderTrigger.get_TriggerId()
    }

    /**
     * 
     * @returns {GattLocalService} 
     */
    get_Service() {
        if (!this.HasProp("__IGattServiceProviderTrigger")) {
            if ((queryResult := this.QueryInterface(IGattServiceProviderTrigger.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattServiceProviderTrigger := IGattServiceProviderTrigger(outPtr)
        }

        return this.__IGattServiceProviderTrigger.get_Service()
    }

    /**
     * 
     * @param {GattServiceProviderAdvertisingParameters} value 
     * @returns {HRESULT} 
     */
    put_AdvertisingParameters(value) {
        if (!this.HasProp("__IGattServiceProviderTrigger")) {
            if ((queryResult := this.QueryInterface(IGattServiceProviderTrigger.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattServiceProviderTrigger := IGattServiceProviderTrigger(outPtr)
        }

        return this.__IGattServiceProviderTrigger.put_AdvertisingParameters(value)
    }

    /**
     * 
     * @returns {GattServiceProviderAdvertisingParameters} 
     */
    get_AdvertisingParameters() {
        if (!this.HasProp("__IGattServiceProviderTrigger")) {
            if ((queryResult := this.QueryInterface(IGattServiceProviderTrigger.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattServiceProviderTrigger := IGattServiceProviderTrigger(outPtr)
        }

        return this.__IGattServiceProviderTrigger.get_AdvertisingParameters()
    }

;@endregion Instance Methods
}
