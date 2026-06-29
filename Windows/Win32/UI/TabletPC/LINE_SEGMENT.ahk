#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\POINT.ahk" { POINT }

/**
 * Describes the start and end points of a line recognition segment, such as the baseline or midline.
 * @see https://learn.microsoft.com/windows/win32/api/rectypes/ns-rectypes-line_segment
 * @namespace Windows.Win32.UI.TabletPC
 */
export default struct LINE_SEGMENT {
    #StructPack 4

    /**
     * Point that represents the start of the line segment. The point is in ink space coordinates.
     */
    PtA : POINT

    /**
     * Point that represents the end of the line segment. The point is in ink space coordinates.
     */
    PtB : POINT

}
