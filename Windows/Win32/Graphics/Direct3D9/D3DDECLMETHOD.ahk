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
 */
class D3DDECLMETHOD extends Win32Enum {

    /**
     * Native name: D3DDECLMETHOD_DEFAULT
     * @type {Integer (Int32)}
     */
    static DEFAULT => 0

    /**
     * Native name: D3DDECLMETHOD_PARTIALU
     * @type {Integer (Int32)}
     */
    static PARTIALU => 1

    /**
     * Native name: D3DDECLMETHOD_PARTIALV
     * @type {Integer (Int32)}
     */
    static PARTIALV => 2

    /**
     * Native name: D3DDECLMETHOD_CROSSUV
     * @type {Integer (Int32)}
     */
    static CROSSUV => 3

    /**
     * Native name: D3DDECLMETHOD_UV
     * @type {Integer (Int32)}
     */
    static UV => 4

    /**
     * Native name: D3DDECLMETHOD_LOOKUP
     * @type {Integer (Int32)}
     */
    static LOOKUP => 5

    /**
     * Native name: D3DDECLMETHOD_LOOKUPPRESAMPLED
     * @type {Integer (Int32)}
     */
    static LOOKUPPRESAMPLED => 6
}
