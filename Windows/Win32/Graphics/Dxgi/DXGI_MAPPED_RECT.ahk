#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes a mapped rectangle that is used to access a surface.
 * @remarks
 * The <b>DXGI_MAPPED_RECT</b> structure is initialized by the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgisurface-map">IDXGISurface::Map</a> method.
 * @see https://learn.microsoft.com/windows/win32/api/dxgi/ns-dxgi-dxgi_mapped_rect
 * @namespace Windows.Win32.Graphics.Dxgi
 */
export default struct DXGI_MAPPED_RECT {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">INT</a></b>
     * 
     * A value that describes the width, in bytes, of the surface.
     */
    Pitch : Int32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a>*</b>
     * 
     * A pointer to the image buffer of the surface.
     */
    pBits : IntPtr

}
