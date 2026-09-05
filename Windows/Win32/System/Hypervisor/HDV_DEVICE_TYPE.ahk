#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * HDV_DEVICE_TYPE
 * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/hdv/HdvDeviceType
 * @namespace Windows.Win32.System.Hypervisor
 */
class HDV_DEVICE_TYPE extends Win32Enum {

    /**
     * Native name: HdvDeviceTypeUndefined
     * @type {Integer (Int32)}
     */
    static Undefined => 0

    /**
     * Native name: HdvDeviceTypePCI
     * @type {Integer (Int32)}
     */
    static TypePCI => 1
}
