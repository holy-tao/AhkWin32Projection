#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGattDeviceService.ahk
#Include ..\..\..\Foundation\IClosable.ahk
#Include .\IGattDeviceService2.ahk
#Include .\IGattDeviceService3.ahk
#Include .\IGattDeviceServiceStatics.ahk
#Include .\IGattDeviceServiceStatics2.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a GATT Primary Service on a Bluetooth device. The GattDeviceService class represents a GATT service on a Bluetooth LE device. It is instantiated by using a device service instance path, obtained by finding a device using the [Windows.Devices.Enumeration](../windows.devices.enumeration/windows_devices_enumeration.md) API.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattdeviceservice
 * @namespace Windows.Devices.Bluetooth.GenericAttributeProfile
 * @version WindowsRuntime 1.4
 */
class GattDeviceService extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGattDeviceService

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGattDeviceService.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Instantiates a new GattDeviceService object from the device ID.
     * @param {HSTRING} deviceId The GATT device ID.
     * @returns {IAsyncOperation<GattDeviceService>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattdeviceservice.fromidasync
     */
    static FromIdAsync(deviceId) {
        if (!GattDeviceService.HasProp("__IGattDeviceServiceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattDeviceService")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattDeviceServiceStatics.IID)
            GattDeviceService.__IGattDeviceServiceStatics := IGattDeviceServiceStatics(factoryPtr)
        }

        return GattDeviceService.__IGattDeviceServiceStatics.FromIdAsync(deviceId)
    }

    /**
     * Creates a suitable AQS Filter string for use with the [CreateWatcher](../windows.devices.enumeration/deviceinformation_createwatcher_4958831.md) method, from a Bluetooth service UUID.
     * @param {Guid} serviceUuid A 128-bit Bluetooth GATT Service UUID, represented as a standard [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) object.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattdeviceservice.getdeviceselectorfromuuid
     */
    static GetDeviceSelectorFromUuid(serviceUuid) {
        if (!GattDeviceService.HasProp("__IGattDeviceServiceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattDeviceService")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattDeviceServiceStatics.IID)
            GattDeviceService.__IGattDeviceServiceStatics := IGattDeviceServiceStatics(factoryPtr)
        }

        return GattDeviceService.__IGattDeviceServiceStatics.GetDeviceSelectorFromUuid(serviceUuid)
    }

    /**
     * Creates a suitable AQS Filter string for use with the [CreateWatcher](../windows.devices.enumeration/deviceinformation_createwatcher_4958831.md) method, from a 16-bit Bluetooth GATT Service UUID.
     * 
     * > [!IMPORTANT]
     * > The **GetDeviceSelectorFromShortId** API is deprecated, and it may not be available in future versions of Windows. Instead, use [GetDeviceSelectorFromUuid](/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattdeviceservice.getdeviceselectorfromuuid).
     * @param {Integer} serviceShortId A 16-bit Bluetooth GATT Service UUID.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattdeviceservice.getdeviceselectorfromshortid
     */
    static GetDeviceSelectorFromShortId(serviceShortId) {
        if (!GattDeviceService.HasProp("__IGattDeviceServiceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattDeviceService")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattDeviceServiceStatics.IID)
            GattDeviceService.__IGattDeviceServiceStatics := IGattDeviceServiceStatics(factoryPtr)
        }

        return GattDeviceService.__IGattDeviceServiceStatics.GetDeviceSelectorFromShortId(serviceShortId)
    }

    /**
     * Converts a Bluetooth SIG defined short Id to a full GATT UUID.
     * 
     * > [!IMPORTANT]
     * > The **ConvertShortIdToUuid** API is deprecated, and it may not be available in future versions of Windows. Instead, use [BluetoothUuidHelper.FromShortId](/uwp/api/windows.devices.bluetooth.bluetoothuuidhelper.fromshortid).
     * @param {Integer} shortId A 16-bit Bluetooth GATT Service UUID.
     * @returns {Guid} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattdeviceservice.convertshortidtouuid
     */
    static ConvertShortIdToUuid(shortId) {
        if (!GattDeviceService.HasProp("__IGattDeviceServiceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattDeviceService")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattDeviceServiceStatics.IID)
            GattDeviceService.__IGattDeviceServiceStatics := IGattDeviceServiceStatics(factoryPtr)
        }

        return GattDeviceService.__IGattDeviceServiceStatics.ConvertShortIdToUuid(shortId)
    }

    /**
     * Instantiates a new GattDeviceService from the device ID.
     * @remarks
     * The first time this method is invoked by a store app, it should be called from a UI thread in order to display the consent prompt. After the user has granted consent, the method can be invoked from any application thread.
     * 
     * If a store app has not declared the right capabilities or the user does not grant consent, the method returns a null object.
     * 
     * - For Universal Windows Platform (UWP) apps, use the **bluetooth** capability. For more info see [App capability declarations](/windows/uwp/packaging/app-capability-declarations).
     * - For Windows 8.x store apps, see [How to specify device capabilities for Bluetooth (Windows)](/uwp/schemas/appxpackage/how-to-specify-device-capabilities-for-bluetooth) to declare the right capabilities.
     * @param {HSTRING} deviceId The GATT device ID.
     * @param {Integer} sharingMode 
     * @returns {IAsyncOperation<GattDeviceService>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattdeviceservice.fromidasync
     */
    static FromIdWithSharingModeAsync(deviceId, sharingMode) {
        if (!GattDeviceService.HasProp("__IGattDeviceServiceStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattDeviceService")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattDeviceServiceStatics2.IID)
            GattDeviceService.__IGattDeviceServiceStatics2 := IGattDeviceServiceStatics2(factoryPtr)
        }

        return GattDeviceService.__IGattDeviceServiceStatics2.FromIdWithSharingModeAsync(deviceId, sharingMode)
    }

    /**
     * Creates a suitable AQS Filter string for use with the [CreateWatcher](../windows.devices.enumeration/deviceinformation_createwatcher_4958831.md) method, from a BluetoothDeviceId.
     * @param {BluetoothDeviceId} bluetoothDeviceId_ The bluetooth device ID.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattdeviceservice.getdeviceselectorforbluetoothdeviceid
     */
    static GetDeviceSelectorForBluetoothDeviceId(bluetoothDeviceId_) {
        if (!GattDeviceService.HasProp("__IGattDeviceServiceStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattDeviceService")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattDeviceServiceStatics2.IID)
            GattDeviceService.__IGattDeviceServiceStatics2 := IGattDeviceServiceStatics2(factoryPtr)
        }

        return GattDeviceService.__IGattDeviceServiceStatics2.GetDeviceSelectorForBluetoothDeviceId(bluetoothDeviceId_)
    }

    /**
     * Creates a suitable AQS Filter string for use with the [CreateWatcher](../windows.devices.enumeration/deviceinformation_createwatcher_4958831.md) method, from a BluetoothDeviceId.
     * @param {BluetoothDeviceId} bluetoothDeviceId_ The bluetooth device ID.
     * @param {Integer} cacheMode_ 
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattdeviceservice.getdeviceselectorforbluetoothdeviceid
     */
    static GetDeviceSelectorForBluetoothDeviceIdWithCacheMode(bluetoothDeviceId_, cacheMode_) {
        if (!GattDeviceService.HasProp("__IGattDeviceServiceStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattDeviceService")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattDeviceServiceStatics2.IID)
            GattDeviceService.__IGattDeviceServiceStatics2 := IGattDeviceServiceStatics2(factoryPtr)
        }

        return GattDeviceService.__IGattDeviceServiceStatics2.GetDeviceSelectorForBluetoothDeviceIdWithCacheMode(bluetoothDeviceId_, cacheMode_)
    }

    /**
     * Creates a suitable AQS Filter string for use with the [CreateWatcher](../windows.devices.enumeration/deviceinformation_createwatcher_4958831.md) method, from a BluetoothDeviceId and serviceUuid.
     * @param {BluetoothDeviceId} bluetoothDeviceId_ The bluetooth device ID.
     * @param {Guid} serviceUuid The GATT service ID.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattdeviceservice.getdeviceselectorforbluetoothdeviceidanduuid
     */
    static GetDeviceSelectorForBluetoothDeviceIdAndUuid(bluetoothDeviceId_, serviceUuid) {
        if (!GattDeviceService.HasProp("__IGattDeviceServiceStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattDeviceService")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattDeviceServiceStatics2.IID)
            GattDeviceService.__IGattDeviceServiceStatics2 := IGattDeviceServiceStatics2(factoryPtr)
        }

        return GattDeviceService.__IGattDeviceServiceStatics2.GetDeviceSelectorForBluetoothDeviceIdAndUuid(bluetoothDeviceId_, serviceUuid)
    }

    /**
     * Creates a suitable AQS Filter string for use with the [CreateWatcher](../windows.devices.enumeration/deviceinformation_createwatcher_4958831.md) method, from a BluetoothDeviceId and serviceUuid.
     * @param {BluetoothDeviceId} bluetoothDeviceId_ The bluetooth device ID.
     * @param {Guid} serviceUuid The GATT service ID.
     * @param {Integer} cacheMode_ 
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattdeviceservice.getdeviceselectorforbluetoothdeviceidanduuid
     */
    static GetDeviceSelectorForBluetoothDeviceIdAndUuidWithCacheMode(bluetoothDeviceId_, serviceUuid, cacheMode_) {
        if (!GattDeviceService.HasProp("__IGattDeviceServiceStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattDeviceService")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattDeviceServiceStatics2.IID)
            GattDeviceService.__IGattDeviceServiceStatics2 := IGattDeviceServiceStatics2(factoryPtr)
        }

        return GattDeviceService.__IGattDeviceServiceStatics2.GetDeviceSelectorForBluetoothDeviceIdAndUuidWithCacheMode(bluetoothDeviceId_, serviceUuid, cacheMode_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Get the string that represents the GATT service instance path used to instantiate the GattDeviceService.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattdeviceservice.deviceid
     * @type {HSTRING} 
     */
    DeviceId {
        get => this.get_DeviceId()
    }

    /**
     * Gets the GATT Service UUID associated with this **GattDeviceService**.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattdeviceservice.uuid
     * @type {Guid} 
     */
    Uuid {
        get => this.get_Uuid()
    }

    /**
     * Gets the handle used to uniquely identify GATT-based service attributes as declared on the Bluetooth LE device.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattdeviceservice.attributehandle
     * @type {Integer} 
     */
    AttributeHandle {
        get => this.get_AttributeHandle()
    }

    /**
     * Gets the [BluetoothLEDevice](../windows.devices.bluetooth/bluetoothledevice.md) object describing the device associated with the current [GattDeviceService](gattdeviceservice.md) object.
     * 
     * > [!IMPORTANT]
     * > The **Device** API is deprecated, and it may not be available in future versions of Windows. Instead, use [Session](/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattdeviceservice.session).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattdeviceservice.device
     * @type {BluetoothLEDevice} 
     */
    Device {
        get => this.get_Device()
    }

    /**
     * Gets the read-only list of parent services for this service.
     * 
     * > [!IMPORTANT]
     * > The **ParentServices** API is deprecated, and it may not be available in future versions of Windows.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattdeviceservice.parentservices
     * @type {IVectorView<GattDeviceService>} 
     */
    ParentServices {
        get => this.get_ParentServices()
    }

    /**
     * Gets the device access information associated with the current [GattDeviceService](gattdeviceservice.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattdeviceservice.deviceaccessinformation
     * @type {DeviceAccessInformation} 
     */
    DeviceAccessInformation {
        get => this.get_DeviceAccessInformation()
    }

    /**
     * Gets the session for this GATT device service instance.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattdeviceservice.session
     * @type {GattSession} 
     */
    Session {
        get => this.get_Session()
    }

    /**
     * Gets the sharing mode for this GATT device service instance.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattdeviceservice.sharingmode
     * @type {Integer} 
     */
    SharingMode {
        get => this.get_SharingMode()
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
     * Returns a vector of characteristics, that are identified by the specified UUID and belong to this GattDeviceService instance.
     * 
     * > [!IMPORTANT]
     * > The **GetCharacteristics** API is deprecated, and it may not be available in future versions of Windows. Instead, use [GetCharacteristicsForUuidAsync](/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattdeviceservice.getcharacteristicsforuuidasync).
     * @remarks
     * Only a single app can access a single service. If one app has registered a GATT notification trigger, this method will throw an exception for all other apps that sub subsequently call this API.
     * @param {Guid} characteristicUuid The UUID for the characteristics to be retrieved.
     * @returns {IVectorView<GattCharacteristic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattdeviceservice.getcharacteristics
     */
    GetCharacteristics(characteristicUuid) {
        if (!this.HasProp("__IGattDeviceService")) {
            if ((queryResult := this.QueryInterface(IGattDeviceService.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattDeviceService := IGattDeviceService(outPtr)
        }

        return this.__IGattDeviceService.GetCharacteristics(characteristicUuid)
    }

    /**
     * Returns a vector of included services, that are identified by the specified UUID and belong to this GattDeviceService instance.
     * 
     * > [!IMPORTANT]
     * > The **GetIncludedServices** API is deprecated, and it may not be available in future versions of Windows. Instead, use [GetIncludedServicesForUuidAsync](/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattdeviceservice.getincludedservicesforuuidasync).
     * @param {Guid} serviceUuid The UUID for the included services to be retrieved.
     * @returns {IVectorView<GattDeviceService>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattdeviceservice.getincludedservices
     */
    GetIncludedServices(serviceUuid) {
        if (!this.HasProp("__IGattDeviceService")) {
            if ((queryResult := this.QueryInterface(IGattDeviceService.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattDeviceService := IGattDeviceService(outPtr)
        }

        return this.__IGattDeviceService.GetIncludedServices(serviceUuid)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeviceId() {
        if (!this.HasProp("__IGattDeviceService")) {
            if ((queryResult := this.QueryInterface(IGattDeviceService.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattDeviceService := IGattDeviceService(outPtr)
        }

        return this.__IGattDeviceService.get_DeviceId()
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_Uuid() {
        if (!this.HasProp("__IGattDeviceService")) {
            if ((queryResult := this.QueryInterface(IGattDeviceService.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattDeviceService := IGattDeviceService(outPtr)
        }

        return this.__IGattDeviceService.get_Uuid()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AttributeHandle() {
        if (!this.HasProp("__IGattDeviceService")) {
            if ((queryResult := this.QueryInterface(IGattDeviceService.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattDeviceService := IGattDeviceService(outPtr)
        }

        return this.__IGattDeviceService.get_AttributeHandle()
    }

    /**
     * Releases the resources associated with the **GattDeviceService** class. This allows other apps to access the resources of the **GattDeviceService** in question. Don't use a **GattDeviceService** object after you've invoked **Close** on it; instead, instantiate a new **GattDeviceService** object by using the [FromIdAsync](./gattdeviceservice_fromidasync_116749634.md) method.
     * 
     * For C++, call **Close**. For .NET languages, this **Close** method is projected into [Dispose](/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattdeviceservice.dispose).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattdeviceservice.close
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
     * @returns {BluetoothLEDevice} 
     */
    get_Device() {
        if (!this.HasProp("__IGattDeviceService2")) {
            if ((queryResult := this.QueryInterface(IGattDeviceService2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattDeviceService2 := IGattDeviceService2(outPtr)
        }

        return this.__IGattDeviceService2.get_Device()
    }

    /**
     * 
     * @returns {IVectorView<GattDeviceService>} 
     */
    get_ParentServices() {
        if (!this.HasProp("__IGattDeviceService2")) {
            if ((queryResult := this.QueryInterface(IGattDeviceService2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattDeviceService2 := IGattDeviceService2(outPtr)
        }

        return this.__IGattDeviceService2.get_ParentServices()
    }

    /**
     * Gets the collection of all characteristics belonging to this GattDeviceService instance.
     * 
     * > [!IMPORTANT]
     * > The **GetAllCharacteristics** API is deprecated, and it may not be available in future versions of Windows. Instead, use [GetCharacteristicsAsync](/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattdeviceservice.getcharacteristicsasync).
     * @returns {IVectorView<GattCharacteristic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattdeviceservice.getallcharacteristics
     */
    GetAllCharacteristics() {
        if (!this.HasProp("__IGattDeviceService2")) {
            if ((queryResult := this.QueryInterface(IGattDeviceService2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattDeviceService2 := IGattDeviceService2(outPtr)
        }

        return this.__IGattDeviceService2.GetAllCharacteristics()
    }

    /**
     * Gets the collection of all included services belonging to this GattDeviceService instance.
     * 
     * > [!IMPORTANT]
     * > The **GetAllCharacteristics** API is deprecated, and it may not be available in future versions of Windows. Instead, use [GetIncludedServicesAsync](/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattdeviceservice.getincludedservicesasync).
     * @returns {IVectorView<GattDeviceService>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattdeviceservice.getallincludedservices
     */
    GetAllIncludedServices() {
        if (!this.HasProp("__IGattDeviceService2")) {
            if ((queryResult := this.QueryInterface(IGattDeviceService2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattDeviceService2 := IGattDeviceService2(outPtr)
        }

        return this.__IGattDeviceService2.GetAllIncludedServices()
    }

    /**
     * 
     * @returns {DeviceAccessInformation} 
     */
    get_DeviceAccessInformation() {
        if (!this.HasProp("__IGattDeviceService3")) {
            if ((queryResult := this.QueryInterface(IGattDeviceService3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattDeviceService3 := IGattDeviceService3(outPtr)
        }

        return this.__IGattDeviceService3.get_DeviceAccessInformation()
    }

    /**
     * 
     * @returns {GattSession} 
     */
    get_Session() {
        if (!this.HasProp("__IGattDeviceService3")) {
            if ((queryResult := this.QueryInterface(IGattDeviceService3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattDeviceService3 := IGattDeviceService3(outPtr)
        }

        return this.__IGattDeviceService3.get_Session()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SharingMode() {
        if (!this.HasProp("__IGattDeviceService3")) {
            if ((queryResult := this.QueryInterface(IGattDeviceService3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattDeviceService3 := IGattDeviceService3(outPtr)
        }

        return this.__IGattDeviceService3.get_SharingMode()
    }

    /**
     * Requests access to the GattDeviceService.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattdeviceservice.requestaccessasync
     */
    RequestAccessAsync() {
        if (!this.HasProp("__IGattDeviceService3")) {
            if ((queryResult := this.QueryInterface(IGattDeviceService3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattDeviceService3 := IGattDeviceService3(outPtr)
        }

        return this.__IGattDeviceService3.RequestAccessAsync()
    }

    /**
     * Opens the GATT device service with the specified sharingMode.
     * @param {Integer} sharingMode The sharing mode.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattdeviceservice.openasync
     */
    OpenAsync(sharingMode) {
        if (!this.HasProp("__IGattDeviceService3")) {
            if ((queryResult := this.QueryInterface(IGattDeviceService3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattDeviceService3 := IGattDeviceService3(outPtr)
        }

        return this.__IGattDeviceService3.OpenAsync(sharingMode)
    }

    /**
     * Gets the characteristics that are part of this GattDeviceService instance.
     * @returns {IAsyncOperation<GattCharacteristicsResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattdeviceservice.getcharacteristicsasync
     */
    GetCharacteristicsAsync() {
        if (!this.HasProp("__IGattDeviceService3")) {
            if ((queryResult := this.QueryInterface(IGattDeviceService3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattDeviceService3 := IGattDeviceService3(outPtr)
        }

        return this.__IGattDeviceService3.GetCharacteristicsAsync()
    }

    /**
     * Gets the characteristics that are part of this GattDeviceService instance.
     * @param {Integer} cacheMode_ 
     * @returns {IAsyncOperation<GattCharacteristicsResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattdeviceservice.getcharacteristicsasync
     */
    GetCharacteristicsWithCacheModeAsync(cacheMode_) {
        if (!this.HasProp("__IGattDeviceService3")) {
            if ((queryResult := this.QueryInterface(IGattDeviceService3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattDeviceService3 := IGattDeviceService3(outPtr)
        }

        return this.__IGattDeviceService3.GetCharacteristicsWithCacheModeAsync(cacheMode_)
    }

    /**
     * Gets the characterisitics that are part of this GattDeviceService instance and associated with the characteristicUuid.
     * @param {Guid} characteristicUuid The UUID for the characteristics to be retrieved.
     * @returns {IAsyncOperation<GattCharacteristicsResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattdeviceservice.getcharacteristicsforuuidasync
     */
    GetCharacteristicsForUuidAsync(characteristicUuid) {
        if (!this.HasProp("__IGattDeviceService3")) {
            if ((queryResult := this.QueryInterface(IGattDeviceService3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattDeviceService3 := IGattDeviceService3(outPtr)
        }

        return this.__IGattDeviceService3.GetCharacteristicsForUuidAsync(characteristicUuid)
    }

    /**
     * Gets the characterisitics that are part of this GattDeviceService instance and associated with the characteristicUuid.
     * @param {Guid} characteristicUuid The UUID for the characteristics to be retrieved.
     * @param {Integer} cacheMode_ 
     * @returns {IAsyncOperation<GattCharacteristicsResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattdeviceservice.getcharacteristicsforuuidasync
     */
    GetCharacteristicsForUuidWithCacheModeAsync(characteristicUuid, cacheMode_) {
        if (!this.HasProp("__IGattDeviceService3")) {
            if ((queryResult := this.QueryInterface(IGattDeviceService3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattDeviceService3 := IGattDeviceService3(outPtr)
        }

        return this.__IGattDeviceService3.GetCharacteristicsForUuidWithCacheModeAsync(characteristicUuid, cacheMode_)
    }

    /**
     * Gets the included services that are associated with this GattDeviceService instance.
     * @returns {IAsyncOperation<GattDeviceServicesResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattdeviceservice.getincludedservicesasync
     */
    GetIncludedServicesAsync() {
        if (!this.HasProp("__IGattDeviceService3")) {
            if ((queryResult := this.QueryInterface(IGattDeviceService3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattDeviceService3 := IGattDeviceService3(outPtr)
        }

        return this.__IGattDeviceService3.GetIncludedServicesAsync()
    }

    /**
     * Gets the included services that are associated with this GattDeviceService instance.
     * @param {Integer} cacheMode_ 
     * @returns {IAsyncOperation<GattDeviceServicesResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattdeviceservice.getincludedservicesasync
     */
    GetIncludedServicesWithCacheModeAsync(cacheMode_) {
        if (!this.HasProp("__IGattDeviceService3")) {
            if ((queryResult := this.QueryInterface(IGattDeviceService3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattDeviceService3 := IGattDeviceService3(outPtr)
        }

        return this.__IGattDeviceService3.GetIncludedServicesWithCacheModeAsync(cacheMode_)
    }

    /**
     * Gets the included services from the serviceUuid that is associated with this GattDeviceService instance.
     * @param {Guid} serviceUuid A 128-bit Bluetooth GATT Service UUID, represented as a standard [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) object.
     * @returns {IAsyncOperation<GattDeviceServicesResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattdeviceservice.getincludedservicesforuuidasync
     */
    GetIncludedServicesForUuidAsync(serviceUuid) {
        if (!this.HasProp("__IGattDeviceService3")) {
            if ((queryResult := this.QueryInterface(IGattDeviceService3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattDeviceService3 := IGattDeviceService3(outPtr)
        }

        return this.__IGattDeviceService3.GetIncludedServicesForUuidAsync(serviceUuid)
    }

    /**
     * Gets the included services from the serviceUuid that is associated with this GattDeviceService instance.
     * @param {Guid} serviceUuid A 128-bit Bluetooth GATT Service UUID, represented as a standard [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) object.
     * @param {Integer} cacheMode_ 
     * @returns {IAsyncOperation<GattDeviceServicesResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattdeviceservice.getincludedservicesforuuidasync
     */
    GetIncludedServicesForUuidWithCacheModeAsync(serviceUuid, cacheMode_) {
        if (!this.HasProp("__IGattDeviceService3")) {
            if ((queryResult := this.QueryInterface(IGattDeviceService3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattDeviceService3 := IGattDeviceService3(outPtr)
        }

        return this.__IGattDeviceService3.GetIncludedServicesForUuidWithCacheModeAsync(serviceUuid, cacheMode_)
    }

;@endregion Instance Methods
}
