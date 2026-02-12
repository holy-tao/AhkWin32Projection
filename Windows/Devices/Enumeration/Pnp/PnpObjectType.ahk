#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * > [!IMPORTANT]
  * > We no longer recommend that you use the types in the **Windows.Devices.Enumeration.Pnp** namespace. Instead, the types in the [Windows.Devices.Enumeration](/uwp/api/windows.devices.enumeration) namespace implement a modern, and better maintained, superset of the functionality of **Windows.Devices.Enumeration.Pnp**.
  * >
  * > The alternative to **PnpObjectType** is the [Windows.Devices.Enumeration.DeviceInformationKind](/uwp/api/windows.devices.enumeration.deviceinformationkind) enum, which you can pass as a parameter to **Windows.Devices.Enumeration** APIs. For example, instead of using **PnpObjectType** when you create a **PnpObjectWatcher**, use **DeviceInformationKind** when you create a [DeviceWatcher](/uwp/api/windows.devices.enumeration.devicewatcher).
  * 
  * Defines constants that specify the type of device represented by the [PnpObject](pnpobject.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.pnp.pnpobjecttype
 * @namespace Windows.Devices.Enumeration.Pnp
 * @version WindowsRuntime 1.4
 */
class PnpObjectType extends Win32Enum{

    /**
     * The object is of an unknown type. This value is not used.
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * The [PnpObject](pnpobject.md) represents a device interface.
     * @type {Integer (Int32)}
     */
    static DeviceInterface => 1

    /**
     * The [PnpObject](pnpobject.md) represents a device container.
     * @type {Integer (Int32)}
     */
    static DeviceContainer => 2

    /**
     * The [PnpObject](pnpobject.md) represents a device.
     * @type {Integer (Int32)}
     */
    static Device => 3

    /**
     * The [PnpObject](pnpobject.md) represents a device interface class.
     * @type {Integer (Int32)}
     */
    static DeviceInterfaceClass => 4

    /**
     * The [PnpObject](pnpobject.md) represents an association endpoint.
     * @type {Integer (Int32)}
     */
    static AssociationEndpoint => 5

    /**
     * The [PnpObject](pnpobject.md) represents an association endpoint container.
     * @type {Integer (Int32)}
     */
    static AssociationEndpointContainer => 6

    /**
     * The [PnpObject](pnpobject.md) represents an association endpoint service.
     * @type {Integer (Int32)}
     */
    static AssociationEndpointService => 7

    /**
     * The [PnpObject](pnpobject.md) represents a device input panel.
     * @type {Integer (Int32)}
     */
    static DevicePanel => 8

    /**
     * Specifies that the [PnpObject](pnpobject.md) represents an association endpoint protocol.
     * @type {Integer (Int32)}
     */
    static AssociationEndpointProtocol => 9
}
