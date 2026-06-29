#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Identifiers for properties of the Opacity metadata effect.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effects/ne-d2d1effects-d2d1_opacitymetadata_prop
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct D2D1_OPACITYMETADATA_PROP {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The portion of the source image that is opaque. The default is the entire input image.
     *           
     * 
     * The type is <a href="https://docs.microsoft.com/windows/desktop/api/dcommon/ns-dcommon-d2d_vector_4f">D2D1_VECTOR_4F</a>.
     * 
     * The default is {-FLT_MAX, -FLT_MAX, FLT_MAX, FLT_MAX}.
     * @type {Integer (Int32)}
     */
    static D2D1_OPACITYMETADATA_PROP_INPUT_OPAQUE_RECT => 0
}
