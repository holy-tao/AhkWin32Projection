#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "Common\DXGI_MODE_ROTATION.ahk" { DXGI_MODE_ROTATION }
#Import "Common\DXGI_RATIONAL.ahk" { DXGI_RATIONAL }
#Import "Common\DXGI_MODE_SCANLINE_ORDER.ahk" { DXGI_MODE_SCANLINE_ORDER }
#Import "Common\DXGI_MODE_SCALING.ahk" { DXGI_MODE_SCALING }
#Import "Common\DXGI_MODE_DESC.ahk" { DXGI_MODE_DESC }
#Import "Common\DXGI_FORMAT.ahk" { DXGI_FORMAT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * The DXGI_OUTDUPL_DESC structure describes the dimension of the output and the surface that contains the desktop image. The format of the desktop image is always DXGI_FORMAT_B8G8R8A8_UNORM.
 * @remarks
 * This structure is used by <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgioutputduplication-getdesc">GetDesc</a>.
 * @see https://learn.microsoft.com/windows/win32/api/dxgi1_2/ns-dxgi1_2-dxgi_outdupl_desc
 * @namespace Windows.Win32.Graphics.Dxgi
 */
export default struct DXGI_OUTDUPL_DESC {
    #StructPack 4

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb173064(v=vs.85)">DXGI_MODE_DESC</a> structure that describes the display mode of the duplicated output.
     */
    ModeDesc : DXGI_MODE_DESC

    /**
     * A member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb173065(v=vs.85)">DXGI_MODE_ROTATION</a> enumerated type that describes how the duplicated output rotates an image.
     */
    Rotation : DXGI_MODE_ROTATION

    /**
     * Specifies whether the resource that contains the desktop image is already located in system memory. <b>TRUE</b> if the resource is in system memory; otherwise, <b>FALSE</b>. If this value is <b>TRUE</b> and  the application requires CPU access, it can use the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgioutputduplication-mapdesktopsurface">IDXGIOutputDuplication::MapDesktopSurface</a> and <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgioutputduplication-unmapdesktopsurface">IDXGIOutputDuplication::UnMapDesktopSurface</a> methods to avoid copying the data into a staging buffer.
     */
    DesktopImageInSystemMemory : BOOL

}
