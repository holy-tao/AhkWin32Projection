#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
class OBO_TOKEN_TYPE extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static OBO_USER => 1

    /**
     * @type {Integer (Int32)}
     */
    static OBO_COMPONENT => 2

    /**
     * @type {Integer (Int32)}
     */
    static OBO_SOFTWARE => 3
}
