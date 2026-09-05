#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The different faces of a cube texture. (D3D10_TEXTURECUBE_FACE)
 * @see https://learn.microsoft.com/windows/win32/api/d3d10/ne-d3d10-d3d10_texturecube_face
 * @namespace Windows.Win32.Graphics.Direct3D10
 */
class D3D10_TEXTURECUBE_FACE extends Win32Enum {

    /**
     * Positive X face.
     * Native name: D3D10_TEXTURECUBE_FACE_POSITIVE_X
     * @type {Integer (Int32)}
     */
    static POSITIVE_X => 0

    /**
     * Negative X face.
     * Native name: D3D10_TEXTURECUBE_FACE_NEGATIVE_X
     * @type {Integer (Int32)}
     */
    static NEGATIVE_X => 1

    /**
     * Positive Y face.
     * Native name: D3D10_TEXTURECUBE_FACE_POSITIVE_Y
     * @type {Integer (Int32)}
     */
    static POSITIVE_Y => 2

    /**
     * Negative Y face.
     * Native name: D3D10_TEXTURECUBE_FACE_NEGATIVE_Y
     * @type {Integer (Int32)}
     */
    static NEGATIVE_Y => 3

    /**
     * Positive Z face.
     * Native name: D3D10_TEXTURECUBE_FACE_POSITIVE_Z
     * @type {Integer (Int32)}
     */
    static POSITIVE_Z => 4

    /**
     * Negative Z face.
     * Native name: D3D10_TEXTURECUBE_FACE_NEGATIVE_Z
     * @type {Integer (Int32)}
     */
    static NEGATIVE_Z => 5
}
