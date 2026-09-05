#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of service.
 * @see https://learn.microsoft.com/windows/win32/api/icftypes/ne-icftypes-net_fw_service_type
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 */
class NET_FW_SERVICE_TYPE extends Win32Enum {

    /**
     * Service type is File and Print Sharing.
     * Native name: NET_FW_SERVICE_FILE_AND_PRINT
     * @type {Integer (Int32)}
     */
    static FILE_AND_PRINT => 0

    /**
     * Service type is UPnP Framework.
     * Native name: NET_FW_SERVICE_UPNP
     * @type {Integer (Int32)}
     */
    static UPNP => 1

    /**
     * Service type is Remote Desktop.
     * Native name: NET_FW_SERVICE_REMOTE_DESKTOP
     * @type {Integer (Int32)}
     */
    static REMOTE_DESKTOP => 2

    /**
     * Not a valid service type. This is used to indicate that a port is not part of a service.
     * Native name: NET_FW_SERVICE_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 3

    /**
     * Used for boundary checking only. Not valid for application programming.
     * Native name: NET_FW_SERVICE_TYPE_MAX
     * @type {Integer (Int32)}
     */
    static MAX => 4
}
