#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines resource types.
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3dresourcetype
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DRESOURCETYPE {
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
    static D3DRTYPE_SURFACE => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DRTYPE_VOLUME => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DRTYPE_TEXTURE => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3DRTYPE_VOLUMETEXTURE => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DRTYPE_CUBETEXTURE => 5

    /**
     * @type {Integer (Int32)}
     */
    static D3DRTYPE_VERTEXBUFFER => 6

    /**
     * @type {Integer (Int32)}
     */
    static D3DRTYPE_INDEXBUFFER => 7
}
