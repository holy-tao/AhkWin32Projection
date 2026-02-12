#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRfcommDeviceService.ahk
#Include .\IRfcommDeviceService2.ahk
#Include ..\..\..\Foundation\IClosable.ahk
#Include .\IRfcommDeviceService3.ahk
#Include .\IRfcommDeviceServiceStatics.ahk
#Include .\IRfcommDeviceServiceStatics2.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents an instance of a service on a Bluetooth BR device.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.rfcomm.rfcommdeviceservice
 * @namespace Windows.Devices.Bluetooth.Rfcomm
 * @version WindowsRuntime 1.4
 */
class RfcommDeviceService extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRfcommDeviceService

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRfcommDeviceService.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets an RfcommDeviceService object from a DeviceInformation Id for an RFCOMM service instance.
     * @remarks
     * The first time this method is invoked by a store app, it should be called from a UI thread in order to display the consent prompt. After the user has granted consent, the method can be invoked from any application thread.
     * 
     * If a store app has not declared the right capabilities or the user does not grant consent, the method returns a null object.
     * 
     * 
     * + For Universal Windows Platform (UWP) apps, use the **bluetooth** capability. For more info, see [App capability declarations](/windows/uwp/packaging/app-capability-declarations).
     * + For Windows 8.x store apps, see [How to specify device capabilities for Bluetooth (Windows)](/uwp/schemas/appxpackage/how-to-specify-device-capabilities-for-bluetooth) to declare the right capabilities.
     * 
     * 
     * > [!WARNING]
     * > If the device acting as the RFCOMM server does not have the correct channel registered in its manifest, this method throws an exception when called on the device acting as the RFCOMM client.
     * @param {HSTRING} deviceId The DeviceInformation Id that identifies the RFCOMM service instance. This id can be retrieved from [Windows.Devices.Enumeration](../windows.devices.enumeration/windows_devices_enumeration.md).
     * @returns {IAsyncOperation<RfcommDeviceService>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.rfcomm.rfcommdeviceservice.fromidasync
     */
    static FromIdAsync(deviceId) {
        if (!RfcommDeviceService.HasProp("__IRfcommDeviceServiceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.Rfcomm.RfcommDeviceService")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRfcommDeviceServiceStatics.IID)
            RfcommDeviceService.__IRfcommDeviceServiceStatics := IRfcommDeviceServiceStatics(factoryPtr)
        }

        return RfcommDeviceService.__IRfcommDeviceServiceStatics.FromIdAsync(deviceId)
    }

    /**
     * Gets an Advanced Query Syntax (AQS) string for identifying instances of an RFCOMM service. This string is passed to the [CreateWatcher](/uwp/api/windows.devices.enumeration.deviceinformation.createwatcher) method.
     * @param {RfcommServiceId} serviceId The service id for which to query.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.rfcomm.rfcommdeviceservice.getdeviceselector
     */
    static GetDeviceSelector(serviceId) {
        if (!RfcommDeviceService.HasProp("__IRfcommDeviceServiceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.Rfcomm.RfcommDeviceService")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRfcommDeviceServiceStatics.IID)
            RfcommDeviceService.__IRfcommDeviceServiceStatics := IRfcommDeviceServiceStatics(factoryPtr)
        }

        return RfcommDeviceService.__IRfcommDeviceServiceStatics.GetDeviceSelector(serviceId)
    }

    /**
     * Gets an Advanced Query Syntax (AQS) string for identifying cached instances of all Rfcomm services on a remote Bluetooth device.
     * @param {BluetoothDevice} bluetoothDevice_ The remote Bluetooth device.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.rfcomm.rfcommdeviceservice.getdeviceselectorforbluetoothdevice
     */
    static GetDeviceSelectorForBluetoothDevice(bluetoothDevice_) {
        if (!RfcommDeviceService.HasProp("__IRfcommDeviceServiceStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.Rfcomm.RfcommDeviceService")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRfcommDeviceServiceStatics2.IID)
            RfcommDeviceService.__IRfcommDeviceServiceStatics2 := IRfcommDeviceServiceStatics2(factoryPtr)
        }

        return RfcommDeviceService.__IRfcommDeviceServiceStatics2.GetDeviceSelectorForBluetoothDevice(bluetoothDevice_)
    }

    /**
     * Gets an Advanced Query Syntax (AQS) string for identifying instances of all Rfcomm services on a remote Bluetooth device.
     * @param {BluetoothDevice} bluetoothDevice_ The remote bluetooth device.
     * @param {Integer} cacheMode_ 
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.rfcomm.rfcommdeviceservice.getdeviceselectorforbluetoothdevice
     */
    static GetDeviceSelectorForBluetoothDeviceWithCacheMode(bluetoothDevice_, cacheMode_) {
        if (!RfcommDeviceService.HasProp("__IRfcommDeviceServiceStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.Rfcomm.RfcommDeviceService")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRfcommDeviceServiceStatics2.IID)
            RfcommDeviceService.__IRfcommDeviceServiceStatics2 := IRfcommDeviceServiceStatics2(factoryPtr)
        }

        return RfcommDeviceService.__IRfcommDeviceServiceStatics2.GetDeviceSelectorForBluetoothDeviceWithCacheMode(bluetoothDevice_, cacheMode_)
    }

    /**
     * Gets an Advanced Query Syntax (AQS) string for identifying instances of Rfcomm services on a remote Bluetooth device.
     * @param {BluetoothDevice} bluetoothDevice_ The remote bluetooth device.
     * @param {RfcommServiceId} serviceId The service ID.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.rfcomm.rfcommdeviceservice.getdeviceselectorforbluetoothdeviceandserviceid
     */
    static GetDeviceSelectorForBluetoothDeviceAndServiceId(bluetoothDevice_, serviceId) {
        if (!RfcommDeviceService.HasProp("__IRfcommDeviceServiceStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.Rfcomm.RfcommDeviceService")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRfcommDeviceServiceStatics2.IID)
            RfcommDeviceService.__IRfcommDeviceServiceStatics2 := IRfcommDeviceServiceStatics2(factoryPtr)
        }

        return RfcommDeviceService.__IRfcommDeviceServiceStatics2.GetDeviceSelectorForBluetoothDeviceAndServiceId(bluetoothDevice_, serviceId)
    }

    /**
     * Gets an Advanced Query Syntax (AQS) string for identifying instances of Rfcomm services on a remote Bluetooth device.
     * @param {BluetoothDevice} bluetoothDevice_ The remote Bluetooth device.
     * @param {RfcommServiceId} serviceId The service ID.
     * @param {Integer} cacheMode_ 
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.rfcomm.rfcommdeviceservice.getdeviceselectorforbluetoothdeviceandserviceid
     */
    static GetDeviceSelectorForBluetoothDeviceAndServiceIdWithCacheMode(bluetoothDevice_, serviceId, cacheMode_) {
        if (!RfcommDeviceService.HasProp("__IRfcommDeviceServiceStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.Rfcomm.RfcommDeviceService")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRfcommDeviceServiceStatics2.IID)
            RfcommDeviceService.__IRfcommDeviceServiceStatics2 := IRfcommDeviceServiceStatics2(factoryPtr)
        }

        return RfcommDeviceService.__IRfcommDeviceServiceStatics2.GetDeviceSelectorForBluetoothDeviceAndServiceIdWithCacheMode(bluetoothDevice_, serviceId, cacheMode_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the connection host name of the RFCOMM service instance, which is used to connect to the remote device.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.rfcomm.rfcommdeviceservice.connectionhostname
     * @type {HostName} 
     */
    ConnectionHostName {
        get => this.get_ConnectionHostName()
    }

    /**
     * Gets the connection service name of the RFCOMM service instance, which is used to connect to the remote device.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.rfcomm.rfcommdeviceservice.connectionservicename
     * @type {HSTRING} 
     */
    ConnectionServiceName {
        get => this.get_ConnectionServiceName()
    }

    /**
     * Gets the RfcommServiceId of this RFCOMM service instance.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.rfcomm.rfcommdeviceservice.serviceid
     * @type {RfcommServiceId} 
     */
    ServiceId {
        get => this.get_ServiceId()
    }

    /**
     * Gets the current SocketProtectionLevel of the RFCOMM service instance.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.rfcomm.rfcommdeviceservice.protectionlevel
     * @type {Integer} 
     */
    ProtectionLevel {
        get => this.get_ProtectionLevel()
    }

    /**
     * Gets the maximum SocketProtectionLevel supported by this RFCOMM service instance.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.rfcomm.rfcommdeviceservice.maxprotectionlevel
     * @type {Integer} 
     */
    MaxProtectionLevel {
        get => this.get_MaxProtectionLevel()
    }

    /**
     * Gets the [BluetoothDevice](../windows.devices.bluetooth/bluetoothdevice.md) object describing the device associated with the current [RfcommDeviceService](rfcommdeviceservice.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.rfcomm.rfcommdeviceservice.device
     * @type {BluetoothDevice} 
     */
    Device {
        get => this.get_Device()
    }

    /**
     * The device access information. Used to check and monitor access.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.rfcomm.rfcommdeviceservice.deviceaccessinformation
     * @type {DeviceAccessInformation} 
     */
    DeviceAccessInformation {
        get => this.get_DeviceAccessInformation()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        this.Close()

        super.__Delete()
    }

    /**
     * 
     * @returns {HostName} 
     */
    get_ConnectionHostName() {
        if (!this.HasProp("__IRfcommDeviceService")) {
            if ((queryResult := this.QueryInterface(IRfcommDeviceService.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRfcommDeviceService := IRfcommDeviceService(outPtr)
        }

        return this.__IRfcommDeviceService.get_ConnectionHostName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ConnectionServiceName() {
        if (!this.HasProp("__IRfcommDeviceService")) {
            if ((queryResult := this.QueryInterface(IRfcommDeviceService.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRfcommDeviceService := IRfcommDeviceService(outPtr)
        }

        return this.__IRfcommDeviceService.get_ConnectionServiceName()
    }

    /**
     * 
     * @returns {RfcommServiceId} 
     */
    get_ServiceId() {
        if (!this.HasProp("__IRfcommDeviceService")) {
            if ((queryResult := this.QueryInterface(IRfcommDeviceService.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRfcommDeviceService := IRfcommDeviceService(outPtr)
        }

        return this.__IRfcommDeviceService.get_ServiceId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ProtectionLevel() {
        if (!this.HasProp("__IRfcommDeviceService")) {
            if ((queryResult := this.QueryInterface(IRfcommDeviceService.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRfcommDeviceService := IRfcommDeviceService(outPtr)
        }

        return this.__IRfcommDeviceService.get_ProtectionLevel()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxProtectionLevel() {
        if (!this.HasProp("__IRfcommDeviceService")) {
            if ((queryResult := this.QueryInterface(IRfcommDeviceService.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRfcommDeviceService := IRfcommDeviceService(outPtr)
        }

        return this.__IRfcommDeviceService.get_MaxProtectionLevel()
    }

    /**
     * Gets the SDP attributes of the RFCOMM service instance.
     * @returns {IAsyncOperation<IMapView<Integer, IBuffer>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.rfcomm.rfcommdeviceservice.getsdprawattributesasync
     */
    GetSdpRawAttributesAsync() {
        if (!this.HasProp("__IRfcommDeviceService")) {
            if ((queryResult := this.QueryInterface(IRfcommDeviceService.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRfcommDeviceService := IRfcommDeviceService(outPtr)
        }

        return this.__IRfcommDeviceService.GetSdpRawAttributesAsync()
    }

    /**
     * Gets the cached SDP attributes of the RFCOMM service instance.
     * @param {Integer} cacheMode_ 
     * @returns {IAsyncOperation<IMapView<Integer, IBuffer>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.rfcomm.rfcommdeviceservice.getsdprawattributesasync
     */
    GetSdpRawAttributesWithCacheModeAsync(cacheMode_) {
        if (!this.HasProp("__IRfcommDeviceService")) {
            if ((queryResult := this.QueryInterface(IRfcommDeviceService.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRfcommDeviceService := IRfcommDeviceService(outPtr)
        }

        return this.__IRfcommDeviceService.GetSdpRawAttributesWithCacheModeAsync(cacheMode_)
    }

    /**
     * 
     * @returns {BluetoothDevice} 
     */
    get_Device() {
        if (!this.HasProp("__IRfcommDeviceService2")) {
            if ((queryResult := this.QueryInterface(IRfcommDeviceService2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRfcommDeviceService2 := IRfcommDeviceService2(outPtr)
        }

        return this.__IRfcommDeviceService2.get_Device()
    }

    /**
     * Closes the RFCOMM device.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.rfcomm.rfcommdeviceservice.close
     */
    Close() {
        if (!this.HasProp("__IClosable")) {
            if ((queryResult := this.QueryInterface(IClosable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClosable := IClosable(outPtr)
        }

        return this.__IClosable.Close()
    }

    /**
     * 
     * @returns {DeviceAccessInformation} 
     */
    get_DeviceAccessInformation() {
        if (!this.HasProp("__IRfcommDeviceService3")) {
            if ((queryResult := this.QueryInterface(IRfcommDeviceService3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRfcommDeviceService3 := IRfcommDeviceService3(outPtr)
        }

        return this.__IRfcommDeviceService3.get_DeviceAccessInformation()
    }

    /**
     * Used to request explicit access to the Rfcomm service. This invokes Device Consent and must be called on the UI thread. By default, unpaired devices do not require consent, while paired devices do. [FromIdAsync](rfcommdeviceservice_fromidasync_1322863552.md) will only display a consent prompt when called for a paired device. RequestAccessAsync allows the app to make the access request explicit in the event where the device may become paired in the future through other uses of the device.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.rfcomm.rfcommdeviceservice.requestaccessasync
     */
    RequestAccessAsync() {
        if (!this.HasProp("__IRfcommDeviceService3")) {
            if ((queryResult := this.QueryInterface(IRfcommDeviceService3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRfcommDeviceService3 := IRfcommDeviceService3(outPtr)
        }

        return this.__IRfcommDeviceService3.RequestAccessAsync()
    }

;@endregion Instance Methods
}
