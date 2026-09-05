#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The VMR9DeinterlaceTech enumeration type describes the algorithm used for deinterlacing a video stream. The flags are not mutually exclusive; drivers can set a combination of flags.
 * @see https://learn.microsoft.com/windows/win32/api/vmr9/ne-vmr9-vmr9deinterlacetech
 * @namespace Windows.Win32.Media.DirectShow
 */
class VMR9DeinterlaceTech extends Win32Enum {

    /**
     * The algorithm is unknown or proprietary.
     * Native name: DeinterlaceTech9_Unknown
     * @type {Integer (Int32)}
     */
    static Tech9_Unknown => 0

    /**
     * The algorithm creates each missing line by repeating the line above it or below it. This method creates jagged artifacts and is not recommended.
     * Native name: DeinterlaceTech9_BOBLineReplicate
     * @type {Integer (Int32)}
     */
    static Tech9_BOBLineReplicate => 1

    /**
     * The algorithm creates the missing lines by vertically stretching each video field by a factor of two. For example, it might average two lines or use a (-1, 9, 9, -1)/16 filter across four lines. Slight vertical adjustments are made to ensure that the resulting image does not "bob" up and down
     * Native name: DeinterlaceTech9_BOBVerticalStretch
     * @type {Integer (Int32)}
     */
    static Tech9_BOBVerticalStretch => 2

    /**
     * The algorithm uses median filtering to recreate the pixels in the missing lines.
     * Native name: DeinterlaceTech9_MedianFiltering
     * @type {Integer (Int32)}
     */
    static Tech9_MedianFiltering => 4

    /**
     * The algorithm uses an edge filter to create the missing lines. In this process, spatial directional filters are applied to determine the orientation of edges in the picture content. Missing pixels are created by filtering along (rather than across) the detected edges.
     * Native name: DeinterlaceTech9_EdgeFiltering
     * @type {Integer (Int32)}
     */
    static Tech9_EdgeFiltering => 16

    /**
     * The algorithm uses spatial or temporal interpolation, switching between the two on a field-by-field basis, depending on the amount of motion.
     * Native name: DeinterlaceTech9_FieldAdaptive
     * @type {Integer (Int32)}
     */
    static Tech9_FieldAdaptive => 32

    /**
     * The algorithm uses spatial or temporal interpolation, switching between the two on a pixel-by-pixel basis, depending on the amount of motion.
     * Native name: DeinterlaceTech9_PixelAdaptive
     * @type {Integer (Int32)}
     */
    static Tech9_PixelAdaptive => 64

    /**
     * The algorithm identifies objects within a sequence of video fields. Before it recreates the missing pixels, it aligns the movement axes of the individual objects in the scene to make them parallel with the time axis.
     * Native name: DeinterlaceTech9_MotionVectorSteered
     * @type {Integer (Int32)}
     */
    static Tech9_MotionVectorSteered => 128
}
