#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBluetoothDevice.ahk
#Include .\IBluetoothDevice2.ahk
#Include .\IBluetoothDevice3.ahk
#Include .\IBluetoothDevice4.ahk
#Include .\IBluetoothDevice5.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include .\IBluetoothDeviceStatics2.ahk
#Include .\IBluetoothDeviceStatics.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\BluetoothDevice.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents a Bluetooth device.
  * 
  * Sample applications that use this class include [Device enumeration and pairing sample](/samples/microsoft/windows-universal-samples/deviceenumerationandpairing/) and [Bluetooth RFCOMM chat sample](/samples/microsoft/windows-universal-samples/bluetoothrfcommchat/).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothdevice
 * @namespace Windows.Devices.Bluetooth
 * @version WindowsRuntime 1.4
 */
class BluetoothDevice extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBluetoothDevice

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBluetoothDevice.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates an Advanced Query Syntax (AQS) filter string that contains a query for Bluetooth devices that are either paired or unpaired. The AQS string is passed into the [CreateWatcher](../windows.devices.enumeration/deviceinformation_createwatcher_4958831.md) method to return a collection of [DeviceInformation](../windows.devices.enumeration/deviceinformation.md) objects.
     * @param {Boolean} pairingState The current pairing state for Bluetooth devices used for constructing the AQS string. Bluetooth devices can be either paired (true) or unpaired (false). The AQS Filter string will request scanning to be performed when the pairingState is false.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothdevice.getdeviceselectorfrompairingstate
     */
    static GetDeviceSelectorFromPairingState(pairingState) {
        if (!BluetoothDevice.HasProp("__IBluetoothDeviceStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.BluetoothDevice")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothDeviceStatics2.IID)
            BluetoothDevice.__IBluetoothDeviceStatics2 := IBluetoothDeviceStatics2(factoryPtr)
        }

        return BluetoothDevice.__IBluetoothDeviceStatics2.GetDeviceSelectorFromPairingState(pairingState)
    }

    /**
     * Creates an Advanced Query Syntax (AQS) filter string that contains a query for Bluetooth devices with the indicated [BluetoothConnectionStatus](bluetoothconnectionstatus.md). The AQS string is passed into the [CreateWatcher](../windows.devices.enumeration/deviceinformation_createwatcher_4958831.md) method to return a collection of [DeviceInformation](../windows.devices.enumeration/deviceinformation.md) objects with the indicated Bluetooth connection status.
     * @param {Integer} connectionStatus The connection status used for constructing the AQS string.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothdevice.getdeviceselectorfromconnectionstatus
     */
    static GetDeviceSelectorFromConnectionStatus(connectionStatus) {
        if (!BluetoothDevice.HasProp("__IBluetoothDeviceStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.BluetoothDevice")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothDeviceStatics2.IID)
            BluetoothDevice.__IBluetoothDeviceStatics2 := IBluetoothDeviceStatics2(factoryPtr)
        }

        return BluetoothDevice.__IBluetoothDeviceStatics2.GetDeviceSelectorFromConnectionStatus(connectionStatus)
    }

    /**
     * Creates an Advanced Query Syntax (AQS) filter string that contains a query for the Bluetooth device name. The AQS string is passed into the [CreateWatcher](../windows.devices.enumeration/deviceinformation_createwatcher_4958831.md) method to return a collection of [DeviceInformation](../windows.devices.enumeration/deviceinformation.md) objects containing the specified Bluetooth device name.
     * @param {HSTRING} deviceName The Bluetooth device name used for constructing the AQS string.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothdevice.getdeviceselectorfromdevicename
     */
    static GetDeviceSelectorFromDeviceName(deviceName) {
        if (!BluetoothDevice.HasProp("__IBluetoothDeviceStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.BluetoothDevice")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothDeviceStatics2.IID)
            BluetoothDevice.__IBluetoothDeviceStatics2 := IBluetoothDeviceStatics2(factoryPtr)
        }

        return BluetoothDevice.__IBluetoothDeviceStatics2.GetDeviceSelectorFromDeviceName(deviceName)
    }

    /**
     * Creates an Advanced Query Syntax (AQS) filter string from a 64-bit address that represents a Bluetooth device. The AQS string is passed into the [CreateWatcher](../windows.devices.enumeration/deviceinformation_createwatcher_4958831.md) method to return a collection of [DeviceInformation](../windows.devices.enumeration/deviceinformation.md) objects.
     * @param {Integer} bluetoothAddress A 64-bit Bluetooth device address used for constructing the AQS string.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothdevice.getdeviceselectorfrombluetoothaddress
     */
    static GetDeviceSelectorFromBluetoothAddress(bluetoothAddress) {
        if (!BluetoothDevice.HasProp("__IBluetoothDeviceStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.BluetoothDevice")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothDeviceStatics2.IID)
            BluetoothDevice.__IBluetoothDeviceStatics2 := IBluetoothDeviceStatics2(factoryPtr)
        }

        return BluetoothDevice.__IBluetoothDeviceStatics2.GetDeviceSelectorFromBluetoothAddress(bluetoothAddress)
    }

    /**
     * Creates an Advanced Query Syntax (AQS) filter string from a [BluetoothClassOfDevice](bluetoothclassofdevice.md) object. The AQS string is passed into the [CreateWatcher](../windows.devices.enumeration/deviceinformation_createwatcher_4958831.md) method to return a collection of [DeviceInformation](../windows.devices.enumeration/deviceinformation.md) objects.
     * @remarks
     * Each section of the classOfDevice parameter is optional. However, if the minor class of device is set, then the major class of device must also be set. The following are behaviors related what is set.
     * 
     * + If no major/minor class of device is set, all devices matching the supplied service capabilities will be returned.
     * + If no minor class of device is set, all devices matching the major class of devices AND the supplied service capabilities will be returned.
     * + If service capabilities are set, all devices that match at LEAST the supplied service capabilities AND the major/minor class of device will be returned.
     * + If no service capabilities are set, all devices that match the major/minor class of device will be returned.
     * + If no major/minor class of device is set AND no service capabilities are set, all devices will be returned. This AQS Filter string will request an inquiry to be issued.
     * @param {BluetoothClassOfDevice} classOfDevice The class of device used for constructing the AQS string.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothdevice.getdeviceselectorfromclassofdevice
     */
    static GetDeviceSelectorFromClassOfDevice(classOfDevice) {
        if (!BluetoothDevice.HasProp("__IBluetoothDeviceStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.BluetoothDevice")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothDeviceStatics2.IID)
            BluetoothDevice.__IBluetoothDeviceStatics2 := IBluetoothDeviceStatics2(factoryPtr)
        }

        return BluetoothDevice.__IBluetoothDeviceStatics2.GetDeviceSelectorFromClassOfDevice(classOfDevice)
    }

    /**
     * Returns a [BluetoothDevice](bluetoothdevice.md) object identified by the given [DeviceId](bluetoothledevice_deviceid.md).
     * @remarks
     * This method must be called from a UI thread.
     * @param {HSTRING} deviceId The DeviceId value that identifies the BluetoothDevice instance.
     * @returns {IAsyncOperation<BluetoothDevice>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothdevice.fromidasync
     */
    static FromIdAsync(deviceId) {
        if (!BluetoothDevice.HasProp("__IBluetoothDeviceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.BluetoothDevice")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothDeviceStatics.IID)
            BluetoothDevice.__IBluetoothDeviceStatics := IBluetoothDeviceStatics(factoryPtr)
        }

        return BluetoothDevice.__IBluetoothDeviceStatics.FromIdAsync(deviceId)
    }

    /**
     * Returns a [BluetoothDevice](bluetoothdevice.md) object identified by the given [HostName](bluetoothdevice_hostname.md).
     * @param {HostName} hostName_ The HostName that identifies the BluetoothDevice instance.
     * @returns {IAsyncOperation<BluetoothDevice>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothdevice.fromhostnameasync
     */
    static FromHostNameAsync(hostName_) {
        if (!BluetoothDevice.HasProp("__IBluetoothDeviceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.BluetoothDevice")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothDeviceStatics.IID)
            BluetoothDevice.__IBluetoothDeviceStatics := IBluetoothDeviceStatics(factoryPtr)
        }

        return BluetoothDevice.__IBluetoothDeviceStatics.FromHostNameAsync(hostName_)
    }

    /**
     * Returns a [BluetoothDevice](bluetoothdevice.md) object for the given [BluetoothAddress](bluetoothdevice_bluetoothaddress.md).
     * @param {Integer} address_ The address of the Bluetooth device.
     * @returns {IAsyncOperation<BluetoothDevice>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothdevice.frombluetoothaddressasync
     */
    static FromBluetoothAddressAsync(address_) {
        if (!BluetoothDevice.HasProp("__IBluetoothDeviceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.BluetoothDevice")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothDeviceStatics.IID)
            BluetoothDevice.__IBluetoothDeviceStatics := IBluetoothDeviceStatics(factoryPtr)
        }

        return BluetoothDevice.__IBluetoothDeviceStatics.FromBluetoothAddressAsync(address_)
    }

    /**
     * Gets an Advanced Query Syntax (AQS) string for identifying instances of this device. This string is passed to the FindAllAsync or CreateWatcher method.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothdevice.getdeviceselector
     */
    static GetDeviceSelector() {
        if (!BluetoothDevice.HasProp("__IBluetoothDeviceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.BluetoothDevice")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBluetoothDeviceStatics.IID)
            BluetoothDevice.__IBluetoothDeviceStatics := IBluetoothDeviceStatics(factoryPtr)
        }

        return BluetoothDevice.__IBluetoothDeviceStatics.GetDeviceSelector()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the device ID that came from the Windows.Devices.Enumeration.DeviceInformation.Id
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothdevice.deviceid
     * @type {HSTRING} 
     */
    DeviceId {
        get => this.get_DeviceId()
    }

    /**
     * Gets the HostName of the device.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothdevice.hostname
     * @type {HostName} 
     */
    HostName {
        get => this.get_HostName()
    }

    /**
     * Gets the Name of the device.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothdevice.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * Gets the Bluetooth Class Of Device information of the device.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothdevice.classofdevice
     * @type {BluetoothClassOfDevice} 
     */
    ClassOfDevice {
        get => this.get_ClassOfDevice()
    }

    /**
     * Gets the read-only list of Service Discovery Protocol (SDP) records for the device.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothdevice.sdprecords
     * @type {IVectorView<IBuffer>} 
     */
    SdpRecords {
        get => this.get_SdpRecords()
    }

    /**
     * Gets the read-only list of RFCOMM services supported by the device.
     * 
     * > [!IMPORTANT]
     * > The **RfcommServices** API is deprecated, and it may not be available in future versions of Windows. Instead, use [GetRfcommServicesAsync](/uwp/api/windows.devices.bluetooth.bluetoothdevice.getrfcommservicesasync).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothdevice.rfcommservices
     * @type {IVectorView<RfcommDeviceService>} 
     */
    RfcommServices {
        get => this.get_RfcommServices()
    }

    /**
     * Gets the connection status of the device.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothdevice.connectionstatus
     * @type {Integer} 
     */
    ConnectionStatus {
        get => this.get_ConnectionStatus()
    }

    /**
     * Gets the device address.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothdevice.bluetoothaddress
     * @type {Integer} 
     */
    BluetoothAddress {
        get => this.get_BluetoothAddress()
    }

    /**
     * Gets the [DeviceInformation](../windows.devices.enumeration/deviceinformation.md) object for the Bluetooth device.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothdevice.deviceinformation
     * @type {DeviceInformation} 
     */
    DeviceInformation {
        get => this.get_DeviceInformation()
    }

    /**
     * The current **DeviceAccessInformation** object for the device. Used to check and monitor access changes to the device.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothdevice.deviceaccessinformation
     * @type {DeviceAccessInformation} 
     */
    DeviceAccessInformation {
        get => this.get_DeviceAccessInformation()
    }

    /**
     * Gets the bluetooth device ID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothdevice.bluetoothdeviceid
     * @type {BluetoothDeviceId} 
     */
    BluetoothDeviceId {
        get => this.get_BluetoothDeviceId()
    }

    /**
     * Gets a boolean indicating whether the BluetoothDevice was paired using a Secure Connection.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothdevice.wassecureconnectionusedforpairing
     * @type {Boolean} 
     */
    WasSecureConnectionUsedForPairing {
        get => this.get_WasSecureConnectionUsedForPairing()
    }

    /**
     * Occurs when the name of the device has changed.
     * @type {TypedEventHandler<BluetoothDevice, IInspectable>}
    */
    OnNameChanged {
        get {
            if(!this.HasProp("__OnNameChanged")){
                this.__OnNameChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{db56ce1c-5e9f-5138-9227-b1a66d60bc1b}"),
                    BluetoothDevice,
                    IInspectable
                )
                this.__OnNameChangedToken := this.add_NameChanged(this.__OnNameChanged.iface)
            }
            return this.__OnNameChanged
        }
    }

    /**
     * Occurs when the list SDP records for the device has changed.
     * @type {TypedEventHandler<BluetoothDevice, IInspectable>}
    */
    OnSdpRecordsChanged {
        get {
            if(!this.HasProp("__OnSdpRecordsChanged")){
                this.__OnSdpRecordsChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{db56ce1c-5e9f-5138-9227-b1a66d60bc1b}"),
                    BluetoothDevice,
                    IInspectable
                )
                this.__OnSdpRecordsChangedToken := this.add_SdpRecordsChanged(this.__OnSdpRecordsChanged.iface)
            }
            return this.__OnSdpRecordsChanged
        }
    }

    /**
     * Occurs when the connection status of the device has changed.
     * @type {TypedEventHandler<BluetoothDevice, IInspectable>}
    */
    OnConnectionStatusChanged {
        get {
            if(!this.HasProp("__OnConnectionStatusChanged")){
                this.__OnConnectionStatusChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{db56ce1c-5e9f-5138-9227-b1a66d60bc1b}"),
                    BluetoothDevice,
                    IInspectable
                )
                this.__OnConnectionStatusChangedToken := this.add_ConnectionStatusChanged(this.__OnConnectionStatusChanged.iface)
            }
            return this.__OnConnectionStatusChanged
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

        if(this.HasProp("__OnSdpRecordsChangedToken")) {
            this.remove_SdpRecordsChanged(this.__OnSdpRecordsChangedToken)
            this.__OnSdpRecordsChanged.iface.Dispose()
        }

        if(this.HasProp("__OnConnectionStatusChangedToken")) {
            this.remove_ConnectionStatusChanged(this.__OnConnectionStatusChangedToken)
            this.__OnConnectionStatusChanged.iface.Dispose()
        }

        this.Close()

        super.__Delete()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeviceId() {
        if (!this.HasProp("__IBluetoothDevice")) {
            if ((queryResult := this.QueryInterface(IBluetoothDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothDevice := IBluetoothDevice(outPtr)
        }

        return this.__IBluetoothDevice.get_DeviceId()
    }

    /**
     * 
     * @returns {HostName} 
     */
    get_HostName() {
        if (!this.HasProp("__IBluetoothDevice")) {
            if ((queryResult := this.QueryInterface(IBluetoothDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothDevice := IBluetoothDevice(outPtr)
        }

        return this.__IBluetoothDevice.get_HostName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Name() {
        if (!this.HasProp("__IBluetoothDevice")) {
            if ((queryResult := this.QueryInterface(IBluetoothDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothDevice := IBluetoothDevice(outPtr)
        }

        return this.__IBluetoothDevice.get_Name()
    }

    /**
     * 
     * @returns {BluetoothClassOfDevice} 
     */
    get_ClassOfDevice() {
        if (!this.HasProp("__IBluetoothDevice")) {
            if ((queryResult := this.QueryInterface(IBluetoothDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothDevice := IBluetoothDevice(outPtr)
        }

        return this.__IBluetoothDevice.get_ClassOfDevice()
    }

    /**
     * 
     * @returns {IVectorView<IBuffer>} 
     */
    get_SdpRecords() {
        if (!this.HasProp("__IBluetoothDevice")) {
            if ((queryResult := this.QueryInterface(IBluetoothDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothDevice := IBluetoothDevice(outPtr)
        }

        return this.__IBluetoothDevice.get_SdpRecords()
    }

    /**
     * 
     * @returns {IVectorView<RfcommDeviceService>} 
     */
    get_RfcommServices() {
        if (!this.HasProp("__IBluetoothDevice")) {
            if ((queryResult := this.QueryInterface(IBluetoothDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothDevice := IBluetoothDevice(outPtr)
        }

        return this.__IBluetoothDevice.get_RfcommServices()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ConnectionStatus() {
        if (!this.HasProp("__IBluetoothDevice")) {
            if ((queryResult := this.QueryInterface(IBluetoothDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothDevice := IBluetoothDevice(outPtr)
        }

        return this.__IBluetoothDevice.get_ConnectionStatus()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BluetoothAddress() {
        if (!this.HasProp("__IBluetoothDevice")) {
            if ((queryResult := this.QueryInterface(IBluetoothDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothDevice := IBluetoothDevice(outPtr)
        }

        return this.__IBluetoothDevice.get_BluetoothAddress()
    }

    /**
     * 
     * @param {TypedEventHandler<BluetoothDevice, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_NameChanged(handler) {
        if (!this.HasProp("__IBluetoothDevice")) {
            if ((queryResult := this.QueryInterface(IBluetoothDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothDevice := IBluetoothDevice(outPtr)
        }

        return this.__IBluetoothDevice.add_NameChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_NameChanged(token) {
        if (!this.HasProp("__IBluetoothDevice")) {
            if ((queryResult := this.QueryInterface(IBluetoothDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothDevice := IBluetoothDevice(outPtr)
        }

        return this.__IBluetoothDevice.remove_NameChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<BluetoothDevice, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SdpRecordsChanged(handler) {
        if (!this.HasProp("__IBluetoothDevice")) {
            if ((queryResult := this.QueryInterface(IBluetoothDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothDevice := IBluetoothDevice(outPtr)
        }

        return this.__IBluetoothDevice.add_SdpRecordsChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_SdpRecordsChanged(token) {
        if (!this.HasProp("__IBluetoothDevice")) {
            if ((queryResult := this.QueryInterface(IBluetoothDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothDevice := IBluetoothDevice(outPtr)
        }

        return this.__IBluetoothDevice.remove_SdpRecordsChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<BluetoothDevice, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ConnectionStatusChanged(handler) {
        if (!this.HasProp("__IBluetoothDevice")) {
            if ((queryResult := this.QueryInterface(IBluetoothDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothDevice := IBluetoothDevice(outPtr)
        }

        return this.__IBluetoothDevice.add_ConnectionStatusChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ConnectionStatusChanged(token) {
        if (!this.HasProp("__IBluetoothDevice")) {
            if ((queryResult := this.QueryInterface(IBluetoothDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothDevice := IBluetoothDevice(outPtr)
        }

        return this.__IBluetoothDevice.remove_ConnectionStatusChanged(token)
    }

    /**
     * 
     * @returns {DeviceInformation} 
     */
    get_DeviceInformation() {
        if (!this.HasProp("__IBluetoothDevice2")) {
            if ((queryResult := this.QueryInterface(IBluetoothDevice2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothDevice2 := IBluetoothDevice2(outPtr)
        }

        return this.__IBluetoothDevice2.get_DeviceInformation()
    }

    /**
     * 
     * @returns {DeviceAccessInformation} 
     */
    get_DeviceAccessInformation() {
        if (!this.HasProp("__IBluetoothDevice3")) {
            if ((queryResult := this.QueryInterface(IBluetoothDevice3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothDevice3 := IBluetoothDevice3(outPtr)
        }

        return this.__IBluetoothDevice3.get_DeviceAccessInformation()
    }

    /**
     * Used to request explicit access to the Bluetooth device. This invokes Device Consent and must be called on the UI thread.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothdevice.requestaccessasync
     */
    RequestAccessAsync() {
        if (!this.HasProp("__IBluetoothDevice3")) {
            if ((queryResult := this.QueryInterface(IBluetoothDevice3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothDevice3 := IBluetoothDevice3(outPtr)
        }

        return this.__IBluetoothDevice3.RequestAccessAsync()
    }

    /**
     * Retrieves all cached Rfcomm Services on the remote Bluetooth Device.
     * @returns {IAsyncOperation<RfcommDeviceServicesResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothdevice.getrfcommservicesasync
     */
    GetRfcommServicesAsync() {
        if (!this.HasProp("__IBluetoothDevice3")) {
            if ((queryResult := this.QueryInterface(IBluetoothDevice3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothDevice3 := IBluetoothDevice3(outPtr)
        }

        return this.__IBluetoothDevice3.GetRfcommServicesAsync()
    }

    /**
     * Retrieves all Rfcomm Services on the remote Bluetooth Device.
     * @param {Integer} cacheMode_ 
     * @returns {IAsyncOperation<RfcommDeviceServicesResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothdevice.getrfcommservicesasync
     */
    GetRfcommServicesWithCacheModeAsync(cacheMode_) {
        if (!this.HasProp("__IBluetoothDevice3")) {
            if ((queryResult := this.QueryInterface(IBluetoothDevice3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothDevice3 := IBluetoothDevice3(outPtr)
        }

        return this.__IBluetoothDevice3.GetRfcommServicesWithCacheModeAsync(cacheMode_)
    }

    /**
     * Retrieves all cached Rfcomm Services on the Remote Bluetooth Device matching the specified [RfcommServiceId](../windows.devices.bluetooth.rfcomm/rfcommserviceid.md).
     * @param {RfcommServiceId} serviceId The Rfcomm service id.
     * @returns {IAsyncOperation<RfcommDeviceServicesResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothdevice.getrfcommservicesforidasync
     */
    GetRfcommServicesForIdAsync(serviceId) {
        if (!this.HasProp("__IBluetoothDevice3")) {
            if ((queryResult := this.QueryInterface(IBluetoothDevice3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothDevice3 := IBluetoothDevice3(outPtr)
        }

        return this.__IBluetoothDevice3.GetRfcommServicesForIdAsync(serviceId)
    }

    /**
     * Retrieves all Rfcomm Services on the Remote Bluetooth Device matching the specified [RfcommServiceId](../windows.devices.bluetooth.rfcomm/rfcommserviceid.md).
     * @param {RfcommServiceId} serviceId The Rfcomm service id.
     * @param {Integer} cacheMode_ 
     * @returns {IAsyncOperation<RfcommDeviceServicesResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothdevice.getrfcommservicesforidasync
     */
    GetRfcommServicesForIdWithCacheModeAsync(serviceId, cacheMode_) {
        if (!this.HasProp("__IBluetoothDevice3")) {
            if ((queryResult := this.QueryInterface(IBluetoothDevice3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothDevice3 := IBluetoothDevice3(outPtr)
        }

        return this.__IBluetoothDevice3.GetRfcommServicesForIdWithCacheModeAsync(serviceId, cacheMode_)
    }

    /**
     * 
     * @returns {BluetoothDeviceId} 
     */
    get_BluetoothDeviceId() {
        if (!this.HasProp("__IBluetoothDevice4")) {
            if ((queryResult := this.QueryInterface(IBluetoothDevice4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothDevice4 := IBluetoothDevice4(outPtr)
        }

        return this.__IBluetoothDevice4.get_BluetoothDeviceId()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_WasSecureConnectionUsedForPairing() {
        if (!this.HasProp("__IBluetoothDevice5")) {
            if ((queryResult := this.QueryInterface(IBluetoothDevice5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBluetoothDevice5 := IBluetoothDevice5(outPtr)
        }

        return this.__IBluetoothDevice5.get_WasSecureConnectionUsedForPairing()
    }

    /**
     * Closes the Bluetooth device.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.bluetoothdevice.close
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
