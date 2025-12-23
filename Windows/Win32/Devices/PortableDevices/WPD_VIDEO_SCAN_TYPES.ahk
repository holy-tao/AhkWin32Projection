#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The WPD\_VIDEO\_SCAN\_TYPES enumeration type describes how the fields in a video file are encoded.
 * @remarks
 * This enumeration is used by the [WPD\_VIDEO\_SCAN\_TYPE](properties-and-attributes.md) property.
 * 
 * There are two types of interleaved file formats that are specified by this enumeration. **WPD\_VIDEO\_SCAN\_TYPE\_FIELD\_INTERLEAVED** refers to a file format where frames are delivered as they were scanned fields alternate and data goes line by line, as shown here:
 * 
 * **Frame 1**
 * 
 * Field 1: Line 1
 * 
 * Field 2: Line 1
 * 
 * Field 1: Line 2
 * 
 * Field 2: Line 2
 * 
 * Field 1: Line 3
 * 
 * Field 2: Line 3
 * 
 * ...
 * 
 * **WPD\_VIDEO\_SCAN\_TYPE\_FIELD\_SINGLE** refers to a file format where each field is stored in a single block of scan lines, and fields are stored sequentially, as shown here:
 * 
 * **Frame 1**
 * 
 * Field 1: Line 1
 * 
 * Field 1: Line 2
 * 
 * Field 1: Line 3
 * 
 * ...
 * 
 * Followed by
 * 
 * Field 2: Line 1
 * 
 * Field 2: Line 2
 * 
 * Field 2: Line 3
 * 
 * ...
 * @see https://learn.microsoft.com/windows/win32/wpd_sdk/wpd-video-scan-types
 * @namespace Windows.Win32.Devices.PortableDevices
 * @version v4.0.30319
 */
class WPD_VIDEO_SCAN_TYPES extends Win32Enum{

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
