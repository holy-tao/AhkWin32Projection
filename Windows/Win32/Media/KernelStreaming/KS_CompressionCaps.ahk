#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KS_CompressionCaps{

    /**
     * @type {Integer (Int32)}
     */
    static KS_CompressionCaps_CanQuality => 1

    /**
     * @type {Integer (Int32)}
     */
    static KS_CompressionCaps_CanCrunch => 2

    /**
     * @type {Integer (Int32)}
     */
    static KS_CompressionCaps_CanKeyFrame => 4

    /**
     * @type {Integer (Int32)}
     */
    static KS_CompressionCaps_CanBFrame => 8

    /**
     * @type {Integer (Int32)}
     */
    static KS_CompressionCaps_CanWindow => 16
}
