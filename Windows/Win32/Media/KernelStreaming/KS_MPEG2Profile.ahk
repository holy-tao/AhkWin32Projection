#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KS_MPEG2Profile extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static KS_MPEG2Profile_Simple => 0

    /**
     * @type {Integer (Int32)}
     */
    static KS_MPEG2Profile_Main => 1

    /**
     * @type {Integer (Int32)}
     */
    static KS_MPEG2Profile_SNRScalable => 2

    /**
     * @type {Integer (Int32)}
     */
    static KS_MPEG2Profile_SpatiallyScalable => 3

    /**
     * @type {Integer (Int32)}
     */
    static KS_MPEG2Profile_High => 4
}
