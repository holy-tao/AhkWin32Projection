#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The VMR_ASPECT_RATIO_MODE enumeration type describes whether the Video Mixing Renderer Filter 7 preserves the aspect ratio of the source video.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ne-strmif-vmr_aspect_ratio_mode
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct VMR_ASPECT_RATIO_MODE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Indicates that the VMR will not try to maintain the aspect ratio of the source video.
     * @type {Integer (Int32)}
     */
    static VMR_ARMODE_NONE => 0

    /**
     * Indicates that the VMR will maintain the aspect ratio of the source video by letterboxing within the output rectangle.
     * @type {Integer (Int32)}
     */
    static VMR_ARMODE_LETTER_BOX => 1
}
