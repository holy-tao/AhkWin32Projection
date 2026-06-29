#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes the metadata for HDR10, used when video is compressed using High Efficiency Video Coding (HEVC).
 * @remarks
 * This structure represents the definition of HDR10 metadata used with HEVC, not HDR10 metadata for ST.2086. These are closely related but defined differently.
 * 
 * Example: Mastering display with DCI-P3 color primaries and D65 white point, maximum luminance of 1000 nits and minimum luminance of 0.001 nits; content has maximum luminance of 2000 nits and maximum frame average light level (MaxFALL) of 500 nits.
 * 
 * 
 * ```cpp
 * RedPrimary[0] = 0.680 * 50000;
 * RedPrimary[1] = 0.320 * 50000;
 * GreenPrimary[0] = 0.265 * 50000;
 * GreenPrimary[1] = 0.690 * 50000;
 * BluePrimary[0] = 0.150 * 50000;
 * BluePrimary[1] = 0.060 * 50000;
 * WhitePoint[0] = 0.3127 * 50000;
 * WhitePoint[1] = 0.3290 * 50000;
 * MaxMasteringLuminance = 1000;
 * MinMasteringLuminance = 0.001 * 10000;
 * MaxContentLightLevel = 2000;
 * MaxFrameAverageLightLevel = 500;
 * ```
 * 
 * 
 * This structure is used in conjunction with the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_5/nf-dxgi1_5-idxgiswapchain4-sethdrmetadata">SetHDRMetaData</a> method.
 * @see https://learn.microsoft.com/windows/win32/api/dxgi1_5/ns-dxgi1_5-dxgi_hdr_metadata_hdr10
 * @namespace Windows.Win32.Graphics.Dxgi
 */
export default struct DXGI_HDR_METADATA_HDR10 {
    #StructPack 4

    /**
     * The chromaticity coordinates of the red value in the CIE1931 color space. Index 0 contains the X coordinate and index 1 contains the Y coordinate. The values are normalized to 50,000.
     */
    RedPrimary : UInt16[2]

    /**
     * The chromaticity coordinates of the green value in the CIE1931 color space. Index 0 contains the X coordinate and index 1 contains the Y coordinate. The values are normalized to 50,000.
     */
    GreenPrimary : UInt16[2]

    /**
     * The chromaticity coordinates of the blue value in the CIE1931 color space. Index 0 contains the X coordinate and index 1 contains the Y coordinate. The values are normalized to 50,000.
     */
    BluePrimary : UInt16[2]

    /**
     * The chromaticity coordinates of the white point in the CIE1931 color space. Index 0 contains the X coordinate and index 1 contains the Y coordinate. The values are normalized to 50,000.
     */
    WhitePoint : UInt16[2]

    /**
     * The maximum number of nits of the display used to master the content. Values are in whole nits.
     */
    MaxMasteringLuminance : UInt32

    /**
     * The minimum number of nits of the display used to master the content. Values are 1/10000th of a nit (0.0001 nit).
     */
    MinMasteringLuminance : UInt32

    /**
     * The maximum content light level (MaxCLL). This is the nit value corresponding to the brightest pixel used anywhere in the content.
     */
    MaxContentLightLevel : UInt16

    /**
     * The maximum frame average light level (MaxFALL). This is the nit value corresponding to the average luminance of the frame which has the brightest average luminance anywhere in the content.
     */
    MaxFrameAverageLightLevel : UInt16

}
