#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class IMAGE_LIST_ITEM_FLAGS extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static ILIF_ALPHA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ILIF_LOWQUALITY => 2
}
