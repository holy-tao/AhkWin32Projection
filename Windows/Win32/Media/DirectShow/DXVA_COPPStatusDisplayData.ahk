#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Contains the result of a Display Data query in Certified Output Protection Protocol (COPP).
 * @remarks
 * The refresh rate is expressed as a fraction. For example, if the refresh rate is 72 Hz, <b>FreqNumerator</b> = 72 and <b>FreqDenominator</b> = 1. For NTSC television, the values are <b>FreqNumerator</b> = 60000 and <b>FreqDenominator</b> = 1001 (59.94 fields per second).
 * @see https://learn.microsoft.com/windows/win32/api/dxva9typ/ns-dxva9typ-dxva_coppstatusdisplaydata
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct DXVA_COPPStatusDisplayData {
    #StructPack 4

    /**
     * A 128-bit random number that was passed by the application in the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ns-strmif-amcoppstatusinput">AMCOPPStatusInput</a> structure.
     */
    rApp : Guid

    /**
     * Status flag. See <a href="https://docs.microsoft.com/windows/desktop/api/dxva9typ/ne-dxva9typ-copp_statusflags">COPP_StatusFlags</a>.
     */
    dwFlags : UInt32

    /**
     * Width of the display mode, in pixels.
     */
    DisplayWidth : UInt32

    /**
     * Height of the display mode, in pixels.
     */
    DisplayHeight : UInt32

    /**
     * Contains a <b>DXVA_ExtendedFormat</b> structure packed into a <b>ULONG</b>, describing the video format.
     */
    Format : UInt32

    /**
     * Contains a <b>D3DFORMAT</b> value that describes the video format. For more information, see the Direct3D SDK documentation.
     */
    d3dFormat : UInt32

    /**
     * The numerator of the refresh rate of the current display mode.
     */
    FreqNumerator : UInt32

    /**
     * The denominator of the refresh rate of the current display mode.
     */
    FreqDenominator : UInt32

}
