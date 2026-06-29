#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Identifiers for properties of the Tile effect.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effects/ne-d2d1effects-d2d1_tile_prop
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct D2D1_TILE_PROP {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The region of the image to be tiled. This property is a <a href="https://docs.microsoft.com/windows/desktop/api/dcommon/ns-dcommon-d2d_vector_4f">D2D1_VECTOR_4F</a> defined as: (left, top, right, bottom). The units are in DIPs.
     *             
     * 
     * The type is <a href="https://docs.microsoft.com/windows/desktop/api/dcommon/ns-dcommon-d2d_vector_4f">D2D1_VECTOR_4F</a>.
     * 
     * The default is {0.0f, 0.0f, 100.0f, 100.0f}.
     * @type {Integer (Int32)}
     */
    static D2D1_TILE_PROP_RECT => 0
}
