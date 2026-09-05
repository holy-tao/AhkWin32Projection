#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSPROPERTY_EXTXPORT extends Win32Enum {

    /**
     * Native name: KSPROPERTY_EXTXPORT_CAPABILITIES
     * @type {Integer (Int32)}
     */
    static CAPABILITIES => 0

    /**
     * Native name: KSPROPERTY_EXTXPORT_INPUT_SIGNAL_MODE
     * @type {Integer (Int32)}
     */
    static INPUT_SIGNAL_MODE => 1

    /**
     * Native name: KSPROPERTY_EXTXPORT_OUTPUT_SIGNAL_MODE
     * @type {Integer (Int32)}
     */
    static OUTPUT_SIGNAL_MODE => 2

    /**
     * Native name: KSPROPERTY_EXTXPORT_LOAD_MEDIUM
     * @type {Integer (Int32)}
     */
    static LOAD_MEDIUM => 3

    /**
     * Native name: KSPROPERTY_EXTXPORT_MEDIUM_INFO
     * @type {Integer (Int32)}
     */
    static MEDIUM_INFO => 4

    /**
     * Native name: KSPROPERTY_EXTXPORT_STATE
     * @type {Integer (Int32)}
     */
    static STATE => 5

    /**
     * Native name: KSPROPERTY_EXTXPORT_STATE_NOTIFY
     * @type {Integer (Int32)}
     */
    static STATE_NOTIFY => 6

    /**
     * Native name: KSPROPERTY_EXTXPORT_TIMECODE_SEARCH
     * @type {Integer (Int32)}
     */
    static TIMECODE_SEARCH => 7

    /**
     * Native name: KSPROPERTY_EXTXPORT_ATN_SEARCH
     * @type {Integer (Int32)}
     */
    static ATN_SEARCH => 8

    /**
     * Native name: KSPROPERTY_EXTXPORT_RTC_SEARCH
     * @type {Integer (Int32)}
     */
    static RTC_SEARCH => 9

    /**
     * Native name: KSPROPERTY_RAW_AVC_CMD
     * @type {Integer (Int32)}
     */
    static RAW_AVC_CMD => 10
}
