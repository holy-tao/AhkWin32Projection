#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBluetoothLEDevice.ahk
#Include .\IBluetoothLEDevice2.ahk
#Include .\IBluetoothLEDevice3.ahk
#Include .\IBluetoothLEDevice4.ahk
#Include .\IBluetoothLEDevice5.ahk
#Include .\IBluetoothLEDevice6.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include .\IBluetoothLEDeviceStatics.ahk
#Include .\IBluetoothLEDeviceStatics2.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\BluetoothLEDevice.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents a Bluetooth LE device.
  * 
  * For code examples, see [Bluetooth Low Energy sample](/samples/microsoft/windows-universal-samples/bluetoothle/) and [Device enumeration and pairing sample](/samples/microsoft/windows-universal-samples/deviceenumerationandpairing/).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothledevice
 * @namespace Windows.Devices.Bluetooth
 * @version WindowsRuntime 1.4
 */
class BluetoothLEDevice extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBluetoothLEDevice

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBluetoothLEDevice.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Returns a [BluetoothLEDevice](bluetoothledevice.md) object for the given Id. See **Remarks** in the member topic.
     * @remarks
     * This method must be called from a UI thread.
     * 
     * Creating a [BluetoothLEDevice](bluetoothledevice.md) object by calling this method alone doesn't (necessarily) initiate a connection. To initiate a connection, set [GattSession.MaintainConnection](/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattsession.maintainconnection) to `true`, or call an uncached service discovery method on **BluetoothLEDevice**, or perform a read/write operation against the device.
     * 
     * - If **GattSession.MaintainConnection** is set to true, then the system waits indefinitely for a connection, and it will connect when the device is available. There's nothing for your application to wait on, since **GattSession.MaintainConnection** is a property.
     * - For service discovery and read/write operations in GATT, the system waits a finite but variable time. Anything from instantaneous to a matter of minutes. Factors include the traffic on the stack, and how queued up the request is. If there are no other pending request, and the remote device is unreachable, then the system will wait for 7 seconds before it times out. If there are other pending requests, then each of the requests in the queue can take 7 seconds to process, so the further yours is toward the back of the queue, the longer you'll wait.
     * 
     * Currently, you can't cancel the connection process.
     * @param {HSTRING} deviceId The Id of the Bluetooth LE device.
     * @returns {IAsyncOperation<BluetoothLEDevice>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothledevice.fromidasync
     */
    static FromIdAsync(deviceId) {
        if (!BluetoothLEDevice.HasProp("__IBluetoothLEDeviceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.BluetoothLEDevice")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothLEDeviceStatics.IID)
            BluetoothLEDevice.__IBluetoothLEDeviceStatics := IBluetoothLEDeviceStatics(factoryPtr)
        }

        return BluetoothLEDevice.__IBluetoothLEDeviceStatics.FromIdAsync(deviceId)
    }

    /**
     * Returns a [BluetoothLEDevice](bluetoothledevice.md) object representing the peer device with the given address and address type. See **Remarks** (in this member topic).
     * @remarks
     * Creating a [BluetoothLEDevice](bluetoothledevice.md) object by calling this method alone doesn't (necessarily) initiate a connection. To initiate a connection, set [GattSession.MaintainConnection](/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattsession.maintainconnection) to `true`, or call an uncached service discovery method on **BluetoothLEDevice**, or perform a read/write operation against the device.
     * 
     * - If **GattSession.MaintainConnection** is set to true, then the system waits indefinitely for a connection, and it will connect when the device is available. There's nothing for your application to wait on, since **GattSession.MaintainConnection** is a property.
     * - For service discovery and read/write operations in GATT, the system waits a finite but variable time. Anything from instantaneous to a matter of minutes. Factors include the traffic on the stack, and how queued up the request is. If there are no other pending request, and the remote device is unreachable, then the system will wait for 7 seconds before it times out. If there are other pending requests, then each of the requests in the queue can take 7 seconds to process, so the further yours is toward the back of the queue, the longer you'll wait.
     * 
     * Currently, you can't cancel the connection process.
     * @param {Integer} bluetoothAddress A [BluetoothAddress](bluetoothledevice_bluetoothaddress.md) value containing the 64-bit address of the peer Bluetooth LE device.
     * @returns {IAsyncOperation<BluetoothLEDevice>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothledevice.frombluetoothaddressasync
     */
    static FromBluetoothAddressAsync(bluetoothAddress) {
        if (!BluetoothLEDevice.HasProp("__IBluetoothLEDeviceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.BluetoothLEDevice")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothLEDeviceStatics.IID)
            BluetoothLEDevice.__IBluetoothLEDeviceStatics := IBluetoothLEDeviceStatics(factoryPtr)
        }

        return BluetoothLEDevice.__IBluetoothLEDeviceStatics.FromBluetoothAddressAsync(bluetoothAddress)
    }

    /**
     * Gets an Advanced Query Syntax (AQS) string for identifying all Bluetooth Low Energy (LE) devices. This string is passed to the [FindAllAsync](/uwp/api/windows.devices.enumeration.deviceinformation.findallasync) or [CreateWatcher](/uwp/api/windows.devices.enumeration.deviceinformation.createwatcher) method in order to get a list of Bluetooth LE devices.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothledevice.getdeviceselector
     */
    static GetDeviceSelector() {
        if (!BluetoothLEDevice.HasProp("__IBluetoothLEDeviceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.BluetoothLEDevice")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothLEDeviceStatics.IID)
            BluetoothLEDevice.__IBluetoothLEDeviceStatics := IBluetoothLEDeviceStatics(factoryPtr)
        }

        return BluetoothLEDevice.__IBluetoothLEDeviceStatics.GetDeviceSelector()
    }

    /**
     * Creates an Advanced Query Syntax (AQS) filter string that contains a query for Bluetooth LE devices that are either paired or unpaired. The AQS string is passed into the [CreateWatcher](../windows.devices.enumeration/deviceinformation_createwatcher_4958831.md) method to return a collection of [DeviceInformation](../windows.devices.enumeration/deviceinformation.md) objects.
     * @param {Boolean} pairingState The current pairing state for Bluetooth LE devices used for constructing the AQS string. Bluetooth LE devices can be either paired (true) or unpaired (false). The AQS Filter string will request scanning to be performed when the pairingState is false.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothledevice.getdeviceselectorfrompairingstate
     */
    static GetDeviceSelectorFromPairingState(pairingState) {
        if (!BluetoothLEDevice.HasProp("__IBluetoothLEDeviceStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.BluetoothLEDevice")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothLEDeviceStatics2.IID)
            BluetoothLEDevice.__IBluetoothLEDeviceStatics2 := IBluetoothLEDeviceStatics2(factoryPtr)
        }

        return BluetoothLEDevice.__IBluetoothLEDeviceStatics2.GetDeviceSelectorFromPairingState(pairingState)
    }

    /**
     * Creates an Advanced Query Syntax (AQS) filter string that contains a query for Bluetooth LE devices with the indicated [BluetoothConnectionStatus](bluetoothconnectionstatus.md). The AQS string is passed into the [CreateWatcher](../windows.devices.enumeration/deviceinformation_createwatcher_4958831.md) method to return a collection of [DeviceInformation](../windows.devices.enumeration/deviceinformation.md) objects with the indicated Bluetooth connection status.
     * @param {Integer} connectionStatus The connection status used for constructing the AQS string.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothledevice.getdeviceselectorfromconnectionstatus
     */
    static GetDeviceSelectorFromConnectionStatus(connectionStatus) {
        if (!BluetoothLEDevice.HasProp("__IBluetoothLEDeviceStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.BluetoothLEDevice")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothLEDeviceStatics2.IID)
            BluetoothLEDevice.__IBluetoothLEDeviceStatics2 := IBluetoothLEDeviceStatics2(factoryPtr)
        }

        return BluetoothLEDevice.__IBluetoothLEDeviceStatics2.GetDeviceSelectorFromConnectionStatus(connectionStatus)
    }

    /**
     * Creates an Advanced Query Syntax (AQS) filter string that contains a query for the Bluetooth LE device name. The AQS string is passed into the [CreateWatcher](../windows.devices.enumeration/deviceinformation_createwatcher_4958831.md) method to return a collection of [DeviceInformation](../windows.devices.enumeration/deviceinformation.md) objects containing the specified Bluetooth LE device name.
     * @param {HSTRING} deviceName The Bluetooth LE device name used for constructing the AQS string.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothledevice.getdeviceselectorfromdevicename
     */
    static GetDeviceSelectorFromDeviceName(deviceName) {
        if (!BluetoothLEDevice.HasProp("__IBluetoothLEDeviceStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.BluetoothLEDevice")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothLEDeviceStatics2.IID)
            BluetoothLEDevice.__IBluetoothLEDeviceStatics2 := IBluetoothLEDeviceStatics2(factoryPtr)
        }

        return BluetoothLEDevice.__IBluetoothLEDeviceStatics2.GetDeviceSelectorFromDeviceName(deviceName)
    }

    /**
     * Creates an Advanced Query Syntax (AQS) filter string from a 64-bit address and address type that represents a Bluetooth LE device. The AQS string is passed into the [CreateWatcher](../windows.devices.enumeration/deviceinformation_createwatcher_4958831.md) method.
     * @param {Integer} bluetoothAddress A 64-bit Bluetooth LE device address used for constructing the AQS string.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothledevice.getdeviceselectorfrombluetoothaddress
     */
    static GetDeviceSelectorFromBluetoothAddress(bluetoothAddress) {
        if (!BluetoothLEDevice.HasProp("__IBluetoothLEDeviceStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.BluetoothLEDevice")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothLEDeviceStatics2.IID)
            BluetoothLEDevice.__IBluetoothLEDeviceStatics2 := IBluetoothLEDeviceStatics2(factoryPtr)
        }

        return BluetoothLEDevice.__IBluetoothLEDeviceStatics2.GetDeviceSelectorFromBluetoothAddress(bluetoothAddress)
    }

    /**
     * Creates an Advanced Query Syntax (AQS) filter string from a 64-bit address that represents a Bluetooth LE device. The AQS string is passed into the [CreateWatcher](../windows.devices.enumeration/deviceinformation_createwatcher_4958831.md) method to return a collection of [DeviceInformation](../windows.devices.enumeration/deviceinformation.md) objects.
     * @param {Integer} bluetoothAddress A 64-bit Bluetooth LE device address used for constructing the AQS string.
     * @param {Integer} bluetoothAddressType_ 
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothledevice.getdeviceselectorfrombluetoothaddress
     */
    static GetDeviceSelectorFromBluetoothAddressWithBluetoothAddressType(bluetoothAddress, bluetoothAddressType_) {
        if (!BluetoothLEDevice.HasProp("__IBluetoothLEDeviceStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.BluetoothLEDevice")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothLEDeviceStatics2.IID)
            BluetoothLEDevice.__IBluetoothLEDeviceStatics2 := IBluetoothLEDeviceStatics2(factoryPtr)
        }

        return BluetoothLEDevice.__IBluetoothLEDeviceStatics2.GetDeviceSelectorFromBluetoothAddressWithBluetoothAddressType(bluetoothAddress, bluetoothAddressType_)
    }

    /**
     * Creates an Advanced Query Syntax (AQS) filter string from a [BluetoothLEAppearance](bluetoothleappearance.md) object. The AQS string is passed into the [CreateWatcher](../windows.devices.enumeration/deviceinformation_createwatcher_4958831.md) method to return a collection of [DeviceInformation](../windows.devices.enumeration/deviceinformation.md) objects with the specified appearance.
     * @param {BluetoothLEAppearance} appearance The Bluetooth LE appearance used for constructing the AQS string.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothledevice.getdeviceselectorfromappearance
     */
    static GetDeviceSelectorFromAppearance(appearance) {
        if (!BluetoothLEDevice.HasProp("__IBluetoothLEDeviceStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.BluetoothLEDevice")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothLEDeviceStatics2.IID)
            BluetoothLEDevice.__IBluetoothLEDeviceStatics2 := IBluetoothLEDeviceStatics2(factoryPtr)
        }

        return BluetoothLEDevice.__IBluetoothLEDeviceStatics2.GetDeviceSelectorFromAppearance(appearance)
    }

    /**
     * Returns a [BluetoothLEDevice](bluetoothledevice.md) object representing the peer Bluetooth LE device with the given address. See **Remarks** (in this member topic).
     * @remarks
     * Creating a [BluetoothLEDevice](bluetoothledevice.md) object by calling this method alone doesn't (necessarily) initiate a connection. To initiate a connection, set [GattSession.MaintainConnection](/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattsession.maintainconnection) to `true`, or call an uncached service discovery method on **BluetoothLEDevice**, or perform a read/write operation against the device.
     * 
     * - If **GattSession.MaintainConnection** is set to true, then the system waits indefinitely for a connection, and it will connect when the device is available. There's nothing for your application to wait on, since **GattSession.MaintainConnection** is a property.
     * - For service discovery and read/write operations in GATT, the system waits a finite but variable time. Anything from instantaneous to a matter of minutes. Factors include the traffic on the stack, and how queued up the request is. If there are no other pending request, and the remote device is unreachable, then the system will wait for 7 seconds before it times out. If there are other pending requests, then each of the requests in the queue can take 7 seconds to process, so the further yours is toward the back of the queue, the longer you'll wait.
     * 
     * You can't cancel the connection process.
     * @param {Integer} bluetoothAddress A [BluetoothAddress](bluetoothledevice_bluetoothaddress.md) value containing the 64-bit address of the peer Bluetooth LE device.
     * @param {Integer} bluetoothAddressType_ 
     * @returns {IAsyncOperation<BluetoothLEDevice>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothledevice.frombluetoothaddressasync
     */
    static FromBluetoothAddressWithBluetoothAddressTypeAsync(bluetoothAddress, bluetoothAddressType_) {
        if (!BluetoothLEDevice.HasProp("__IBluetoothLEDeviceStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.BluetoothLEDevice")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothLEDeviceStatics2.IID)
            BluetoothLEDevice.__IBluetoothLEDeviceStatics2 := IBluetoothLEDeviceStatics2(factoryPtr)
        }

        return BluetoothLEDevice.__IBluetoothLEDeviceStatics2.FromBluetoothAddressWithBluetoothAddressTypeAsync(bluetoothAddress, bluetoothAddressType_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the device Id.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothledevice.deviceid
     * @type {HSTRING} 
     */
    DeviceId {
        get => this.get_DeviceId()
    }

    /**
     * Gets the name of the Bluetooth LE device.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothledevice.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * Gets the read-only list of GATT services supported by the device.
     * 
     * > [!IMPORTANT]
     * > The **GattServices** API is deprecated, and it may not be available in future versions of Windows. Instead, use [GetGattServicesAsync](/uwp/api/windows.devices.bluetooth.bluetoothledevice.getgattservicesasync).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothledevice.gattservices
     * @type {IVectorView<GattDeviceService>} 
     */
    GattServices {
        get => this.get_GattServices()
    }

    /**
     * Gets the connection status of the device.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothledevice.connectionstatus
     * @type {Integer} 
     */
    ConnectionStatus {
        get => this.get_ConnectionStatus()
    }

    /**
     * Gets the device address.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothledevice.bluetoothaddress
     * @type {Integer} 
     */
    BluetoothAddress {
        get => this.get_BluetoothAddress()
    }

    /**
     * Gets the device information for the Bluetooth LE device.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothledevice.deviceinformation
     * @type {DeviceInformation} 
     */
    DeviceInformation {
        get => this.get_DeviceInformation()
    }

    /**
     * Gets the [BluetoothLEAppearance](bluetoothleappearance.md) object for the Bluetooth LE device.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothledevice.appearance
     * @type {BluetoothLEAppearance} 
     */
    Appearance {
        get => this.get_Appearance()
    }

    /**
     * Gets the address type for the Bluetooth LE device.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothledevice.bluetoothaddresstype
     * @type {Integer} 
     */
    BluetoothAddressType {
        get => this.get_BluetoothAddressType()
    }

    /**
     * Gets the DeviceAccessInformation.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothledevice.deviceaccessinformation
     * @type {DeviceAccessInformation} 
     */
    DeviceAccessInformation {
        get => this.get_DeviceAccessInformation()
    }

    /**
     * Gets the bluetooth device ID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothledevice.bluetoothdeviceid
     * @type {BluetoothDeviceId} 
     */
    BluetoothDeviceId {
        get => this.get_BluetoothDeviceId()
    }

    /**
     * Gets a boolean indicating whether the BluetoothLEDevice was paired using a Secure Connection.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothledevice.wassecureconnectionusedforpairing
     * @type {Boolean} 
     */
    WasSecureConnectionUsedForPairing {
        get => this.get_WasSecureConnectionUsedForPairing()
    }

    /**
     * Occurs when the name of the device has changed.
     * @remarks
     * In your handler for this event, to get the name query the [BluetoothLEDevice.Name](/uwp/api/windows.devices.bluetooth.bluetoothledevice.name) property on the [BluetoothLEDevice](/uwp/api/windows.devices.bluetooth.bluetoothledevice) that's passed to your handler.
     * @type {TypedEventHandler<BluetoothLEDevice, IInspectable>}
    */
    OnNameChanged {
        get {
            if(!this.HasProp("__OnNameChanged")){
                this.__OnNameChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{a90661e2-372e-5d1e-bbbb-b8a2ce0e7c4d}"),
                    BluetoothLEDevice,
                    IInspectable
                )
                this.__OnNameChangedToken := this.add_NameChanged(this.__OnNameChanged.iface)
            }
            return this.__OnNameChanged
        }
    }

    /**
     * Raised when the list of GATT services supported by the device has changed.
     * @remarks
     * This event is raised when the remote device changes its services, or an unpaired device is disconnecting. All services are cleared because unpaired device services can't be cached between connections.
     * 
     * The object parameter in this event is null for every event that is raised.
     * 
     * In your handler for this event, do the following in order to get the services available. Call [BluetoothLEDevice.GetGattServicesAsync](/uwp/api/windows.devices.bluetooth.bluetoothledevice.getgattservicesasync) on the [BluetoothLEDevice](/uwp/api/windows.devices.bluetooth.bluetoothledevice) that's passed to your handler. When calling **GetGattServicesAsync**, use the [Cached](/uwp/api/windows.devices.bluetooth.bluetoothcachemode) option. This can be used to refresh the list of services and re-initialize the services on the device if they are gone.
     * @type {TypedEventHandler<BluetoothLEDevice, IInspectable>}
    */
    OnGattServicesChanged {
        get {
            if(!this.HasProp("__OnGattServicesChanged")){
                this.__OnGattServicesChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{a90661e2-372e-5d1e-bbbb-b8a2ce0e7c4d}"),
                    BluetoothLEDevice,
                    IInspectable
                )
                this.__OnGattServicesChangedToken := this.add_GattServicesChanged(this.__OnGattServicesChanged.iface)
            }
            return this.__OnGattServicesChanged
        }
    }

    /**
     * Occurs when the connection status for the device has changed.
     * @remarks
     * In your handler for this event, to get the connection status query the [BluetoothLEDevice.ConnectionStatus](/uwp/api/windows.devices.bluetooth.bluetoothledevice.connectionstatus) property on the [BluetoothLEDevice](/uwp/api/windows.devices.bluetooth.bluetoothledevice) that's passed to your handler.
     * @type {TypedEventHandler<BluetoothLEDevice, IInspectable>}
    */
    OnConnectionStatusChanged {
        get {
            if(!this.HasProp("__OnConnectionStatusChanged")){
                this.__OnConnectionStatusChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{a90661e2-372e-5d1e-bbbb-b8a2ce0e7c4d}"),
                    BluetoothLEDevice,
                    IInspectable
                )
                this.__OnConnectionStatusChangedToken := this.add_ConnectionStatusChanged(this.__OnConnectionStatusChanged.iface)
            }
            return this.__OnConnectionStatusChanged
        }
    }

    /**
     * An event that's raised when the current connection parameters for the device change. The parameters will update only after a connection to the device has been established.
     * @type {TypedEventHandler<BluetoothLEDevice, IInspectable>}
    */
    OnConnectionParametersChanged {
        get {
            if(!this.HasProp("__OnConnectionParametersChanged")){
                this.__OnConnectionParametersChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{a90661e2-372e-5d1e-bbbb-b8a2ce0e7c4d}"),
                    BluetoothLEDevice,
                    IInspectable
                )
                this.__OnConnectionParametersChangedToken := this.add_ConnectionParametersChanged(this.__OnConnectionParametersChanged.iface)
            }
            return this.__OnConnectionParametersChanged
        }
    }

    /**
     * An event that's raised when the current PHY for the device changes. The PHY will update only after a connection to the device has been established.
     * @type {TypedEventHandler<BluetoothLEDevice, IInspectable>}
    */
    OnConnectionPhyChanged {
        get {
            if(!this.HasProp("__OnConnectionPhyChanged")){
                this.__OnConnectionPhyChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{a90661e2-372e-5d1e-bbbb-b8a2ce0e7c4d}"),
                    BluetoothLEDevice,
                    IInspectable
                )
                this.__OnConnectionPhyChangedToken := this.add_ConnectionPhyChanged(this.__OnConnectionPhyChanged.iface)
            }
            return this.__OnConnectionPhyChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnNameChangedToken")) {
            this.remove_NameChanged(this.__OnNameChangedToken)
            this.__OnNameChanged.iface.Dispose()
        }

        if(this.HasProp("__OnGattServicesChangedToken")) {
            this.remove_GattServicesChanged(this.__OnGattServicesChangedToken)
            this.__OnGattServicesChanged.iface.Dispose()
        }

        if(this.HasProp("__OnConnectionStatusChangedToken")) {
            this.remove_ConnectionStatusChanged(this.__OnConnectionStatusChangedToken)
            this.__OnConnectionStatusChanged.iface.Dispose()
        }

        if(this.HasProp("__OnConnectionParametersChangedToken")) {
            this.remove_ConnectionParametersChanged(this.__OnConnectionParametersChangedToken)
            this.__OnConnectionParametersChanged.iface.Dispose()
        }

        if(this.HasProp("__OnConnectionPhyChangedToken")) {
            this.remove_ConnectionPhyChanged(this.__OnConnectionPhyChangedToken)
            this.__OnConnectionPhyChanged.iface.Dispose()
        }

        this.Close()

        super.__Delete()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeviceId() {
        if (!this.HasProp("__IBluetoothLEDevice")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEDevice := IBluetoothLEDevice(outPtr)
        }

        return this.__IBluetoothLEDevice.get_DeviceId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Name() {
        if (!this.HasProp("__IBluetoothLEDevice")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEDevice := IBluetoothLEDevice(outPtr)
        }

        return this.__IBluetoothLEDevice.get_Name()
    }

    /**
     * 
     * @returns {IVectorView<GattDeviceService>} 
     */
    get_GattServices() {
        if (!this.HasProp("__IBluetoothLEDevice")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEDevice := IBluetoothLEDevice(outPtr)
        }

        return this.__IBluetoothLEDevice.get_GattServices()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ConnectionStatus() {
        if (!this.HasProp("__IBluetoothLEDevice")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEDevice := IBluetoothLEDevice(outPtr)
        }

        return this.__IBluetoothLEDevice.get_ConnectionStatus()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BluetoothAddress() {
        if (!this.HasProp("__IBluetoothLEDevice")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEDevice := IBluetoothLEDevice(outPtr)
        }

        return this.__IBluetoothLEDevice.get_BluetoothAddress()
    }

    /**
     * Returns the GATT service with the given service Id.
     * 
     * > [!IMPORTANT]
     * > The **GetGattService** API is deprecated, and it may not be available in future versions of Windows. Instead, use [GetGattServicesAsync](/uwp/api/windows.devices.bluetooth.bluetoothledevice.getgattservicesasync).
     * @param {Guid} serviceUuid The service Id of the GATT service.
     * @returns {GattDeviceService} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothledevice.getgattservice
     */
    GetGattService(serviceUuid) {
        if (!this.HasProp("__IBluetoothLEDevice")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEDevice := IBluetoothLEDevice(outPtr)
        }

        return this.__IBluetoothLEDevice.GetGattService(serviceUuid)
    }

    /**
     * 
     * @param {TypedEventHandler<BluetoothLEDevice, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_NameChanged(handler) {
        if (!this.HasProp("__IBluetoothLEDevice")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEDevice := IBluetoothLEDevice(outPtr)
        }

        return this.__IBluetoothLEDevice.add_NameChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_NameChanged(token) {
        if (!this.HasProp("__IBluetoothLEDevice")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEDevice := IBluetoothLEDevice(outPtr)
        }

        return this.__IBluetoothLEDevice.remove_NameChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<BluetoothLEDevice, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_GattServicesChanged(handler) {
        if (!this.HasProp("__IBluetoothLEDevice")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEDevice := IBluetoothLEDevice(outPtr)
        }

        return this.__IBluetoothLEDevice.add_GattServicesChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_GattServicesChanged(token) {
        if (!this.HasProp("__IBluetoothLEDevice")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEDevice := IBluetoothLEDevice(outPtr)
        }

        return this.__IBluetoothLEDevice.remove_GattServicesChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<BluetoothLEDevice, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ConnectionStatusChanged(handler) {
        if (!this.HasProp("__IBluetoothLEDevice")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEDevice := IBluetoothLEDevice(outPtr)
        }

        return this.__IBluetoothLEDevice.add_ConnectionStatusChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ConnectionStatusChanged(token) {
        if (!this.HasProp("__IBluetoothLEDevice")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEDevice := IBluetoothLEDevice(outPtr)
        }

        return this.__IBluetoothLEDevice.remove_ConnectionStatusChanged(token)
    }

    /**
     * 
     * @returns {DeviceInformation} 
     */
    get_DeviceInformation() {
        if (!this.HasProp("__IBluetoothLEDevice2")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEDevice2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEDevice2 := IBluetoothLEDevice2(outPtr)
        }

        return this.__IBluetoothLEDevice2.get_DeviceInformation()
    }

    /**
     * 
     * @returns {BluetoothLEAppearance} 
     */
    get_Appearance() {
        if (!this.HasProp("__IBluetoothLEDevice2")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEDevice2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEDevice2 := IBluetoothLEDevice2(outPtr)
        }

        return this.__IBluetoothLEDevice2.get_Appearance()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BluetoothAddressType() {
        if (!this.HasProp("__IBluetoothLEDevice2")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEDevice2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEDevice2 := IBluetoothLEDevice2(outPtr)
        }

        return this.__IBluetoothLEDevice2.get_BluetoothAddressType()
    }

    /**
     * 
     * @returns {DeviceAccessInformation} 
     */
    get_DeviceAccessInformation() {
        if (!this.HasProp("__IBluetoothLEDevice3")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEDevice3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEDevice3 := IBluetoothLEDevice3(outPtr)
        }

        return this.__IBluetoothLEDevice3.get_DeviceAccessInformation()
    }

    /**
     * Requests access to the Bluetooth LowEnergy device.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothledevice.requestaccessasync
     */
    RequestAccessAsync() {
        if (!this.HasProp("__IBluetoothLEDevice3")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEDevice3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEDevice3 := IBluetoothLEDevice3(outPtr)
        }

        return this.__IBluetoothLEDevice3.RequestAccessAsync()
    }

    /**
     * Returns the GattDeviceServices for this Bluetooth LowEnergy device with the specified cache mode.
     * @returns {IAsyncOperation<GattDeviceServicesResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothledevice.getgattservicesasync
     */
    GetGattServicesAsync() {
        if (!this.HasProp("__IBluetoothLEDevice3")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEDevice3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEDevice3 := IBluetoothLEDevice3(outPtr)
        }

        return this.__IBluetoothLEDevice3.GetGattServicesAsync()
    }

    /**
     * Gets the GattDeviceServices for this Bluetooth LowEnergy device.
     * @param {Integer} cacheMode_ 
     * @returns {IAsyncOperation<GattDeviceServicesResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothledevice.getgattservicesasync
     */
    GetGattServicesWithCacheModeAsync(cacheMode_) {
        if (!this.HasProp("__IBluetoothLEDevice3")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEDevice3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEDevice3 := IBluetoothLEDevice3(outPtr)
        }

        return this.__IBluetoothLEDevice3.GetGattServicesWithCacheModeAsync(cacheMode_)
    }

    /**
     * Returns the GattDeviceServices for the Bluetooth LowEnergy device with the specified UUID.
     * @param {Guid} serviceUuid The service UUID.
     * @returns {IAsyncOperation<GattDeviceServicesResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothledevice.getgattservicesforuuidasync
     */
    GetGattServicesForUuidAsync(serviceUuid) {
        if (!this.HasProp("__IBluetoothLEDevice3")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEDevice3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEDevice3 := IBluetoothLEDevice3(outPtr)
        }

        return this.__IBluetoothLEDevice3.GetGattServicesForUuidAsync(serviceUuid)
    }

    /**
     * Returns the GattDeviceServices for the Bluetooth LowEnergy device with the specified UUID.
     * @remarks
     * Returns an asynchronous operation that completes with a GattDeviceServicesResult.
     * @param {Guid} serviceUuid The service UUID.
     * @param {Integer} cacheMode_ 
     * @returns {IAsyncOperation<GattDeviceServicesResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothledevice.getgattservicesforuuidasync
     */
    GetGattServicesForUuidWithCacheModeAsync(serviceUuid, cacheMode_) {
        if (!this.HasProp("__IBluetoothLEDevice3")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEDevice3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEDevice3 := IBluetoothLEDevice3(outPtr)
        }

        return this.__IBluetoothLEDevice3.GetGattServicesForUuidWithCacheModeAsync(serviceUuid, cacheMode_)
    }

    /**
     * 
     * @returns {BluetoothDeviceId} 
     */
    get_BluetoothDeviceId() {
        if (!this.HasProp("__IBluetoothLEDevice4")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEDevice4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEDevice4 := IBluetoothLEDevice4(outPtr)
        }

        return this.__IBluetoothLEDevice4.get_BluetoothDeviceId()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_WasSecureConnectionUsedForPairing() {
        if (!this.HasProp("__IBluetoothLEDevice5")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEDevice5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEDevice5 := IBluetoothLEDevice5(outPtr)
        }

        return this.__IBluetoothLEDevice5.get_WasSecureConnectionUsedForPairing()
    }

    /**
     * Retrieves connection parameters for the remote device. If multiple apps or other system scenarios also request these parameters, then the system automatically combines the parameters, where compatible, based on system priority.
     * 
     * > [!NOTE]
     * > When the device is not connected, the connection parameters are invalid (all zero).
     * @returns {BluetoothLEConnectionParameters} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothledevice.getconnectionparameters
     */
    GetConnectionParameters() {
        if (!this.HasProp("__IBluetoothLEDevice6")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEDevice6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEDevice6 := IBluetoothLEDevice6(outPtr)
        }

        return this.__IBluetoothLEDevice6.GetConnectionParameters()
    }

    /**
     * Retrieves info about about the Bluetooth LE physical layer (PHY).
     * 
     * > [!NOTE]
     * > When the device is not connected, the connection PHYs are invalid (all false)
     * @returns {BluetoothLEConnectionPhy} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothledevice.getconnectionphy
     */
    GetConnectionPhy() {
        if (!this.HasProp("__IBluetoothLEDevice6")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEDevice6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEDevice6 := IBluetoothLEDevice6(outPtr)
        }

        return this.__IBluetoothLEDevice6.GetConnectionPhy()
    }

    /**
     * Retrieves a Bluetooth LE preferred connection parameters request object for the specified Bluetooth LE preferred connection parameters object.
     * @remarks
     * When performing firmware updates, higher throughput is necessary to complete the operation swiftly for the user. In those scenarios, you should request [ThroughputOptimized](bluetoothlepreferredconnectionparameters_throughputoptimized.md) connection parameters for the duration of the firmware update. That will reduce the number of concurrent connections to other Bluetooth peripherals, and should be used sparingly. Once the firmware update is completed, you should restore the connection parameters to their defaults, either by disposing of the **BluetoothLEDevice**, or by requested new connection parameters.
     * 
     * Conversely, when connecting to multiple LE devices concurrently, you should use [PowerOptimized](bluetoothlepreferredconnectionparameters_poweroptimized.md). That will increase the acceptable peripheral latency for the connection, reducing the interval at which the LE device must respond to the host OS. That allows the local Bluetooth radio to schedule more connections concurrently, and reduces power usage on both the host OS and on the peripheral device.
     * @param {BluetoothLEPreferredConnectionParameters} preferredConnectionParameters A [BluetoothLEPreferredConnectionParameters](bluetoothlepreferredconnectionparameters.md) object representing the Bluetooth LE preferred connection parameters.
     * @returns {BluetoothLEPreferredConnectionParametersRequest} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothledevice.requestpreferredconnectionparameters
     */
    RequestPreferredConnectionParameters(preferredConnectionParameters) {
        if (!this.HasProp("__IBluetoothLEDevice6")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEDevice6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEDevice6 := IBluetoothLEDevice6(outPtr)
        }

        return this.__IBluetoothLEDevice6.RequestPreferredConnectionParameters(preferredConnectionParameters)
    }

    /**
     * 
     * @param {TypedEventHandler<BluetoothLEDevice, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ConnectionParametersChanged(handler) {
        if (!this.HasProp("__IBluetoothLEDevice6")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEDevice6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEDevice6 := IBluetoothLEDevice6(outPtr)
        }

        return this.__IBluetoothLEDevice6.add_ConnectionParametersChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ConnectionParametersChanged(token) {
        if (!this.HasProp("__IBluetoothLEDevice6")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEDevice6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEDevice6 := IBluetoothLEDevice6(outPtr)
        }

        return this.__IBluetoothLEDevice6.remove_ConnectionParametersChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<BluetoothLEDevice, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ConnectionPhyChanged(handler) {
        if (!this.HasProp("__IBluetoothLEDevice6")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEDevice6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEDevice6 := IBluetoothLEDevice6(outPtr)
        }

        return this.__IBluetoothLEDevice6.add_ConnectionPhyChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ConnectionPhyChanged(token) {
        if (!this.HasProp("__IBluetoothLEDevice6")) {
            if ((queryResult := this.QueryInterface(IBluetoothLEDevice6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothLEDevice6 := IBluetoothLEDevice6(outPtr)
        }

        return this.__IBluetoothLEDevice6.remove_ConnectionPhyChanged(token)
    }

    /**
     * Closes this Bluetooth LE device. This may close the connection to the device if this is the only app with a connection.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothledevice.close
     */
    Close() {
        if (!this.HasProp("__IClosable")) {
            if ((queryResult := this.QueryInterface(IClosable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClosable := IClosable(outPtr)
        }

        return this.__IClosable.Close()
    }

;@endregion Instance Methods
}
