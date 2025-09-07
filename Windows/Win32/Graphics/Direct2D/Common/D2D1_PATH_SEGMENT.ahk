#Requires AutoHotkey v2.0.0 64-bit

/**
 * Indicates whether a segment should be stroked and whether the join between this segment and the previous one should be smooth. This enumeration allows a bitwise combination of its member values.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_path_segment
 * @namespace Windows.Win32.Graphics.Direct2D.Common
 * @version v4.0.30319
 */
class D2D1_PATH_SEGMENT{

    /**
     * The segment is joined  as specified by the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1strokestyle">ID2D1StrokeStyle</a> interface, and it is stroked.
     * @type {Integer (Int32)}
     */
    static D2D1_PATH_SEGMENT_NONE => 0

    /**
     * The segment is not stroked.
     * @type {Integer (Int32)}
     */
    static D2D1_PATH_SEGMENT_FORCE_UNSTROKED => 1

    /**
     * The segment is always joined with the one preceding it using a round line join, regardless of which <a href="https://docs.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_line_join">D2D1_LINE_JOIN</a> enumeration is specified by the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1strokestyle">ID2D1StrokeStyle</a> interface. If this segment is the first segment and the figure is closed, a round line join is used to connect the closing segment with the first segment. If the figure is not closed, this setting has no effect on the first segment of the figure. If <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1simplifiedgeometrysink-setsegmentflags">ID2D1SimplifiedGeometrySink::SetSegmentFlags</a> is called just before <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1simplifiedgeometrysink-endfigure">ID2D1SimplifiedGeometrySink::EndFigure</a>, the join between the closing segment and the last explicitly specified segment is affected.
     * @type {Integer (Int32)}
     */
    static D2D1_PATH_SEGMENT_FORCE_ROUND_LINE_JOIN => 2
}
