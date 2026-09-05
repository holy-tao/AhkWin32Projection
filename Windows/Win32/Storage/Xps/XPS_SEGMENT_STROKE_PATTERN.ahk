#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates whether all, some, or none of the segments in a figure are stroked.
 * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/ne-xpsobjectmodel-xps_segment_stroke_pattern
 * @namespace Windows.Win32.Storage.Xps
 */
class XPS_SEGMENT_STROKE_PATTERN extends Win32Enum {

    /**
     * All segments in the figure are stroked.
     * Native name: XPS_SEGMENT_STROKE_PATTERN_ALL
     * @type {Integer (Int32)}
     */
    static ALL => 1

    /**
     * No segments in the figure are stroked.
     * Native name: XPS_SEGMENT_STROKE_PATTERN_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 2

    /**
     * Some segments in the figure are stroked, others are not.
     * Native name: XPS_SEGMENT_STROKE_PATTERN_MIXED
     * @type {Integer (Int32)}
     */
    static MIXED => 3
}
