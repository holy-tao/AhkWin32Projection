#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
class DownResEventParam extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static DOWNRES_Always => 0

    /**
     * @type {Integer (Int32)}
     */
    static DOWNRES_InWindowOnly => 1

    /**
     * @type {Integer (Int32)}
     */
    static DOWNRES_Undefined => 2
}
