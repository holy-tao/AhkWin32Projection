#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\OPM_RANDOM_NUMBER.ahk" { OPM_RANDOM_NUMBER }

/**
 * OPM_STANDARD_INFORMATION (opmapi.h) contains the result from an Output Protection Manager (OPM) status request.
 * @remarks
 * The layout of this structure is identical to the <a href="https://docs.microsoft.com/windows/desktop/api/dxva9typ/ns-dxva9typ-dxva_coppstatusdata">DXVA_COPPStatusData</a> structure used in Certified Output Protection Protocol (COPP).
 * @see https://learn.microsoft.com/windows/win32/api/opmapi/ns-opmapi-opm_standard_information
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct OPM_STANDARD_INFORMATION {
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
     * Response data. The meaning of this value depends on the status request. For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/opm-status-requests">OPM Status Requests</a>.
     */
    ulInformation : UInt32

    /**
     * Reserved for future use. Set to zero.
     */
    ulReserved : UInt32

    /**
     * Reserved for future use. Set to zero.
     */
    ulReserved2 : UInt32

}
