#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Identifiers for properties of the Border effect.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effects/ne-d2d1effects-d2d1_border_prop
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct D2D1_BORDER_PROP {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The edge mode in the X direction for the effect. You can set this to clamp, wrap, or mirror.
     *             
     * 
     * The type is <a href="https://docs.microsoft.com/windows/desktop/api/d2d1effects/ne-d2d1effects-d2d1_border_edge_mode">D2D1_BORDER_EDGE_MODE</a>.
     * 
     * The default value is D2D1_BORDER_EDGE_MODE_CLAMP.
     * @type {Integer (Int32)}
     */
    static D2D1_BORDER_PROP_EDGE_MODE_X => 0

    /**
     * The edge mode in the Y direction for the effect. You can set this to clamp, wrap, or mirror.
     *             
     * 
     * The type is <a href="https://docs.microsoft.com/windows/desktop/api/d2d1effects/ne-d2d1effects-d2d1_border_edge_mode">D2D1_BORDER_EDGE_MODE</a>.
     * 
     * The default value is D2D1_BORDER_EDGE_MODE_CLAMP.
     * @type {Integer (Int32)}
     */
    static D2D1_BORDER_PROP_EDGE_MODE_Y => 1
}
