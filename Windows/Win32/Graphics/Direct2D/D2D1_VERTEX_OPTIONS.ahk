#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes flags that influence how the renderer interacts with a custom vertex shader. (D2D1_VERTEX_OPTIONS)
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/ne-d2d1effectauthor-d2d1_vertex_options
 * @namespace Windows.Win32.Graphics.Direct2D
 */
class D2D1_VERTEX_OPTIONS extends Win32BitflagEnum {

    /**
     * The logical equivalent of having no flags set.
     * Native name: D2D1_VERTEX_OPTIONS_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * If this flag is set, the renderer  assumes that the vertex shader will cover the entire region of interest with vertices and need not clear the destination render target. If this flag is not set, the renderer assumes that the vertices do not cover the entire region interest and must clear the render target to transparent black first.
     * Native name: D2D1_VERTEX_OPTIONS_DO_NOT_CLEAR
     * @type {Integer (Int32)}
     */
    static DO_NOT_CLEAR => 1

    /**
     * The renderer will use a depth buffer when rendering custom vertices. The depth buffer will be used for calculating occlusion information. This can result in the renderer output being draw-order dependent if it contains transparency.
     * Native name: D2D1_VERTEX_OPTIONS_USE_DEPTH_BUFFER
     * @type {Integer (Int32)}
     */
    static USE_DEPTH_BUFFER => 2

    /**
     * Indicates that custom vertices do not overlap each other.
     * Native name: D2D1_VERTEX_OPTIONS_ASSUME_NO_OVERLAP
     * @type {Integer (Int32)}
     */
    static ASSUME_NO_OVERLAP => 4
}
