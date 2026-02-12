#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGattServiceProviderConnection.ahk
#Include .\IGattServiceProviderConnection2.ahk
#Include .\IGattServiceProviderConnectionStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * This class represents a gatt service provider connection.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.background.gattserviceproviderconnection
 * @namespace Windows.Devices.Bluetooth.Background
 * @version WindowsRuntime 1.4
 */
class GattServiceProviderConnection extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGattServiceProviderConnection

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGattServiceProviderConnection.IID

    /**
     * Gets all the services.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.background.gattserviceproviderconnection.allservices
     * @type {IMapView<HSTRING, GattServiceProviderConnection>} 
     */
    static AllServices {
        get => GattServiceProviderConnection.get_AllServices()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {IMapView<HSTRING, GattServiceProviderConnection>} 
     */
    static get_AllServices() {
        if (!GattServiceProviderConnection.HasProp("__IGattServiceProviderConnectionStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.Background.GattServiceProviderConnection")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattServiceProviderConnectionStatics.IID)
            GattServiceProviderConnection.__IGattServiceProviderConnectionStatics := IGattServiceProviderConnectionStatics(factoryPtr)
        }

        return GattServiceProviderConnection.__IGattServiceProviderConnectionStatics.get_AllServices()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets GATT service connection trigger ID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.background.gattserviceproviderconnection.triggerid
     * @type {HSTRING} 
     */
    TriggerId {
        get => this.get_TriggerId()
    }

    /**
     * Gets the local GATT service.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.background.gattserviceproviderconnection.service
     * @type {GattLocalService} 
     */
    Service {
        get => this.get_Service()
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
        if (!this.HasProp("__IGattServiceProviderConnection")) {
            if ((queryResult := this.QueryInterface(IGattServiceProviderConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattServiceProviderConnection := IGattServiceProviderConnection(outPtr)
        }

        return this.__IGattServiceProviderConnection.get_TriggerId()
    }

    /**
     * 
     * @returns {GattLocalService} 
     */
    get_Service() {
        if (!this.HasProp("__IGattServiceProviderConnection")) {
            if ((queryResult := this.QueryInterface(IGattServiceProviderConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattServiceProviderConnection := IGattServiceProviderConnection(outPtr)
        }

        return this.__IGattServiceProviderConnection.get_Service()
    }

    /**
     * Starts a GATT service provider connection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.background.gattserviceproviderconnection.start
     */
    Start() {
        if (!this.HasProp("__IGattServiceProviderConnection")) {
            if ((queryResult := this.QueryInterface(IGattServiceProviderConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattServiceProviderConnection := IGattServiceProviderConnection(outPtr)
        }

        return this.__IGattServiceProviderConnection.Start()
    }

    /**
     * 
     * @param {GattServiceProviderAdvertisingParameters} parameters 
     * @returns {HRESULT} 
     */
    UpdateAdvertisingParameters(parameters) {
        if (!this.HasProp("__IGattServiceProviderConnection2")) {
            if ((queryResult := this.QueryInterface(IGattServiceProviderConnection2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattServiceProviderConnection2 := IGattServiceProviderConnection2(outPtr)
        }

        return this.__IGattServiceProviderConnection2.UpdateAdvertisingParameters(parameters)
    }

;@endregion Instance Methods
}
