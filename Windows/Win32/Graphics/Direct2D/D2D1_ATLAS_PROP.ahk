#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Identifiers for properties of the Atlas effect.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effects/ne-d2d1effects-d2d1_atlas_prop
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct D2D1_ATLAS_PROP {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The portion of the image passed to the next effect.
     *             Type is D2D1_VECTOR_4F.
     *             Default value is (-FLT_MAX, -FLT_MAX, FLT_MAX, FLT_MAX).
     * @type {Integer (Int32)}
     */
    static D2D1_ATLAS_PROP_INPUT_RECT => 0

    /**
     * The maximum size sampled for the output rectangle.
     *             Type is D2D1_VECTOR_4F.
     *             Default value is (-FLT_MAX, -FLT_MAX, FLT_MAX, FLT_MAX).
     * @type {Integer (Int32)}
     */
    static D2D1_ATLAS_PROP_INPUT_PADDING_RECT => 1
}
