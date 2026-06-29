#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "Common\D2D_POINT_2F.ahk" { D2D_POINT_2F }

/**
 * Describes a point on a path geometry.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/ns-d2d1_1-d2d1_point_description
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct D2D1_POINT_DESCRIPTION {
    #StructPack 4

    /**
     * The end point after walking the path.
     */
    point : D2D_POINT_2F

    /**
     * A unit vector indicating the tangent point.
     */
    unitTangentVector : D2D_POINT_2F

    /**
     * The index of the segment on which point resides. This index is global to the entire path, not just to a particular figure.
     */
    endSegment : UInt32

    /**
     * The index of the figure on which point resides.
     */
    endFigure : UInt32

    /**
     * The length of the section of the path stretching from the start of the path  to the start of <b>endSegment</b>.
     */
    lengthToEndSegment : Float32

}
