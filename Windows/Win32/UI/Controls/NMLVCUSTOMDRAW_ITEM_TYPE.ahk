#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class NMLVCUSTOMDRAW_ITEM_TYPE extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static LVCDI_ITEM => 0

    /**
     * @type {Integer (UInt32)}
     */
    static LVCDI_GROUP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LVCDI_ITEMSLIST => 2
}
