#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the type of service.
 * @see https://docs.microsoft.com/windows/win32/api//icftypes/ne-icftypes-net_fw_service_type
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 * @version v4.0.30319
 */
class NET_FW_SERVICE_TYPE{

    /**
     * Service type is File and Print Sharing.
     * @type {Integer (Int32)}
     */
    static NET_FW_SERVICE_FILE_AND_PRINT => 0

    /**
     * Service type is UPnP Framework.
     * @type {Integer (Int32)}
     */
    static NET_FW_SERVICE_UPNP => 1

    /**
     * Service type is Remote Desktop.
     * @type {Integer (Int32)}
     */
    static NET_FW_SERVICE_REMOTE_DESKTOP => 2

    /**
     * Not a valid service type. This is used to indicate that a port is not part of a service.
     * @type {Integer (Int32)}
     */
    static NET_FW_SERVICE_NONE => 3

    /**
     * Used for boundary checking only. Not valid for application programming.
     * @type {Integer (Int32)}
     */
    static NET_FW_SERVICE_TYPE_MAX => 4
}
