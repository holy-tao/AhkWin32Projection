#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 */
class GPFIDL_FLAGS extends Win32Enum {

    /**
     * Native name: GPFIDL_DEFAULT
     * @type {Integer (UInt32)}
     */
    static DEFAULT => 0

    /**
     * Native name: GPFIDL_ALTNAME
     * @type {Integer (UInt32)}
     */
    static ALTNAME => 1

    /**
     * Native name: GPFIDL_UNCPRINTER
     * @type {Integer (UInt32)}
     */
    static UNCPRINTER => 2
}
