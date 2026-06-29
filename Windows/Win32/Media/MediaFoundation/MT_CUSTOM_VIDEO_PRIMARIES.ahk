#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines custom color primaries for a video source. The color primaries define how to convert colors from RGB color space to CIE XYZ color space.
 * @remarks
 * This structure is used with the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-custom-video-primaries-attribute">MF_MT_CUSTOM_VIDEO_PRIMARIES</a> attribute.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/ns-mfapi-mt_custom_video_primaries
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MT_CUSTOM_VIDEO_PRIMARIES {
    #StructPack 4

    /**
     * Red x-coordinate.
     */
    fRx : Float32

    /**
     * Red y-coordinate.
     */
    fRy : Float32

    /**
     * Green x-coordinate.
     */
    fGx : Float32

    /**
     * Green y-coordinate.
     */
    fGy : Float32

    /**
     * Blue x-coordinate.
     */
    fBx : Float32

    /**
     * Blue y-coordinate.
     */
    fBy : Float32

    /**
     * White point x-coordinate.
     */
    fWx : Float32

    /**
     * White point y-coordinate.
     */
    fWy : Float32

}
