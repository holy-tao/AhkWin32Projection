#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KS_AMVP_MODE extends Win32Enum {

    /**
     * Native name: KS_AMVP_MODE_WEAVE
     * @type {Integer (Int32)}
     */
    static WEAVE => 0

    /**
     * Native name: KS_AMVP_MODE_BOBINTERLEAVED
     * @type {Integer (Int32)}
     */
    static BOBINTERLEAVED => 1

    /**
     * Native name: KS_AMVP_MODE_BOBNONINTERLEAVED
     * @type {Integer (Int32)}
     */
    static BOBNONINTERLEAVED => 2

    /**
     * Native name: KS_AMVP_MODE_SKIPEVEN
     * @type {Integer (Int32)}
     */
    static SKIPEVEN => 3

    /**
     * Native name: KS_AMVP_MODE_SKIPODD
     * @type {Integer (Int32)}
     */
    static SKIPODD => 4
}
