#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of diagnostic event that is associated with a [AdaptiveMediaSourceDiagnostics.DiagnosticAvailable](adaptivemediasourcediagnostics_diagnosticavailable.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasourcediagnostictype
 * @namespace Windows.Media.Streaming.Adaptive
 * @version WindowsRuntime 1.4
 */
class AdaptiveMediaSourceDiagnosticType extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static ManifestUnchangedUponReload => 0

    /**
     * @type {Integer (Int32)}
     */
    static ManifestMismatchUponReload => 1

    /**
     * @type {Integer (Int32)}
     */
    static ManifestSignaledEndOfLiveEventUponReload => 2

    /**
     * @type {Integer (Int32)}
     */
    static MediaSegmentSkipped => 3

    /**
     * @type {Integer (Int32)}
     */
    static ResourceNotFound => 4

    /**
     * @type {Integer (Int32)}
     */
    static ResourceTimedOut => 5

    /**
     * @type {Integer (Int32)}
     */
    static ResourceParsingError => 6

    /**
     * @type {Integer (Int32)}
     */
    static BitrateDisabled => 7

    /**
     * Introduced in Windows.Foundation.UniversalApiContract v5. The **[AdaptiveMediaSource](/uwp/api/Windows.Media.Streaming.Adaptive.AdaptiveMediaSource)** passed an error to the media pipeline that caused playback to stop. This diagnostic is not intended to replace media failure events provided by the [MediaPlayer](/uwp/api/windows.media.playback.mediaplayer), such as the **[MediaFailed](/uwp/api/windows.media.playback.mediaplayer.MediaFailed)** event. Instead, this diagnostic can be useful for correlating errors originating from the media source with potential corruption of error conditions with the content delivery network.
     * @type {Integer (Int32)}
     */
    static FatalMediaSourceError => 8
}
