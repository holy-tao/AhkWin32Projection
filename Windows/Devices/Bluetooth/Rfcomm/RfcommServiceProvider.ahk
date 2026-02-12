#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRfcommServiceProvider.ahk
#Include .\IRfcommServiceProvider2.ahk
#Include .\IRfcommServiceProviderStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents an instance of a local RFCOMM service.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.rfcomm.rfcommserviceprovider
 * @namespace Windows.Devices.Bluetooth.Rfcomm
 * @version WindowsRuntime 1.4
 */
class RfcommServiceProvider extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRfcommServiceProvider

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRfcommServiceProvider.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets a RfcommServiceProvider object from a [RfcommServiceId](rfcommserviceid.md) for an RFCOMM service instance.
     * @param {RfcommServiceId} serviceId The RfcommServiceId to be hosted locally.
     * @returns {IAsyncOperation<RfcommServiceProvider>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.rfcomm.rfcommserviceprovider.createasync
     */
    static CreateAsync(serviceId) {
        if (!RfcommServiceProvider.HasProp("__IRfcommServiceProviderStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.Rfcomm.RfcommServiceProvider")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRfcommServiceProviderStatics.IID)
            RfcommServiceProvider.__IRfcommServiceProviderStatics := IRfcommServiceProviderStatics(factoryPtr)
        }

        return RfcommServiceProvider.__IRfcommServiceProviderStatics.CreateAsync(serviceId)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the RfcommServiceId of this local RFCOMM service instance.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.rfcomm.rfcommserviceprovider.serviceid
     * @type {RfcommServiceId} 
     */
    ServiceId {
        get => this.get_ServiceId()
    }

    /**
     * Gets a collection of SDP attributes for advertising.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.rfcomm.rfcommserviceprovider.sdprawattributes
     * @type {IMap<Integer, IBuffer>} 
     */
    SdpRawAttributes {
        get => this.get_SdpRawAttributes()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {RfcommServiceId} 
     */
    get_ServiceId() {
        if (!this.HasProp("__IRfcommServiceProvider")) {
            if ((queryResult := this.QueryInterface(IRfcommServiceProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRfcommServiceProvider := IRfcommServiceProvider(outPtr)
        }

        return this.__IRfcommServiceProvider.get_ServiceId()
    }

    /**
     * 
     * @returns {IMap<Integer, IBuffer>} 
     */
    get_SdpRawAttributes() {
        if (!this.HasProp("__IRfcommServiceProvider")) {
            if ((queryResult := this.QueryInterface(IRfcommServiceProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRfcommServiceProvider := IRfcommServiceProvider(outPtr)
        }

        return this.__IRfcommServiceProvider.get_SdpRawAttributes()
    }

    /**
     * Begins advertising the SDP attributes.
     * @param {StreamSocketListener} listener The StreamSocketListener that is listening for incoming connections.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.rfcomm.rfcommserviceprovider.startadvertising
     */
    StartAdvertising(listener) {
        if (!this.HasProp("__IRfcommServiceProvider")) {
            if ((queryResult := this.QueryInterface(IRfcommServiceProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRfcommServiceProvider := IRfcommServiceProvider(outPtr)
        }

        return this.__IRfcommServiceProvider.StartAdvertising(listener)
    }

    /**
     * Stops advertising the SDP attributes.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.rfcomm.rfcommserviceprovider.stopadvertising
     */
    StopAdvertising() {
        if (!this.HasProp("__IRfcommServiceProvider")) {
            if ((queryResult := this.QueryInterface(IRfcommServiceProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRfcommServiceProvider := IRfcommServiceProvider(outPtr)
        }

        return this.__IRfcommServiceProvider.StopAdvertising()
    }

    /**
     * Begins advertising the SDP attributes.
     * @param {StreamSocketListener} listener The StreamSocketListener that is listening for incoming connections.
     * @param {Boolean} radioDiscoverable Indicates whether the radio is discoverable (true) or not (false).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.rfcomm.rfcommserviceprovider.startadvertising
     */
    StartAdvertisingWithRadioDiscoverability(listener, radioDiscoverable) {
        if (!this.HasProp("__IRfcommServiceProvider2")) {
            if ((queryResult := this.QueryInterface(IRfcommServiceProvider2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRfcommServiceProvider2 := IRfcommServiceProvider2(outPtr)
        }

        return this.__IRfcommServiceProvider2.StartAdvertisingWithRadioDiscoverability(listener, radioDiscoverable)
    }

;@endregion Instance Methods
}
