#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
class IMAGEHLP_SF_TYPE extends Win32Enum {

    /**
     * Native name: sfImage
     * @type {Integer (Int32)}
     */
    static Image => 0

    /**
     * Native name: sfDbg
     * @type {Integer (Int32)}
     */
    static Dbg => 1

    /**
     * Native name: sfPdb
     * @type {Integer (Int32)}
     */
    static Pdb => 2

    /**
     * Native name: sfMpd
     * @type {Integer (Int32)}
     */
    static Mpd => 3

    /**
     * Native name: sfMax
     * @type {Integer (Int32)}
     */
    static Max => 4
}
