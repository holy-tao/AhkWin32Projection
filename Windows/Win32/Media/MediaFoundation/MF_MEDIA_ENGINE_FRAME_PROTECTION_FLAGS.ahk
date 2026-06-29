#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the content protection requirements for a video frame.
 * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/ne-mfmediaengine-mf_media_engine_frame_protection_flags
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MF_MEDIA_ENGINE_FRAME_PROTECTION_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The video frame should be protected.
     * @type {Integer (Int32)}
     */
    static MF_MEDIA_ENGINE_FRAME_PROTECTION_FLAG_PROTECTED => 1

    /**
     * Direct3D surface protection must be applied to any surface that contains the frame.
     * @type {Integer (Int32)}
     */
    static MF_MEDIA_ENGINE_FRAME_PROTECTION_FLAG_REQUIRES_SURFACE_PROTECTION => 2

    /**
     * Direct3D anti-screen-scrape protection must be applied to any surface that contains the frame.
     * @type {Integer (Int32)}
     */
    static MF_MEDIA_ENGINE_FRAME_PROTECTION_FLAG_REQUIRES_ANTI_SCREEN_SCRAPE_PROTECTION => 4
}
