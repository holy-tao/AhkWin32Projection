#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDeviceInformation.ahk
#Include .\IDeviceInformation2.ahk
#Include .\IDeviceInformationStatics.ahk
#Include .\IDeviceInformationStatics2.ahk
#Include .\IDeviceInformationStatics3.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a device. This class allows access to well-known device properties as well as additional properties specified during device enumeration.
 * @remarks
 * A DeviceInformation object is composed of an identity ([DeviceInformation.Id](deviceinformation_id.md)), a kind ([DeviceInformation.Kind](deviceinformation_kind.md)), and a property bag ([DeviceInformation.Properties](deviceinformation_properties.md)). All of the other properties of a DeviceInformation object are derived from the [Properties](deviceinformation_properties.md) property bag. For example, [Name](deviceinformation_name.md) is derived from **System.ItemNameDisplay**.
 * 
 * Successful completion of [FindAllAsync](deviceinformation_findallasync_1257462890.md) results in a [DeviceInformationCollection](deviceinformationcollection.md) containing DeviceInformation objects.
 * 
 * If a call to [CreateWatcher](deviceinformation_createwatcher_1506431823.md) succeeds, a DeviceInformation object is passed to the [added](devicewatcher_added.md) event for each device that is found.
 * 
 * The [Name](deviceinformation_name.md) property should only be used for display purposes only and not for finding a device because the [Name](deviceinformation_name.md) can change due to localization or a user assigning a name.
 * 
 * [CreateFromIdAsync](deviceinformation_createfromidasync_270724983.md) creates a DeviceInformation object if successful.
 * 
 * The DeviceInformation class provides device information, but more specifically, it provides properties of the device interface, the interface that represents functionality that the device exposes. Multi-function devices may have more than one device interface. The physical object that a user sees as a device, is known as the device container, and has properties such as **Manufacturer** and **ModelID**. For more information about enumerating devices and recovering properties, see [Enumerate devices](/windows/uwp/devices-sensors/enumerate-devices).
 * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.deviceinformation
 * @namespace Windows.Devices.Enumeration
 * @version WindowsRuntime 1.4
 */
class DeviceInformation extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDeviceInformation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDeviceInformation.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a [DeviceInformation](deviceinformation.md) object from a [DeviceInformation](deviceinformation.md) ID and a list of additional properties.
     * @param {HSTRING} deviceId A string containing the [DeviceInformation](deviceinformation.md) ID.
     * @returns {IAsyncOperation<DeviceInformation>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.deviceinformation.createfromidasync
     */
    static CreateFromIdAsync(deviceId) {
        if (!DeviceInformation.HasProp("__IDeviceInformationStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Enumeration.DeviceInformation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDeviceInformationStatics.IID)
            DeviceInformation.__IDeviceInformationStatics := IDeviceInformationStatics(factoryPtr)
        }

        return DeviceInformation.__IDeviceInformationStatics.CreateFromIdAsync(deviceId)
    }

    /**
     * Creates a [DeviceInformation](deviceinformation.md) object from a [DeviceInformation](deviceinformation.md) ID, a list of additional properties, and a [DeviceInformationKind](deviceinformationkind.md) parameter.
     * @param {HSTRING} deviceId A string containing the [DeviceInformation](deviceinformation.md) ID.
     * @param {IIterable<HSTRING>} additionalProperties An iterable list of additional properties to include in the [Properties](deviceinformation_properties.md) property of the [DeviceInformation](deviceinformation.md) objects in the enumeration results. For more info on what the properties represent, see [Device information properties](/windows/uwp/devices-sensors/device-information-properties).
     * @returns {IAsyncOperation<DeviceInformation>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.deviceinformation.createfromidasync
     */
    static CreateFromIdAsyncAdditionalProperties(deviceId, additionalProperties) {
        if (!DeviceInformation.HasProp("__IDeviceInformationStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Enumeration.DeviceInformation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDeviceInformationStatics.IID)
            DeviceInformation.__IDeviceInformationStatics := IDeviceInformationStatics(factoryPtr)
        }

        return DeviceInformation.__IDeviceInformationStatics.CreateFromIdAsyncAdditionalProperties(deviceId, additionalProperties)
    }

    /**
     * Enumerates [DeviceInformation](deviceinformation.md) objects of the specified class.
     * @returns {IAsyncOperation<DeviceInformationCollection>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.deviceinformation.findallasync
     */
    static FindAllAsync() {
        if (!DeviceInformation.HasProp("__IDeviceInformationStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Enumeration.DeviceInformation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDeviceInformationStatics.IID)
            DeviceInformation.__IDeviceInformationStatics := IDeviceInformationStatics(factoryPtr)
        }

        return DeviceInformation.__IDeviceInformationStatics.FindAllAsync()
    }

    /**
     * Enumerates [DeviceInformation](deviceinformation.md) objects matching the specified Advanced Query Syntax (AQS) device interface selector string and including the specified collection of properties.
     * @param {Integer} deviceClass_ 
     * @returns {IAsyncOperation<DeviceInformationCollection>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.deviceinformation.findallasync
     */
    static FindAllAsyncDeviceClass(deviceClass_) {
        if (!DeviceInformation.HasProp("__IDeviceInformationStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Enumeration.DeviceInformation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDeviceInformationStatics.IID)
            DeviceInformation.__IDeviceInformationStatics := IDeviceInformationStatics(factoryPtr)
        }

        return DeviceInformation.__IDeviceInformationStatics.FindAllAsyncDeviceClass(deviceClass_)
    }

    /**
     * Enumerates [DeviceInformation](deviceinformation.md) objects matching the specified Advanced Query Syntax (AQS) device interface selector string and including the specified collection of properties.
     * @param {HSTRING} aqsFilter An AQS device interface selector string that filters the [DeviceInformation](deviceinformation.md) objects to enumerate. Typically this string is retrieved from the **GetDeviceSelector** method of a class that interacts with devices. For example, [GetDeviceSelector](../windows.devices.portable/storagedevice_getdeviceselector_838466080.md) retrieves the string for the [StorageDevice](../windows.devices.portable/storagedevice.md) class.
     * @returns {IAsyncOperation<DeviceInformationCollection>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.deviceinformation.findallasync
     */
    static FindAllAsyncAqsFilter(aqsFilter) {
        if (!DeviceInformation.HasProp("__IDeviceInformationStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Enumeration.DeviceInformation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDeviceInformationStatics.IID)
            DeviceInformation.__IDeviceInformationStatics := IDeviceInformationStatics(factoryPtr)
        }

        return DeviceInformation.__IDeviceInformationStatics.FindAllAsyncAqsFilter(aqsFilter)
    }

    /**
     * Enumerates [DeviceInformation](deviceinformation.md) objects matching the specified Advanced Query Syntax (AQS) device interface selector string, the device kind, and including the specified collection of properties.
     * @param {HSTRING} aqsFilter An AQS device interface selector string that filters the [DeviceInformation](deviceinformation.md) objects to enumerate. Typically this string is retrieved from the **GetDeviceSelector** method of a class that interacts with devices. For example, [GetDeviceSelector](../windows.devices.portable/storagedevice_getdeviceselector_838466080.md) retrieves the string for the [StorageDevice](../windows.devices.portable/storagedevice.md) class.
     * @param {IIterable<HSTRING>} additionalProperties An iterable list of additional properties to include in the [Properties](deviceinformation_properties.md) property of the [DeviceInformation](deviceinformation.md) objects in the enumeration results. For more info on what the properties represent, see [Device information properties](/windows/uwp/devices-sensors/device-information-properties).
     * @returns {IAsyncOperation<DeviceInformationCollection>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.deviceinformation.findallasync
     */
    static FindAllAsyncAqsFilterAndAdditionalProperties(aqsFilter, additionalProperties) {
        if (!DeviceInformation.HasProp("__IDeviceInformationStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Enumeration.DeviceInformation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDeviceInformationStatics.IID)
            DeviceInformation.__IDeviceInformationStatics := IDeviceInformationStatics(factoryPtr)
        }

        return DeviceInformation.__IDeviceInformationStatics.FindAllAsyncAqsFilterAndAdditionalProperties(aqsFilter, additionalProperties)
    }

    /**
     * Creates a [DeviceWatcher](devicewatcher.md) for devices matching the specified [DeviceClass](deviceclass.md).
     * @remarks
     * The [DeviceWatcher](devicewatcher.md) first performs an initial enumeration of devices, raising an [Added](devicewatcher_added.md) event for each device that it finds, and raising an [EnumerationCompleted](devicewatcher_enumerationcompleted.md) event when the initial enumeration is complete. After the initial enumeration is complete, it raises events when a device is added, deleted, or updated.
     * 
     * See the [DeviceWatcher](devicewatcher.md) class for an example.
     * @returns {DeviceWatcher} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.deviceinformation.createwatcher
     */
    static CreateWatcher() {
        if (!DeviceInformation.HasProp("__IDeviceInformationStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Enumeration.DeviceInformation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDeviceInformationStatics.IID)
            DeviceInformation.__IDeviceInformationStatics := IDeviceInformationStatics(factoryPtr)
        }

        return DeviceInformation.__IDeviceInformationStatics.CreateWatcher()
    }

    /**
     * Creates a [DeviceWatcher](devicewatcher.md) for devices matching the specified Advanced Query Syntax (AQS) string and the specified collection of properties.
     * @remarks
     * The [DeviceWatcher](devicewatcher.md) first performs an initial enumeration of devices, raising an [Added](devicewatcher_added.md) event for each device that it finds, and raising an [EnumerationCompleted](devicewatcher_enumerationcompleted.md) event when the initial enumeration is complete. After the initial enumeration is complete, it raises events when a device is added, deleted, or updated.
     * 
     * See the [DeviceWatcher](devicewatcher.md) class for an example.
     * @param {Integer} deviceClass_ 
     * @returns {DeviceWatcher} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.deviceinformation.createwatcher
     */
    static CreateWatcherDeviceClass(deviceClass_) {
        if (!DeviceInformation.HasProp("__IDeviceInformationStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Enumeration.DeviceInformation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDeviceInformationStatics.IID)
            DeviceInformation.__IDeviceInformationStatics := IDeviceInformationStatics(factoryPtr)
        }

        return DeviceInformation.__IDeviceInformationStatics.CreateWatcherDeviceClass(deviceClass_)
    }

    /**
     * Creates a [DeviceWatcher](devicewatcher.md) for devices matching the specified Advanced Query Syntax (AQS) string and the specified collection of properties.
     * @remarks
     * The [DeviceWatcher](devicewatcher.md) first performs an initial enumeration of devices, raising an [Added](devicewatcher_added.md) event for each device that it finds, and raising an [EnumerationCompleted](devicewatcher_enumerationcompleted.md) event when the initial enumeration is complete. After the initial enumeration is complete, it raises events when a device is added, deleted, or updated.
     * 
     * See the [DeviceWatcher](devicewatcher.md) class for an example.
     * @param {HSTRING} aqsFilter An AQS string that filters the [DeviceInformation](deviceinformation.md) objects to enumerate. Typically this string is retrieved from the **GetDeviceSelector** method of a class that interacts with devices. For example, [GetDeviceSelector](../windows.devices.portable/storagedevice_getdeviceselector_838466080.md) retrieves the string for the [StorageDevice](../windows.devices.portable/storagedevice.md) class.
     * @returns {DeviceWatcher} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.deviceinformation.createwatcher
     */
    static CreateWatcherAqsFilter(aqsFilter) {
        if (!DeviceInformation.HasProp("__IDeviceInformationStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Enumeration.DeviceInformation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDeviceInformationStatics.IID)
            DeviceInformation.__IDeviceInformationStatics := IDeviceInformationStatics(factoryPtr)
        }

        return DeviceInformation.__IDeviceInformationStatics.CreateWatcherAqsFilter(aqsFilter)
    }

    /**
     * Creates a [DeviceWatcher](devicewatcher.md) for devices matching the specified Advanced Query Syntax (AQS) string, the specified collection of properties, and the kind of devices.
     * @param {HSTRING} aqsFilter An AQS string that filters the [DeviceInformation](deviceinformation.md) objects to enumerate. Typically this string is retrieved from the **GetDeviceSelector** method of a class that interacts with devices. For example, [GetDeviceSelector](../windows.devices.portable/storagedevice_getdeviceselector_838466080.md) retrieves the string for the [StorageDevice](../windows.devices.portable/storagedevice.md) class.
     * @param {IIterable<HSTRING>} additionalProperties An iterable list of additional properties to include in the [Properties](deviceinformation_properties.md) property of the [DeviceInformation](deviceinformation.md) objects in the enumeration results. For more info on what the properties represent, see [Device information properties](/windows/uwp/devices-sensors/device-information-properties).
     * @returns {DeviceWatcher} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.deviceinformation.createwatcher
     */
    static CreateWatcherAqsFilterAndAdditionalProperties(aqsFilter, additionalProperties) {
        if (!DeviceInformation.HasProp("__IDeviceInformationStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Enumeration.DeviceInformation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDeviceInformationStatics.IID)
            DeviceInformation.__IDeviceInformationStatics := IDeviceInformationStatics(factoryPtr)
        }

        return DeviceInformation.__IDeviceInformationStatics.CreateWatcherAqsFilterAndAdditionalProperties(aqsFilter, additionalProperties)
    }

    /**
     * Creates a filter to use to enumerate through a subset of device types.
     * @param {Integer} deviceClass_ The type of devices that you want to create a filter for.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.deviceinformation.getaqsfilterfromdeviceclass
     */
    static GetAqsFilterFromDeviceClass(deviceClass_) {
        if (!DeviceInformation.HasProp("__IDeviceInformationStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Enumeration.DeviceInformation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDeviceInformationStatics2.IID)
            DeviceInformation.__IDeviceInformationStatics2 := IDeviceInformationStatics2(factoryPtr)
        }

        return DeviceInformation.__IDeviceInformationStatics2.GetAqsFilterFromDeviceClass(deviceClass_)
    }

    /**
     * Asynchronously creates a [DeviceInformation](deviceinformation.md) object from a [DeviceInformation](deviceinformation.md) ID, a list of additional properties, a [DeviceInformationKind](deviceinformationkind.md), and a settings object.
     * @param {HSTRING} deviceId A string containing the [DeviceInformation](deviceinformation.md) ID.
     * @param {IIterable<HSTRING>} additionalProperties An iterable list of additional properties to include in the [Properties](deviceinformation_properties.md) property of the [DeviceInformation](deviceinformation.md) object in the enumeration results. For more info about what the properties represent, see [Device information properties](/windows/uwp/devices-sensors/device-information-properties).
     * @param {Integer} kind The type of [DeviceInformation](deviceinformation.md) object that you want to create.
     * @returns {IAsyncOperation<DeviceInformation>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.deviceinformation.createfromidasync
     */
    static CreateFromIdAsyncWithKindAndAdditionalProperties(deviceId, additionalProperties, kind) {
        if (!DeviceInformation.HasProp("__IDeviceInformationStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Enumeration.DeviceInformation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDeviceInformationStatics2.IID)
            DeviceInformation.__IDeviceInformationStatics2 := IDeviceInformationStatics2(factoryPtr)
        }

        return DeviceInformation.__IDeviceInformationStatics2.CreateFromIdAsyncWithKindAndAdditionalProperties(deviceId, additionalProperties, kind)
    }

    /**
     * Asynchronously enumerates [DeviceInformation](deviceinformation.md) objects matching the specified Advanced Query Syntax (AQS) device interface selector string, the device kind, including the specified collection of properties, and with the settings.
     * @param {HSTRING} aqsFilter An AQS device interface selector string that filters the [DeviceInformation](deviceinformation.md) objects to enumerate. Typically this string is retrieved from the **GetDeviceSelector** method of a class that interacts with devices. For example, [GetDeviceSelector](../windows.devices.portable/storagedevice_getdeviceselector_838466080.md) retrieves the string for the [StorageDevice](../windows.devices.portable/storagedevice.md) class.
     * @param {IIterable<HSTRING>} additionalProperties An iterable list of additional properties to include in the [Properties](deviceinformation_properties.md) property of the [DeviceInformation](deviceinformation.md) objects in the enumeration results. For more info on what the properties represent, see [Device information properties](/windows/uwp/devices-sensors/device-information-properties).
     * @param {Integer} kind The specific type of device to find.
     * @returns {IAsyncOperation<DeviceInformationCollection>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.deviceinformation.findallasync
     */
    static FindAllAsyncWithKindAqsFilterAndAdditionalProperties(aqsFilter, additionalProperties, kind) {
        if (!DeviceInformation.HasProp("__IDeviceInformationStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Enumeration.DeviceInformation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDeviceInformationStatics2.IID)
            DeviceInformation.__IDeviceInformationStatics2 := IDeviceInformationStatics2(factoryPtr)
        }

        return DeviceInformation.__IDeviceInformationStatics2.FindAllAsyncWithKindAqsFilterAndAdditionalProperties(aqsFilter, additionalProperties, kind)
    }

    /**
     * Creates a [DeviceWatcher](devicewatcher.md) for devices matching the specified Advanced Query Syntax (AQS) string, the specified collection of properties, the kind of device, and the settings.
     * @param {HSTRING} aqsFilter An AQS string that filters the [DeviceInformation](deviceinformation.md) objects to enumerate. Typically this string is retrieved from the **GetDeviceSelector** method of a class that interacts with devices. For example, [GetDeviceSelector](../windows.devices.portable/storagedevice_getdeviceselector_838466080.md) retrieves the string for the [StorageDevice](../windows.devices.portable/storagedevice.md) class.
     * @param {IIterable<HSTRING>} additionalProperties An iterable list of additional properties to include in the [Properties](deviceinformation_properties.md) property of the [DeviceInformation](deviceinformation.md) objects in the enumeration results. For more info on what the properties represent, see [Device information properties](/windows/uwp/devices-sensors/device-information-properties).
     * @param {Integer} kind The specific types of devices the [DeviceWatcher](devicewatcher.md) is interested in.
     * @returns {DeviceWatcher} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.deviceinformation.createwatcher
     */
    static CreateWatcherWithKindAqsFilterAndAdditionalProperties(aqsFilter, additionalProperties, kind) {
        if (!DeviceInformation.HasProp("__IDeviceInformationStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Enumeration.DeviceInformation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDeviceInformationStatics2.IID)
            DeviceInformation.__IDeviceInformationStatics2 := IDeviceInformationStatics2(factoryPtr)
        }

        return DeviceInformation.__IDeviceInformationStatics2.CreateWatcherWithKindAqsFilterAndAdditionalProperties(aqsFilter, additionalProperties, kind)
    }

    /**
     * Creates a [DeviceInformation](deviceinformation.md) object from a [DeviceInformation](deviceinformation.md) ID.
     * @param {HSTRING} deviceId The device ID.
     * @param {IIterable<HSTRING>} additionalProperties 
     * @param {Integer} kind 
     * @param {IDeviceEnumerationSettings} settings 
     * @returns {IAsyncOperation<DeviceInformation>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.deviceinformation.createfromidasync
     */
    static CreateFromIdAsyncWithAdditionalPropertiesKindAndSettings(deviceId, additionalProperties, kind, settings) {
        if (!DeviceInformation.HasProp("__IDeviceInformationStatics3")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Enumeration.DeviceInformation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDeviceInformationStatics3.IID)
            DeviceInformation.__IDeviceInformationStatics3 := IDeviceInformationStatics3(factoryPtr)
        }

        return DeviceInformation.__IDeviceInformationStatics3.CreateFromIdAsyncWithAdditionalPropertiesKindAndSettings(deviceId, additionalProperties, kind, settings)
    }

    /**
     * Enumerates all [DeviceInformation](deviceinformation.md) objects.
     * @param {HSTRING} aqsFilter 
     * @param {IIterable<HSTRING>} additionalProperties 
     * @param {Integer} kind 
     * @param {IDeviceEnumerationSettings} settings 
     * @returns {IAsyncOperation<DeviceInformationCollection>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.deviceinformation.findallasync
     */
    static FindAllAsyncWithAqsFilterAdditionalPropertiesKindAndSettings(aqsFilter, additionalProperties, kind, settings) {
        if (!DeviceInformation.HasProp("__IDeviceInformationStatics3")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Enumeration.DeviceInformation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDeviceInformationStatics3.IID)
            DeviceInformation.__IDeviceInformationStatics3 := IDeviceInformationStatics3(factoryPtr)
        }

        return DeviceInformation.__IDeviceInformationStatics3.FindAllAsyncWithAqsFilterAdditionalPropertiesKindAndSettings(aqsFilter, additionalProperties, kind, settings)
    }

    /**
     * Creates a [DeviceWatcher](devicewatcher.md) for all devices.
     * @remarks
     * The [DeviceWatcher](devicewatcher.md) first performs an initial enumeration of devices, raising an [Added](devicewatcher_added.md) event for each device that it finds, and raising an [EnumerationCompleted](devicewatcher_enumerationcompleted.md) event when the initial enumeration is complete. After the initial enumeration is complete, it raises events when a device is added, deleted, or updated.
     * 
     * See the [DeviceWatcher](devicewatcher.md) class for an example.
     * @param {HSTRING} aqsFilter 
     * @param {IIterable<HSTRING>} additionalProperties 
     * @param {Integer} kind 
     * @param {IDeviceEnumerationSettings} settings 
     * @returns {DeviceWatcher} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.deviceinformation.createwatcher
     */
    static CreateWatcherWithAqsFilterAdditionalPropertiesKindAndSettings(aqsFilter, additionalProperties, kind, settings) {
        if (!DeviceInformation.HasProp("__IDeviceInformationStatics3")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Enumeration.DeviceInformation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDeviceInformationStatics3.IID)
            DeviceInformation.__IDeviceInformationStatics3 := IDeviceInformationStatics3(factoryPtr)
        }

        return DeviceInformation.__IDeviceInformationStatics3.CreateWatcherWithAqsFilterAdditionalPropertiesKindAndSettings(aqsFilter, additionalProperties, kind, settings)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * A string representing the identity of the device.
     * @remarks
     * This ID can be used to activate device functionality using the [CreateFromIdAsync](deviceinformation_createfromidasync_270724983.md) methods on classes that implement device functionality.
     * 
     * By default, calling [DeviceInformation.FindAllAsync](../windows.devices.enumeration/deviceinformation_findallasync_1257462890.md) returns a collection of  [DeviceInformation](../windows.devices.enumeration/deviceinformation.md) objects that describe device interfaces (rather than devices). Consequently, the value of **DeviceInformation.Id** for those objects is a device interface identifier (rather than a device identifier). There are overloads of **DeviceInformation.FindAllAsync** to which you can pass a [DeviceInformationKind](deviceinformationkind.md) to control whether the returned **DeviceInformation** objects represent devices, device interfaces, or other kinds of information.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.deviceinformation.id
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * The name of the device. This name is in the best available language for the app.
     * @remarks
     * The Name property should only be used for display purposes only and not for finding a device because the Name can change due to localization or a user assigning a name.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.deviceinformation.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * Indicates whether this device is enabled.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.deviceinformation.isenabled
     * @type {Boolean} 
     */
    IsEnabled {
        get => this.get_IsEnabled()
    }

    /**
     * Indicates whether this device is the default device for the class.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.deviceinformation.isdefault
     * @type {Boolean} 
     */
    IsDefault {
        get => this.get_IsDefault()
    }

    /**
     * The physical location of the device in its enclosure. For example, it may describe the location of a webcam inside a laptop.
     * @remarks
     * If no enclosure location information is available, the property will be null.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.deviceinformation.enclosurelocation
     * @type {EnclosureLocation} 
     */
    EnclosureLocation {
        get => this.get_EnclosureLocation()
    }

    /**
     * Property store containing well-known values as well as additional properties that can be specified during device enumeration.
     * @remarks
     * For more info on what the properties represent, see [Device information properties](/windows/uwp/devices-sensors/device-information-properties).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.deviceinformation.properties
     * @type {IMapView<HSTRING, IInspectable>} 
     */
    Properties {
        get => this.get_Properties()
    }

    /**
     * Gets the type of [DeviceInformation](deviceinformation.md) represented by this object.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.deviceinformation.kind
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
    }

    /**
     * Gets the information about the capabilities for this device to pair.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.deviceinformation.pairing
     * @type {DeviceInformationPairing} 
     */
    Pairing {
        get => this.get_Pairing()
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
    get_Id() {
        if (!this.HasProp("__IDeviceInformation")) {
            if ((queryResult := this.QueryInterface(IDeviceInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceInformation := IDeviceInformation(outPtr)
        }

        return this.__IDeviceInformation.get_Id()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Name() {
        if (!this.HasProp("__IDeviceInformation")) {
            if ((queryResult := this.QueryInterface(IDeviceInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceInformation := IDeviceInformation(outPtr)
        }

        return this.__IDeviceInformation.get_Name()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsEnabled() {
        if (!this.HasProp("__IDeviceInformation")) {
            if ((queryResult := this.QueryInterface(IDeviceInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceInformation := IDeviceInformation(outPtr)
        }

        return this.__IDeviceInformation.get_IsEnabled()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDefault() {
        if (!this.HasProp("__IDeviceInformation")) {
            if ((queryResult := this.QueryInterface(IDeviceInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceInformation := IDeviceInformation(outPtr)
        }

        return this.__IDeviceInformation.get_IsDefault()
    }

    /**
     * 
     * @returns {EnclosureLocation} 
     */
    get_EnclosureLocation() {
        if (!this.HasProp("__IDeviceInformation")) {
            if ((queryResult := this.QueryInterface(IDeviceInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceInformation := IDeviceInformation(outPtr)
        }

        return this.__IDeviceInformation.get_EnclosureLocation()
    }

    /**
     * 
     * @returns {IMapView<HSTRING, IInspectable>} 
     */
    get_Properties() {
        if (!this.HasProp("__IDeviceInformation")) {
            if ((queryResult := this.QueryInterface(IDeviceInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceInformation := IDeviceInformation(outPtr)
        }

        return this.__IDeviceInformation.get_Properties()
    }

    /**
     * Updates the properties of an existing [DeviceInformation](deviceinformation.md) object.
     * @remarks
     * For more info on what the properties represent, see [Device information properties](/windows/uwp/devices-sensors/device-information-properties).
     * @param {DeviceInformationUpdate} updateInfo Indicates the properties to update.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.deviceinformation.update
     */
    Update(updateInfo) {
        if (!this.HasProp("__IDeviceInformation")) {
            if ((queryResult := this.QueryInterface(IDeviceInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceInformation := IDeviceInformation(outPtr)
        }

        return this.__IDeviceInformation.Update(updateInfo)
    }

    /**
     * Returns a thumbnail image for the device.
     * @returns {IAsyncOperation<DeviceThumbnail>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.deviceinformation.getthumbnailasync
     */
    GetThumbnailAsync() {
        if (!this.HasProp("__IDeviceInformation")) {
            if ((queryResult := this.QueryInterface(IDeviceInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceInformation := IDeviceInformation(outPtr)
        }

        return this.__IDeviceInformation.GetThumbnailAsync()
    }

    /**
     * Gets a glyph for the device.
     * @returns {IAsyncOperation<DeviceThumbnail>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.deviceinformation.getglyphthumbnailasync
     */
    GetGlyphThumbnailAsync() {
        if (!this.HasProp("__IDeviceInformation")) {
            if ((queryResult := this.QueryInterface(IDeviceInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceInformation := IDeviceInformation(outPtr)
        }

        return this.__IDeviceInformation.GetGlyphThumbnailAsync()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Kind() {
        if (!this.HasProp("__IDeviceInformation2")) {
            if ((queryResult := this.QueryInterface(IDeviceInformation2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceInformation2 := IDeviceInformation2(outPtr)
        }

        return this.__IDeviceInformation2.get_Kind()
    }

    /**
     * 
     * @returns {DeviceInformationPairing} 
     */
    get_Pairing() {
        if (!this.HasProp("__IDeviceInformation2")) {
            if ((queryResult := this.QueryInterface(IDeviceInformation2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeviceInformation2 := IDeviceInformation2(outPtr)
        }

        return this.__IDeviceInformation2.get_Pairing()
    }

;@endregion Instance Methods
}
