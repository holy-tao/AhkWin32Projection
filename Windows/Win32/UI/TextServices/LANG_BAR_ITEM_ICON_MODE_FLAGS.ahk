#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class LANG_BAR_ITEM_ICON_MODE_FLAGS extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static TF_DTLBI_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static TF_DTLBI_USEPROFILEICON => 1
}
