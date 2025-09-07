#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\OPM_RANDOM_NUMBER.ahk

/**
 * Contains the result of an OPM_GET_ACTUAL_OUTPUT_FORMAT query in Output Protection Manager (OPM).
 * @remarks
 * The refresh rate is expressed as a fraction. For example, if the refresh rate is 72 Hz, <b>FreqNumerator</b> = 72 and <b>FreqDenominator</b> = 1. For NTSC television, the values are <b>FreqNumerator</b> = 60000 and <b>FreqDenominator</b> = 1001 (59.94 fields per second). 
  * 
  * The layout of this structure is identical to the <a href="https://docs.microsoft.com/windows/desktop/api/dxva9typ/ns-dxva9typ-dxva_coppstatusdisplaydata">DXVA_COPPStatusDisplayData</a> structure used in Certified Output Protection Protocol (COPP).
 * @see https://learn.microsoft.com/windows/win32/api/opmapi/ns-opmapi-opm_actual_output_format
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class OPM_ACTUAL_OUTPUT_FORMAT extends Win32Struct
{
    static sizeof => 44

    static packingSize => 1

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/ksopmapi/ns-ksopmapi-opm_random_number">OPM_RANDOM_NUMBER</a> structure. This structure contains the same 128-bit random number that the application sent to the driver in the <a href="https://docs.microsoft.com/windows/desktop/api/ksopmapi/ns-ksopmapi-opm_get_info_parameters">OPM_GET_INFO_PARAMETERS</a> or <a href="https://docs.microsoft.com/windows/desktop/api/opmapi/nf-opmapi-iopmvideooutput-coppcompatiblegetinformation">OPM_COPP_COMPATIBLE_GET_INFO_PARAMETERS</a> structure.
     * @type {OPM_RANDOM_NUMBER}
     */
    rnRandomNumber{
        get {
            if(!this.HasProp("__rnRandomNumber"))
                this.__rnRandomNumber := OPM_RANDOM_NUMBER(this.ptr + 0)
            return this.__rnRandomNumber
        }
    }

    /**
     * A bitwise <b>OR</b> of <a href="https://docs.microsoft.com/windows/desktop/medfound/opm-status-flags">OPM Status Flags</a>.
     * @type {Integer}
     */
    ulStatusFlags {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The width of the display mode, in pixels.
     * @type {Integer}
     */
    ulDisplayWidth {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * The height of the display mode, in pixels.
     * @type {Integer}
     */
    ulDisplayHeight {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/ne-dxva2api-dxva2_sampleformat">DXVA2_SampleFormat</a> value that describes the interlace mode.
     * @type {Integer}
     */
    dsfSampleInterleaveFormat {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * A <b>D3DFORMAT</b> value that describes the video format.
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
    ulFrequencyNumerator {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * The denominator of the refresh rate of the current display mode.
     * @type {Integer}
     */
    ulFrequencyDenominator {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }
}
