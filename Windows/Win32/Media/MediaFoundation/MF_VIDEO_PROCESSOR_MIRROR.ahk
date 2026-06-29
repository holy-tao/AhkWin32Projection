#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies how to flip a video image.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/ne-mfidl-mf_video_processor_mirror
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MF_VIDEO_PROCESSOR_MIRROR {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Do not flip the image.
     * @type {Integer (Int32)}
     */
    static MIRROR_NONE => 0

    /**
     * Flip the image horizontally.
     * @type {Integer (Int32)}
     */
    static MIRROR_HORIZONTAL => 1

    /**
     * Flip the image vertically.
     * @type {Integer (Int32)}
     */
    static MIRROR_VERTICAL => 2
}
