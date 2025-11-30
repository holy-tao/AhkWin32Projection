#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains flags for the IMFQualityAdvise2::NotifyQualityEvent method.
 * @remarks
 * 
 * If the decoder sets the <b>MF_QUALITY_CANNOT_KEEP_UP</b> flag, the quality manager tries to reduce latency through the media source and the media sink. For example, it might request the <a href="https://docs.microsoft.com/windows/desktop/medfound/enhanced-video-renderer">Enhanced Video Renderer</a> (EVR) to drop frames. During this period, the quality manager stops calling the decoder's <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfqualityadvise2-notifyqualityevent">IMFQualityAdvise2::NotifyQualityEvent</a> method, until samples are no longer arriving late at the sink. At that point, the quality manager resumes calling <b>NotifyQualityEvent</b> on the decoder.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/ne-mfidl-mf_quality_advise_flags
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MF_QUALITY_ADVISE_FLAGS extends Win32Enum{

    /**
     * The decoder has done everything that it can to reduce sample latency, and samples are still late.
     * @type {Integer (Int32)}
     */
    static MF_QUALITY_CANNOT_KEEP_UP => 1
}
