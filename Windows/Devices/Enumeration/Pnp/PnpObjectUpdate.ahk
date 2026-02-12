#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPnpObjectUpdate.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * > [!IMPORTANT]
  * > We no longer recommend that you use the types in the **Windows.Devices.Enumeration.Pnp** namespace. Instead, the types in the [Windows.Devices.Enumeration](/uwp/api/windows.devices.enumeration) namespace implement a modern, and better maintained, superset of the functionality of **Windows.Devices.Enumeration.Pnp**.
  * >
  * > The alternative to **PnpObjectType** is the [Windows.Devices.Enumeration.DeviceInformationKind](/uwp/api/windows.devices.enumeration.deviceinformationkind) enum, which you can pass as a parameter to **Windows.Devices.Enumeration** APIs. For example, instead of using **PnpObjectType** when you create a **PnpObjectWatcher**, use **DeviceInformationKind** when you create a [DeviceWatcher](/uwp/api/windows.devices.enumeration.devicewatcher).
  * 
  * Contains the updated properties of a [PnpObject](pnpobject.md).
 * @remarks
 * Retrieve an instance of this class from the [Updated](pnpobjectwatcher_updated.md) event.
 * 
 * Instantiate an instance of this class to pass to the [Update](pnpobject_update_414576016.md) method.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.pnp.pnpobjectupdate
 * @namespace Windows.Devices.Enumeration.Pnp
 * @version WindowsRuntime 1.4
 */
class PnpObjectUpdate extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPnpObjectUpdate

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPnpObjectUpdate.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * > [!IMPORTANT]
     * > We no longer recommend that you use the types in the **Windows.Devices.Enumeration.Pnp** namespace. Instead, the types in the [Windows.Devices.Enumeration](/uwp/api/windows.devices.enumeration) namespace implement a modern, and better maintained, superset of the functionality of **Windows.Devices.Enumeration.Pnp**.
     * >
     * > The alternative to **PnpObjectType** is the [Windows.Devices.Enumeration.DeviceInformationKind](/uwp/api/windows.devices.enumeration.deviceinformationkind) enum, which you can pass as a parameter to **Windows.Devices.Enumeration** APIs. For example, instead of using **PnpObjectType** when you create a **PnpObjectWatcher**, use **DeviceInformationKind** when you create a [DeviceWatcher](/uwp/api/windows.devices.enumeration.devicewatcher).
     * 
     * The type of the [PnpObject](pnpobject.md). One of the values of the [PnpObjectType](pnpobjecttype.md) enumeration.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.pnp.pnpobjectupdate.type
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
     * The identifier of the [PnpObject](pnpobject.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.pnp.pnpobjectupdate.id
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
     * The changed properties in an update to a [PnpObject](pnpobject.md).
     * @remarks
     * For more info on what the properties represent, see [Device information properties](/windows/uwp/devices-sensors/device-information-properties).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.pnp.pnpobjectupdate.properties
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
        if (!this.HasProp("__IPnpObjectUpdate")) {
            if ((queryResult := this.QueryInterface(IPnpObjectUpdate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPnpObjectUpdate := IPnpObjectUpdate(outPtr)
        }

        return this.__IPnpObjectUpdate.get_Type()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        if (!this.HasProp("__IPnpObjectUpdate")) {
            if ((queryResult := this.QueryInterface(IPnpObjectUpdate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPnpObjectUpdate := IPnpObjectUpdate(outPtr)
        }

        return this.__IPnpObjectUpdate.get_Id()
    }

    /**
     * 
     * @returns {IMapView<HSTRING, IInspectable>} 
     */
    get_Properties() {
        if (!this.HasProp("__IPnpObjectUpdate")) {
            if ((queryResult := this.QueryInterface(IPnpObjectUpdate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPnpObjectUpdate := IPnpObjectUpdate(outPtr)
        }

        return this.__IPnpObjectUpdate.get_Properties()
    }

;@endregion Instance Methods
}
