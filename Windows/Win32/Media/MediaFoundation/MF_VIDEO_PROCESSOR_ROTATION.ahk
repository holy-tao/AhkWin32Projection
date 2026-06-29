#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies how to rotate a video image.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/ne-mfidl-mf_video_processor_rotation
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MF_VIDEO_PROCESSOR_ROTATION {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Do not rotate the image.
     * @type {Integer (Int32)}
     */
    static ROTATION_NONE => 0

    /**
     * Rotate the image to the correct viewing orientation.
     * @type {Integer (Int32)}
     */
    static ROTATION_NORMAL => 1
}
