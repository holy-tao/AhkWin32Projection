#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Com
 */
class IMPLTYPEFLAGS extends Win32BitflagEnum {

    /**
     * @type {Integer (Int32)}
     */
    static IMPLTYPEFLAG_FDEFAULT => 1

    /**
     * @type {Integer (Int32)}
     */
    static IMPLTYPEFLAG_FSOURCE => 2

    /**
     * @type {Integer (Int32)}
     */
    static IMPLTYPEFLAG_FRESTRICTED => 4

    /**
     * @type {Integer (Int32)}
     */
    static IMPLTYPEFLAG_FDEFAULTVTABLE => 8
}
