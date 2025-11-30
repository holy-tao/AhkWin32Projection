#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The PathPointType enumeration indicates point types and flags for the data points in a path.
 * @remarks
 * 
 * A <a href="https://docs.microsoft.com/windows/desktop/api/gdipluspath/nl-gdipluspath-graphicspath">GraphicsPath</a> object has an array of points and an array of types. Each element in the array of types is a byte that specifies the point type and a set of flags for the corresponding element in the array of points.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//gdiplusenums/ne-gdiplusenums-pathpointtype
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class PathPointType extends Win32Enum{

    /**
     * Indicates that the point is the start of a figure.
     * @type {Integer (Int32)}
     */
    static PathPointTypeStart => 0

    /**
     * Indicates that the point is one of the two endpoints of a line.
     * @type {Integer (Int32)}
     */
    static PathPointTypeLine => 1

    /**
     * Indicates that the point is an endpoint or control point of a cubic Bézier spline.
     * @type {Integer (Int32)}
     */
    static PathPointTypeBezier => 3

    /**
     * Masks all bits except for the three low-order bits, which indicate the point type.
     * @type {Integer (Int32)}
     */
    static PathPointTypePathTypeMask => 7

    /**
     * Not used.
     * @type {Integer (Int32)}
     */
    static PathPointTypeDashMode => 16

    /**
     * Specifies that the point is a marker.
     * @type {Integer (Int32)}
     */
    static PathPointTypePathMarker => 32

    /**
     * Specifies that the point is the last point in a closed subpath (figure).
     * @type {Integer (Int32)}
     */
    static PathPointTypeCloseSubpath => 128

    /**
     * Indicates that the point is an endpoint or control point of a cubic Bézier spline.
     * @type {Integer (Int32)}
     */
    static PathPointTypeBezier3 => 3
}
