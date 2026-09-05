#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
class msidbIniFileAction extends Win32Enum {

    /**
     * Native name: msidbIniFileActionAddLine
     * @type {Integer (Int32)}
     */
    static AddLine => 0

    /**
     * Native name: msidbIniFileActionCreateLine
     * @type {Integer (Int32)}
     */
    static CreateLine => 1

    /**
     * Native name: msidbIniFileActionRemoveLine
     * @type {Integer (Int32)}
     */
    static RemoveLine => 2

    /**
     * Native name: msidbIniFileActionAddTag
     * @type {Integer (Int32)}
     */
    static AddTag => 3

    /**
     * Native name: msidbIniFileActionRemoveTag
     * @type {Integer (Int32)}
     */
    static RemoveTag => 4
}
