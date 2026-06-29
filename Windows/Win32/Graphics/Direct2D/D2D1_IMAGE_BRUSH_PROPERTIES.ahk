#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D2D1_EXTEND_MODE.ahk" { D2D1_EXTEND_MODE }
#Import ".\D2D1_INTERPOLATION_MODE.ahk" { D2D1_INTERPOLATION_MODE }
#Import "Common\D2D_RECT_F.ahk" { D2D_RECT_F }

/**
 * Describes image brush features.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/ns-d2d1_1-d2d1_image_brush_properties
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct D2D1_IMAGE_BRUSH_PROPERTIES {
    #StructPack 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-rect-f">D2D1_RECT_F</a></b>
     * 
     * The source rectangle in the image space from which the image will be tiled or interpolated.
     */
    sourceRectangle : D2D_RECT_F

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/ne-d2d1-d2d1_extend_mode">D2D1_EXTEND_MODE</a></b>
     * 
     * The extend mode in the image x-axis.
     */
    extendModeX : D2D1_EXTEND_MODE

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/ne-d2d1-d2d1_extend_mode">D2D1_EXTEND_MODE</a></b>
     * 
     * The extend mode in the image y-axis.
     */
    extendModeY : D2D1_EXTEND_MODE

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-rect-f">D2D1_INTERPOLATION_MODE</a></b>
     * 
     * The interpolation mode to use when scaling the image brush.
     */
    interpolationMode : D2D1_INTERPOLATION_MODE

}
