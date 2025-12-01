#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines algorithms for the video processor which is use by MF_VIDEO_PROCESSOR_ALGORITHM.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/ne-mfidl-mf_video_processor_algorithm_type
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MF_VIDEO_PROCESSOR_ALGORITHM_TYPE extends Win32Enum{

    /**
     * default mode favors a balance of quality and speed
     * @type {Integer (Int32)}
     */
    static MF_VIDEO_PROCESSOR_ALGORITHM_DEFAULT => 0

    /**
     * The video processor will always internally process in AYUV and use high quality filters.
     * @type {Integer (Int32)}
     */
    static MF_VIDEO_PROCESSOR_ALGORITHM_MRF_CRF_444 => 1
}
