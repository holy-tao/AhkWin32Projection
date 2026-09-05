#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 */
class CorRegFlags extends Win32Enum {

    /**
     * Native name: regNoCopy
     * @type {Integer (Int32)}
     */
    static NoCopy => 1

    /**
     * Native name: regConfig
     * @type {Integer (Int32)}
     */
    static Config => 2

    /**
     * Native name: regHasRefs
     * @type {Integer (Int32)}
     */
    static HasRefs => 4
}
