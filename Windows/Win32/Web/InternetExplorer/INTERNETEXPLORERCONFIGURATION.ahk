#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 */
class INTERNETEXPLORERCONFIGURATION extends Win32Enum {

    /**
     * Native name: INTERNETEXPLORERCONFIGURATION_HOST
     * @type {Integer (Int32)}
     */
    static HOST => 1

    /**
     * Native name: INTERNETEXPLORERCONFIGURATION_WEB_DRIVER
     * @type {Integer (Int32)}
     */
    static WEB_DRIVER => 2

    /**
     * Native name: INTERNETEXPLORERCONFIGURATION_WEB_DRIVER_EDGE
     * @type {Integer (Int32)}
     */
    static WEB_DRIVER_EDGE => 4
}
