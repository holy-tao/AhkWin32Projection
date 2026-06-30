#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Contains the result of a Display Data query in Certified Output Protection Protocol (COPP).
 * @remarks
 * The refresh rate is expressed as a fraction. For example, if the refresh rate is 72 Hz, <b>FreqNumerator</b> = 72 and <b>FreqDenominator</b> = 1. For NTSC television, the values are <b>FreqNumerator</b> = 60000 and <b>FreqDenominator</b> = 1001 (59.94 fields per second).
 * @see https://learn.microsoft.com/windows/win32/api/dxva9typ/ns-dxva9typ-dxva_coppstatusdisplaydata
 * @namespace Windows.Win32.Media.DirectShow
 */
class DXVA_COPPStatusDisplayData extends Win32Struct {
    static sizeof => 44

    static packingSize => 4

    /**
     * A 128-bit random number that was passed by the application in the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ns-strmif-amcoppstatusinput">AMCOPPStatusInput</a> structure.
     * @type {Guid}
     */
    rApp {
        get {
            if(!this.HasProp("__rApp"))
                this.__rApp := Guid(0, this)
            return this.__rApp
        }
    }

    /**
     * Status flag. See <a href="https://docs.microsoft.com/windows/desktop/api/dxva9typ/ne-dxva9typ-copp_statusflags">COPP_StatusFlags</a>.
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Width of the display mode, in pixels.
     * @type {Integer}
     */
    DisplayWidth {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Height of the display mode, in pixels.
     * @type {Integer}
     */
    DisplayHeight {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Contains a <b>DXVA_ExtendedFormat</b> structure packed into a <b>ULONG</b>, describing the video format.
     * @type {Integer}
     */
    Format {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Contains a <b>D3DFORMAT</b> value that describes the video format. For more information, see the Direct3D SDK documentation.
     * @type {Integer}
     */
    d3dFormat {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * The numerator of the refresh rate of the current display mode.
     * @type {Integer}
     */
    FreqNumerator {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * The denominator of the refresh rate of the current display mode.
     * @type {Integer}
     */
    FreqDenominator {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }
}
