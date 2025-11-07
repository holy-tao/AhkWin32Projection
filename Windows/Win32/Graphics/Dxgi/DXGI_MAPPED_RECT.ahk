#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes a mapped rectangle that is used to access a surface.
 * @remarks
 * 
 * The <b>DXGI_MAPPED_RECT</b> structure is initialized by the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgisurface-map">IDXGISurface::Map</a> method.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//dxgi/ns-dxgi-dxgi_mapped_rect
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class DXGI_MAPPED_RECT extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">INT</a></b>
     * 
     * A value that describes the width, in bytes, of the surface.
     * @type {Integer}
     */
    Pitch {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a>*</b>
     * 
     * A pointer to the image buffer of the surface.
     * @type {Pointer<Integer>}
     */
    pBits {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
