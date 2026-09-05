#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Performance
 */
class PERF_DETAIL extends Win32Enum {

    /**
     * Native name: PERF_DETAIL_NOVICE
     * @type {Integer (UInt32)}
     */
    static NOVICE => 100

    /**
     * Native name: PERF_DETAIL_ADVANCED
     * @type {Integer (UInt32)}
     */
    static ADVANCED => 200

    /**
     * Native name: PERF_DETAIL_EXPERT
     * @type {Integer (UInt32)}
     */
    static EXPERT => 300

    /**
     * Native name: PERF_DETAIL_WIZARD
     * @type {Integer (UInt32)}
     */
    static WIZARD => 400
}
