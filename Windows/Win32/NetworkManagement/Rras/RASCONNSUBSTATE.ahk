#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class RASCONNSUBSTATE{

    /**
     * @type {Integer (Int32)}
     */
    static RASCSS_None => 0

    /**
     * @type {Integer (Int32)}
     */
    static RASCSS_Dormant => 1

    /**
     * @type {Integer (Int32)}
     */
    static RASCSS_Reconnecting => 2

    /**
     * @type {Integer (Int32)}
     */
    static RASCSS_Reconnected => 8192
}
