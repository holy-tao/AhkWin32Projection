#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Flags indicating the method the rasterizer uses to create an image on a surface.
 * @remarks
 * This enumeration is used as a member in [**D3DDISPLAYMODEFILTER**](d3ddisplaymodefilter.md) and [**D3DDISPLAYMODEEX**](d3ddisplaymodeex.md).
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3dscanlineordering
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DSCANLINEORDERING {
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
    static D3DSCANLINEORDERING_UNKNOWN => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DSCANLINEORDERING_PROGRESSIVE => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DSCANLINEORDERING_INTERLACED => 2
}
