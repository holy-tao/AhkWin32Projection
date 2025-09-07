#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies which characteristics of a stroke, such as drawing attributes, are used to calculate the bounding box of the ink.The bounding box is the smallest rectangle that includes all points in the InkDisp object.
 * @see https://learn.microsoft.com/windows/win32/api/msinkaut/ne-msinkaut-inkboundingboxmode
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class InkBoundingBoxMode{

    /**
     * The definition of each stroke (polyline or Bezier) is used to calculate the bounding box; includes the drawing attributes, such as pen width, in the calculation.
     * @type {Integer (Int32)}
     */
    static IBBM_Default => 0

    /**
     * The polyline of the strokes (ignoring Bezier curve fitting requests) is used to calculate the bounding box; includes the drawing attributes in the calculation.
     * @type {Integer (Int32)}
     */
    static IBBM_NoCurveFit => 1

    /**
     * The  Bezier curve fitting line of the strokes (apply Bezier curve fitting to all strokes) is used to calculate the bounding box; includes the drawing attributes in the calculation.
     * @type {Integer (Int32)}
     */
    static IBBM_CurveFit => 2

    /**
     * Only the points of the strokes are used to calculate the bounding box.
     * @type {Integer (Int32)}
     */
    static IBBM_PointsOnly => 3

    /**
     * The union of a NoCurveFit request and a CurveFit request.
     * @type {Integer (Int32)}
     */
    static IBBM_Union => 4
}
