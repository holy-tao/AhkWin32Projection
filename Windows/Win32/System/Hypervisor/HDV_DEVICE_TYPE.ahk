#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/hdv/HdvDeviceType
 * @namespace Windows.Win32.System.Hypervisor
 * @version v4.0.30319
 */
class HDV_DEVICE_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static HdvDeviceTypeUndefined => 0

    /**
     * @type {Integer (Int32)}
     */
    static HdvDeviceTypePCI => 1
}
