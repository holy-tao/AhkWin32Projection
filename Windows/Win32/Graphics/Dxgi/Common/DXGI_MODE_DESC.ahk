#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DXGI_RATIONAL.ahk" { DXGI_RATIONAL }
#Import ".\DXGI_MODE_SCANLINE_ORDER.ahk" { DXGI_MODE_SCANLINE_ORDER }
#Import ".\DXGI_MODE_SCALING.ahk" { DXGI_MODE_SCALING }
#Import ".\DXGI_FORMAT.ahk" { DXGI_FORMAT }

/**
 * @namespace Windows.Win32.Graphics.Dxgi.Common
 */
export default struct DXGI_MODE_DESC {
    #StructPack 4

    Width : UInt32

    Height : UInt32

    RefreshRate : DXGI_RATIONAL

    Format : DXGI_FORMAT

    ScanlineOrdering : DXGI_MODE_SCANLINE_ORDER

    Scaling : DXGI_MODE_SCALING

}
