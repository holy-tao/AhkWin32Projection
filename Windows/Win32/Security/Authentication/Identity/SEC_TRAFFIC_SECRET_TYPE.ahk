#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Indicates the traffic secret type used.
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ne-sspi-sec_traffic_secret_type
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
class SEC_TRAFFIC_SECRET_TYPE extends Win32Enum {

    /**
     * No traffic secret is used.
     * Native name: SecTrafficSecret_None
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * The traffic secret is handled by the client.
     * Native name: SecTrafficSecret_Client
     * @type {Integer (Int32)}
     */
    static Client => 1

    /**
     * The traffic secret is handled by the server.
     * Native name: SecTrafficSecret_Server
     * @type {Integer (Int32)}
     */
    static Server => 2
}
