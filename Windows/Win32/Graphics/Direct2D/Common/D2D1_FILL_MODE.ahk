#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies how the intersecting areas of geometries or figures are combined to form the area of the composite geometry.
 * @remarks
 * 
  * Use the <b>D2D1_FILL_MODE</b> enumeration when creating an <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1geometrygroup">ID2D1GeometryGroup</a> with the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1factory-creategeometrygroup">CreateGeometryGroup</a> method, or when modifying the fill mode of an <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1simplifiedgeometrysink">ID2D1SimplifiedGeometrySink</a> with the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1simplifiedgeometrysink-setfillmode">ID2D1SimplifiedGeometrySink::SetFillMode</a>  method.
  * 
  * Direct2D fills the interior of a path by using one of the two fill modes specified by this enumeration: <b>D2D1_FILL_MODE_ALTERNATE</b> (alternate) or <b>D2D1_FILL_MODE_WINDING</b> (winding). Because the modes determine how to fill the interior of a closed shape, all shapes are treated as closed when they are filled.  If there is a gap in a segment in a shape, draw an imaginary line to close it. 
  * 
  *  To see the difference between the winding and alternate fill modes, assume that you have four circles with the same center and a different radius, as shown in the following illustration. The first one has the radius of 25, the second 50, the third 75, and the fourth 100.
  * 
  * <img alt="Illustration of four concentric circles with different radius values" src="./images/fillmode_not_filled_01.png"/>
  * The following  illustration shows the shape filled by using the alternate fill mode. Notice that the center and third ring are not filled. This is because a ray drawn from any point in either of those two rings passes through an even number of segments. 
  * 
  * <img alt="Illustration of concentric circles with the second and fourth rings filled" src="./images/fillmode_01.png"/>
  * The following illustration explains this process. 
  * 
  * <img alt="Illustration of concentric circles with points in the second and third rings and two arbitrary rays extending from each point" src="./images/fillmode_03.png"/>
  * The following illustration shows how the same shape is filled when the winding fill mode is specified. 
  * 
  * <img alt="Illustration of concentric circles with all rings filled" src="./images/fillmode_02.png"/>
  * Notice that all the rings are filled. This is because all the segments run in the same direction, so a ray drawn from any point will cross one or more segments, and the sum of the crossings will not equal zero. 
  * 
  * The following illustration explains this process. The red arrows represent the direction in which the segments are drawn and the black arrow represents an arbitrary ray that runs from a point in the innermost ring. Starting with a value of zero, for each segment that the ray crosses, a value of one is added for every clockwise intersection. All points lie in the fill region in this illustration, because the count does not equal zero. 
  * 
  * <img alt="Illustration of concentric circles with a ray from within the first ring that crosses all four rings" src="./images/fillmode_04.png"/>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d2d1/ne-d2d1-d2d1_fill_mode
 * @namespace Windows.Win32.Graphics.Direct2D.Common
 * @version v4.0.30319
 */
class D2D1_FILL_MODE{

    /**
     * Determines whether a point is in the fill region by drawing a ray from that point to infinity in any direction, and then counting the number of path segments within the given shape that the ray crosses. If this number is odd, the point is in the fill region; if even, the point is outside the fill region.
     * @type {Integer (Int32)}
     */
    static D2D1_FILL_MODE_ALTERNATE => 0

    /**
     * Determines whether a point is in the fill region of the path by drawing a ray from that point to infinity in any direction, and then examining the places where a segment of the shape crosses the ray. Starting with a count of zero, add one each time a segment crosses the ray from left to right and subtract one each time a path segment crosses the ray from right to left,  as long as left and right are seen from the perspective of the ray. After counting the crossings, if the result is zero, then the point is outside the path. Otherwise, it is inside the path.
     * @type {Integer (Int32)}
     */
    static D2D1_FILL_MODE_WINDING => 1
}
