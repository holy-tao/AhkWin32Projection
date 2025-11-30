#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the content protection requirements for a video frame.
 * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/ne-mfmediaengine-mf_media_engine_frame_protection_flags
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MF_MEDIA_ENGINE_FRAME_PROTECTION_FLAGS extends Win32Enum{

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
