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
 */
class WPD_VIDEO_SCAN_TYPES extends Win32Enum {

    /**
     * Native name: WPD_VIDEO_SCAN_TYPE_UNUSED
     * @type {Integer (Int32)}
     */
    static TYPE_UNUSED => 0

    /**
     * Native name: WPD_VIDEO_SCAN_TYPE_PROGRESSIVE
     * @type {Integer (Int32)}
     */
    static TYPE_PROGRESSIVE => 1

    /**
     * Native name: WPD_VIDEO_SCAN_TYPE_FIELD_INTERLEAVED_UPPER_FIRST
     * @type {Integer (Int32)}
     */
    static TYPE_FIELD_INTERLEAVED_UPPER_FIRST => 2

    /**
     * Native name: WPD_VIDEO_SCAN_TYPE_FIELD_INTERLEAVED_LOWER_FIRST
     * @type {Integer (Int32)}
     */
    static TYPE_FIELD_INTERLEAVED_LOWER_FIRST => 3

    /**
     * Native name: WPD_VIDEO_SCAN_TYPE_FIELD_SINGLE_UPPER_FIRST
     * @type {Integer (Int32)}
     */
    static TYPE_FIELD_SINGLE_UPPER_FIRST => 4

    /**
     * Native name: WPD_VIDEO_SCAN_TYPE_FIELD_SINGLE_LOWER_FIRST
     * @type {Integer (Int32)}
     */
    static TYPE_FIELD_SINGLE_LOWER_FIRST => 5

    /**
     * Native name: WPD_VIDEO_SCAN_TYPE_MIXED_INTERLACE
     * @type {Integer (Int32)}
     */
    static TYPE_MIXED_INTERLACE => 6

    /**
     * Native name: WPD_VIDEO_SCAN_TYPE_MIXED_INTERLACE_AND_PROGRESSIVE
     * @type {Integer (Int32)}
     */
    static TYPE_MIXED_INTERLACE_AND_PROGRESSIVE => 7
}
