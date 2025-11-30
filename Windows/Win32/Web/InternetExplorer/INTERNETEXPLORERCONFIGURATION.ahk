#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class INTERNETEXPLORERCONFIGURATION extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static INTERNETEXPLORERCONFIGURATION_HOST => 1

    /**
     * @type {Integer (Int32)}
     */
    static INTERNETEXPLORERCONFIGURATION_WEB_DRIVER => 2

    /**
     * @type {Integer (Int32)}
     */
    static INTERNETEXPLORERCONFIGURATION_WEB_DRIVER_EDGE => 4
}
