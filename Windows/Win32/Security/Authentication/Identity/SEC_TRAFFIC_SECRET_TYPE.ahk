#Requires AutoHotkey v2.0.0 64-bit

/**
 * Indicates the traffic secret type used.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ne-sspi-sec_traffic_secret_type
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SEC_TRAFFIC_SECRET_TYPE{

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
