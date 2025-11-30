#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class NET_VALIDATE_PASSWORD_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NetValidateAuthentication => 1

    /**
     * @type {Integer (Int32)}
     */
    static NetValidatePasswordChange => 2

    /**
     * @type {Integer (Int32)}
     */
    static NetValidatePasswordReset => 3
}
