#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the type of service.
 * @see https://learn.microsoft.com/windows/win32/api/icftypes/ne-icftypes-net_fw_service_type
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 */
export default struct NET_FW_SERVICE_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
