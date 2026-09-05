#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The WMDMMessage enumeration type defines message types and states.
 * @see https://learn.microsoft.com/windows/win32/WMDM/wmdmmessage
 * @namespace Windows.Win32.Media.DeviceManager
 */
class WMDMMessage extends Win32Enum {

    /**
     * Native name: WMDM_MSG_DEVICE_ARRIVAL
     * @type {Integer (Int32)}
     */
    static MSG_DEVICE_ARRIVAL => 0

    /**
     * Native name: WMDM_MSG_DEVICE_REMOVAL
     * @type {Integer (Int32)}
     */
    static MSG_DEVICE_REMOVAL => 1

    /**
     * Native name: WMDM_MSG_MEDIA_ARRIVAL
     * @type {Integer (Int32)}
     */
    static MSG_MEDIA_ARRIVAL => 2

    /**
     * Native name: WMDM_MSG_MEDIA_REMOVAL
     * @type {Integer (Int32)}
     */
    static MSG_MEDIA_REMOVAL => 3
}
