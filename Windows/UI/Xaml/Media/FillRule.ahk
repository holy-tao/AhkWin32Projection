#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies how the intersecting areas of [PathFigure](pathfigure.md) objects contained in a [Geometry](geometry.md) are combined to form the area of the [Geometry](geometry.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.fillrule
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class FillRule extends Win32Enum{

    /**
     * Rule that determines whether a point is in the fill region by drawing a ray from that point to infinity in any direction and counting the number of path segments within the given shape that the ray crosses. If this number is odd, the point is inside; if even, the point is outside.
     * @type {Integer (Int32)}
     */
    static EvenOdd => 0

    /**
     * Rule that determines whether a point is in the fill region of the path by drawing a ray from that point to infinity in any direction and then examining the places where a segment of the shape crosses the ray. Starting with a count of zero, add one each time a segment crosses the ray from left to right and subtract one each time a path segment crosses the ray from right to left. After counting the crossings, if the result is zero then the point is outside the path. Otherwise, it is inside.
     * @type {Integer (Int32)}
     */
    static Nonzero => 1
}
