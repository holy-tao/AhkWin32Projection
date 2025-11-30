#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 */
class PERF_DETAIL extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static PERF_DETAIL_NOVICE => 100

    /**
     * @type {Integer (UInt32)}
     */
    static PERF_DETAIL_ADVANCED => 200

    /**
     * @type {Integer (UInt32)}
     */
    static PERF_DETAIL_EXPERT => 300

    /**
     * @type {Integer (UInt32)}
     */
    static PERF_DETAIL_WIZARD => 400
}
