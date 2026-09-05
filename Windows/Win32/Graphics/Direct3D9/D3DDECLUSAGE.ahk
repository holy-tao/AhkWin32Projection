#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Identifies the intended use of vertex data.
 * @remarks
 * Vertex data is declared with an array of [**D3DVERTEXELEMENT9**](d3dvertexelement9.md) structures. Each element in the array contains a usage type.
 * 
 * For more information about vertex declarations, see [Vertex Declaration (Direct3D 9)](vertex-declaration.md).
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3ddeclusage
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
class D3DDECLUSAGE extends Win32Enum {

    /**
     * Native name: D3DDECLUSAGE_POSITION
     * @type {Integer (Int32)}
     */
    static POSITION => 0

    /**
     * Native name: D3DDECLUSAGE_BLENDWEIGHT
     * @type {Integer (Int32)}
     */
    static BLENDWEIGHT => 1

    /**
     * Native name: D3DDECLUSAGE_BLENDINDICES
     * @type {Integer (Int32)}
     */
    static BLENDINDICES => 2

    /**
     * Native name: D3DDECLUSAGE_NORMAL
     * @type {Integer (Int32)}
     */
    static NORMAL => 3

    /**
     * Native name: D3DDECLUSAGE_PSIZE
     * @type {Integer (Int32)}
     */
    static PSIZE => 4

    /**
     * Native name: D3DDECLUSAGE_TEXCOORD
     * @type {Integer (Int32)}
     */
    static TEXCOORD => 5

    /**
     * Native name: D3DDECLUSAGE_TANGENT
     * @type {Integer (Int32)}
     */
    static TANGENT => 6

    /**
     * Native name: D3DDECLUSAGE_BINORMAL
     * @type {Integer (Int32)}
     */
    static BINORMAL => 7

    /**
     * Native name: D3DDECLUSAGE_TESSFACTOR
     * @type {Integer (Int32)}
     */
    static TESSFACTOR => 8

    /**
     * Native name: D3DDECLUSAGE_POSITIONT
     * @type {Integer (Int32)}
     */
    static POSITIONT => 9

    /**
     * Native name: D3DDECLUSAGE_COLOR
     * @type {Integer (Int32)}
     */
    static COLOR => 10

    /**
     * Native name: D3DDECLUSAGE_FOG
     * @type {Integer (Int32)}
     */
    static FOG => 11

    /**
     * Native name: D3DDECLUSAGE_DEPTH
     * @type {Integer (Int32)}
     */
    static DEPTH => 12

    /**
     * Native name: D3DDECLUSAGE_SAMPLE
     * @type {Integer (Int32)}
     */
    static SAMPLE => 13
}
