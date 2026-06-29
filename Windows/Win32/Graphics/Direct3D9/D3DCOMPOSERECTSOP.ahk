#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies how to combine the glyph data from the source and destination surfaces in a call to ComposeRects.
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3dcomposerectsop
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DCOMPOSERECTSOP {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static D3DCOMPOSERECTS_COPY => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DCOMPOSERECTS_OR => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DCOMPOSERECTS_AND => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3DCOMPOSERECTS_NEG => 4
}
