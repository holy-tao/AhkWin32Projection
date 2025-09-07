#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class MSIPATCHSTATE{

    /**
     * @type {Integer (Int32)}
     */
    static MSIPATCHSTATE_INVALID => 0

    /**
     * @type {Integer (Int32)}
     */
    static MSIPATCHSTATE_APPLIED => 1

    /**
     * @type {Integer (Int32)}
     */
    static MSIPATCHSTATE_SUPERSEDED => 2

    /**
     * @type {Integer (Int32)}
     */
    static MSIPATCHSTATE_OBSOLETED => 4

    /**
     * @type {Integer (Int32)}
     */
    static MSIPATCHSTATE_REGISTERED => 8

    /**
     * @type {Integer (Int32)}
     */
    static MSIPATCHSTATE_ALL => 15
}
