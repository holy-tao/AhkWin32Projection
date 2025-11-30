#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KS_AMVP_MODE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static KS_AMVP_MODE_WEAVE => 0

    /**
     * @type {Integer (Int32)}
     */
    static KS_AMVP_MODE_BOBINTERLEAVED => 1

    /**
     * @type {Integer (Int32)}
     */
    static KS_AMVP_MODE_BOBNONINTERLEAVED => 2

    /**
     * @type {Integer (Int32)}
     */
    static KS_AMVP_MODE_SKIPEVEN => 3

    /**
     * @type {Integer (Int32)}
     */
    static KS_AMVP_MODE_SKIPODD => 4
}
