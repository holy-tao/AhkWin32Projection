#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the available algorithms used by the Transcode Video Processor (XVP).
 * @remarks
 * The **MrfCrf444** algorithm uses larger filters, full precision for color conversions, prefers higher quality color formats, and enables a high quality MRF deinterlacer. Developers who want their apps to produce the best quality output regardless of the hardware, time, or power consumption, may want to enable this algorithm for transcoding.
 * @see https://learn.microsoft.com/uwp/api/windows.media.transcoding.mediavideoprocessingalgorithm
 * @namespace Windows.Media.Transcoding
 * @version WindowsRuntime 1.4
 */
class MediaVideoProcessingAlgorithm extends Win32Enum{

    /**
     * Default video processing algorithm. This algorithm prefers performance, speed, and space over quality. This algorithm will makes use of hardware.
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * Prefers quality over performance. This mode always runs in software and insures that hardware implementations, which may differ from the XVP are not used.
     * @type {Integer (Int32)}
     */
    static MrfCrf444 => 1
}
