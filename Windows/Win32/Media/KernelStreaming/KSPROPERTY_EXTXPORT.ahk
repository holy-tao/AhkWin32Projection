#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSPROPERTY_EXTXPORT extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_EXTXPORT_CAPABILITIES => 0

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_EXTXPORT_INPUT_SIGNAL_MODE => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_EXTXPORT_OUTPUT_SIGNAL_MODE => 2

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_EXTXPORT_LOAD_MEDIUM => 3

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_EXTXPORT_MEDIUM_INFO => 4

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_EXTXPORT_STATE => 5

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_EXTXPORT_STATE_NOTIFY => 6

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_EXTXPORT_TIMECODE_SEARCH => 7

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_EXTXPORT_ATN_SEARCH => 8

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_EXTXPORT_RTC_SEARCH => 9

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_RAW_AVC_CMD => 10
}
