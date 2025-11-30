#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class INSTALLLOGATTRIBUTES extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLLOGATTRIBUTES_APPEND => 1

    /**
     * @type {Integer (Int32)}
     */
    static INSTALLLOGATTRIBUTES_FLUSHEACHLINE => 2
}
