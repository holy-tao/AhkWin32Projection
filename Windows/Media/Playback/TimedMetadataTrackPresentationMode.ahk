#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies whether a set of timed metadata tracks are listed in the XAML **[MediaTransportControls](/uwp/api/windows.ui.xaml.controls.mediatransportcontrols), whether events are raised for data cues in the tracks, and whether any subtitles and closed captions contained in the tracks are displayed by the system, by the app, or not at all.
 * @remarks
 * Access the **[TimedMetadataTracks](/uwp/api/windows.media.playback.mediaplaybackitem.TimedMetadataTracks)** of a **[MediaPlaybackItem](mediaplaybackitem.md)** to get a **[MediaPlaybackTimedmetadataTrackList](mediaplaybacktimedmetadatatracklist.md)** object representing the list of timed metadata tracks associated with the playback item. Call **[SetPresentationMode](/uwp/api/windows.media.playback.mediaplaybacktimedmetadatatracklist#Windows_Media_Playback_MediaPlaybackTimedMetadataTrackList_SetPresentationMode_System_UInt32_Windows_Media_Playback_TimedMetadataTrackPresentationMode_)**, passing in a value from this enumeration, to set the presentation mode for the playback item.
 * 
 * For how-to guidance on using timed metadata tracks with **MediaPlaybackItem**, see [Media items, playlists, and tracks](/windows/uwp/audio-video-camera/media-playback-with-mediasource).
 * @see https://learn.microsoft.com/uwp/api/windows.media.playback.timedmetadatatrackpresentationmode
 * @namespace Windows.Media.Playback
 * @version WindowsRuntime 1.4
 */
class TimedMetadataTrackPresentationMode extends Win32Enum{

    /**
     * The timed metadata track is not listed in the **MediaTransportControls**. If the metadata track contains subtitles or closed captions, they are not displayed by the platform. Cue events are not raised.
     * @type {Integer (Int32)}
     */
    static Disabled => 0

    /**
     * The timed metadata track is not listed in the **MediaTransportControls**. If the metadata track contains subtitles or closed captions, they are not displayed by the platform. Cue events are raised.
     * @type {Integer (Int32)}
     */
    static Hidden => 1

    /**
     * The timed metadata track is listed in the **MediaTransportControls**. If the metadata track contains subtitles or closed captions, they are not displayed by the platform. Cue events are raised.
     * @type {Integer (Int32)}
     */
    static ApplicationPresented => 2

    /**
     * The timed metadata track is listed in the **MediaTransportControls**. If the metadata track contains subtitles or closed captions, they are displayed by the platform. Cue events are raised.
     * @type {Integer (Int32)}
     */
    static PlatformPresented => 3
}
