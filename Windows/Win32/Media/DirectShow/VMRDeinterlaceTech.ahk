#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The VMRDeinterlaceTech enumeration type describes the algorithm used for deinterlacing a video stream. The flags are not mutually exclusive; drivers can set a combination of flags.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ne-strmif-vmrdeinterlacetech
 * @namespace Windows.Win32.Media.DirectShow
 */
class VMRDeinterlaceTech extends Win32Enum {

    /**
     * The algorithm is unknown or proprietary.
     * Native name: DeinterlaceTech_Unknown
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * The algorithm creates each missing line by repeating the line above it or below it. This method creates jagged artifacts and is not recommended.
     * Native name: DeinterlaceTech_BOBLineReplicate
     * @type {Integer (Int32)}
     */
    static BOBLineReplicate => 1

    /**
     * The algorithm creates the missing lines by vertically stretching each video field by a factor of two. For example, it might average two lines or use a (-1, 9, 9, -1)/16 filter across four lines. Slight vertical adjustments are made to ensure that the resulting image does not "bob" up and down.
     * Native name: DeinterlaceTech_BOBVerticalStretch
     * @type {Integer (Int32)}
     */
    static BOBVerticalStretch => 2

    /**
     * The algorithm uses median filtering to recreate the pixels in the missing lines.
     * Native name: DeinterlaceTech_MedianFiltering
     * @type {Integer (Int32)}
     */
    static MedianFiltering => 4

    /**
     * The algorithm uses an edge filter to create the missing lines. In this process, spatial directional filters are applied to determine the orientation of edges in the picture content. Missing pixels are created by filtering along (rather than across) the detected edges.
     * Native name: DeinterlaceTech_EdgeFiltering
     * @type {Integer (Int32)}
     */
    static EdgeFiltering => 16

    /**
     * The algorithm uses spatial or temporal interpolation, switching between the two on a field-by-field basis, depending on the amount of motion.
     * Native name: DeinterlaceTech_FieldAdaptive
     * @type {Integer (Int32)}
     */
    static FieldAdaptive => 32

    /**
     * The algorithm uses spatial or temporal interpolation, switching between the two on a pixel-by-pixel basis, depending on the amount of motion.
     * Native name: DeinterlaceTech_PixelAdaptive
     * @type {Integer (Int32)}
     */
    static PixelAdaptive => 64

    /**
     * The algorithm identifies objects within a sequence of video fields. Before it recreates the missing pixels, it aligns the movement axes of the individual objects in the scene to make them parallel with the time axis.
     * Native name: DeinterlaceTech_MotionVectorSteered
     * @type {Integer (Int32)}
     */
    static MotionVectorSteered => 128
}
