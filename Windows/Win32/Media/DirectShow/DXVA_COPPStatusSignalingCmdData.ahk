#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Contains the result from a Signaling query in Certified Output Protection Protocol (COPP).
 * @see https://learn.microsoft.com/windows/win32/api/dxva9typ/ns-dxva9typ-dxva_coppstatussignalingcmddata
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct DXVA_COPPStatusSignalingCmdData {
    #StructPack 4

    /**
     * A 128-bit random number that was passed by the application in the <b>AMCOPPStatusInput</b> structure.
     */
    rApp : Guid

    /**
     * Status flag. See <a href="https://docs.microsoft.com/windows/desktop/api/dxva9typ/ne-dxva9typ-copp_statusflags">COPP_StatusFlags</a>.
     */
    dwFlags : UInt32

    /**
     * Bitwise <b>OR</b> of flags from the <a href="https://docs.microsoft.com/windows/desktop/api/dxva9typ/ne-dxva9typ-copp_tvprotectionstandard">COPP_TVProtectionStandard</a> enumeration. The driver should return flags for all of the protection standards and resolutions that it supports.
     */
    AvailableTVProtectionStandards : UInt32

    /**
     * Member of the <a href="https://docs.microsoft.com/windows/desktop/api/dxva9typ/ne-dxva9typ-copp_tvprotectionstandard">COPP_TVProtectionStandard</a> enumeration, indicating the protection standard that is currently active.
     */
    ActiveTVProtectionStandard : UInt32

    /**
     * Reserved.
     */
    TVType : UInt32

    /**
     * Bit mask indicating which bits of <b>AspectRatioData1</b> are valid.
     */
    AspectRatioValidMask1 : UInt32

    /**
     * Specifies the current aspect ratio value. For EN 300 294, the value is a member of the <a href="https://docs.microsoft.com/windows/desktop/api/dxva9typ/ne-dxva9typ-copp_imageaspectratio_en300294">COPP_ImageAspectRatio_EN300294</a> enumeration.
     */
    AspectRatioData1 : UInt32

    /**
     * Bit mask indicating which bits of <b>AspectRatioData2</b> are valid.
     */
    AspectRatioValidMask2 : UInt32

    /**
     * Additional data element related to aspect ratio for the current protection standard. The presence and meaning of this data depends on the protection standard. This field may be used to convey End and Q0 bits for EIA-608-B, or the active format description for CEA-805-A.
     */
    AspectRatioData2 : UInt32

    /**
     * Bit mask indicating which bits of <b>AspectRatioData3</b> are valid.
     */
    AspectRatioValidMask3 : UInt32

    /**
     * Additional data element related to aspect ratio for the current protection standard. The presence and meaning of this data depends on the protection standard.
     */
    AspectRatioData3 : UInt32

    /**
     * Array of bit masks indicating which bits in <b>ExtendedInfoData</b> are valid.
     */
    ExtendedInfoValidMask : UInt32[4]

    /**
     * Additional signaling elements. This array is currently not used.
     */
    ExtendedInfoData : UInt32[4]

}
