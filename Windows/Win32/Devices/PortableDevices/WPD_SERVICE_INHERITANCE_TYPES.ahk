#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the inheritance relationship for a service.
 * @see https://learn.microsoft.com/windows/win32/wpd_sdk/wpd-service-inheritance-types2
 * @namespace Windows.Win32.Devices.PortableDevices
 */
class WPD_SERVICE_INHERITANCE_TYPES extends Win32Enum {

    /**
     * Native name: WPD_SERVICE_INHERITANCE_IMPLEMENTATION
     * @type {Integer (Int32)}
     */
    static IMPLEMENTATION => 0
}
