#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class HierarchyAlpha extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static BDA_HALPHA_NOT_SET => -1

    /**
     * @type {Integer (Int32)}
     */
    static BDA_HALPHA_NOT_DEFINED => 0

    /**
     * @type {Integer (Int32)}
     */
    static BDA_HALPHA_1 => 1

    /**
     * @type {Integer (Int32)}
     */
    static BDA_HALPHA_2 => 2

    /**
     * @type {Integer (Int32)}
     */
    static BDA_HALPHA_4 => 3

    /**
     * @type {Integer (Int32)}
     */
    static BDA_HALPHA_MAX => 4
}
