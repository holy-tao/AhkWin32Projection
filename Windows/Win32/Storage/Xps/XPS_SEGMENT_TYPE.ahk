#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes a line segment.
 * @remarks
 * 
 * A geometry segment is described by the start point, the segment type, and additional parameters whose values are determined by the segment type. The coordinates for the start point of the first segment are a property of the geometry figure. The start point of each subsequent segment is the end point of the preceding segment.
 * 
 * The table that follows shows an example of each segment type.
 * 
 * <table>
 * <tr>
 * <th colspan="2">Examples</th>
 * </tr>
 * <tr>
 * <td>
 * XPS_SEGMENT_TYPE_ARC_LARGE_CLOCKWISE <img alt="A diagram that shows an example of an XPS_SEGMENT_TYPE_ARC_LARGE_CLOCKWISE figure segment" src="./images/segment_type_arc_lc.png"/>
 * 
 * </td>
 * <td>
 * XPS_SEGMENT_TYPE_ARC_LARGE_COUNTERCLOCKWISE <img alt="A diagram that shows an example of an XPS_SEGMENT_TYPE_ARC_LARGE_CLOCKWISE figure segment" src="./images/segment_type_arc_lcc.png"/> 
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * XPS_SEGMENT_TYPE_ARC_SMALL_CLOCKWISE<img alt="A diagram that shows an example of an XPS_SEGMENT_TYPE_ARC_SMALL_CLOCKWISE figure segment" src="./images/segment_type_arc_sc.png"/> 
 * 
 * </td>
 * <td>
 * XPS_SEGMENT_TYPE_ARC_SMALL_COUNTERCLOCKWISE <img alt="A diagram that shows an example of an XPS_SEGMENT_TYPE_ARC_SMALL_COUNTERCLOCKWISE figure segment" src="./images/segment_type_arc_scc.png"/> 
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * XPS_SEGMENT_TYPE_BEZIER <img alt="A diagram that shows an example of an XPS_SEGMENT_TYPE_BEZIER figure segment" src="./images/segment_type_bezier.png"/> 
 * 
 * </td>
 * <td>
 *   XPS_SEGMENT_TYPE_LINE <img alt="A diagram that shows an example of an XPS_SEGMENT_TYPE_LINE figure segment" src="./images/segment_type_line.png"/> 
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * XPS_SEGMENT_TYPE_QUADRATIC_BEZIER <img alt="A diagram that shows an example of an XPS_SEGMENT_TYPE_QUADRATIC_BEZIER figure segment" src="./images/segment_type_quad_bezier.png"/> 
 * 
 * </td>
 * <td></td>
 * </tr>
 * </table>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//xpsobjectmodel/ne-xpsobjectmodel-xps_segment_type
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class XPS_SEGMENT_TYPE extends Win32Enum{

    /**
     * The line segment is an arc that covers more than 180 degrees and is drawn in a clockwise direction from the start point to the end point.
     * @type {Integer (Int32)}
     */
    static XPS_SEGMENT_TYPE_ARC_LARGE_CLOCKWISE => 1

    /**
     * The line segment is an arc that covers more than 180 degrees and is drawn in a counterclockwise direction from the start point to the end point.
     * @type {Integer (Int32)}
     */
    static XPS_SEGMENT_TYPE_ARC_LARGE_COUNTERCLOCKWISE => 2

    /**
     * The line segment is an arc that covers at most 180 degrees and is drawn in a clockwise direction from the start point to the end point.
     * @type {Integer (Int32)}
     */
    static XPS_SEGMENT_TYPE_ARC_SMALL_CLOCKWISE => 3

    /**
     * The line segment is an arc that covers at most 180 degrees and is drawn in a counterclockwise direction from the start point to the end point.
     * @type {Integer (Int32)}
     */
    static XPS_SEGMENT_TYPE_ARC_SMALL_COUNTERCLOCKWISE => 4

    /**
     * The line segment is a cubic Bezier curve that is drawn between two points.
     * @type {Integer (Int32)}
     */
    static XPS_SEGMENT_TYPE_BEZIER => 5

    /**
     * The line segment is a straight line that is drawn between two points.
     * @type {Integer (Int32)}
     */
    static XPS_SEGMENT_TYPE_LINE => 6

    /**
     * The line segment is a quadratic Bezier curve that is drawn between two points.
     * @type {Integer (Int32)}
     */
    static XPS_SEGMENT_TYPE_QUADRATIC_BEZIER => 7
}
