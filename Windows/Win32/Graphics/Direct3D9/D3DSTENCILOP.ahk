#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines stencil-buffer operations.
 * @remarks
 * Stencil-buffer entries are integer values ranging from 0 through 2ⁿ - 1, where n is the bit depth of the stencil buffer.
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3dstencilop
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DSTENCILOP {
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
    static D3DSTENCILOP_KEEP => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DSTENCILOP_ZERO => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DSTENCILOP_REPLACE => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3DSTENCILOP_INCRSAT => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DSTENCILOP_DECRSAT => 5

    /**
     * @type {Integer (Int32)}
     */
    static D3DSTENCILOP_INVERT => 6

    /**
     * @type {Integer (Int32)}
     */
    static D3DSTENCILOP_INCR => 7

    /**
     * @type {Integer (Int32)}
     */
    static D3DSTENCILOP_DECR => 8
}
