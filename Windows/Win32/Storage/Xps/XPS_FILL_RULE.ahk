#Requires AutoHotkey v2.0.0 64-bit

/**
 * The rule used by a composite shape to determine whether a given point is part of the geometry.
 * @see https://learn.microsoft.com/windows/win32/api/xpsobjectmodel/ne-xpsobjectmodel-xps_fill_rule
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class XPS_FILL_RULE{

    /**
     * The rule that determines whether a point is in the fill region. This is determined by drawing 
 * 				a ray from the point to infinity in any direction, and counting the number 
 * 				of path segments within the shape that the ray crosses. If this 
 * 				number is odd, the point is inside; if even, the point is outside.
     * @type {Integer (Int32)}
     */
    static XPS_FILL_RULE_EVENODD => 1

    /**
     * The rule that determines whether a point is in the fill region of the 
 * 				path. This is determined by drawing a ray from the point to infinity in any direction, and  
 * 				examining the places where a segment of the shape crosses the ray. Start 
 * 				the count at 0, then add 1 whenever a path segment crosses the ray from left 
 * 				to right; subtract 1 whenever a path segment crosses the ray from 
 * 				right to left. After the crossings are counted, 
 * 				the point is outside the path if the result is zero and inside if otherwise.
     * @type {Integer (Int32)}
     */
    static XPS_FILL_RULE_NONZERO => 2
}
