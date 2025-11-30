#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class BEHAVIOR_EVENT_FLAGS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static BEHAVIOREVENTFLAGS_BUBBLE => 1

    /**
     * @type {Integer (Int32)}
     */
    static BEHAVIOREVENTFLAGS_STANDARDADDITIVE => 2

    /**
     * @type {Integer (Int32)}
     */
    static BEHAVIOR_EVENT_FLAGS_Max => 2147483647
}
