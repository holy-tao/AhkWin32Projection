#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KS_CompressionCaps extends Win32Enum {

    /**
     * Native name: KS_CompressionCaps_CanQuality
     * @type {Integer (Int32)}
     */
    static CanQuality => 1

    /**
     * Native name: KS_CompressionCaps_CanCrunch
     * @type {Integer (Int32)}
     */
    static CanCrunch => 2

    /**
     * Native name: KS_CompressionCaps_CanKeyFrame
     * @type {Integer (Int32)}
     */
    static CanKeyFrame => 4

    /**
     * Native name: KS_CompressionCaps_CanBFrame
     * @type {Integer (Int32)}
     */
    static CanBFrame => 8

    /**
     * Native name: KS_CompressionCaps_CanWindow
     * @type {Integer (Int32)}
     */
    static CanWindow => 16
}
