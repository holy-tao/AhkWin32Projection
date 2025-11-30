#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class TEXTSTYLEPARTS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static TEXT_MAININSTRUCTION => 1

    /**
     * @type {Integer (Int32)}
     */
    static TEXT_INSTRUCTION => 2

    /**
     * @type {Integer (Int32)}
     */
    static TEXT_BODYTITLE => 3

    /**
     * @type {Integer (Int32)}
     */
    static TEXT_BODYTEXT => 4

    /**
     * @type {Integer (Int32)}
     */
    static TEXT_SECONDARYTEXT => 5

    /**
     * @type {Integer (Int32)}
     */
    static TEXT_HYPERLINKTEXT => 6

    /**
     * @type {Integer (Int32)}
     */
    static TEXT_EXPANDED => 7

    /**
     * @type {Integer (Int32)}
     */
    static TEXT_LABEL => 8

    /**
     * @type {Integer (Int32)}
     */
    static TEXT_CONTROLLABEL => 9
}
