#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\OPM_RANDOM_NUMBER.ahk" { OPM_RANDOM_NUMBER }

/**
 * Contains the result from an OPM_GET_ACP_AND_CGMSA_SIGNALING query.
 * @remarks
 * The layout of this structure is identical to the <a href="https://docs.microsoft.com/windows/desktop/api/dxva9typ/ns-dxva9typ-dxva_coppstatussignalingcmddata">DXVA_COPPStatusSignalingCmdData</a> structure used in Certified Output Protection Protocol (COPP).
 * @see https://learn.microsoft.com/windows/win32/api/opmapi/ns-opmapi-opm_acp_and_cgmsa_signaling
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct OPM_ACP_AND_CGMSA_SIGNALING {
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
     * A bitwise <b>OR</b> of zero or more <a href="https://docs.microsoft.com/windows/desktop/medfound/tv-protection-standard-flags">TV Protection Standard Flags</a>. The driver will return flags for all of the protection standards and resolutions that it supports, regardless of which are now active.
     */
    ulAvailableTVProtectionStandards : UInt32

    /**
     * One value from the <a href="https://docs.microsoft.com/windows/desktop/medfound/tv-protection-standard-flags">TV Protection Standard Flags</a>, indicating the protection standard that is currently active.
     */
    ulActiveTVProtectionStandard : UInt32

    /**
     * Reserved for future use. Set to zero.
     */
    ulReserved : UInt32

    /**
     * A bitmask indicating which bits of <b>ulAspectRatioData1</b> are valid.
     */
    ulAspectRatioValidMask1 : UInt32

    /**
     * The current aspect ratio. For EN 300 294, the value is a member of the <a href="https://docs.microsoft.com/windows/desktop/api/opmapi/ne-opmapi-opm_image_aspect_ratio_en300294">OPM_IMAGE_ASPECT_RATIO_EN300294</a> enumeration.
     */
    ulAspectRatioData1 : UInt32

    /**
     * A bitmask indicating which bits of <b>ulAspectRatioData2</b> are valid.
     */
    ulAspectRatioValidMask2 : UInt32

    /**
     * An additional data element related to aspect ratio for the current protection standard. The presence and meaning of this data depends on the protection standard. This field can be used to convey End and Q0 bits for EIA-608-B, or the active format description for CEA-805-A.
     */
    ulAspectRatioData2 : UInt32

    /**
     * A bitmask indicating which bits of <b>ulAspectRatioData3</b> are valid.
     */
    ulAspectRatioValidMask3 : UInt32

    /**
     * An additional data element related to aspect ratio for the current protection standard. The presence and meaning of this data depends on the protection standard.
     */
    ulAspectRatioData3 : UInt32

    /**
     * Reserved for future use. Fill this array with zeros.
     */
    ulReserved2 : UInt32[4]

    /**
     * Reserved for future use.Fill this array with zeros.
     */
    ulReserved3 : UInt32[4]

}
