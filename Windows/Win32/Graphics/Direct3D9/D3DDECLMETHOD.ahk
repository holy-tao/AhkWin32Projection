#Requires AutoHotkey v2.0.0 64-bit

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3ddeclmethod
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DDECLMETHOD{

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
