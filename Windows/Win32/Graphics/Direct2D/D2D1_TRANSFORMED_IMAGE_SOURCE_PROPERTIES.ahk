#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D2D1_INTERPOLATION_MODE.ahk" { D2D1_INTERPOLATION_MODE }
#Import ".\D2D1_TRANSFORMED_IMAGE_SOURCE_OPTIONS.ahk" { D2D1_TRANSFORMED_IMAGE_SOURCE_OPTIONS }
#Import ".\D2D1_ORIENTATION.ahk" { D2D1_ORIENTATION }

/**
 * Properties of a transformed image source.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/ns-d2d1_3-d2d1_transformed_image_source_properties
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct D2D1_TRANSFORMED_IMAGE_SOURCE_PROPERTIES {
    #StructPack 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/ne-d2d1_3-d2d1_orientation">D2D1_ORIENTATION</a></b>
     * 
     * The orientation at which the image source is drawn.
     */
    orientation : D2D1_ORIENTATION

    /**
     * Type: <b>FLOAT</b>
     * 
     * The horizontal scale factor at which the image source is drawn.
     */
    scaleX : Float32

    /**
     * Type: <b>FLOAT</b>
     * 
     * The vertical scale factor at which the image source is drawn.
     */
    scaleY : Float32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_interpolation_mode">D2D1_INTERPOLATION_MODE</a></b>
     * 
     * The interpolation mode used when the image source is drawn.  This is ignored if the image source is drawn using the DrawImage method, or using an image brush.
     */
    interpolationMode : D2D1_INTERPOLATION_MODE

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/ne-d2d1_3-d2d1_transformed_image_source_options">D2D1_TRANSFORMED_IMAGE_SOURCE_OPTIONS</a></b>
     * 
     * Image source option flags.
     */
    options : D2D1_TRANSFORMED_IMAGE_SOURCE_OPTIONS

}
