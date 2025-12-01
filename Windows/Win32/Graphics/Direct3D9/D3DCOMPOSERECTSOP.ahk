#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies how to combine the glyph data from the source and destination surfaces in a call to ComposeRects.
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3dcomposerectsop
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DCOMPOSERECTSOP extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3DCOMPOSERECTS_COPY => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DCOMPOSERECTS_OR => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DCOMPOSERECTS_AND => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3DCOMPOSERECTS_NEG => 4
}
