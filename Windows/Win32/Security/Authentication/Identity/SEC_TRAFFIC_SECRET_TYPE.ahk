#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ne-sspi-sec_traffic_secret_type
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SEC_TRAFFIC_SECRET_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SecTrafficSecret_None => 0

    /**
     * @type {Integer (Int32)}
     */
    static SecTrafficSecret_Client => 1

    /**
     * @type {Integer (Int32)}
     */
    static SecTrafficSecret_Server => 2
}
