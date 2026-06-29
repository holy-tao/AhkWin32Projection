#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains parameters for the OPM_SET_HDCP_SRM command.
 * @see https://learn.microsoft.com/windows/win32/api/opmapi/ns-opmapi-opm_set_hdcp_srm_parameters
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct OPM_SET_HDCP_SRM_PARAMETERS {
    #StructPack 4

    /**
     * Contains the SRM version number in little-endian format. This number is contained in the <b>SRM Version</b> field of the SRM. For more information, see the HDCP specification.
     */
    ulSRMVersion : UInt32

}
