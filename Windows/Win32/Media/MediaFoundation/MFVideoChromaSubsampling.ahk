#Requires AutoHotkey v2.0.0 64-bit

/**
 * Contains flags that define the chroma encoding scheme for Y'Cb'Cr' data.
 * @remarks
 * These flags are used with the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-video-chroma-siting-attribute">MF_MT_VIDEO_CHROMA_SITING</a> attribute.
  * 
  * For more information about these values, see the remarks for the <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/ne-dxva2api-dxva2_videochromasubsampling">DXVA2_VideoChromaSubSampling</a> enumeration, which is the DirectX Video Acceleration (DXVA) equivalent of this enumeration.
 * @see https://learn.microsoft.com/windows/win32/api/mfobjects/ne-mfobjects-mfvideochromasubsampling
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFVideoChromaSubsampling{

    /**
     * Unknown encoding scheme.
     * @type {Integer (Int32)}
     */
    static MFVideoChromaSubsampling_Unknown => 0

    /**
     * Chroma should be reconstructed as if the underlying video was progressive content, rather than skipping fields or applying chroma filtering to minimize artifacts from reconstructing 4:2:0 interlaced chroma.
     * @type {Integer (Int32)}
     */
    static MFVideoChromaSubsampling_ProgressiveChroma => 8

    /**
     * Chroma samples are aligned horizontally with the luma samples, or with multiples of the luma samples. If this flag is not set, chroma samples are located 1/2 pixel to the right of the corresponding luma sample.
     * @type {Integer (Int32)}
     */
    static MFVideoChromaSubsampling_Horizontally_Cosited => 4

    /**
     * Chroma samples are aligned vertically with the luma samples, or with multiples of the luma samples. If this flag is not set, chroma samples are located 1/2 pixel down from the corresponding luma sample.
     * @type {Integer (Int32)}
     */
    static MFVideoChromaSubsampling_Vertically_Cosited => 2

    /**
     * The U and V planes are aligned vertically. If this flag is not set, the chroma planes are assumed to be out of phase by 1/2 chroma sample, alternating between a line of U followed by a line of V.
     * @type {Integer (Int32)}
     */
    static MFVideoChromaSubsampling_Vertically_AlignedChromaPlanes => 1

    /**
     * Specifies the chroma encoding scheme for MPEG-2 video. Chroma samples are aligned horizontally with the luma samples, but are not aligned vertically. The U and V planes are aligned vertically.
     * @type {Integer (Int32)}
     */
    static MFVideoChromaSubsampling_MPEG2 => 5

    /**
     * Specifies the chroma encoding scheme for MPEG-1 video.
     * @type {Integer (Int32)}
     */
    static MFVideoChromaSubsampling_MPEG1 => 1

    /**
     * Specifies the chroma encoding scheme for PAL DV video.
     * @type {Integer (Int32)}
     */
    static MFVideoChromaSubsampling_DV_PAL => 6

    /**
     * Chroma samples are aligned vertically and horizontally with the luma samples. YUV formats such as 4:4:4, 4:2:2, and 4:1:1 are always cosited in both directions and should use this flag.
     * @type {Integer (Int32)}
     */
    static MFVideoChromaSubsampling_Cosited => 7

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static MFVideoChromaSubsampling_Last => 8

    /**
     * Reserved. This member forces the enumeration type to compile as a <b>DWORD</b> value.
     * @type {Integer (Int32)}
     */
    static MFVideoChromaSubsampling_ForceDWORD => 2147483647
}
