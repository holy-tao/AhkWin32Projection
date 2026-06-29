#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\OPM_RANDOM_NUMBER.ahk" { OPM_RANDOM_NUMBER }

/**
 * Contains the result from an OPM_GET_OUTPUT_ID status request.
 * @see https://learn.microsoft.com/windows/win32/api/opmapi/ns-opmapi-opm_output_id_data
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct OPM_OUTPUT_ID_DATA {
    #StructPack 8

    /**
     * An <a href="https://docs.microsoft.com/windows/win32/api/opmapi/ns-opmapi-opm_copp_compatible_get_info_parameters">OPM_RANDOM_NUMBER</a> structure. This structure contains the same 128-bit random number that the application sent to the driver in the <a href="https://docs.microsoft.com/windows/desktop/api/ksopmapi/ns-ksopmapi-opm_get_info_parameters">OPM_GET_INFO_PARAMETERS</a> or <a href="https://docs.microsoft.com/windows/desktop/api/opmapi/ns-opmapi-opm_copp_compatible_get_info_parameters">OPM_COPP_COMPATIBLE_GET_INFO_PARAMETERS</a> structure.
     */
    rnRandomNumber : OPM_RANDOM_NUMBER

    /**
     * A bitwise <b>OR</b> of <a href="https://docs.microsoft.com/windows/desktop/medfound/opm-status-flags">OPM Status Flags</a>.
     */
    ulStatusFlags : UInt32

    /**
     * The unique identifier of the monitor associated with this video output.
     */
    OutputId : Int64

}
