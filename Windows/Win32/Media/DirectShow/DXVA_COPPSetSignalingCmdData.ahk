#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains information for the Set Signal command in Certified Output Protection Protocol (COPP).
 * @see https://learn.microsoft.com/windows/win32/api/dxva9typ/ns-dxva9typ-dxva_coppsetsignalingcmddata
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct DXVA_COPPSetSignalingCmdData {
    #StructPack 4

    /**
     * Specifies the protection standard and format that is current active. The value is a member of the <a href="https://docs.microsoft.com/windows/desktop/api/dxva9typ/ne-dxva9typ-copp_tvprotectionstandard">COPP_TVProtectionStandard</a> enumeration.
     */
    ActiveTVProtectionStandard : UInt32

    /**
     * Bit mask indicating which bits from <b>AspectRatioData1</b> to set in the signal.
     */
    AspectRatioChangeMask1 : UInt32

    /**
     * Specifies the aspect ratio value to be set for the current protection standard. For EN 300 294, use the <a href="https://docs.microsoft.com/windows/desktop/api/dxva9typ/ne-dxva9typ-copp_imageaspectratio_en300294">COPP_ImageAspectRatio_EN300294</a> enumeration.
     */
    AspectRatioData1 : UInt32

    /**
     * Bit mask indicating which bits from <b>AspectRatioData2</b> to set in the signal.
     */
    AspectRatioChangeMask2 : UInt32

    /**
     * An additional data element related to aspect ratio. The presence and meaning of this data depends on the protection standard. This field can be used to convey End and Q0 bits for EIA-608-B, or the active format description for CEA-805-A.
     */
    AspectRatioData2 : UInt32

    /**
     * Bit mask indicating which bits from <b>AspectRatioData3</b> to set in the signal.
     */
    AspectRatioChangeMask3 : UInt32

    /**
     * An additional data element related to aspect ratio for the current protection standard. The presence and meaning of this data depends on the protection standard.
     */
    AspectRatioData3 : UInt32

    /**
     * Array of bit masks indicating which bits in <b>ExtendedInfoData</b> to change. This array is currently not used. Set each member to zero.
     */
    ExtendedInfoChangeMask : UInt32[4]

    /**
     * Additional signaling elements to be set. This array is currently not used.
     *           Set each member to zero.
     */
    ExtendedInfoData : UInt32[4]

    /**
     * Reserved. Set to zero.
     */
    Reserved : UInt32

}
