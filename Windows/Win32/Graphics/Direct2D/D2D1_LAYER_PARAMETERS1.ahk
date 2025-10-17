#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include Common\D2D_RECT_F.ahk
#Include Common\D2D_MATRIX_3X2_F.ahk

/**
 * Contains the content bounds, mask information, opacity settings, and other options for a layer resource.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/ns-d2d1_1-d2d1_layer_parameters1
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_LAYER_PARAMETERS1 extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-rect-f">D2D1_RECT_F</a></b>
     * 
     * The content bounds of the layer. Content outside these bounds is not guaranteed to render.
     * @type {D2D_RECT_F}
     */
    contentBounds{
        get {
            if(!this.HasProp("__contentBounds"))
                this.__contentBounds := D2D_RECT_F(0, this)
            return this.__contentBounds
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nn-d2d1-id2d1geometry">ID2D1Geometry</a>*</b>
     * 
     * The geometric mask specifies the area of the layer that is composited into the render target.
     * @type {Pointer<ID2D1Geometry>}
     */
    geometricMask {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/ne-d2d1-d2d1_antialias_mode">D2D1_ANTIALIAS_MODE</a></b>
     * 
     * A value that specifies the antialiasing mode for the geometricMask.
     * @type {Integer}
     */
    maskAntialiasMode {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-matrix-3x2-f">D2D1_MATRIX_3X2_F</a></b>
     * 
     * A value that specifies the transform that is applied to the geometric mask when composing the layer.
     * @type {D2D_MATRIX_3X2_F}
     */
    maskTransform{
        get {
            if(!this.HasProp("__maskTransform"))
                this.__maskTransform := D2D_MATRIX_3X2_F(32, this)
            return this.__maskTransform
        }
    }

    /**
     * Type: <b>FLOAT</b>
     * 
     * An opacity value that is applied uniformly to all resources in the layer when compositing to the target.
     * @type {Float}
     */
    opacity {
        get => NumGet(this, 56, "float")
        set => NumPut("float", value, this, 56)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nn-d2d1-id2d1brush">ID2D1Brush</a>*</b>
     * 
     * A brush that is used to modify the opacity of the layer. The brush 
     * is mapped to the layer, and the alpha channel of each mapped brush pixel is multiplied against the corresponding layer pixel.
     * @type {Pointer<ID2D1Brush>}
     */
    opacityBrush {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_layer_options1">D2D1_LAYER_OPTIONS1</a></b>
     * 
     * Additional options for the layer creation.
     * @type {Integer}
     */
    layerOptions {
        get => NumGet(this, 72, "int")
        set => NumPut("int", value, this, 72)
    }
}
