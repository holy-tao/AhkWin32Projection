#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
class RawSearchFlags extends Win32Enum {

    /**
     * Native name: RawSearchNone
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Native name: RawSearchNoBases
     * @type {Integer (Int32)}
     */
    static NoBases => 1
}
