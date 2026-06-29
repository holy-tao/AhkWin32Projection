#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Identifiers for properties of the Blend effect.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effects/ne-d2d1effects-d2d1_blend_prop
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct D2D1_BLEND_PROP {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The blend mode used for the effect.
     *           
     * 
     * The type is <a href="https://docs.microsoft.com/windows/desktop/api/d2d1effects/ne-d2d1effects-d2d1_blend_mode">D2D1_BLEND_MODE</a>.
     * 
     * The default value is D2D1_BLEND_MODE_MULTIPLY.
     * @type {Integer (Int32)}
     */
    static D2D1_BLEND_PROP_MODE => 0
}
