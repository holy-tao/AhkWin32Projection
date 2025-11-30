#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class NMCUSTOMDRAW_DRAW_STAGE extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static CDDS_POSTPAINT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CDDS_PREERASE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static CDDS_PREPAINT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CDDS_ITEMPOSTERASE => 65540

    /**
     * @type {Integer (UInt32)}
     */
    static CDDS_ITEMPOSTPAINT => 65538

    /**
     * @type {Integer (UInt32)}
     */
    static CDDS_ITEMPREERASE => 65539

    /**
     * @type {Integer (UInt32)}
     */
    static CDDS_ITEMPREPAINT => 65537

    /**
     * @type {Integer (UInt32)}
     */
    static CDDS_SUBITEM => 131072
}
