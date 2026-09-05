#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
class NET_VALIDATE_PASSWORD_TYPE extends Win32Enum {

    /**
     * Native name: NetValidateAuthentication
     * @type {Integer (Int32)}
     */
    static Authentication => 1

    /**
     * Native name: NetValidatePasswordChange
     * @type {Integer (Int32)}
     */
    static Change => 2

    /**
     * Native name: NetValidatePasswordReset
     * @type {Integer (Int32)}
     */
    static Reset => 3
}
