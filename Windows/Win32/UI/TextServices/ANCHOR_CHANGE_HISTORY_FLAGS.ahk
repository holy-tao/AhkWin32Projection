#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ANCHOR_CHANGE_HISTORY_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static TS_CH_PRECEDING_DEL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TS_CH_FOLLOWING_DEL => 2
}
