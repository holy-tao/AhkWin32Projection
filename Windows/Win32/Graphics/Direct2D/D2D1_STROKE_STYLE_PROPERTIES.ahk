#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D2D1_DASH_STYLE.ahk" { D2D1_DASH_STYLE }
#Import ".\D2D1_CAP_STYLE.ahk" { D2D1_CAP_STYLE }
#Import ".\D2D1_LINE_JOIN.ahk" { D2D1_LINE_JOIN }

/**
 * Describes the stroke that outlines a shape. (D2D1_STROKE_STYLE_PROPERTIES)
 * @remarks
 * The following illustration shows different <i>dashOffset</i> values for the same custom dash style.
 * 
 * <img alt="Illustration of four dashes with the same style and different dashOffset values" src="./images/StrokeStyle_DashOffset.png"/>
 * @see https://learn.microsoft.com/windows/win32/api/d2d1/ns-d2d1-d2d1_stroke_style_properties
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct D2D1_STROKE_STYLE_PROPERTIES {
    #StructPack 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_cap_style">D2D1_CAP_STYLE</a></b>
     * 
     * The cap applied to the start of all the open figures in a stroked geometry.
     */
    startCap : D2D1_CAP_STYLE

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_cap_style">D2D1_CAP_STYLE</a></b>
     * 
     * The cap applied to the end of all the open figures in a stroked geometry.
     */
    endCap : D2D1_CAP_STYLE

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_cap_style">D2D1_CAP_STYLE</a></b>
     * 
     * The shape  at either end of each dash segment.
     */
    dashCap : D2D1_CAP_STYLE

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_line_join">D2D1_LINE_JOIN</a></b>
     * 
     * A value that describes how segments are joined. This value is ignored for a vertex if the segment flags specify that the segment should have a smooth join.
     */
    lineJoin : D2D1_LINE_JOIN

    /**
     * Type: <b>FLOAT</b>
     * 
     * The limit of the thickness of the join on a mitered corner. This value is always treated as though it is greater than or equal to 1.0f.
     */
    miterLimit : Float32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_dash_style">D2D1_DASH_STYLE</a></b>
     * 
     * A value that specifies whether the stroke has a dash pattern and, if so, the dash style.
     */
    dashStyle : D2D1_DASH_STYLE

    /**
     * Type: <b>FLOAT</b>
     * 
     * A value that specifies an offset in the dash sequence.   A positive dash offset value  shifts the dash pattern, in units of  stroke width, toward the start of the stroked geometry.  A negative dash offset value  shifts the dash pattern, in units of  stroke width, toward the end of the stroked geometry.
     */
    dashOffset : Float32

}
