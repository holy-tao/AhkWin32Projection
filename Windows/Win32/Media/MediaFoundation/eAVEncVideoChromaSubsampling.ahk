#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies chroma siting. Chroma siting defines the positions of the chroma samples relative to the luma samples. This enumeration is used with the AVEncVideoInputChromaSubsampling and AVEncVideoOutputChromaSubsampling properties.
 * @see https://learn.microsoft.com/windows/win32/api/codecapi/ne-codecapi-eavencvideochromasubsampling
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class eAVEncVideoChromaSubsampling{

    /**
     * Use the same chroma siting as the input video. This flag applies to the <b>AVEncVideoOutputChromaResolution</b> property only. This flag may not be combined with other flags.
     * @type {Integer (Int32)}
     */
    static eAVEncVideoChromaSubsamplingFormat_SameAsSource => 0

    /**
     * Chroma should be reconstructed as if the underlying video was progressive content, rather than skipping fields or applying chroma filtering to minimize artifacts from reconstructing 4:2:0 interlaced chroma.
     * @type {Integer (Int32)}
     */
    static eAVEncVideoChromaSubsamplingFormat_ProgressiveChroma => 8

    /**
     * Chroma samples are aligned horizontally with multiples of the luma samples.
     * @type {Integer (Int32)}
     */
    static eAVEncVideoChromaSubsamplingFormat_Horizontally_Cosited => 4

    /**
     * Chroma samples are aligned vertically with multiples of the luma samples.
     * @type {Integer (Int32)}
     */
    static eAVEncVideoChromaSubsamplingFormat_Vertically_Cosited => 2

    /**
     * The chroma planes have the same phase alignment. It is not valid to omit this flag unless the data is vertically cosited. If the data is not vertically cosited, this flag is required. If this flag is absent, the Cb and Cr samples are sited on alternate lines. For example, interlaced PAL DV video uses non-aligned chroma planes.
     * @type {Integer (Int32)}
     */
    static eAVEncVideoChromaSubsamplingFormat_Vertically_AlignedChromaPlanes => 1
}
