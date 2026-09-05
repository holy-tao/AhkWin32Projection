#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
class MSISOURCETYPE extends Win32Enum {

    /**
     * Native name: MSISOURCETYPE_UNKNOWN
     * @type {Integer (Int32)}
     */
    static UNKNOWN => 0

    /**
     * Native name: MSISOURCETYPE_NETWORK
     * @type {Integer (Int32)}
     */
    static NETWORK => 1

    /**
     * Native name: MSISOURCETYPE_URL
     * @type {Integer (Int32)}
     */
    static URL => 2

    /**
     * Native name: MSISOURCETYPE_MEDIA
     * @type {Integer (Int32)}
     */
    static MEDIA => 4
}
