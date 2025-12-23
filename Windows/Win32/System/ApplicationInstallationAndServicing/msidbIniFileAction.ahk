#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class msidbIniFileAction extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static msidbIniFileActionAddLine => 0

    /**
     * @type {Integer (Int32)}
     */
    static msidbIniFileActionCreateLine => 1

    /**
     * @type {Integer (Int32)}
     */
    static msidbIniFileActionRemoveLine => 2

    /**
     * @type {Integer (Int32)}
     */
    static msidbIniFileActionAddTag => 3

    /**
     * @type {Integer (Int32)}
     */
    static msidbIniFileActionRemoveTag => 4
}
