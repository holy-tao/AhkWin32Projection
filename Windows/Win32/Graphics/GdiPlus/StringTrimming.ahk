#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class StringTrimming extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static StringTrimmingNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static StringTrimmingCharacter => 1

    /**
     * @type {Integer (Int32)}
     */
    static StringTrimmingWord => 2

    /**
     * @type {Integer (Int32)}
     */
    static StringTrimmingEllipsisCharacter => 3

    /**
     * @type {Integer (Int32)}
     */
    static StringTrimmingEllipsisWord => 4

    /**
     * @type {Integer (Int32)}
     */
    static StringTrimmingEllipsisPath => 5
}
