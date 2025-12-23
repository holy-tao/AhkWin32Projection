#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the vertex declaration method which is a predefined operation performed by the tessellator (or any procedural geometry routine on the vertex data during tessellation).
 * @remarks
 * The tessellator looks at the method to determine what data to calculate from the vertex data during tessellation. Mesh data should use the default value. Patches can use any of the other implemented types.
 * 
 * Vertex data is declared with an array of [**D3DVERTEXELEMENT9**](d3dvertexelement9.md) structures. Each element in the array contains a vertex declaration method.
 * 
 * In addition to using D3DDECLMETHOD\_DEFAULT, a normal mesh can use D3DDECLMETHOD\_LOOKUP and D3DDECLMETHOD\_LOOKUPPRESAMPLED methods when N-patches are enabled.
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3ddeclmethod
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DDECLMETHOD extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3DDECLMETHOD_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DDECLMETHOD_PARTIALU => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DDECLMETHOD_PARTIALV => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DDECLMETHOD_CROSSUV => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3DDECLMETHOD_UV => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DDECLMETHOD_LOOKUP => 5

    /**
     * @type {Integer (Int32)}
     */
    static D3DDECLMETHOD_LOOKUPPRESAMPLED => 6
}
