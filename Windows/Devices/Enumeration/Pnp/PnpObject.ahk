#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPnpObject.ahk
#Include .\IPnpObjectStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * > [!IMPORTANT]
  * > We no longer recommend that you use the types in the **Windows.Devices.Enumeration.Pnp** namespace. Instead, the types in the [Windows.Devices.Enumeration](/uwp/api/windows.devices.enumeration) namespace implement a modern, and better maintained, superset of the functionality of **Windows.Devices.Enumeration.Pnp**.
  * >
  * > The alternative to **PnpObjectType** is the [Windows.Devices.Enumeration.DeviceInformationKind](/uwp/api/windows.devices.enumeration.deviceinformationkind) enum, which you can pass as a parameter to **Windows.Devices.Enumeration** APIs. For example, instead of using **PnpObjectType** when you create a **PnpObjectWatcher**, use **DeviceInformationKind** when you create a [DeviceWatcher](/uwp/api/windows.devices.enumeration.devicewatcher).
  * 
  * Represents a PnP object. This class allows access to well-known properties of a PnP object as well as a property store of additional properties that are specified to be retrieved from the PnP object.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.pnp.pnpobject
 * @namespace Windows.Devices.Enumeration.Pnp
 * @version WindowsRuntime 1.4
 */
class PnpObject extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPnpObject

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPnpObject.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * > [!IMPORTANT]
     * > We no longer recommend that you use the types in the **Windows.Devices.Enumeration.Pnp** namespace. Instead, the types in the [Windows.Devices.Enumeration](/uwp/api/windows.devices.enumeration) namespace implement a modern, and better maintained, superset of the functionality of **Windows.Devices.Enumeration.Pnp**.
     * >
     * > The alternative to **PnpObjectType** is the [Windows.Devices.Enumeration.DeviceInformationKind](/uwp/api/windows.devices.enumeration.deviceinformationkind) enum, which you can pass as a parameter to **Windows.Devices.Enumeration** APIs. For example, instead of using **PnpObjectType** when you create a **PnpObjectWatcher**, use **DeviceInformationKind** when you create a [DeviceWatcher](/uwp/api/windows.devices.enumeration.devicewatcher).
     * 
     * Creates a [PnpObject](pnpobject.md) object asynchronously from a previously saved [DeviceInformation](../windows.devices.enumeration/deviceinformation.md) ID.
     * @param {Integer} type The type of the [PnpObject](pnpobject.md).
     * @param {HSTRING} id The string value identifying the [PnpObject](pnpobject.md).
     * @param {IIterable<HSTRING>} requestedProperties An iterable list of additional properties to include in the [Properties](../windows.devices.enumeration/deviceinformation_properties.md) property of the [PnpObject](pnpobject.md) object to create. For more info on what the properties represent, see [Device information properties](/windows/uwp/devices-sensors/device-information-properties).
     * @returns {IAsyncOperation<PnpObject>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.pnp.pnpobject.createfromidasync
     */
    static CreateFromIdAsync(type, id, requestedProperties) {
        if (!PnpObject.HasProp("__IPnpObjectStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Enumeration.Pnp.PnpObject")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPnpObjectStatics.IID)
            PnpObject.__IPnpObjectStatics := IPnpObjectStatics(factoryPtr)
        }

        return PnpObject.__IPnpObjectStatics.CreateFromIdAsync(type, id, requestedProperties)
    }

    /**
     * > [!IMPORTANT]
     * > We no longer recommend that you use the types in the **Windows.Devices.Enumeration.Pnp** namespace. Instead, the types in the [Windows.Devices.Enumeration](/uwp/api/windows.devices.enumeration) namespace implement a modern, and better maintained, superset of the functionality of **Windows.Devices.Enumeration.Pnp**.
     * >
     * > The alternative to **PnpObjectType** is the [Windows.Devices.Enumeration.DeviceInformationKind](/uwp/api/windows.devices.enumeration.deviceinformationkind) enum, which you can pass as a parameter to **Windows.Devices.Enumeration** APIs. For example, instead of using **PnpObjectType** when you create a **PnpObjectWatcher**, use **DeviceInformationKind** when you create a [DeviceWatcher](/uwp/api/windows.devices.enumeration.devicewatcher).
     * 
     * Returns all of the PnP objects of a specified type that match the specified filter.
     * @param {Integer} type The type of the [PnpObject](pnpobject.md).
     * @param {IIterable<HSTRING>} requestedProperties An iterable list of additional properties to include in the [Properties](pnpobject_properties.md) property of the [PnpObject](pnpobject.md) objects included in enumeration results. For more info on what the properties represent, see [Device information properties](/windows/uwp/devices-sensors/device-information-properties).
     * @returns {IAsyncOperation<PnpObjectCollection>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.pnp.pnpobject.findallasync
     */
    static FindAllAsync(type, requestedProperties) {
        if (!PnpObject.HasProp("__IPnpObjectStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Enumeration.Pnp.PnpObject")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPnpObjectStatics.IID)
            PnpObject.__IPnpObjectStatics := IPnpObjectStatics(factoryPtr)
        }

        return PnpObject.__IPnpObjectStatics.FindAllAsync(type, requestedProperties)
    }

    /**
     * > [!IMPORTANT]
     * > We no longer recommend that you use the types in the **Windows.Devices.Enumeration.Pnp** namespace. Instead, the types in the [Windows.Devices.Enumeration](/uwp/api/windows.devices.enumeration) namespace implement a modern, and better maintained, superset of the functionality of **Windows.Devices.Enumeration.Pnp**.
     * >
     * > The alternative to **PnpObjectType** is the [Windows.Devices.Enumeration.DeviceInformationKind](/uwp/api/windows.devices.enumeration.deviceinformationkind) enum, which you can pass as a parameter to **Windows.Devices.Enumeration** APIs. For example, instead of using **PnpObjectType** when you create a **PnpObjectWatcher**, use **DeviceInformationKind** when you create a [DeviceWatcher](/uwp/api/windows.devices.enumeration.devicewatcher).
     * 
     * Returns all of the PnP objects of a specified type that match the specified criteria.
     * @param {Integer} type The type of the [PnpObject](pnpobject.md).
     * @param {IIterable<HSTRING>} requestedProperties An iterable list of additional properties to include in the [Properties](pnpobject_properties.md) property of the [PnpObject](pnpobject.md) objects included in enumeration results. For more info on what the properties represent, see [Device information properties](/windows/uwp/devices-sensors/device-information-properties).
     * @param {HSTRING} aqsFilter 
     * @returns {IAsyncOperation<PnpObjectCollection>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.pnp.pnpobject.findallasync
     */
    static FindAllAsyncAqsFilter(type, requestedProperties, aqsFilter) {
        if (!PnpObject.HasProp("__IPnpObjectStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Enumeration.Pnp.PnpObject")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPnpObjectStatics.IID)
            PnpObject.__IPnpObjectStatics := IPnpObjectStatics(factoryPtr)
        }

        return PnpObject.__IPnpObjectStatics.FindAllAsyncAqsFilter(type, requestedProperties, aqsFilter)
    }

    /**
     * > [!IMPORTANT]
     * > We no longer recommend that you use the types in the **Windows.Devices.Enumeration.Pnp** namespace. Instead, the types in the [Windows.Devices.Enumeration](/uwp/api/windows.devices.enumeration) namespace implement a modern, and better maintained, superset of the functionality of **Windows.Devices.Enumeration.Pnp**.
     * >
     * > The alternative to **PnpObjectType** is the [Windows.Devices.Enumeration.DeviceInformationKind](/uwp/api/windows.devices.enumeration.deviceinformationkind) enum, which you can pass as a parameter to **Windows.Devices.Enumeration** APIs. For example, instead of using **PnpObjectType** when you create a **PnpObjectWatcher**, use **DeviceInformationKind** when you create a [DeviceWatcher](/uwp/api/windows.devices.enumeration.devicewatcher).
     * 
     * Returns a [PnpObjectWatcher](pnpobjectwatcher.md) object that is used to enumerate a filtered collection of PnP objects using events.
     * @param {Integer} type The type of the [PnpObject](pnpobject.md).
     * @param {IIterable<HSTRING>} requestedProperties An iterable list of additional properties to include in the [Properties](pnpobject_properties.md) property of the [PnpObject](pnpobject.md) objects included in enumeration results. For more info on what the properties represent, see [Device information properties](/windows/uwp/devices-sensors/device-information-properties).
     * @returns {PnpObjectWatcher} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.pnp.pnpobject.createwatcher
     */
    static CreateWatcher(type, requestedProperties) {
        if (!PnpObject.HasProp("__IPnpObjectStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Enumeration.Pnp.PnpObject")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPnpObjectStatics.IID)
            PnpObject.__IPnpObjectStatics := IPnpObjectStatics(factoryPtr)
        }

        return PnpObject.__IPnpObjectStatics.CreateWatcher(type, requestedProperties)
    }

    /**
     * > [!IMPORTANT]
     * > We no longer recommend that you use the types in the **Windows.Devices.Enumeration.Pnp** namespace. Instead, the types in the [Windows.Devices.Enumeration](/uwp/api/windows.devices.enumeration) namespace implement a modern, and better maintained, superset of the functionality of **Windows.Devices.Enumeration.Pnp**.
     * >
     * > The alternative to **PnpObjectType** is the [Windows.Devices.Enumeration.DeviceInformationKind](/uwp/api/windows.devices.enumeration.deviceinformationkind) enum, which you can pass as a parameter to **Windows.Devices.Enumeration** APIs. For example, instead of using **PnpObjectType** when you create a **PnpObjectWatcher**, use **DeviceInformationKind** when you create a [DeviceWatcher](/uwp/api/windows.devices.enumeration.devicewatcher).
     * 
     * Returns a [PnpObjectWatcher](pnpobjectwatcher.md) object that is used to enumerate the PnP objects in the collection using events.
     * @remarks
     * [CreateWatcher](pnpobject_createwatcher_1842907357.md) is a primary starting point method for enumerating device objects. A client should use this API to enumerate [PnpObject](pnpobject.md)s if they want the enumeration to happen incrementally, or if they want the results to be updated as things change. For example, if a [PnpObject](pnpobject.md) is added, removed or its properties are updated, the client will register event handlers with the returned watcher object to receive the enumerated [PnpObject](pnpobject.md) as well as the later updates.
     * @param {Integer} type The type of the [PnpObject](pnpobject.md).
     * @param {IIterable<HSTRING>} requestedProperties An iterable list of additional properties to include in the [Properties](pnpobject_properties.md) property of the [PnpObject](pnpobject.md) objects included in enumeration results. For more info on what the properties represent, see [Device information properties](/windows/uwp/devices-sensors/device-information-properties).
     * @param {HSTRING} aqsFilter 
     * @returns {PnpObjectWatcher} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.pnp.pnpobject.createwatcher
     */
    static CreateWatcherAqsFilter(type, requestedProperties, aqsFilter) {
        if (!PnpObject.HasProp("__IPnpObjectStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Enumeration.Pnp.PnpObject")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPnpObjectStatics.IID)
            PnpObject.__IPnpObjectStatics := IPnpObjectStatics(factoryPtr)
        }

        return PnpObject.__IPnpObjectStatics.CreateWatcherAqsFilter(type, requestedProperties, aqsFilter)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * > [!IMPORTANT]
     * > We no longer recommend that you use the types in the **Windows.Devices.Enumeration.Pnp** namespace. Instead, the types in the [Windows.Devices.Enumeration](/uwp/api/windows.devices.enumeration) namespace implement a modern, and better maintained, superset of the functionality of **Windows.Devices.Enumeration.Pnp**.
     * >
     * > The alternative to **PnpObjectType** is the [Windows.Devices.Enumeration.DeviceInformationKind](/uwp/api/windows.devices.enumeration.deviceinformationkind) enum, which you can pass as a parameter to **Windows.Devices.Enumeration** APIs. For example, instead of using **PnpObjectType** when you create a **PnpObjectWatcher**, use **DeviceInformationKind** when you create a [DeviceWatcher](/uwp/api/windows.devices.enumeration.devicewatcher).
     * 
     * The type of the [PnpObject](pnpobject.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.pnp.pnpobject.type
     * @type {Integer} 
     */
    Type {
        get => this.get_Type()
    }

    /**
     * > [!IMPORTANT]
     * > We no longer recommend that you use the types in the **Windows.Devices.Enumeration.Pnp** namespace. Instead, the types in the [Windows.Devices.Enumeration](/uwp/api/windows.devices.enumeration) namespace implement a modern, and better maintained, superset of the functionality of **Windows.Devices.Enumeration.Pnp**.
     * >
     * > The alternative to **PnpObjectType** is the [Windows.Devices.Enumeration.DeviceInformationKind](/uwp/api/windows.devices.enumeration.deviceinformationkind) enum, which you can pass as a parameter to **Windows.Devices.Enumeration** APIs. For example, instead of using **PnpObjectType** when you create a **PnpObjectWatcher**, use **DeviceInformationKind** when you create a [DeviceWatcher](/uwp/api/windows.devices.enumeration.devicewatcher).
     * 
     * A string representing the identity of the [PnpObject](pnpobject.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.pnp.pnpobject.id
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * > [!IMPORTANT]
     * > We no longer recommend that you use the types in the **Windows.Devices.Enumeration.Pnp** namespace. Instead, the types in the [Windows.Devices.Enumeration](/uwp/api/windows.devices.enumeration) namespace implement a modern, and better maintained, superset of the functionality of **Windows.Devices.Enumeration.Pnp**.
     * >
     * > The alternative to **PnpObjectType** is the [Windows.Devices.Enumeration.DeviceInformationKind](/uwp/api/windows.devices.enumeration.deviceinformationkind) enum, which you can pass as a parameter to **Windows.Devices.Enumeration** APIs. For example, instead of using **PnpObjectType** when you create a **PnpObjectWatcher**, use **DeviceInformationKind** when you create a [DeviceWatcher](/uwp/api/windows.devices.enumeration.devicewatcher).
     * 
     * A property store containing well-known values as well as additional specified properties.
     * @remarks
     * For more info on what the properties represent, see [Device information properties](/windows/uwp/devices-sensors/device-information-properties).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.pnp.pnpobject.properties
     * @type {IMapView<HSTRING, IInspectable>} 
     */
    Properties {
        get => this.get_Properties()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Type() {
        if (!this.HasProp("__IPnpObject")) {
            if ((queryResult := this.QueryInterface(IPnpObject.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPnpObject := IPnpObject(outPtr)
        }

        return this.__IPnpObject.get_Type()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        if (!this.HasProp("__IPnpObject")) {
            if ((queryResult := this.QueryInterface(IPnpObject.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPnpObject := IPnpObject(outPtr)
        }

        return this.__IPnpObject.get_Id()
    }

    /**
     * 
     * @returns {IMapView<HSTRING, IInspectable>} 
     */
    get_Properties() {
        if (!this.HasProp("__IPnpObject")) {
            if ((queryResult := this.QueryInterface(IPnpObject.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPnpObject := IPnpObject(outPtr)
        }

        return this.__IPnpObject.get_Properties()
    }

    /**
     * > [!IMPORTANT]
     * > We no longer recommend that you use the types in the **Windows.Devices.Enumeration.Pnp** namespace. Instead, the types in the [Windows.Devices.Enumeration](/uwp/api/windows.devices.enumeration) namespace implement a modern, and better maintained, superset of the functionality of **Windows.Devices.Enumeration.Pnp**.
     * >
     * > The alternative to **PnpObjectType** is the [Windows.Devices.Enumeration.DeviceInformationKind](/uwp/api/windows.devices.enumeration.deviceinformationkind) enum, which you can pass as a parameter to **Windows.Devices.Enumeration** APIs. For example, instead of using **PnpObjectType** when you create a **PnpObjectWatcher**, use **DeviceInformationKind** when you create a [DeviceWatcher](/uwp/api/windows.devices.enumeration.devicewatcher).
     * 
     * Updates the properties of an existing [PnpObject](pnpobject.md) by applying the changes described in a [PnpObjectUpdate](pnpobjectupdate.md) object.
     * @param {PnpObjectUpdate} updateInfo Indicates the properties to update.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.pnp.pnpobject.update
     */
    Update(updateInfo) {
        if (!this.HasProp("__IPnpObject")) {
            if ((queryResult := this.QueryInterface(IPnpObject.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPnpObject := IPnpObject(outPtr)
        }

        return this.__IPnpObject.Update(updateInfo)
    }

;@endregion Instance Methods
}
