#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Indicates the traffic secret type used.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ne-sspi-sec_traffic_secret_type
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SEC_TRAFFIC_SECRET_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * No traffic secret is used.
     * @type {Integer (Int32)}
     */
    static SecTrafficSecret_None => 0

    /**
     * The traffic secret is handled by the client.
     * @type {Integer (Int32)}
     */
    static SecTrafficSecret_Client => 1

    /**
     * The traffic secret is handled by the server.
     * @type {Integer (Int32)}
     */
    static SecTrafficSecret_Server => 2
}
