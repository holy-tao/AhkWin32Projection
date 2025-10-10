#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Devices.PortableDevices
 * @version v4.0.30319
 */
class WPD_VIDEO_SCAN_TYPES{

    /**
     * @type {Integer (Int32)}
     */
    static WPD_VIDEO_SCAN_TYPE_UNUSED => 0

    /**
     * @type {Integer (Int32)}
     */
    static WPD_VIDEO_SCAN_TYPE_PROGRESSIVE => 1

    /**
     * @type {Integer (Int32)}
     */
    static WPD_VIDEO_SCAN_TYPE_FIELD_INTERLEAVED_UPPER_FIRST => 2

    /**
     * @type {Integer (Int32)}
     */
    static WPD_VIDEO_SCAN_TYPE_FIELD_INTERLEAVED_LOWER_FIRST => 3

    /**
     * @type {Integer (Int32)}
     */
    static WPD_VIDEO_SCAN_TYPE_FIELD_SINGLE_UPPER_FIRST => 4

    /**
     * @type {Integer (Int32)}
     */
    static WPD_VIDEO_SCAN_TYPE_FIELD_SINGLE_LOWER_FIRST => 5

    /**
     * @type {Integer (Int32)}
     */
    static WPD_VIDEO_SCAN_TYPE_MIXED_INTERLACE => 6

    /**
     * @type {Integer (Int32)}
     */
    static WPD_VIDEO_SCAN_TYPE_MIXED_INTERLACE_AND_PROGRESSIVE => 7
}
