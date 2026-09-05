#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
class EnTag_Mode extends Win32Enum {

    /**
     * Native name: EnTag_Remove
     * @type {Integer (Int32)}
     */
    static Remove => 0

    /**
     * Native name: EnTag_Once
     * @type {Integer (Int32)}
     */
    static Once => 1

    /**
     * Native name: EnTag_Repeat
     * @type {Integer (Int32)}
     */
    static Repeat => 2
}
