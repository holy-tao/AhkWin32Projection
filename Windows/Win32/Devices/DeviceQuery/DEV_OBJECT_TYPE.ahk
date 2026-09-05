#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.DeviceQuery
 */
class DEV_OBJECT_TYPE extends Win32Enum {

    /**
     * Native name: DevObjectTypeUnknown
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * Native name: DevObjectTypeDeviceInterface
     * @type {Integer (Int32)}
     */
    static DeviceInterface => 1

    /**
     * Native name: DevObjectTypeDeviceContainer
     * @type {Integer (Int32)}
     */
    static DeviceContainer => 2

    /**
     * Native name: DevObjectTypeDevice
     * @type {Integer (Int32)}
     */
    static Device => 3

    /**
     * Native name: DevObjectTypeDeviceInterfaceClass
     * @type {Integer (Int32)}
     */
    static DeviceInterfaceClass => 4

    /**
     * Native name: DevObjectTypeAEP
     * @type {Integer (Int32)}
     */
    static TypeAEP => 5

    /**
     * Native name: DevObjectTypeAEPContainer
     * @type {Integer (Int32)}
     */
    static TypeAEPContainer => 6

    /**
     * Native name: DevObjectTypeDeviceInstallerClass
     * @type {Integer (Int32)}
     */
    static DeviceInstallerClass => 7

    /**
     * Native name: DevObjectTypeDeviceInterfaceDisplay
     * @type {Integer (Int32)}
     */
    static DeviceInterfaceDisplay => 8

    /**
     * Native name: DevObjectTypeDeviceContainerDisplay
     * @type {Integer (Int32)}
     */
    static DeviceContainerDisplay => 9

    /**
     * Native name: DevObjectTypeAEPService
     * @type {Integer (Int32)}
     */
    static TypeAEPService => 10

    /**
     * Native name: DevObjectTypeDevicePanel
     * @type {Integer (Int32)}
     */
    static DevicePanel => 11

    /**
     * Native name: DevObjectTypeAEPProtocol
     * @type {Integer (Int32)}
     */
    static TypeAEPProtocol => 12
}
