#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains information for the OPM_SET_ACP_AND_CGMSA_SIGNALING command in Output Protection Manager (OPM).
 * @remarks
 * The layout of this structure is identical to the <a href="https://docs.microsoft.com/windows/desktop/api/dxva9typ/ns-dxva9typ-dxva_coppsetsignalingcmddata">DXVA_COPPSetSignalingCmdData</a> structure used in Certified Output Protection Manager (COPP).
 * @see https://learn.microsoft.com/windows/win32/api/opmapi/ns-opmapi-opm_set_acp_and_cgmsa_signaling_parameters
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct OPM_SET_ACP_AND_CGMSA_SIGNALING_PARAMETERS {
    #StructPack 4

    /**
     * Specifies the protection standard and format that is currently active. The value is a bitwise <b>OR</b> of <a href="https://docs.microsoft.com/windows/desktop/medfound/tv-protection-standard-flags">TV Protection Standard Flags</a>.
     */
    ulNewTVProtectionStandard : UInt32

    /**
     * A bitmask indicating which bits from <b>ulAspectRatioData1</b> to set in the signal.
     */
    ulAspectRatioChangeMask1 : UInt32

    /**
     * Specifies the aspect ratio value to be set for the current protection standard. For EN 300 294, use the <a href="https://docs.microsoft.com/windows/desktop/api/opmapi/ne-opmapi-opm_image_aspect_ratio_en300294">OPM_IMAGE_ASPECT_RATIO_EN300294</a> enumeration.
     */
    ulAspectRatioData1 : UInt32

    /**
     * A bitmask indicating which bits from <b>ulAspectRatioData2</b> to set in the signal.
     */
    ulAspectRatioChangeMask2 : UInt32

    /**
     * An additional data element related to aspect ratio. The presence and meaning of this data depends on the protection standard. This field can be used to convey End and Q0 bits for EIA-608-B, or the active format description for CEA-805-A.
     */
    ulAspectRatioData2 : UInt32

    /**
     * A bitmask indicating which bits from <b>ulAspectRatioData3</b> to set in the signal.
     */
    ulAspectRatioChangeMask3 : UInt32

    /**
     * An additional data element related to aspect ratio for the current protection standard. The presence and meaning of this data depends on the protection standard.
     */
    ulAspectRatioData3 : UInt32

    /**
     * Reserved for future use. Set the entire array to zero.
     */
    ulReserved : UInt32[4]

    /**
     * Reserved for future use. Set the entire array to zero.
     */
    ulReserved2 : UInt32[4]

    /**
     * Reserved for future use. Set to zero.
     */
    ulReserved3 : UInt32

}
