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
 * @version v4.0.30319
 */
class D3DDECLTYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3DDECLTYPE_FLOAT1 => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DDECLTYPE_FLOAT2 => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DDECLTYPE_FLOAT3 => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DDECLTYPE_FLOAT4 => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3DDECLTYPE_D3DCOLOR => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DDECLTYPE_UBYTE4 => 5

    /**
     * @type {Integer (Int32)}
     */
    static D3DDECLTYPE_SHORT2 => 6

    /**
     * @type {Integer (Int32)}
     */
    static D3DDECLTYPE_SHORT4 => 7

    /**
     * @type {Integer (Int32)}
     */
    static D3DDECLTYPE_UBYTE4N => 8

    /**
     * @type {Integer (Int32)}
     */
    static D3DDECLTYPE_SHORT2N => 9

    /**
     * @type {Integer (Int32)}
     */
    static D3DDECLTYPE_SHORT4N => 10

    /**
     * @type {Integer (Int32)}
     */
    static D3DDECLTYPE_USHORT2N => 11

    /**
     * @type {Integer (Int32)}
     */
    static D3DDECLTYPE_USHORT4N => 12

    /**
     * @type {Integer (Int32)}
     */
    static D3DDECLTYPE_UDEC3 => 13

    /**
     * @type {Integer (Int32)}
     */
    static D3DDECLTYPE_DEC3N => 14

    /**
     * @type {Integer (Int32)}
     */
    static D3DDECLTYPE_FLOAT16_2 => 15

    /**
     * @type {Integer (Int32)}
     */
    static D3DDECLTYPE_FLOAT16_4 => 16

    /**
     * @type {Integer (Int32)}
     */
    static D3DDECLTYPE_UNUSED => 17
}
