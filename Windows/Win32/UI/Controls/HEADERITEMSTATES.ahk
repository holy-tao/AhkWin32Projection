#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class HEADERITEMSTATES extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static HIS_NORMAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static HIS_HOT => 2

    /**
     * @type {Integer (Int32)}
     */
    static HIS_PRESSED => 3

    /**
     * @type {Integer (Int32)}
     */
    static HIS_SORTEDNORMAL => 4

    /**
     * @type {Integer (Int32)}
     */
    static HIS_SORTEDHOT => 5

    /**
     * @type {Integer (Int32)}
     */
    static HIS_SORTEDPRESSED => 6

    /**
     * @type {Integer (Int32)}
     */
    static HIS_ICONNORMAL => 7

    /**
     * @type {Integer (Int32)}
     */
    static HIS_ICONHOT => 8

    /**
     * @type {Integer (Int32)}
     */
    static HIS_ICONPRESSED => 9

    /**
     * @type {Integer (Int32)}
     */
    static HIS_ICONSORTEDNORMAL => 10

    /**
     * @type {Integer (Int32)}
     */
    static HIS_ICONSORTEDHOT => 11

    /**
     * @type {Integer (Int32)}
     */
    static HIS_ICONSORTEDPRESSED => 12
}
