#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
class OBO_TOKEN_TYPE extends Win32Enum {

    /**
     * Native name: OBO_USER
     * @type {Integer (Int32)}
     */
    static USER => 1

    /**
     * Native name: OBO_COMPONENT
     * @type {Integer (Int32)}
     */
    static COMPONENT => 2

    /**
     * Native name: OBO_SOFTWARE
     * @type {Integer (Int32)}
     */
    static SOFTWARE => 3
}
