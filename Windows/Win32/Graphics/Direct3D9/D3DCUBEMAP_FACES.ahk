#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the faces of a cubemap.
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3dcubemap-faces
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
class D3DCUBEMAP_FACES extends Win32Enum {

    /**
     * Native name: D3DCUBEMAP_FACE_POSITIVE_X
     * @type {Integer (Int32)}
     */
    static FACE_POSITIVE_X => 0

    /**
     * Native name: D3DCUBEMAP_FACE_NEGATIVE_X
     * @type {Integer (Int32)}
     */
    static FACE_NEGATIVE_X => 1

    /**
     * Native name: D3DCUBEMAP_FACE_POSITIVE_Y
     * @type {Integer (Int32)}
     */
    static FACE_POSITIVE_Y => 2

    /**
     * Native name: D3DCUBEMAP_FACE_NEGATIVE_Y
     * @type {Integer (Int32)}
     */
    static FACE_NEGATIVE_Y => 3

    /**
     * Native name: D3DCUBEMAP_FACE_POSITIVE_Z
     * @type {Integer (Int32)}
     */
    static FACE_POSITIVE_Z => 4

    /**
     * Native name: D3DCUBEMAP_FACE_NEGATIVE_Z
     * @type {Integer (Int32)}
     */
    static FACE_NEGATIVE_Z => 5
}
