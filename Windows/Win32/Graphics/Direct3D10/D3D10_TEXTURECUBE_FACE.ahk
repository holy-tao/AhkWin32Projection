#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The different faces of a cube texture.
 * @see https://docs.microsoft.com/windows/win32/api//d3d10/ne-d3d10-d3d10_texturecube_face
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class D3D10_TEXTURECUBE_FACE extends Win32Enum{

    /**
     * Positive X face.
     * @type {Integer (Int32)}
     */
    static D3D10_TEXTURECUBE_FACE_POSITIVE_X => 0

    /**
     * Negative X face.
     * @type {Integer (Int32)}
     */
    static D3D10_TEXTURECUBE_FACE_NEGATIVE_X => 1

    /**
     * Positive Y face.
     * @type {Integer (Int32)}
     */
    static D3D10_TEXTURECUBE_FACE_POSITIVE_Y => 2

    /**
     * Negative Y face.
     * @type {Integer (Int32)}
     */
    static D3D10_TEXTURECUBE_FACE_NEGATIVE_Y => 3

    /**
     * Positive Z face.
     * @type {Integer (Int32)}
     */
    static D3D10_TEXTURECUBE_FACE_POSITIVE_Z => 4

    /**
     * Negative Z face.
     * @type {Integer (Int32)}
     */
    static D3D10_TEXTURECUBE_FACE_NEGATIVE_Z => 5
}
