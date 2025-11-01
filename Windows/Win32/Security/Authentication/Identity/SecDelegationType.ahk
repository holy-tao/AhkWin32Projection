#Requires AutoHotkey v2.0.0 64-bit

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ne-sspi-secdelegationtype
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SecDelegationType{

    /**
     * @type {Integer (Int32)}
     */
    static SecFull => 0

    /**
     * @type {Integer (Int32)}
     */
    static SecService => 1

    /**
     * @type {Integer (Int32)}
     */
    static SecTree => 2

    /**
     * @type {Integer (Int32)}
     */
    static SecDirectory => 3

    /**
     * @type {Integer (Int32)}
     */
    static SecObject => 4
}
