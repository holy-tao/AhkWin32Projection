#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
class USER_PRIV extends Win32Enum {

    /**
     * Native name: USER_PRIV_GUEST
     * @type {Integer (UInt32)}
     */
    static GUEST => 0

    /**
     * Native name: USER_PRIV_USER
     * @type {Integer (UInt32)}
     */
    static USER => 1

    /**
     * Native name: USER_PRIV_ADMIN
     * @type {Integer (UInt32)}
     */
    static ADMIN => 2
}
