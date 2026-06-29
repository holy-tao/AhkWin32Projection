#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The NORMALIZEDRECT structure is used with the VMR filter in mixing operations to specify the location of a video rectangle in composition space.
 * @remarks
 * This structure is used in methods involving "composition space," which refers to the visible video rectangle, as well as the offscreen space necessary to contain rectangles from secondary streams. See <a href="https://docs.microsoft.com/windows/desktop/DirectShow/using-the-video-mixing-renderer">Using the Video Mixing Renderer</a> for more information.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ns-strmif-normalizedrect
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct NORMALIZEDRECT {
    #StructPack 4

    /**
     * The left corner of the normalized rectangle.
     */
    left : Float32

    /**
     * The top corner of the normalized rectangle.
     */
    top : Float32

    /**
     * The right corner of the normalized rectangle.
     */
    right : Float32

    /**
     * The bottom corner of the normalized rectangle.
     */
    bottom : Float32

}
