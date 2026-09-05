#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
class msidbEmbeddedUIAttributes extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static msidbEmbeddedUI => 1

    /**
     * Native name: msidbEmbeddedHandlesBasic
     * @type {Integer (Int32)}
     */
    static HandlesBasic => 2
}
