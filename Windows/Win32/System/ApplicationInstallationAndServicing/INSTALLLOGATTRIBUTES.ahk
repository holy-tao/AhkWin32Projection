#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
class INSTALLLOGATTRIBUTES extends Win32Enum {

    /**
     * Native name: INSTALLLOGATTRIBUTES_APPEND
     * @type {Integer (Int32)}
     */
    static APPEND => 1

    /**
     * Native name: INSTALLLOGATTRIBUTES_FLUSHEACHLINE
     * @type {Integer (Int32)}
     */
    static FLUSHEACHLINE => 2
}
