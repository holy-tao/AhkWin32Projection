#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The VMR9NormalizedRect structure is used with the VMR-9 filter in mixing operations to specify or retrieve the location of a video rectangle in composition space.
 * @remarks
 * This structure is used in methods involving "composition space," which refers to the visible video rectangle, as well as the "offscreen" space necessary to contain rectangles from secondary streams. See <a href="https://docs.microsoft.com/windows/desktop/DirectShow/using-the-video-mixing-renderer">Using the Video Mixing Renderer</a> for more information.
 * @see https://learn.microsoft.com/windows/win32/api/vmr9/ns-vmr9-vmr9normalizedrect
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct VMR9NormalizedRect {
    #StructPack 4

    /**
     * Specifies left.
     */
    left : Float32

    /**
     * Specifies top.
     */
    top : Float32

    /**
     * Specifies right.
     */
    right : Float32

    /**
     * Specifies bottom.
     */
    bottom : Float32

}
