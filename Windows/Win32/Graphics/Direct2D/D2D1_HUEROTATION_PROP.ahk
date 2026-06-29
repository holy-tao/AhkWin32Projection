#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Identifiers for properties of the Hue rotate effect.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effects/ne-d2d1effects-d2d1_huerotation_prop
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct D2D1_HUEROTATION_PROP {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The angle to rotate the hue, in degrees.
     *           
     * 
     * The type is FLOAT.
     * 
     * The default is 0.0f.
     * @type {Integer (Int32)}
     */
    static D2D1_HUEROTATION_PROP_ANGLE => 0
}
