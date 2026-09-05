#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * HDV_PCI_INTERFACE_VERSION Enumeration
 * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/hdv/HdvPciInterfaceVersion
 * @namespace Windows.Win32.System.Hypervisor
 */
class HDV_PCI_INTERFACE_VERSION extends Win32Enum {

    /**
     * Native name: HdvPciDeviceInterfaceVersionInvalid
     * @type {Integer (Int32)}
     */
    static DeviceInterfaceVersionInvalid => 0

    /**
     * Native name: HdvPciDeviceInterfaceVersion1
     * @type {Integer (Int32)}
     */
    static DeviceInterfaceVersion1 => 1
}
