#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSPROPERTY_TIMECODE extends Win32Enum {

    /**
     * Native name: KSPROPERTY_TIMECODE_READER
     * @type {Integer (Int32)}
     */
    static READER => 0

    /**
     * Native name: KSPROPERTY_ATN_READER
     * @type {Integer (Int32)}
     */
    static ATN_READER => 1

    /**
     * Native name: KSPROPERTY_RTC_READER
     * @type {Integer (Int32)}
     */
    static RTC_READER => 2
}
