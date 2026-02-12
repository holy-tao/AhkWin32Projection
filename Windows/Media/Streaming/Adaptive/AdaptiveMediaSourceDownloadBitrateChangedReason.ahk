#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the reason that the download bitrate changed. This value is used for the [AdaptiveMediaSource.DownloadBitrateChanged](adaptivemediasource_downloadbitratechanged.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasourcedownloadbitratechangedreason
 * @namespace Windows.Media.Streaming.Adaptive
 * @version WindowsRuntime 1.4
 */
class AdaptiveMediaSourceDownloadBitrateChangedReason extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SufficientInboundBitsPerSecond => 0

    /**
     * @type {Integer (Int32)}
     */
    static InsufficientInboundBitsPerSecond => 1

    /**
     * @type {Integer (Int32)}
     */
    static LowBufferLevel => 2

    /**
     * @type {Integer (Int32)}
     */
    static PositionChanged => 3

    /**
     * @type {Integer (Int32)}
     */
    static TrackSelectionChanged => 4

    /**
     * @type {Integer (Int32)}
     */
    static DesiredBitratesChanged => 5

    /**
     * @type {Integer (Int32)}
     */
    static ErrorInPreviousBitrate => 6
}
