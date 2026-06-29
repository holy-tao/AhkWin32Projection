#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ID2D1Geometry.ahk" { ID2D1Geometry }
#Import "Common\D2D_RECT_F.ahk" { D2D_RECT_F }
#Import ".\D2D1_ANTIALIAS_MODE.ahk" { D2D1_ANTIALIAS_MODE }
#Import ".\ID2D1Brush.ahk" { ID2D1Brush }
#Import "Common\D2D_MATRIX_3X2_F.ahk" { D2D_MATRIX_3X2_F }
#Import ".\D2D1_LAYER_OPTIONS1.ahk" { D2D1_LAYER_OPTIONS1 }

/**
 * Contains the content bounds, mask information, opacity settings, and other options for a layer resource. (D2D1_LAYER_PARAMETERS1)
 * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/ns-d2d1_1-d2d1_layer_parameters1
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct D2D1_LAYER_PARAMETERS1 {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-rect-f">D2D1_RECT_F</a></b>
     * 
     * The content bounds of the layer. Content outside these bounds is not guaranteed to render.
     */
    contentBounds : D2D_RECT_F

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nn-d2d1-id2d1geometry">ID2D1Geometry</a>*</b>
     * 
     * The geometric mask specifies the area of the layer that is composited into the render target.
     */
    geometricMask : ID2D1Geometry

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/ne-d2d1-d2d1_antialias_mode">D2D1_ANTIALIAS_MODE</a></b>
     * 
     * A value that specifies the antialiasing mode for the geometricMask.
     */
    maskAntialiasMode : D2D1_ANTIALIAS_MODE

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-matrix-3x2-f">D2D1_MATRIX_3X2_F</a></b>
     * 
     * A value that specifies the transform that is applied to the geometric mask when composing the layer.
     */
    maskTransform : D2D_MATRIX_3X2_F

    /**
     * Type: <b>FLOAT</b>
     * 
     * An opacity value that is applied uniformly to all resources in the layer when compositing to the target.
     */
    opacity : Float32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nn-d2d1-id2d1brush">ID2D1Brush</a>*</b>
     * 
     * A brush that is used to modify the opacity of the layer. The brush 
     * is mapped to the layer, and the alpha channel of each mapped brush pixel is multiplied against the corresponding layer pixel.
     */
    opacityBrush : ID2D1Brush

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_layer_options1">D2D1_LAYER_OPTIONS1</a></b>
     * 
     * Additional options for the layer creation.
     */
    layerOptions : D2D1_LAYER_OPTIONS1

}
