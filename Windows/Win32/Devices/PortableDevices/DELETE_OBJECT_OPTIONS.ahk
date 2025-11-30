#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/wpd_sdk/delete-object-options
 * @namespace Windows.Win32.Devices.PortableDevices
 * @version v4.0.30319
 */
class DELETE_OBJECT_OPTIONS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static PORTABLE_DEVICE_DELETE_NO_RECURSION => 0

    /**
     * @type {Integer (Int32)}
     */
    static PORTABLE_DEVICE_DELETE_WITH_RECURSION => 1
}
