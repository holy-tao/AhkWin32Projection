#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KS_MPEG2Profile extends Win32Enum {

    /**
     * Native name: KS_MPEG2Profile_Simple
     * @type {Integer (Int32)}
     */
    static Simple => 0

    /**
     * Native name: KS_MPEG2Profile_Main
     * @type {Integer (Int32)}
     */
    static Main => 1

    /**
     * Native name: KS_MPEG2Profile_SNRScalable
     * @type {Integer (Int32)}
     */
    static SNRScalable => 2

    /**
     * Native name: KS_MPEG2Profile_SpatiallyScalable
     * @type {Integer (Int32)}
     */
    static SpatiallyScalable => 3

    /**
     * Native name: KS_MPEG2Profile_High
     * @type {Integer (Int32)}
     */
    static High => 4
}
