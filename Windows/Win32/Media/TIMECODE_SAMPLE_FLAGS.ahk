#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media
 * @version v4.0.30319
 */
class TIMECODE_SAMPLE_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static ED_DEVCAP_TIMECODE_READ => 4121

    /**
     * @type {Integer (UInt32)}
     */
    static ED_DEVCAP_ATN_READ => 5047

    /**
     * @type {Integer (UInt32)}
     */
    static ED_DEVCAP_RTC_READ => 5050
}
