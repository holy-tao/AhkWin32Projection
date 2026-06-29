#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "Common\DXGI_RATIONAL.ahk" { DXGI_RATIONAL }
#Import "Common\DXGI_MODE_SCANLINE_ORDER.ahk" { DXGI_MODE_SCANLINE_ORDER }
#Import "Common\DXGI_MODE_SCALING.ahk" { DXGI_MODE_SCALING }
#Import "Common\DXGI_FORMAT.ahk" { DXGI_FORMAT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Describes a display mode and whether the display mode supports stereo.
 * @remarks
 * <b>DXGI_MODE_DESC1</b> is identical to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb173064(v=vs.85)">DXGI_MODE_DESC</a> except that <b>DXGI_MODE_DESC1</b> includes the <b>Stereo</b> member.
 * 
 * This structure is used by the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgioutput1-getdisplaymodelist1">GetDisplayModeList1</a> and <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgioutput1-findclosestmatchingmode1">FindClosestMatchingMode1</a> methods.
 * @see https://learn.microsoft.com/windows/win32/api/dxgi1_2/ns-dxgi1_2-dxgi_mode_desc1
 * @namespace Windows.Win32.Graphics.Dxgi
 */
export default struct DXGI_MODE_DESC1 {
    #StructPack 4

    /**
     * A value that describes the resolution width.
     */
    Width : UInt32

    /**
     * A value that describes the resolution height.
     */
    Height : UInt32

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/dxgicommon/ns-dxgicommon-dxgi_rational">DXGI_RATIONAL</a> structure that describes the refresh rate in hertz.
     */
    RefreshRate : DXGI_RATIONAL

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a>-typed value that describes the display format.
     */
    Format : DXGI_FORMAT

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb173067(v=vs.85)">DXGI_MODE_SCANLINE_ORDER</a>-typed value that describes the scan-line drawing mode.
     */
    ScanlineOrdering : DXGI_MODE_SCANLINE_ORDER

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb173066(v=vs.85)">DXGI_MODE_SCALING</a>-typed value that describes the scaling mode.
     */
    Scaling : DXGI_MODE_SCALING

    /**
     * Specifies whether the full-screen display mode is stereo. <b>TRUE</b> if stereo; otherwise, <b>FALSE</b>.
     */
    Stereo : BOOL

}
