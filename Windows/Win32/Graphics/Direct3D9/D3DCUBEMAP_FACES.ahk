#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the faces of a cubemap.
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3dcubemap-faces
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DCUBEMAP_FACES {
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
    static D3DCUBEMAP_FACE_POSITIVE_X => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DCUBEMAP_FACE_NEGATIVE_X => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DCUBEMAP_FACE_POSITIVE_Y => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DCUBEMAP_FACE_NEGATIVE_Y => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3DCUBEMAP_FACE_POSITIVE_Z => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DCUBEMAP_FACE_NEGATIVE_Z => 5
}
