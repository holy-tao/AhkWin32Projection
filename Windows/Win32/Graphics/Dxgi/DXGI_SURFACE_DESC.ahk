#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "Common\DXGI_FORMAT.ahk" { DXGI_FORMAT }
#Import "Common\DXGI_SAMPLE_DESC.ahk" { DXGI_SAMPLE_DESC }

/**
 * Describes a surface.
 * @remarks
 * This structure is used by the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgisurface-getdesc">GetDesc</a> and  <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgidevice-createsurface">CreateSurface</a> methods.
 * @see https://learn.microsoft.com/windows/win32/api/dxgi/ns-dxgi-dxgi_surface_desc
 * @namespace Windows.Win32.Graphics.Dxgi
 */
export default struct DXGI_SURFACE_DESC {
    #StructPack 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A value describing the surface width.
     */
    Width : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * A value describing the surface height.
     */
    Height : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a></b>
     * 
     * A member of the <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a> enumerated type that describes the surface format.
     */
    Format : DXGI_FORMAT

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgicommon/ns-dxgicommon-dxgi_sample_desc">DXGI_SAMPLE_DESC</a></b>
     * 
     * A member of the <a href="https://docs.microsoft.com/windows/desktop/api/dxgicommon/ns-dxgicommon-dxgi_sample_desc">DXGI_SAMPLE_DESC</a> structure that describes multi-sampling parameters for the surface.
     */
    SampleDesc : DXGI_SAMPLE_DESC

}
