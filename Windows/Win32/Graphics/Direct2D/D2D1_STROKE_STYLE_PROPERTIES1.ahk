#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D2D1_DASH_STYLE.ahk" { D2D1_DASH_STYLE }
#Import ".\D2D1_CAP_STYLE.ahk" { D2D1_CAP_STYLE }
#Import ".\D2D1_STROKE_TRANSFORM_TYPE.ahk" { D2D1_STROKE_TRANSFORM_TYPE }
#Import ".\D2D1_LINE_JOIN.ahk" { D2D1_LINE_JOIN }

/**
 * Describes the stroke that outlines a shape. (D2D1_STROKE_STYLE_PROPERTIES1)
 * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/ns-d2d1_1-d2d1_stroke_style_properties1
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct D2D1_STROKE_STYLE_PROPERTIES1 {
    #StructPack 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/ne-d2d1-d2d1_cap_style">D2D1_CAP_STYLE</a></b>
     * 
     * The cap to use at the start of each open figure.
     */
    startCap : D2D1_CAP_STYLE

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/ne-d2d1-d2d1_cap_style">D2D1_CAP_STYLE</a></b>
     * 
     * The cap to use at the end of each open figure.
     */
    endCap : D2D1_CAP_STYLE

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/ne-d2d1-d2d1_cap_style">D2D1_CAP_STYLE</a></b>
     * 
     * The cap to use at the start and end of each dash.
     */
    dashCap : D2D1_CAP_STYLE

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/ne-d2d1-d2d1_line_join">D2D1_LINE_JOIN</a></b>
     * 
     * The line join to use.
     */
    lineJoin : D2D1_LINE_JOIN

    /**
     * Type: <b>FLOAT</b>
     * 
     * The limit beyond which miters are either clamped or converted to bevels.
     */
    miterLimit : Float32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/ne-d2d1-d2d1_dash_style">D2D1_DASH_STYLE</a></b>
     * 
     * The type of dash to use.
     */
    dashStyle : D2D1_DASH_STYLE

    /**
     * Type: <b>FLOAT</b>
     * 
     * The location of the first dash, relative to the start of the figure.
     */
    dashOffset : Float32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_stroke_transform_type">D2D1_STROKE_TRANSFORM_TYPE</a></b>
     * 
     * The rule that determines what render target properties affect the nib of the stroke.
     */
    transformType : D2D1_STROKE_TRANSFORM_TYPE

}
