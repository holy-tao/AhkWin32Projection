#Requires AutoHotkey v2.0.0 64-bit

/**
 * Indicates whether all, some, or none of the segments in a figure are stroked.
 * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/ne-xpsobjectmodel-xps_segment_stroke_pattern
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class XPS_SEGMENT_STROKE_PATTERN{

    /**
     * All segments in the figure are stroked.
     * @type {Integer (Int32)}
     */
    static XPS_SEGMENT_STROKE_PATTERN_ALL => 1

    /**
     * No segments in the figure are stroked.
     * @type {Integer (Int32)}
     */
    static XPS_SEGMENT_STROKE_PATTERN_NONE => 2

    /**
     * Some segments in the figure are stroked, others are not.
     * @type {Integer (Int32)}
     */
    static XPS_SEGMENT_STROKE_PATTERN_MIXED => 3
}
