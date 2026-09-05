#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 */
class NGenHintEnum extends Win32Enum {

    /**
     * Native name: NGenDefault
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * Native name: NGenEager
     * @type {Integer (Int32)}
     */
    static Eager => 1

    /**
     * Native name: NGenLazy
     * @type {Integer (Int32)}
     */
    static Lazy => 2

    /**
     * Native name: NGenNever
     * @type {Integer (Int32)}
     */
    static Never => 3
}
