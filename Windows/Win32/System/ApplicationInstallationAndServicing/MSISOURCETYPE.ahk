#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class MSISOURCETYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static MSISOURCETYPE_UNKNOWN => 0

    /**
     * @type {Integer (Int32)}
     */
    static MSISOURCETYPE_NETWORK => 1

    /**
     * @type {Integer (Int32)}
     */
    static MSISOURCETYPE_URL => 2

    /**
     * @type {Integer (Int32)}
     */
    static MSISOURCETYPE_MEDIA => 4
}
