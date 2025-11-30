#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class GET_TEXT_AND_PROPERTY_UPDATES_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static TF_GTP_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static TF_GTP_INCL_TEXT => 1
}
