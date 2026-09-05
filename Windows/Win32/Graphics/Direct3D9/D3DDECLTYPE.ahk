#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines a vertex declaration data type.
 * @remarks
 * Vertex data is declared with an array of [**D3DVERTEXELEMENT9**](d3dvertexelement9.md) structures. Each element in the array contains a vertex declaration data type.
 * 
 * Use the DirectX Caps Viewer Tool (DXCapsViewer.exe) to see which types are supported on your device. You can get this tool and learn about it from the DirectX SDK. For info about the DirectX SDK, see [Where is the DirectX SDK?](../directx-sdk--august-2009-.md).
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3ddecltype
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
class D3DDECLTYPE extends Win32Enum {

    /**
     * Native name: D3DDECLTYPE_FLOAT1
     * @type {Integer (Int32)}
     */
    static FLOAT1 => 0

    /**
     * Native name: D3DDECLTYPE_FLOAT2
     * @type {Integer (Int32)}
     */
    static FLOAT2 => 1

    /**
     * Native name: D3DDECLTYPE_FLOAT3
     * @type {Integer (Int32)}
     */
    static FLOAT3 => 2

    /**
     * Native name: D3DDECLTYPE_FLOAT4
     * @type {Integer (Int32)}
     */
    static FLOAT4 => 3

    /**
     * Native name: D3DDECLTYPE_D3DCOLOR
     * @type {Integer (Int32)}
     */
    static D3DCOLOR => 4

    /**
     * Native name: D3DDECLTYPE_UBYTE4
     * @type {Integer (Int32)}
     */
    static UBYTE4 => 5

    /**
     * Native name: D3DDECLTYPE_SHORT2
     * @type {Integer (Int32)}
     */
    static SHORT2 => 6

    /**
     * Native name: D3DDECLTYPE_SHORT4
     * @type {Integer (Int32)}
     */
    static SHORT4 => 7

    /**
     * Native name: D3DDECLTYPE_UBYTE4N
     * @type {Integer (Int32)}
     */
    static UBYTE4N => 8

    /**
     * Native name: D3DDECLTYPE_SHORT2N
     * @type {Integer (Int32)}
     */
    static SHORT2N => 9

    /**
     * Native name: D3DDECLTYPE_SHORT4N
     * @type {Integer (Int32)}
     */
    static SHORT4N => 10

    /**
     * Native name: D3DDECLTYPE_USHORT2N
     * @type {Integer (Int32)}
     */
    static USHORT2N => 11

    /**
     * Native name: D3DDECLTYPE_USHORT4N
     * @type {Integer (Int32)}
     */
    static USHORT4N => 12

    /**
     * Native name: D3DDECLTYPE_UDEC3
     * @type {Integer (Int32)}
     */
    static UDEC3 => 13

    /**
     * Native name: D3DDECLTYPE_DEC3N
     * @type {Integer (Int32)}
     */
    static DEC3N => 14

    /**
     * Native name: D3DDECLTYPE_FLOAT16_2
     * @type {Integer (Int32)}
     */
    static FLOAT16_2 => 15

    /**
     * Native name: D3DDECLTYPE_FLOAT16_4
     * @type {Integer (Int32)}
     */
    static FLOAT16_4 => 16

    /**
     * Native name: D3DDECLTYPE_UNUSED
     * @type {Integer (Int32)}
     */
    static UNUSED => 17
}
