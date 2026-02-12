#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDeviceConnectionChangeTrigger.ahk
#Include .\IDeviceConnectionChangeTriggerStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a trigger that launches a background task when the connection status of a device changes.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.deviceconnectionchangetrigger
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class DeviceConnectionChangeTrigger extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDeviceConnectionChangeTrigger

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDeviceConnectionChangeTrigger.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Begins an asynchronous operation to get the [DeviceConnectionChangeTrigger](deviceconnectionchangetrigger.md) associated with the specified Id.
     * @param {HSTRING} deviceId The device Id with which to find the associated trigger.
     * @returns {IAsyncOperation<DeviceConnectionChangeTrigger>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.deviceconnectionchangetrigger.fromidasync
     */
    static FromIdAsync(deviceId) {
        if (!DeviceConnectionChangeTrigger.HasProp("__IDeviceConnectionChangeTriggerStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Background.DeviceConnectionChangeTrigger")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDeviceConnectionChangeTriggerStatics.IID)
            DeviceConnectionChangeTrigger.__IDeviceConnectionChangeTriggerStatics := IDeviceConnectionChangeTriggerStatics(factoryPtr)
        }

        return DeviceConnectionChangeTrigger.__IDeviceConnectionChangeTriggerStatics.FromIdAsync(deviceId)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the device Id associated with the device.
     * @remarks
     * When monitoring Bluetooth LE devices, the DeviceId must reference an interface on the Bluetooth LE device object. The device Id in this case can be the values returned by the [GetDeviceSelector](../windows.devices.bluetooth/bluetoothledevice_getdeviceselector_838466080.md). Alternatively, the DeviceId can reference an interface on a [GattDeviceService](../windows.devices.bluetooth.genericattributeprofile/gattdeviceservice.md) object and valid values for the device Id is any value returned by [GetDeviceSelectorFromShortId](../windows.devices.bluetooth.genericattributeprofile/gattdeviceservice_getdeviceselectorfromshortid_783818200.md) or [GetDeviceSelectorFromUuid](../windows.devices.bluetooth.genericattributeprofile/gattdeviceservice_getdeviceselectorfromuuid_26757927.md).
     * 
     * When monitoring other Bluetooth devices, the device Id can be any value returned by the GetDeviceSelector on RfCommDeviceService or BluetoothDevice.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.deviceconnectionchangetrigger.deviceid
     * @type {HSTRING} 
     */
    DeviceId {
        get => this.get_DeviceId()
    }

    /**
     * Gets whether the system can maintain a connection to the specified device.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.deviceconnectionchangetrigger.canmaintainconnection
     * @type {Boolean} 
     */
    CanMaintainConnection {
        get => this.get_CanMaintainConnection()
    }

    /**
     * Gets or sets whether the system should automatically attempt to keep the referenced device connected.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.deviceconnectionchangetrigger.maintainconnection
     * @type {Boolean} 
     */
    MaintainConnection {
        get => this.get_MaintainConnection()
        set => this.put_MaintainConnection(value)
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
    get_DeviceId() {
        if (!this.HasProp("__IDeviceConnectionChangeTrigger")) {
            if ((queryResult := this.QueryInterface(IDeviceConnectionChangeTrigger.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceConnectionChangeTrigger := IDeviceConnectionChangeTrigger(outPtr)
        }

        return this.__IDeviceConnectionChangeTrigger.get_DeviceId()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanMaintainConnection() {
        if (!this.HasProp("__IDeviceConnectionChangeTrigger")) {
            if ((queryResult := this.QueryInterface(IDeviceConnectionChangeTrigger.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceConnectionChangeTrigger := IDeviceConnectionChangeTrigger(outPtr)
        }

        return this.__IDeviceConnectionChangeTrigger.get_CanMaintainConnection()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_MaintainConnection() {
        if (!this.HasProp("__IDeviceConnectionChangeTrigger")) {
            if ((queryResult := this.QueryInterface(IDeviceConnectionChangeTrigger.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceConnectionChangeTrigger := IDeviceConnectionChangeTrigger(outPtr)
        }

        return this.__IDeviceConnectionChangeTrigger.get_MaintainConnection()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_MaintainConnection(value) {
        if (!this.HasProp("__IDeviceConnectionChangeTrigger")) {
            if ((queryResult := this.QueryInterface(IDeviceConnectionChangeTrigger.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceConnectionChangeTrigger := IDeviceConnectionChangeTrigger(outPtr)
        }

        return this.__IDeviceConnectionChangeTrigger.put_MaintainConnection(value)
    }

;@endregion Instance Methods
}
