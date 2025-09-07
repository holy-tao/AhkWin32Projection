#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include Common\DXGI_RATIONAL.ahk

/**
 * Describes a display mode and whether the display mode supports stereo.
 * @remarks
 * <b>DXGI_MODE_DESC1</b> is identical to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb173064(v=vs.85)">DXGI_MODE_DESC</a> except that <b>DXGI_MODE_DESC1</b> includes the <b>Stereo</b> member.
  * 
  * This structure is used by the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgioutput1-getdisplaymodelist1">GetDisplayModeList1</a> and <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgioutput1-findclosestmatchingmode1">FindClosestMatchingMode1</a> methods.
 * @see https://learn.microsoft.com/windows/win32/api/dxgi1_2/ns-dxgi1_2-dxgi_mode_desc1
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class DXGI_MODE_DESC1 extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * A value that describes the resolution width.
     * @type {Integer}
     */
    Width {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A value that describes the resolution height.
     * @type {Integer}
     */
    Height {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/dxgicommon/ns-dxgicommon-dxgi_rational">DXGI_RATIONAL</a> structure that describes the refresh rate in hertz.
     * @type {DXGI_RATIONAL}
     */
    RefreshRate{
        get {
            if(!this.HasProp("__RefreshRate"))
                this.__RefreshRate := DXGI_RATIONAL(this.ptr + 8)
            return this.__RefreshRate
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a>-typed value that describes the display format.
     * @type {Integer}
     */
    Format {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb173067(v=vs.85)">DXGI_MODE_SCANLINE_ORDER</a>-typed value that describes the scan-line drawing mode.
     * @type {Integer}
     */
    ScanlineOrdering {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb173066(v=vs.85)">DXGI_MODE_SCALING</a>-typed value that describes the scaling mode.
     * @type {Integer}
     */
    Scaling {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * Specifies whether the full-screen display mode is stereo. <b>TRUE</b> if stereo; otherwise, <b>FALSE</b>.
     * @type {Integer}
     */
    Stereo {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }
}
