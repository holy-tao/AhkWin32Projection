#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DXVA2_SampleFormat.ahk" { DXVA2_SampleFormat }
#Import ".\OPM_RANDOM_NUMBER.ahk" { OPM_RANDOM_NUMBER }
#Import "..\..\Graphics\Direct3D9\D3DFORMAT.ahk" { D3DFORMAT }

/**
 * Contains the result of an OPM_GET_ACTUAL_OUTPUT_FORMAT query in Output Protection Manager (OPM).
 * @remarks
 * The refresh rate is expressed as a fraction. For example, if the refresh rate is 72 Hz, <b>FreqNumerator</b> = 72 and <b>FreqDenominator</b> = 1. For NTSC television, the values are <b>FreqNumerator</b> = 60000 and <b>FreqDenominator</b> = 1001 (59.94 fields per second). 
 * 
 * The layout of this structure is identical to the <a href="https://docs.microsoft.com/windows/desktop/api/dxva9typ/ns-dxva9typ-dxva_coppstatusdisplaydata">DXVA_COPPStatusDisplayData</a> structure used in Certified Output Protection Protocol (COPP).
 * @see https://learn.microsoft.com/windows/win32/api/opmapi/ns-opmapi-opm_actual_output_format
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct OPM_ACTUAL_OUTPUT_FORMAT {
    #StructPack 4

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/ksopmapi/ns-ksopmapi-opm_random_number">OPM_RANDOM_NUMBER</a> structure. This structure contains the same 128-bit random number that the application sent to the driver in the <a href="https://docs.microsoft.com/windows/desktop/api/ksopmapi/ns-ksopmapi-opm_get_info_parameters">OPM_GET_INFO_PARAMETERS</a> or <a href="https://docs.microsoft.com/windows/desktop/api/opmapi/nf-opmapi-iopmvideooutput-coppcompatiblegetinformation">OPM_COPP_COMPATIBLE_GET_INFO_PARAMETERS</a> structure.
     */
    rnRandomNumber : OPM_RANDOM_NUMBER

    /**
     * A bitwise <b>OR</b> of <a href="https://docs.microsoft.com/windows/desktop/medfound/opm-status-flags">OPM Status Flags</a>.
     */
    ulStatusFlags : UInt32

    /**
     * The width of the display mode, in pixels.
     */
    ulDisplayWidth : UInt32

    /**
     * The height of the display mode, in pixels.
     */
    ulDisplayHeight : UInt32

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/ne-dxva2api-dxva2_sampleformat">DXVA2_SampleFormat</a> value that describes the interlace mode.
     */
    dsfSampleInterleaveFormat : DXVA2_SampleFormat

    /**
     * A <b>D3DFORMAT</b> value that describes the video format.
     */
    d3dFormat : D3DFORMAT

    /**
     * The numerator of the refresh rate of the current display mode.
     */
    ulFrequencyNumerator : UInt32

    /**
     * The denominator of the refresh rate of the current display mode.
     */
    ulFrequencyDenominator : UInt32

}
