#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\OPM_HDCP_KEY_SELECTION_VECTOR.ahk" { OPM_HDCP_KEY_SELECTION_VECTOR }
#Import ".\OPM_RANDOM_NUMBER.ahk" { OPM_RANDOM_NUMBER }

/**
 * Contains the result from an OPM_GET_CONNECTED_HDCP_DEVICE_INFORMATION query.
 * @remarks
 * The layout of this structure is identical to the <a href="https://docs.microsoft.com/windows/desktop/api/dxva9typ/ns-dxva9typ-dxva_coppstatushdcpkeydata">DXVA_COPPStatusHDCPKeyData</a> structure used in Certified Output Protection Protocol (COPP).
 * @see https://learn.microsoft.com/windows/win32/api/opmapi/ns-opmapi-opm_connected_hdcp_device_information
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct OPM_CONNECTED_HDCP_DEVICE_INFORMATION {
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
     * A value that indicates whether the connected device is an HDCP repeater.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="OPM_HDCP_FLAG_NONE"></a><a id="opm_hdcp_flag_none"></a><dl>
     * <dt><b>OPM_HDCP_FLAG_NONE</b></dt>
     * <dt>0x00</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device is not an HDCP repeater.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="OPM_HDCP_FLAG_REPEATER"></a><a id="opm_hdcp_flag_repeater"></a><dl>
     * <dt><b>OPM_HDCP_FLAG_REPEATER</b></dt>
     * <dt>0x01</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device is an HDCP repeater.
     * 
     * </td>
     * </tr>
     * </table>
     */
    ulHDCPFlags : UInt32

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/opmapi/ns-opmapi-opm_hdcp_key_selection_vector">OPM_HDCP_KEY_SELECTION_VECTOR</a> structure that contains the device's key selection vector (KSV). This is the value named <i>Bksv</i> in the HDCP specification.
     */
    ksvB : OPM_HDCP_KEY_SELECTION_VECTOR

    /**
     * Reserved for future use. Fill this array with zeros.
     */
    Reserved : Int8[11]

    /**
     * Reserved for future use. Fill this array with zeros.
     */
    Reserved2 : Int8[16]

    /**
     * Reserved for future use. Fill this array with zeros.
     */
    Reserved3 : Int8[16]

}
