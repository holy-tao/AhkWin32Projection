#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Identifiers for properties of the Composite effect.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effects/ne-d2d1effects-d2d1_composite_prop
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct D2D1_COMPOSITE_PROP {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The mode used for the effect.
     *             
     * 
     * Type is D2D1_COMPOSITE_MODE.
     * 
     * Default value is D2D1_COMPOSITE_MODE_SOURCE_OVER
     * @type {Integer (Int32)}
     */
    static D2D1_COMPOSITE_PROP_MODE => 0
}
