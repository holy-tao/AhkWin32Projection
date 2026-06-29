#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Indicates whether the vertex buffer changes infrequently or frequently.
 * @remarks
 * If a dynamic vertex buffer is created, Direct2D will not necessarily map the buffer directly to a Direct3D vertex buffer. Instead, a system memory copy can be copied to the rendering engine vertex buffer as the effects are rendered.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/ne-d2d1effectauthor-d2d1_vertex_usage
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct D2D1_VERTEX_USAGE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The created vertex buffer is updated infrequently.
     * @type {Integer (Int32)}
     */
    static D2D1_VERTEX_USAGE_STATIC => 0

    /**
     * The created vertex buffer is changed frequently.
     * @type {Integer (Int32)}
     */
    static D2D1_VERTEX_USAGE_DYNAMIC => 1
}
