#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates whether the vertex buffer changes infrequently or frequently.
 * @remarks
 * If a dynamic vertex buffer is created, Direct2D will not necessarily map the buffer directly to a Direct3D vertex buffer. Instead, a system memory copy can be copied to the rendering engine vertex buffer as the effects are rendered.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/ne-d2d1effectauthor-d2d1_vertex_usage
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_VERTEX_USAGE extends Win32Enum{

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
