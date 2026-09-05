#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
class StringTrimming extends Win32Enum {

    /**
     * Native name: StringTrimmingNone
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Native name: StringTrimmingCharacter
     * @type {Integer (Int32)}
     */
    static Character => 1

    /**
     * Native name: StringTrimmingWord
     * @type {Integer (Int32)}
     */
    static Word => 2

    /**
     * Native name: StringTrimmingEllipsisCharacter
     * @type {Integer (Int32)}
     */
    static EllipsisCharacter => 3

    /**
     * Native name: StringTrimmingEllipsisWord
     * @type {Integer (Int32)}
     */
    static EllipsisWord => 4

    /**
     * Native name: StringTrimmingEllipsisPath
     * @type {Integer (Int32)}
     */
    static EllipsisPath => 5
}
