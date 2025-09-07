#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class WBEM_GET_TEXT_FLAGS{

    /**
     * @type {Integer (Int32)}
     */
    static WBEMPATH_COMPRESSED => 1

    /**
     * @type {Integer (Int32)}
     */
    static WBEMPATH_GET_RELATIVE_ONLY => 2

    /**
     * @type {Integer (Int32)}
     */
    static WBEMPATH_GET_SERVER_TOO => 4

    /**
     * @type {Integer (Int32)}
     */
    static WBEMPATH_GET_SERVER_AND_NAMESPACE_ONLY => 8

    /**
     * @type {Integer (Int32)}
     */
    static WBEMPATH_GET_NAMESPACE_ONLY => 16

    /**
     * @type {Integer (Int32)}
     */
    static WBEMPATH_GET_ORIGINAL => 32
}
