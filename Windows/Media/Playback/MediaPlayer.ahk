#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMediaPlayer.ahk
#Include .\IMediaPlayerSource.ahk
#Include .\IMediaPlayerSource2.ahk
#Include .\IMediaPlayer2.ahk
#Include .\IMediaPlayerEffects.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include .\IMediaPlayer3.ahk
#Include .\IMediaPlayer4.ahk
#Include .\IMediaPlayerEffects2.ahk
#Include .\IMediaPlayer5.ahk
#Include .\IMediaPlayer6.ahk
#Include .\IMediaPlayer7.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\MediaPlayer.ahk
#Include .\MediaPlayerFailedEventArgs.ahk
#Include .\PlaybackMediaMarkerReachedEventArgs.ahk
#Include .\MediaPlayerRateChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Provides access to media playback functionality such as play, pause, fast-forward, rewind, and volume.
 * @remarks
 * The [Media playback](/windows/uwp/audio-video-camera/media-playback) section of the documentation contains how-to articles that provide detailed guidance for adding media playback features to your app. The following table lists some of the available articles.
 * 
 * | Topic                                                                                             | Description                                                                                                                                                                                                                                                                                    |
 * |---------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
 * | [Play audio and video with MediaPlayer](/windows/uwp/audio-video-camera/play-audio-and-video-with-mediaplayer) | Shows you how to take advantage of the new features and improvements to the media playback system for UWP apps.                                                                                                          |
 * | [Media items, playlists, and tracks](/windows/uwp/audio-video-camera/media-playback-with-mediasource)                         | Shows you how to use the [**MediaSource**](/uwp/api/Windows.Media.Core.MediaSource) class, which provides a common way to reference and play back media from different sources such as local or remote files and exposes a common model for accessing media data, regardless of the underlying media format.                                                                                                               |
 * | [Integrate with the System Media Transport Controls](/windows/uwp/audio-video-camera/integrate-with-systemmediatransportcontrols)                               | Shows you how to integrate your app with the System Media Transport Controls (SMTC).                                    |
 * | [System-supported timed metadata cues](/windows/uwp/audio-video-camera/system-supported-metadata-cues)                               | Describes how to take advantage of several formats of timed metadata that may be embedded in media files or streams.                                   |
 * | [Create, schedule, and manage media breaks](/windows/uwp/audio-video-camera/create-schedule-and-manage-media-breaks)                                                                             | Shows you how to create, schedule, and manage media breaks to your media playback app.                                                                                                                      |
 * | [Play media in the background](/windows/uwp/audio-video-camera/background-audio)                                                                             | Shows you how to configure your app so that media continues to play when your app moves from the foreground to the background.                                                                                                                     |
 * | [Adaptive Streaming](/windows/uwp/audio-video-camera/adaptive-streaming)                                                       | Describes how to add playback of adaptive streaming multimedia content to a Universal Windows Platform (UWP) apps.                                           |
 * | [Media casting](/windows/uwp/audio-video-camera/media-casting)                                                                 | Shows you how to cast media to remote devices from a Universal Windows app.                                                                                                                                                                                                       |
 * | [PlayReady DRM](/windows/uwp/audio-video-camera/playready-client-sdk)                                                          | Describes how to add PlayReady protected media content to your Universal Windows Platform (UWP) app.                                                                                                                                                                                |
 * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplayer
 * @namespace Windows.Media.Playback
 * @version WindowsRuntime 1.4
 */
class MediaPlayer extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMediaPlayer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMediaPlayer.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets a Boolean value indicating if playback automatically starts after the media is loaded.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplayer.autoplay
     * @type {Boolean} 
     */
    AutoPlay {
        get => this.get_AutoPlay()
        set => this.put_AutoPlay(value)
    }

    /**
     * Get the actual duration of the media without applying the [PlaybackRate](mediaplayer_playbackrate.md). 
     * 
     * > [!NOTE]
     * > **MediaPlayer.NaturalDuration** may be altered or unavailable after Windows 10, version 1607. Instead, use the [MediaPlayer.PlaybackSession](mediaplayer_playbacksession.md) property to get a [MediaPlaybackSession](mediaplaybacksession.md) object and then use the [MediaPlaybackSession.NaturalDuration](mediaplaybacksession_naturalduration.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplayer.naturalduration
     * @type {TimeSpan} 
     */
    NaturalDuration {
        get => this.get_NaturalDuration()
    }

    /**
     * Gets or sets the playback position within the media. 
     * 
     * > [!NOTE]
     * > **MediaPlayer.Position** may be altered or unavailable after Windows 10, version 1607. Instead, use the [MediaPlayer.PlaybackSession](mediaplayer_playbacksession.md) property to get a [MediaPlaybackSession](mediaplaybacksession.md) object and then use the [MediaPlaybackSession.Position](mediaplaybacksession_position.md) property.
     * @remarks
     * The position can't be moved forward while a [MediaPlaybackItem](mediaplaybackitem.md) with [CanSkip](mediaplaybackitem_canskip.md) set to false is playing. Attempting to do so will cause an exception to be thrown.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplayer.position
     * @type {TimeSpan} 
     */
    Position {
        get => this.get_Position()
        set => this.put_Position(value)
    }

    /**
     * Gets the amount of buffering that is completed for the media content, expressed as a percentage.
     * 
     * > [!NOTE]
     * > **MediaPlayer.BufferingProgress** may be altered or unavailable after Windows 10, version 1607. Instead, use the [MediaPlayer.PlaybackSession](mediaplayer_playbacksession.md) property to get a [MediaPlaybackSession](mediaplaybacksession.md) object and then use the [MediaPlaybackSession.BufferingProgress](mediaplaybacksession_bufferingprogress.md) property.
     * @remarks
     * The value ranges from 0 to 1. Multiply by 100 to obtain a percentage. The default value is 0.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplayer.bufferingprogress
     * @type {Float} 
     */
    BufferingProgress {
        get => this.get_BufferingProgress()
    }

    /**
     * Gets the current state of media playback. 
     * 
     * > [!NOTE]
     * > **MediaPlayer.CurrentState** may be altered or unavailable after Windows 10, version 1607. Instead, use the [MediaPlayer.PlaybackSession](mediaplayer_playbacksession.md) property to get a [MediaPlaybackSession](mediaplaybacksession.md) object and then use the [MediaPlaybackSession.PlaybackState](mediaplaybacksession_playbackstate.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplayer.currentstate
     * @type {Integer} 
     */
    CurrentState {
        get => this.get_CurrentState()
    }

    /**
     * Gets a Boolean value indicating if the media supports seeking to a specific position.
     * 
     * > [!NOTE]
     * > **MediaPlayer.CanSeek** may be altered or unavailable after Windows 10, version 1607. Instead, use the [MediaPlayer.PlaybackSession](mediaplayer_playbacksession.md) property to get a [MediaPlaybackSession](mediaplaybacksession.md) object and then use the [MediaPlaybackSession.CanSeek](mediaplaybacksession_canseek.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplayer.canseek
     * @type {Boolean} 
     */
    CanSeek {
        get => this.get_CanSeek()
    }

    /**
     * Gets a Boolean value indicating if the media can be paused.
     * 
     * > [!NOTE]
     * > **MediaPlayer.CanPause** may be altered or unavailable after Windows 10, version 1607. Instead, use the [MediaPlayer.PlaybackSession](mediaplayer_playbacksession.md) property to get a [MediaPlaybackSession](mediaplaybacksession.md) object and then use the [MediaPlaybackSession.CanPause](mediaplaybacksession_canpause.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplayer.canpause
     * @type {Boolean} 
     */
    CanPause {
        get => this.get_CanPause()
    }

    /**
     * Gets or sets a Boolean value indicating if the media will playback in a repeating loop.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplayer.isloopingenabled
     * @type {Boolean} 
     */
    IsLoopingEnabled {
        get => this.get_IsLoopingEnabled()
        set => this.put_IsLoopingEnabled(value)
    }

    /**
     * Gets a Boolean value indicating if the content is protected by a digital rights management system.
     * 
     * > [!NOTE]
     * > **MediaPlayer.IsProtected** may be altered or unavailable after Windows 10, version 1607. Instead, use the [MediaPlayer.PlaybackSession](mediaplayer_playbacksession.md) property to get a [MediaPlaybackSession](mediaplaybacksession.md) object and then use the [IsProtected](mediaplaybacksession_isprotected.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplayer.isprotected
     * @type {Boolean} 
     */
    IsProtected {
        get => this.get_IsProtected()
    }

    /**
     * Gets or sets a Boolean value indicating if the audio is muted.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplayer.ismuted
     * @type {Boolean} 
     */
    IsMuted {
        get => this.get_IsMuted()
        set => this.put_IsMuted(value)
    }

    /**
     * Gets or sets the playback rate, expressed as a ratio. 
     * 
     * > [!NOTE]
     * > **MediaPlayer.PlaybackRate** may be altered or unavailable after Windows 10, version 1607. Instead, use the [MediaPlayer.PlaybackSession](mediaplayer_playbacksession.md) property to get a [MediaPlaybackSession](mediaplaybacksession.md) object and then use the [MediaPlaybackSession.PlaybackRate](mediaplaybacksession_playbackrate.md) property.
     * @remarks
     * This value is expressed as a ratio of the desired playback speed to normal playback speed. For example, a value of 1.5 sets the playback rate to 150% of the original.
     * 
     * The playback rate can't be set to a value greater than 1.0 while a [MediaPlaybackItem](mediaplaybackitem.md) with [CanSkip](mediaplaybackitem_canskip.md) set to false is playing. Attempting to do so will cause an exception to be thrown.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplayer.playbackrate
     * @type {Float} 
     */
    PlaybackRate {
        get => this.get_PlaybackRate()
        set => this.put_PlaybackRate(value)
    }

    /**
     * Get or sets the audio volume for media playback.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplayer.volume
     * @type {Float} 
     */
    Volume {
        get => this.get_Volume()
        set => this.put_Volume(value)
    }

    /**
     * Gets the collection of timeline markers for the media. 
     * 
     * > [!NOTE]
     * > **MediaPlayer.PlaybackMediaMarkers** may be altered or unavailable after Windows 10, version 1607. Instead, use [MediaPlaybackItem.TimedMetadataTracks](mediaplaybackitem_timedmetadatatracks.md) to manage data or text cues. For more information, see [Media playback with MediaSource](/windows/uwp/audio-video-camera/media-playback-with-mediasource).
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplayer.playbackmediamarkers
     * @type {PlaybackMediaMarkerSequence} 
     */
    PlaybackMediaMarkers {
        get => this.get_PlaybackMediaMarkers()
    }

    /**
     * Gets or sets the content protection manager for the media.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplayer.protectionmanager
     * @type {MediaProtectionManager} 
     */
    ProtectionManager {
        get => this.get_ProtectionManager()
        set => this.put_ProtectionManager(value)
    }

    /**
     * Sets the playback source of the media player.
     * @remarks
     * The playback source can be a [MediaSource](../windows.media.core/mediasource.md), a [MediaPlaybackItem](mediaplaybackitem.md), or a [MediaPlaybackList](mediaplaybacklist.md), which is a list of [MediaPlaybackItem](mediaplaybackitem.md) objects.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplayer.source
     * @type {IMediaPlaybackSource} 
     */
    Source {
        get => this.get_Source()
        set => this.put_Source(value)
    }

    /**
     * Gets an instance of the SystemMediaTransportControls class to enable user control of playback of the [MediaPlayer](mediaplayer.md) and to allow the app to show information about the currently playing content in the system UI.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplayer.systemmediatransportcontrols
     * @type {SystemMediaTransportControls} 
     */
    SystemMediaTransportControls {
        get => this.get_SystemMediaTransportControls()
    }

    /**
     * Gets or sets the type of audio that is currently being played.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplayer.audiocategory
     * @type {Integer} 
     */
    AudioCategory {
        get => this.get_AudioCategory()
        set => this.put_AudioCategory(value)
    }

    /**
     * Gets or sets a value that describes the primary usage of the device that is being used to play back audio.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplayer.audiodevicetype
     * @type {Integer} 
     */
    AudioDeviceType {
        get => this.get_AudioDeviceType()
        set => this.put_AudioDeviceType(value)
    }

    /**
     * Gets or sets a ratio of volume across stereo speakers.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplayer.audiobalance
     * @type {Float} 
     */
    AudioBalance {
        get => this.get_AudioBalance()
        set => this.put_AudioBalance(value)
    }

    /**
     * Gets or sets a value that configures the [MediaPlayer](mediaplayer.md) for real-time scenarios such as live streaming video.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplayer.realtimeplayback
     * @type {Boolean} 
     */
    RealTimePlayback {
        get => this.get_RealTimePlayback()
        set => this.put_RealTimePlayback(value)
    }

    /**
     * Gets or sets a value indicating the current stereoscopic render mode.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplayer.stereoscopicvideorendermode
     * @type {Integer} 
     */
    StereoscopicVideoRenderMode {
        get => this.get_StereoscopicVideoRenderMode()
        set => this.put_StereoscopicVideoRenderMode(value)
    }

    /**
     * Gets the [MediaBreakManager](mediabreakmanager.md) associated with the [MediaPlayer](mediaplayer.md), which provides information about and control over media breaks for the player.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplayer.breakmanager
     * @type {MediaBreakManager} 
     */
    BreakManager {
        get => this.get_BreakManager()
    }

    /**
     * Gets the [MediaPlaybackCommandManager](mediaplaybackcommandmanager.md) associated with the [MediaPlayer](mediaplayer.md), which specifies the behavior of and receives events from the System Media Transport Controls.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplayer.commandmanager
     * @type {MediaPlaybackCommandManager} 
     */
    CommandManager {
        get => this.get_CommandManager()
    }

    /**
     * Gets or sets the [DeviceInformation](../windows.devices.enumeration/deviceinformation.md) object representing audio device used by the [MediaPlayer](mediaplayer.md) to render audio.
     * @remarks
     * To enumerate the currently available audio devices, call [DeviceInformation.FindAllAsync](/uwp/api/windows.devices.enumeration.deviceinformation.findallasync), passing in the device selector string returned from [MediaDevice.GetAudioRenderSelector](../windows.media.devices/mediadevice_getaudiorenderselector_1223331501.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplayer.audiodevice
     * @type {DeviceInformation} 
     */
    AudioDevice {
        get => this.get_AudioDevice()
        set => this.put_AudioDevice(value)
    }

    /**
     * Gets or sets the [MediaTimelineController](../windows.media/mediatimelinecontroller.md) associated with the [MediaPlayer](mediaplayer.md). Use this property to manipulate multiple **MediaPlayer** instances with a single timeline control.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplayer.timelinecontroller
     * @type {MediaTimelineController} 
     */
    TimelineController {
        get => this.get_TimelineController()
        set => this.put_TimelineController(value)
    }

    /**
     * Gets or sets the offset applied to the position of the [MediaTimelineController](../windows.media/mediatimelinecontroller.md) associated with the [MediaPlayer](mediaplayer.md).
     * @remarks
     * A [MediaTimelineController](../windows.media/mediatimelinecontroller.md) can be associated with multiple instances of [MediaPlayer](mediaplayer.md) which could be playing different media sources. This property allows you to offset the actual playback position of the player from the current position of the timeline controller.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplayer.timelinecontrollerpositionoffset
     * @type {TimeSpan} 
     */
    TimelineControllerPositionOffset {
        get => this.get_TimelineControllerPositionOffset()
        set => this.put_TimelineControllerPositionOffset(value)
    }

    /**
     * Gets the [MediaPlaybackSession](mediaplaybacksession.md) associated with the [MediaPlayer](mediaplayer.md), which provides information about the state of the current playback session and provides events for responding to changes in playback session state.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplayer.playbacksession
     * @type {MediaPlaybackSession} 
     */
    PlaybackSession {
        get => this.get_PlaybackSession()
    }

    /**
     * Gets a value indicating whether video frame server mode is enabled for the **MediaPlayer** instance.
     * @remarks
     * When frame server mode is enabled, the media player does not render video content. Instead, your app should register for the [VideoFrameAvailable](mediaplayer_videoframeavailable.md) event and call [CopyFrameToVideoSurface](mediaplayer_copyframetovideosurface_313890589.md) when the event is raised to get the video frame data.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplayer.isvideoframeserverenabled
     * @type {Boolean} 
     */
    IsVideoFrameServerEnabled {
        get => this.get_IsVideoFrameServerEnabled()
        set => this.put_IsVideoFrameServerEnabled(value)
    }

    /**
     * Gets an [AudioStateMonitor](../windows.media.audio/audiostatemonitor.md) object that allows a UWP app to determine if any of the app's audio streams are currently being muted or having their volume reduced by the system.
     * @remarks
     * Windows dynamically mutes or lowers the level of audio streams in response to system events. For example, the volume of a podcast app's audio render stream may be lowered while an alarm is ringing. **AudioStateMonitor** allows apps to respond to changes in the level of their audio streams. For example, a podcast app may choose to pause playback when the sound level is lowered by the system and then resume playback when the volume level returns to normal. 
     * 
     * Use the [AudioStateMonitor.SoundLevel](../windows.media/soundlevel.md) property to determine the current sound level of the **MediaPlayer**. Register a handler for the [SoundLevelChanged](../windows.media.audio/audiostatemonitor_soundlevelchanged.md) event to receive notifications when the sound level of the **MediaPlayer** changes, and then check the **SoundLevel** property to determine the new current audio level.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplayer.audiostatemonitor
     * @type {AudioStateMonitor} 
     */
    AudioStateMonitor {
        get => this.get_AudioStateMonitor()
    }

    /**
     * Occurs when the media is opened.
     * @type {TypedEventHandler<MediaPlayer, IInspectable>}
    */
    OnMediaOpened {
        get {
            if(!this.HasProp("__OnMediaOpened")){
                this.__OnMediaOpened := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{f1a6a51e-d078-5c40-ba3f-348870ba5c87}"),
                    MediaPlayer,
                    IInspectable
                )
                this.__OnMediaOpenedToken := this.add_MediaOpened(this.__OnMediaOpened.iface)
            }
            return this.__OnMediaOpened
        }
    }

    /**
     * Occurs when the media has finished playback.
     * @type {TypedEventHandler<MediaPlayer, IInspectable>}
    */
    OnMediaEnded {
        get {
            if(!this.HasProp("__OnMediaEnded")){
                this.__OnMediaEnded := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{f1a6a51e-d078-5c40-ba3f-348870ba5c87}"),
                    MediaPlayer,
                    IInspectable
                )
                this.__OnMediaEndedToken := this.add_MediaEnded(this.__OnMediaEnded.iface)
            }
            return this.__OnMediaEnded
        }
    }

    /**
     * Occurs when an error is encountered.
     * @type {TypedEventHandler<MediaPlayer, MediaPlayerFailedEventArgs>}
    */
    OnMediaFailed {
        get {
            if(!this.HasProp("__OnMediaFailed")){
                this.__OnMediaFailed := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{362c45a7-3a0a-5e27-99ce-cff6d1b770e1}"),
                    MediaPlayer,
                    MediaPlayerFailedEventArgs
                )
                this.__OnMediaFailedToken := this.add_MediaFailed(this.__OnMediaFailed.iface)
            }
            return this.__OnMediaFailed
        }
    }

    /**
     * Occurs when the state of the media player has changed. 
     * 
     * > [!NOTE]
     * > **MediaPlayer.CurrentStateChanged** may be altered or unavailable after Windows 10, version 1607. Instead, use the [MediaPlayer.PlaybackSession](mediaplayer_playbacksession.md) property to get a [MediaPlaybackSession](mediaplaybacksession.md) object and then use the [MediaPlaybackSession.PlaybackStateChanged](mediaplaybacksession_playbackstatechanged.md) event.
     * @type {TypedEventHandler<MediaPlayer, IInspectable>}
    */
    OnCurrentStateChanged {
        get {
            if(!this.HasProp("__OnCurrentStateChanged")){
                this.__OnCurrentStateChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{f1a6a51e-d078-5c40-ba3f-348870ba5c87}"),
                    MediaPlayer,
                    IInspectable
                )
                this.__OnCurrentStateChangedToken := this.add_CurrentStateChanged(this.__OnCurrentStateChanged.iface)
            }
            return this.__OnCurrentStateChanged
        }
    }

    /**
     * Occurs when a media marker has been reached during playback. 
     * 
     * > [!NOTE]
     * > **MediaPlayer.PlaybackMediaMarkerReached** may be altered or unavailable after Windows 10, version 1607. Instead, use [MediaPlaybackItem.TimedMetadataTracks](mediaplaybackitem_timedmetadatatracks.md) to manage data or text cues. For more information, see [Media playback with MediaSource](/windows/uwp/audio-video-camera/media-playback-with-mediasource).
     * @type {TypedEventHandler<MediaPlayer, PlaybackMediaMarkerReachedEventArgs>}
    */
    OnPlaybackMediaMarkerReached {
        get {
            if(!this.HasProp("__OnPlaybackMediaMarkerReached")){
                this.__OnPlaybackMediaMarkerReached := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{67a4f43c-c254-57f0-a39d-a475a342d21d}"),
                    MediaPlayer,
                    PlaybackMediaMarkerReachedEventArgs
                )
                this.__OnPlaybackMediaMarkerReachedToken := this.add_PlaybackMediaMarkerReached(this.__OnPlaybackMediaMarkerReached.iface)
            }
            return this.__OnPlaybackMediaMarkerReached
        }
    }

    /**
     * Occurs when the media playback rate has changed. 
     * 
     * > [!NOTE]
     * > **MediaPlayer.MediaPlayerRateChanged** may be altered or unavailable after Windows 10, version 1607. Instead, use the [MediaPlayer.PlaybackSession](mediaplayer_playbacksession.md) property to get a [MediaPlaybackSession](mediaplaybacksession.md) object and then use the [MediaPlaybackSession.PlaybackRateChanged](mediaplaybacksession_playbackratechanged.md) event.
     * @type {TypedEventHandler<MediaPlayer, MediaPlayerRateChangedEventArgs>}
    */
    OnMediaPlayerRateChanged {
        get {
            if(!this.HasProp("__OnMediaPlayerRateChanged")){
                this.__OnMediaPlayerRateChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{ba51d31a-5688-5d4d-af42-122070b1eefa}"),
                    MediaPlayer,
                    MediaPlayerRateChangedEventArgs
                )
                this.__OnMediaPlayerRateChangedToken := this.add_MediaPlayerRateChanged(this.__OnMediaPlayerRateChanged.iface)
            }
            return this.__OnMediaPlayerRateChanged
        }
    }

    /**
     * Occurs when the volume of the audio has changed.
     * @type {TypedEventHandler<MediaPlayer, IInspectable>}
    */
    OnVolumeChanged {
        get {
            if(!this.HasProp("__OnVolumeChanged")){
                this.__OnVolumeChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{f1a6a51e-d078-5c40-ba3f-348870ba5c87}"),
                    MediaPlayer,
                    IInspectable
                )
                this.__OnVolumeChangedToken := this.add_VolumeChanged(this.__OnVolumeChanged.iface)
            }
            return this.__OnVolumeChanged
        }
    }

    /**
     * Occurs when a seek operation has finished. 
     * 
     * > [!NOTE]
     * > **MediaPlayer.SeekCompleted** may be altered or unavailable after Windows 10, version 1607. Instead, use the [MediaPlayer.PlaybackSession](mediaplayer_playbacksession.md) property to get a [MediaPlaybackSession](mediaplaybacksession.md) object and then use the [MediaPlaybackSession.SeekCompleted](mediaplaybacksession_seekcompleted.md) event.
     * @type {TypedEventHandler<MediaPlayer, IInspectable>}
    */
    OnSeekCompleted {
        get {
            if(!this.HasProp("__OnSeekCompleted")){
                this.__OnSeekCompleted := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{f1a6a51e-d078-5c40-ba3f-348870ba5c87}"),
                    MediaPlayer,
                    IInspectable
                )
                this.__OnSeekCompletedToken := this.add_SeekCompleted(this.__OnSeekCompleted.iface)
            }
            return this.__OnSeekCompleted
        }
    }

    /**
     * Occurs when buffering has started. 
     * 
     * > [!NOTE]
     * > **MediaPlayer.BufferingStarted** may be altered or unavailable after Windows 10, version 1607. Instead, use the [MediaPlayer.PlaybackSession](mediaplayer_playbacksession.md) property to get a [MediaPlaybackSession](mediaplaybacksession.md) object and then use the [MediaPlaybackSession.BufferingStarted](mediaplaybacksession_bufferingstarted.md) event.
     * @type {TypedEventHandler<MediaPlayer, IInspectable>}
    */
    OnBufferingStarted {
        get {
            if(!this.HasProp("__OnBufferingStarted")){
                this.__OnBufferingStarted := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{f1a6a51e-d078-5c40-ba3f-348870ba5c87}"),
                    MediaPlayer,
                    IInspectable
                )
                this.__OnBufferingStartedToken := this.add_BufferingStarted(this.__OnBufferingStarted.iface)
            }
            return this.__OnBufferingStarted
        }
    }

    /**
     * Occurs when buffering has finished. 
     * 
     * > [!NOTE]
     * > **MediaPlayer.BufferingEnded** may be altered or unavailable after Windows 10, version 1607. Instead, use the [MediaPlayer.PlaybackSession](mediaplayer_playbacksession.md) property to get a [MediaPlaybackSession](mediaplaybacksession.md) object and then use the [MediaPlaybackSession.BufferingEnded](mediaplaybacksession_bufferingended.md) event.
     * @type {TypedEventHandler<MediaPlayer, IInspectable>}
    */
    OnBufferingEnded {
        get {
            if(!this.HasProp("__OnBufferingEnded")){
                this.__OnBufferingEnded := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{f1a6a51e-d078-5c40-ba3f-348870ba5c87}"),
                    MediaPlayer,
                    IInspectable
                )
                this.__OnBufferingEndedToken := this.add_BufferingEnded(this.__OnBufferingEnded.iface)
            }
            return this.__OnBufferingEnded
        }
    }

    /**
     * Occurs when the current muted status of the [MediaPlayer](mediaplayer.md) changes.
     * @type {TypedEventHandler<MediaPlayer, IInspectable>}
    */
    OnIsMutedChanged {
        get {
            if(!this.HasProp("__OnIsMutedChanged")){
                this.__OnIsMutedChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{f1a6a51e-d078-5c40-ba3f-348870ba5c87}"),
                    MediaPlayer,
                    IInspectable
                )
                this.__OnIsMutedChangedToken := this.add_IsMutedChanged(this.__OnIsMutedChanged.iface)
            }
            return this.__OnIsMutedChanged
        }
    }

    /**
     * Occurs when the media source for the [MediaPlayer](mediaplayer.md) changes.
     * @remarks
     * A typical use of this event is if you are implementing your own transport controls. You can respond to this event by checking to see whether the source is a [MediaSource](../windows.media.core/mediasource.md), [MediaPlaybackItem](mediaplaybackitem.md), or [MediaPlaybackList](mediaplaybacklist.md) and then update your UI accordingly. For example, if the source is a [MediaPlaybackItem](mediaplaybackitem.md), you could subscribe to the list of audio and caption tracks and update the list in your UI so that the user can select the active track.
     * @type {TypedEventHandler<MediaPlayer, IInspectable>}
    */
    OnSourceChanged {
        get {
            if(!this.HasProp("__OnSourceChanged")){
                this.__OnSourceChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{f1a6a51e-d078-5c40-ba3f-348870ba5c87}"),
                    MediaPlayer,
                    IInspectable
                )
                this.__OnSourceChangedToken := this.add_SourceChanged(this.__OnSourceChanged.iface)
            }
            return this.__OnSourceChanged
        }
    }

    /**
     * Occurs when [IsVideoFrameServerEnabled](mediaplayer_isvideoframeserverenabled.md) is set to true and a new video frame is available for processing.
     * @remarks
     * In the handler for this event, call [CopyFrameToVideoSurface](mediaplayer_copyframetovideosurface_313890589.md) to get the video frame data.
     * @type {TypedEventHandler<MediaPlayer, IInspectable>}
    */
    OnVideoFrameAvailable {
        get {
            if(!this.HasProp("__OnVideoFrameAvailable")){
                this.__OnVideoFrameAvailable := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{f1a6a51e-d078-5c40-ba3f-348870ba5c87}"),
                    MediaPlayer,
                    IInspectable
                )
                this.__OnVideoFrameAvailableToken := this.add_VideoFrameAvailable(this.__OnVideoFrameAvailable.iface)
            }
            return this.__OnVideoFrameAvailable
        }
    }

    /**
     * Occurs when the current subtitle content has changed while the [MediaPlayer](/uwp/api/windows.media.playback.mediaplayer) is in frame server mode.
     * @remarks
     * In the handler for this event, you can call one of the overloads of [RenderSubtitlesToSurface](/uwp/api/windows.media.playback.mediaplayer#Windows_Media_Playback_MediaPlayer_RenderSubtitlesToSurface_Windows_Graphics_DirectX_Direct3D11_IDirect3DSurface_) to request that the system render the current subtitles to the provided IDirect3DSurface. If this method returns false, then no subtitles were rendered. In this case, you may choose to hide the subtitle render surface until the next time the event is raised.
     * 
     * In order for this event to be raised, you must place the [MediaPlayer](/uwp/api/windows.media.playback.mediaplayer) into frame server mode by setting [IsVideoFrameServerEnabled](/uwp/api/windows.media.playback.mediaplayer.IsVideoFrameServerEnabled) to **true**, and the playing media content must have at least one timed metadata track that has had its presentation mode set to [PlatformPresented](/uwp/api/windows.media.playback.timedmetadatatrackpresentationmode) with a call to [Media​Playback​Timed​Metadata​Track​List.SetPresentationMode](/uwp/api/windows.media.playback.mediaplaybacktimedmetadatatracklist#Windows_Media_Playback_MediaPlaybackTimedMetadataTrackList_SetPresentationMode_System_UInt32_Windows_Media_Playback_TimedMetadataTrackPresentationMode_). For more information on using MediaPlayer in frame server mode, see [Play audio and video with MediaPlayer](/windows/uwp/audio-video-camera/play-audio-and-video-with-mediaplayer). For more information on working with metadata tracks, see [Media items, playlists, and tracks](/windows/uwp/audio-video-camera/media-playback-with-mediasource).
     * @type {TypedEventHandler<MediaPlayer, IInspectable>}
    */
    OnSubtitleFrameChanged {
        get {
            if(!this.HasProp("__OnSubtitleFrameChanged")){
                this.__OnSubtitleFrameChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{f1a6a51e-d078-5c40-ba3f-348870ba5c87}"),
                    MediaPlayer,
                    IInspectable
                )
                this.__OnSubtitleFrameChangedToken := this.add_SubtitleFrameChanged(this.__OnSubtitleFrameChanged.iface)
            }
            return this.__OnSubtitleFrameChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [MediaPlayer](mediaplayer.md) object.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Media.Playback.MediaPlayer")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnMediaOpenedToken")) {
            this.remove_MediaOpened(this.__OnMediaOpenedToken)
            this.__OnMediaOpened.iface.Dispose()
        }

        if(this.HasProp("__OnMediaEndedToken")) {
            this.remove_MediaEnded(this.__OnMediaEndedToken)
            this.__OnMediaEnded.iface.Dispose()
        }

        if(this.HasProp("__OnMediaFailedToken")) {
            this.remove_MediaFailed(this.__OnMediaFailedToken)
            this.__OnMediaFailed.iface.Dispose()
        }

        if(this.HasProp("__OnCurrentStateChangedToken")) {
            this.remove_CurrentStateChanged(this.__OnCurrentStateChangedToken)
            this.__OnCurrentStateChanged.iface.Dispose()
        }

        if(this.HasProp("__OnPlaybackMediaMarkerReachedToken")) {
            this.remove_PlaybackMediaMarkerReached(this.__OnPlaybackMediaMarkerReachedToken)
            this.__OnPlaybackMediaMarkerReached.iface.Dispose()
        }

        if(this.HasProp("__OnMediaPlayerRateChangedToken")) {
            this.remove_MediaPlayerRateChanged(this.__OnMediaPlayerRateChangedToken)
            this.__OnMediaPlayerRateChanged.iface.Dispose()
        }

        if(this.HasProp("__OnVolumeChangedToken")) {
            this.remove_VolumeChanged(this.__OnVolumeChangedToken)
            this.__OnVolumeChanged.iface.Dispose()
        }

        if(this.HasProp("__OnSeekCompletedToken")) {
            this.remove_SeekCompleted(this.__OnSeekCompletedToken)
            this.__OnSeekCompleted.iface.Dispose()
        }

        if(this.HasProp("__OnBufferingStartedToken")) {
            this.remove_BufferingStarted(this.__OnBufferingStartedToken)
            this.__OnBufferingStarted.iface.Dispose()
        }

        if(this.HasProp("__OnBufferingEndedToken")) {
            this.remove_BufferingEnded(this.__OnBufferingEndedToken)
            this.__OnBufferingEnded.iface.Dispose()
        }

        if(this.HasProp("__OnIsMutedChangedToken")) {
            this.remove_IsMutedChanged(this.__OnIsMutedChangedToken)
            this.__OnIsMutedChanged.iface.Dispose()
        }

        if(this.HasProp("__OnSourceChangedToken")) {
            this.remove_SourceChanged(this.__OnSourceChangedToken)
            this.__OnSourceChanged.iface.Dispose()
        }

        if(this.HasProp("__OnVideoFrameAvailableToken")) {
            this.remove_VideoFrameAvailable(this.__OnVideoFrameAvailableToken)
            this.__OnVideoFrameAvailable.iface.Dispose()
        }

        if(this.HasProp("__OnSubtitleFrameChangedToken")) {
            this.remove_SubtitleFrameChanged(this.__OnSubtitleFrameChangedToken)
            this.__OnSubtitleFrameChanged.iface.Dispose()
        }

        this.Close()

        super.__Delete()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AutoPlay() {
        if (!this.HasProp("__IMediaPlayer")) {
            if ((queryResult := this.QueryInterface(IMediaPlayer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayer := IMediaPlayer(outPtr)
        }

        return this.__IMediaPlayer.get_AutoPlay()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AutoPlay(value) {
        if (!this.HasProp("__IMediaPlayer")) {
            if ((queryResult := this.QueryInterface(IMediaPlayer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayer := IMediaPlayer(outPtr)
        }

        return this.__IMediaPlayer.put_AutoPlay(value)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_NaturalDuration() {
        if (!this.HasProp("__IMediaPlayer")) {
            if ((queryResult := this.QueryInterface(IMediaPlayer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayer := IMediaPlayer(outPtr)
        }

        return this.__IMediaPlayer.get_NaturalDuration()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_Position() {
        if (!this.HasProp("__IMediaPlayer")) {
            if ((queryResult := this.QueryInterface(IMediaPlayer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayer := IMediaPlayer(outPtr)
        }

        return this.__IMediaPlayer.get_Position()
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_Position(value) {
        if (!this.HasProp("__IMediaPlayer")) {
            if ((queryResult := this.QueryInterface(IMediaPlayer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayer := IMediaPlayer(outPtr)
        }

        return this.__IMediaPlayer.put_Position(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_BufferingProgress() {
        if (!this.HasProp("__IMediaPlayer")) {
            if ((queryResult := this.QueryInterface(IMediaPlayer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayer := IMediaPlayer(outPtr)
        }

        return this.__IMediaPlayer.get_BufferingProgress()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CurrentState() {
        if (!this.HasProp("__IMediaPlayer")) {
            if ((queryResult := this.QueryInterface(IMediaPlayer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayer := IMediaPlayer(outPtr)
        }

        return this.__IMediaPlayer.get_CurrentState()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanSeek() {
        if (!this.HasProp("__IMediaPlayer")) {
            if ((queryResult := this.QueryInterface(IMediaPlayer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayer := IMediaPlayer(outPtr)
        }

        return this.__IMediaPlayer.get_CanSeek()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanPause() {
        if (!this.HasProp("__IMediaPlayer")) {
            if ((queryResult := this.QueryInterface(IMediaPlayer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayer := IMediaPlayer(outPtr)
        }

        return this.__IMediaPlayer.get_CanPause()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsLoopingEnabled() {
        if (!this.HasProp("__IMediaPlayer")) {
            if ((queryResult := this.QueryInterface(IMediaPlayer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayer := IMediaPlayer(outPtr)
        }

        return this.__IMediaPlayer.get_IsLoopingEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsLoopingEnabled(value) {
        if (!this.HasProp("__IMediaPlayer")) {
            if ((queryResult := this.QueryInterface(IMediaPlayer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayer := IMediaPlayer(outPtr)
        }

        return this.__IMediaPlayer.put_IsLoopingEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsProtected() {
        if (!this.HasProp("__IMediaPlayer")) {
            if ((queryResult := this.QueryInterface(IMediaPlayer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayer := IMediaPlayer(outPtr)
        }

        return this.__IMediaPlayer.get_IsProtected()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsMuted() {
        if (!this.HasProp("__IMediaPlayer")) {
            if ((queryResult := this.QueryInterface(IMediaPlayer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayer := IMediaPlayer(outPtr)
        }

        return this.__IMediaPlayer.get_IsMuted()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsMuted(value) {
        if (!this.HasProp("__IMediaPlayer")) {
            if ((queryResult := this.QueryInterface(IMediaPlayer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayer := IMediaPlayer(outPtr)
        }

        return this.__IMediaPlayer.put_IsMuted(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_PlaybackRate() {
        if (!this.HasProp("__IMediaPlayer")) {
            if ((queryResult := this.QueryInterface(IMediaPlayer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayer := IMediaPlayer(outPtr)
        }

        return this.__IMediaPlayer.get_PlaybackRate()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_PlaybackRate(value) {
        if (!this.HasProp("__IMediaPlayer")) {
            if ((queryResult := this.QueryInterface(IMediaPlayer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayer := IMediaPlayer(outPtr)
        }

        return this.__IMediaPlayer.put_PlaybackRate(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Volume() {
        if (!this.HasProp("__IMediaPlayer")) {
            if ((queryResult := this.QueryInterface(IMediaPlayer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayer := IMediaPlayer(outPtr)
        }

        return this.__IMediaPlayer.get_Volume()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_Volume(value) {
        if (!this.HasProp("__IMediaPlayer")) {
            if ((queryResult := this.QueryInterface(IMediaPlayer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayer := IMediaPlayer(outPtr)
        }

        return this.__IMediaPlayer.put_Volume(value)
    }

    /**
     * 
     * @returns {PlaybackMediaMarkerSequence} 
     */
    get_PlaybackMediaMarkers() {
        if (!this.HasProp("__IMediaPlayer")) {
            if ((queryResult := this.QueryInterface(IMediaPlayer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayer := IMediaPlayer(outPtr)
        }

        return this.__IMediaPlayer.get_PlaybackMediaMarkers()
    }

    /**
     * 
     * @param {TypedEventHandler<MediaPlayer, IInspectable>} value 
     * @returns {EventRegistrationToken} 
     */
    add_MediaOpened(value) {
        if (!this.HasProp("__IMediaPlayer")) {
            if ((queryResult := this.QueryInterface(IMediaPlayer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayer := IMediaPlayer(outPtr)
        }

        return this.__IMediaPlayer.add_MediaOpened(value)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_MediaOpened(token) {
        if (!this.HasProp("__IMediaPlayer")) {
            if ((queryResult := this.QueryInterface(IMediaPlayer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayer := IMediaPlayer(outPtr)
        }

        return this.__IMediaPlayer.remove_MediaOpened(token)
    }

    /**
     * 
     * @param {TypedEventHandler<MediaPlayer, IInspectable>} value 
     * @returns {EventRegistrationToken} 
     */
    add_MediaEnded(value) {
        if (!this.HasProp("__IMediaPlayer")) {
            if ((queryResult := this.QueryInterface(IMediaPlayer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayer := IMediaPlayer(outPtr)
        }

        return this.__IMediaPlayer.add_MediaEnded(value)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_MediaEnded(token) {
        if (!this.HasProp("__IMediaPlayer")) {
            if ((queryResult := this.QueryInterface(IMediaPlayer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayer := IMediaPlayer(outPtr)
        }

        return this.__IMediaPlayer.remove_MediaEnded(token)
    }

    /**
     * 
     * @param {TypedEventHandler<MediaPlayer, MediaPlayerFailedEventArgs>} value 
     * @returns {EventRegistrationToken} 
     */
    add_MediaFailed(value) {
        if (!this.HasProp("__IMediaPlayer")) {
            if ((queryResult := this.QueryInterface(IMediaPlayer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayer := IMediaPlayer(outPtr)
        }

        return this.__IMediaPlayer.add_MediaFailed(value)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_MediaFailed(token) {
        if (!this.HasProp("__IMediaPlayer")) {
            if ((queryResult := this.QueryInterface(IMediaPlayer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayer := IMediaPlayer(outPtr)
        }

        return this.__IMediaPlayer.remove_MediaFailed(token)
    }

    /**
     * 
     * @param {TypedEventHandler<MediaPlayer, IInspectable>} value 
     * @returns {EventRegistrationToken} 
     */
    add_CurrentStateChanged(value) {
        if (!this.HasProp("__IMediaPlayer")) {
            if ((queryResult := this.QueryInterface(IMediaPlayer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayer := IMediaPlayer(outPtr)
        }

        return this.__IMediaPlayer.add_CurrentStateChanged(value)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_CurrentStateChanged(token) {
        if (!this.HasProp("__IMediaPlayer")) {
            if ((queryResult := this.QueryInterface(IMediaPlayer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayer := IMediaPlayer(outPtr)
        }

        return this.__IMediaPlayer.remove_CurrentStateChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<MediaPlayer, PlaybackMediaMarkerReachedEventArgs>} value 
     * @returns {EventRegistrationToken} 
     */
    add_PlaybackMediaMarkerReached(value) {
        if (!this.HasProp("__IMediaPlayer")) {
            if ((queryResult := this.QueryInterface(IMediaPlayer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayer := IMediaPlayer(outPtr)
        }

        return this.__IMediaPlayer.add_PlaybackMediaMarkerReached(value)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PlaybackMediaMarkerReached(token) {
        if (!this.HasProp("__IMediaPlayer")) {
            if ((queryResult := this.QueryInterface(IMediaPlayer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayer := IMediaPlayer(outPtr)
        }

        return this.__IMediaPlayer.remove_PlaybackMediaMarkerReached(token)
    }

    /**
     * 
     * @param {TypedEventHandler<MediaPlayer, MediaPlayerRateChangedEventArgs>} value 
     * @returns {EventRegistrationToken} 
     */
    add_MediaPlayerRateChanged(value) {
        if (!this.HasProp("__IMediaPlayer")) {
            if ((queryResult := this.QueryInterface(IMediaPlayer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayer := IMediaPlayer(outPtr)
        }

        return this.__IMediaPlayer.add_MediaPlayerRateChanged(value)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_MediaPlayerRateChanged(token) {
        if (!this.HasProp("__IMediaPlayer")) {
            if ((queryResult := this.QueryInterface(IMediaPlayer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayer := IMediaPlayer(outPtr)
        }

        return this.__IMediaPlayer.remove_MediaPlayerRateChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<MediaPlayer, IInspectable>} value 
     * @returns {EventRegistrationToken} 
     */
    add_VolumeChanged(value) {
        if (!this.HasProp("__IMediaPlayer")) {
            if ((queryResult := this.QueryInterface(IMediaPlayer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayer := IMediaPlayer(outPtr)
        }

        return this.__IMediaPlayer.add_VolumeChanged(value)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_VolumeChanged(token) {
        if (!this.HasProp("__IMediaPlayer")) {
            if ((queryResult := this.QueryInterface(IMediaPlayer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayer := IMediaPlayer(outPtr)
        }

        return this.__IMediaPlayer.remove_VolumeChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<MediaPlayer, IInspectable>} value 
     * @returns {EventRegistrationToken} 
     */
    add_SeekCompleted(value) {
        if (!this.HasProp("__IMediaPlayer")) {
            if ((queryResult := this.QueryInterface(IMediaPlayer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayer := IMediaPlayer(outPtr)
        }

        return this.__IMediaPlayer.add_SeekCompleted(value)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_SeekCompleted(token) {
        if (!this.HasProp("__IMediaPlayer")) {
            if ((queryResult := this.QueryInterface(IMediaPlayer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayer := IMediaPlayer(outPtr)
        }

        return this.__IMediaPlayer.remove_SeekCompleted(token)
    }

    /**
     * 
     * @param {TypedEventHandler<MediaPlayer, IInspectable>} value 
     * @returns {EventRegistrationToken} 
     */
    add_BufferingStarted(value) {
        if (!this.HasProp("__IMediaPlayer")) {
            if ((queryResult := this.QueryInterface(IMediaPlayer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayer := IMediaPlayer(outPtr)
        }

        return this.__IMediaPlayer.add_BufferingStarted(value)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_BufferingStarted(token) {
        if (!this.HasProp("__IMediaPlayer")) {
            if ((queryResult := this.QueryInterface(IMediaPlayer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayer := IMediaPlayer(outPtr)
        }

        return this.__IMediaPlayer.remove_BufferingStarted(token)
    }

    /**
     * 
     * @param {TypedEventHandler<MediaPlayer, IInspectable>} value 
     * @returns {EventRegistrationToken} 
     */
    add_BufferingEnded(value) {
        if (!this.HasProp("__IMediaPlayer")) {
            if ((queryResult := this.QueryInterface(IMediaPlayer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayer := IMediaPlayer(outPtr)
        }

        return this.__IMediaPlayer.add_BufferingEnded(value)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_BufferingEnded(token) {
        if (!this.HasProp("__IMediaPlayer")) {
            if ((queryResult := this.QueryInterface(IMediaPlayer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayer := IMediaPlayer(outPtr)
        }

        return this.__IMediaPlayer.remove_BufferingEnded(token)
    }

    /**
     * Starts media playback.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplayer.play
     */
    Play() {
        if (!this.HasProp("__IMediaPlayer")) {
            if ((queryResult := this.QueryInterface(IMediaPlayer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayer := IMediaPlayer(outPtr)
        }

        return this.__IMediaPlayer.Play()
    }

    /**
     * Pauses media playback.
     * @remarks
     * Note that after you call **Pause**, the time represented by the [Position](/uwp/api/windows.media.playback.mediaplaybacksession.Position) property may not be precisely accurate. Apps that need a frame-accurate position value, such as media editors, should call [MediaPlayer.StepForwardOneFrame](/uwp/api/windows.media.playback.mediaplayer.StepForwardOneFrame) immediately after calling **Pause** before reading the **Position** value.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplayer.pause
     */
    Pause() {
        if (!this.HasProp("__IMediaPlayer")) {
            if ((queryResult := this.QueryInterface(IMediaPlayer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayer := IMediaPlayer(outPtr)
        }

        return this.__IMediaPlayer.Pause()
    }

    /**
     * Sets the path to the media. 
     * 
     * > [!NOTE]
     * > **MediaPlayer.SetUriSource** may be altered or unavailable after Windows 10. Use [MediaPlayer.Source](mediaplayer_source.md) instead.
     * @param {Uri} value The path to the media.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplayer.seturisource
     */
    SetUriSource(value) {
        if (!this.HasProp("__IMediaPlayer")) {
            if ((queryResult := this.QueryInterface(IMediaPlayer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayer := IMediaPlayer(outPtr)
        }

        return this.__IMediaPlayer.SetUriSource(value)
    }

    /**
     * 
     * @returns {MediaProtectionManager} 
     */
    get_ProtectionManager() {
        if (!this.HasProp("__IMediaPlayerSource")) {
            if ((queryResult := this.QueryInterface(IMediaPlayerSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayerSource := IMediaPlayerSource(outPtr)
        }

        return this.__IMediaPlayerSource.get_ProtectionManager()
    }

    /**
     * 
     * @param {MediaProtectionManager} value 
     * @returns {HRESULT} 
     */
    put_ProtectionManager(value) {
        if (!this.HasProp("__IMediaPlayerSource")) {
            if ((queryResult := this.QueryInterface(IMediaPlayerSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayerSource := IMediaPlayerSource(outPtr)
        }

        return this.__IMediaPlayerSource.put_ProtectionManager(value)
    }

    /**
     * Set the media source to a file. 
     * 
     * > [!NOTE]
     * > **MediaPlayer.SetFileSource** may be altered or unavailable after Windows 10. Use [MediaPlayer.Source](mediaplayer_source.md) instead.
     * @param {IStorageFile} file_ The media source file.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplayer.setfilesource
     */
    SetFileSource(file_) {
        if (!this.HasProp("__IMediaPlayerSource")) {
            if ((queryResult := this.QueryInterface(IMediaPlayerSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayerSource := IMediaPlayerSource(outPtr)
        }

        return this.__IMediaPlayerSource.SetFileSource(file_)
    }

    /**
     * Sets the media source to a stream. 
     * 
     * > [!NOTE]
     * > **MediaPlayer.SetMediaSource** may be altered or unavailable after Windows 10. Use [MediaPlayer.Source](mediaplayer_source.md) instead.
     * @param {IRandomAccessStream} stream The media source stream.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplayer.setstreamsource
     */
    SetStreamSource(stream) {
        if (!this.HasProp("__IMediaPlayerSource")) {
            if ((queryResult := this.QueryInterface(IMediaPlayerSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayerSource := IMediaPlayerSource(outPtr)
        }

        return this.__IMediaPlayerSource.SetStreamSource(stream)
    }

    /**
     * Sets the media source for playback. 
     * 
     * > [!NOTE]
     * > **MediaPlayer.SetMediaSource** may be altered or unavailable after Windows 10. Use [MediaPlayer.Source](mediaplayer_source.md) instead.
     * @param {IMediaSource} source The media source for playback.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplayer.setmediasource
     */
    SetMediaSource(source) {
        if (!this.HasProp("__IMediaPlayerSource")) {
            if ((queryResult := this.QueryInterface(IMediaPlayerSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayerSource := IMediaPlayerSource(outPtr)
        }

        return this.__IMediaPlayerSource.SetMediaSource(source)
    }

    /**
     * 
     * @returns {IMediaPlaybackSource} 
     */
    get_Source() {
        if (!this.HasProp("__IMediaPlayerSource2")) {
            if ((queryResult := this.QueryInterface(IMediaPlayerSource2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayerSource2 := IMediaPlayerSource2(outPtr)
        }

        return this.__IMediaPlayerSource2.get_Source()
    }

    /**
     * 
     * @param {IMediaPlaybackSource} value 
     * @returns {HRESULT} 
     */
    put_Source(value) {
        if (!this.HasProp("__IMediaPlayerSource2")) {
            if ((queryResult := this.QueryInterface(IMediaPlayerSource2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayerSource2 := IMediaPlayerSource2(outPtr)
        }

        return this.__IMediaPlayerSource2.put_Source(value)
    }

    /**
     * 
     * @returns {SystemMediaTransportControls} 
     */
    get_SystemMediaTransportControls() {
        if (!this.HasProp("__IMediaPlayer2")) {
            if ((queryResult := this.QueryInterface(IMediaPlayer2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayer2 := IMediaPlayer2(outPtr)
        }

        return this.__IMediaPlayer2.get_SystemMediaTransportControls()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AudioCategory() {
        if (!this.HasProp("__IMediaPlayer2")) {
            if ((queryResult := this.QueryInterface(IMediaPlayer2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayer2 := IMediaPlayer2(outPtr)
        }

        return this.__IMediaPlayer2.get_AudioCategory()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_AudioCategory(value) {
        if (!this.HasProp("__IMediaPlayer2")) {
            if ((queryResult := this.QueryInterface(IMediaPlayer2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayer2 := IMediaPlayer2(outPtr)
        }

        return this.__IMediaPlayer2.put_AudioCategory(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AudioDeviceType() {
        if (!this.HasProp("__IMediaPlayer2")) {
            if ((queryResult := this.QueryInterface(IMediaPlayer2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayer2 := IMediaPlayer2(outPtr)
        }

        return this.__IMediaPlayer2.get_AudioDeviceType()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_AudioDeviceType(value) {
        if (!this.HasProp("__IMediaPlayer2")) {
            if ((queryResult := this.QueryInterface(IMediaPlayer2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayer2 := IMediaPlayer2(outPtr)
        }

        return this.__IMediaPlayer2.put_AudioDeviceType(value)
    }

    /**
     * Adds an audio effect to the playback stream of the [MediaPlayer](mediaplayer.md).
     * @remarks
     * To remove audio effects from the playback stream, call [RemoveAllEffects](mediaplayer_removealleffects_674052444.md).
     * @param {HSTRING} activatableClassId The activatable class ID of the audio effect to add to the playback stream.
     * @param {Boolean} effectOptional A value indicating whether the effect is optional.
     * @param {IPropertySet} configuration A property set containing configuration settings for the specified audio effect.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplayer.addaudioeffect
     */
    AddAudioEffect(activatableClassId, effectOptional, configuration) {
        if (!this.HasProp("__IMediaPlayerEffects")) {
            if ((queryResult := this.QueryInterface(IMediaPlayerEffects.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayerEffects := IMediaPlayerEffects(outPtr)
        }

        return this.__IMediaPlayerEffects.AddAudioEffect(activatableClassId, effectOptional, configuration)
    }

    /**
     * Removes all effects from the playback stream of the [MediaPlayer](mediaplayer.md).
     * @remarks
     * Add effects to the playback stream by calling [AddAudioEffect](mediaplayer_addaudioeffect_1019588069.md) or [AddVideoEffect](mediaplayer_addvideoeffect_205953283.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplayer.removealleffects
     */
    RemoveAllEffects() {
        if (!this.HasProp("__IMediaPlayerEffects")) {
            if ((queryResult := this.QueryInterface(IMediaPlayerEffects.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayerEffects := IMediaPlayerEffects(outPtr)
        }

        return this.__IMediaPlayerEffects.RemoveAllEffects()
    }

    /**
     * Closes the [MediaPlayer](mediaplayer.md) and disposes of associated resources.
     * @remarks
     * The **Close** method is used by Universal Windows app using JavaScript. For apps written using the .NET Framework 4.5 in C# and VB.NET, the **Close** method is exposed as the **Dispose()** method on the [MediaPlayer](mediaplayer.md) object. For apps written in C++, the **Close** method will be called when using the **delete** keyword on the object.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplayer.close
     */
    Close() {
        if (!this.HasProp("__IClosable")) {
            if ((queryResult := this.QueryInterface(IClosable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClosable := IClosable(outPtr)
        }

        return this.__IClosable.Close()
    }

    /**
     * 
     * @param {TypedEventHandler<MediaPlayer, IInspectable>} value 
     * @returns {EventRegistrationToken} 
     */
    add_IsMutedChanged(value) {
        if (!this.HasProp("__IMediaPlayer3")) {
            if ((queryResult := this.QueryInterface(IMediaPlayer3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayer3 := IMediaPlayer3(outPtr)
        }

        return this.__IMediaPlayer3.add_IsMutedChanged(value)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_IsMutedChanged(token) {
        if (!this.HasProp("__IMediaPlayer3")) {
            if ((queryResult := this.QueryInterface(IMediaPlayer3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayer3 := IMediaPlayer3(outPtr)
        }

        return this.__IMediaPlayer3.remove_IsMutedChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<MediaPlayer, IInspectable>} value 
     * @returns {EventRegistrationToken} 
     */
    add_SourceChanged(value) {
        if (!this.HasProp("__IMediaPlayer3")) {
            if ((queryResult := this.QueryInterface(IMediaPlayer3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayer3 := IMediaPlayer3(outPtr)
        }

        return this.__IMediaPlayer3.add_SourceChanged(value)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_SourceChanged(token) {
        if (!this.HasProp("__IMediaPlayer3")) {
            if ((queryResult := this.QueryInterface(IMediaPlayer3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayer3 := IMediaPlayer3(outPtr)
        }

        return this.__IMediaPlayer3.remove_SourceChanged(token)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_AudioBalance() {
        if (!this.HasProp("__IMediaPlayer3")) {
            if ((queryResult := this.QueryInterface(IMediaPlayer3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayer3 := IMediaPlayer3(outPtr)
        }

        return this.__IMediaPlayer3.get_AudioBalance()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_AudioBalance(value) {
        if (!this.HasProp("__IMediaPlayer3")) {
            if ((queryResult := this.QueryInterface(IMediaPlayer3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayer3 := IMediaPlayer3(outPtr)
        }

        return this.__IMediaPlayer3.put_AudioBalance(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_RealTimePlayback() {
        if (!this.HasProp("__IMediaPlayer3")) {
            if ((queryResult := this.QueryInterface(IMediaPlayer3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayer3 := IMediaPlayer3(outPtr)
        }

        return this.__IMediaPlayer3.get_RealTimePlayback()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_RealTimePlayback(value) {
        if (!this.HasProp("__IMediaPlayer3")) {
            if ((queryResult := this.QueryInterface(IMediaPlayer3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayer3 := IMediaPlayer3(outPtr)
        }

        return this.__IMediaPlayer3.put_RealTimePlayback(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_StereoscopicVideoRenderMode() {
        if (!this.HasProp("__IMediaPlayer3")) {
            if ((queryResult := this.QueryInterface(IMediaPlayer3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayer3 := IMediaPlayer3(outPtr)
        }

        return this.__IMediaPlayer3.get_StereoscopicVideoRenderMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_StereoscopicVideoRenderMode(value) {
        if (!this.HasProp("__IMediaPlayer3")) {
            if ((queryResult := this.QueryInterface(IMediaPlayer3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayer3 := IMediaPlayer3(outPtr)
        }

        return this.__IMediaPlayer3.put_StereoscopicVideoRenderMode(value)
    }

    /**
     * 
     * @returns {MediaBreakManager} 
     */
    get_BreakManager() {
        if (!this.HasProp("__IMediaPlayer3")) {
            if ((queryResult := this.QueryInterface(IMediaPlayer3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayer3 := IMediaPlayer3(outPtr)
        }

        return this.__IMediaPlayer3.get_BreakManager()
    }

    /**
     * 
     * @returns {MediaPlaybackCommandManager} 
     */
    get_CommandManager() {
        if (!this.HasProp("__IMediaPlayer3")) {
            if ((queryResult := this.QueryInterface(IMediaPlayer3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayer3 := IMediaPlayer3(outPtr)
        }

        return this.__IMediaPlayer3.get_CommandManager()
    }

    /**
     * 
     * @returns {DeviceInformation} 
     */
    get_AudioDevice() {
        if (!this.HasProp("__IMediaPlayer3")) {
            if ((queryResult := this.QueryInterface(IMediaPlayer3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayer3 := IMediaPlayer3(outPtr)
        }

        return this.__IMediaPlayer3.get_AudioDevice()
    }

    /**
     * 
     * @param {DeviceInformation} value 
     * @returns {HRESULT} 
     */
    put_AudioDevice(value) {
        if (!this.HasProp("__IMediaPlayer3")) {
            if ((queryResult := this.QueryInterface(IMediaPlayer3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayer3 := IMediaPlayer3(outPtr)
        }

        return this.__IMediaPlayer3.put_AudioDevice(value)
    }

    /**
     * 
     * @returns {MediaTimelineController} 
     */
    get_TimelineController() {
        if (!this.HasProp("__IMediaPlayer3")) {
            if ((queryResult := this.QueryInterface(IMediaPlayer3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayer3 := IMediaPlayer3(outPtr)
        }

        return this.__IMediaPlayer3.get_TimelineController()
    }

    /**
     * 
     * @param {MediaTimelineController} value 
     * @returns {HRESULT} 
     */
    put_TimelineController(value) {
        if (!this.HasProp("__IMediaPlayer3")) {
            if ((queryResult := this.QueryInterface(IMediaPlayer3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayer3 := IMediaPlayer3(outPtr)
        }

        return this.__IMediaPlayer3.put_TimelineController(value)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_TimelineControllerPositionOffset() {
        if (!this.HasProp("__IMediaPlayer3")) {
            if ((queryResult := this.QueryInterface(IMediaPlayer3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayer3 := IMediaPlayer3(outPtr)
        }

        return this.__IMediaPlayer3.get_TimelineControllerPositionOffset()
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_TimelineControllerPositionOffset(value) {
        if (!this.HasProp("__IMediaPlayer3")) {
            if ((queryResult := this.QueryInterface(IMediaPlayer3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayer3 := IMediaPlayer3(outPtr)
        }

        return this.__IMediaPlayer3.put_TimelineControllerPositionOffset(value)
    }

    /**
     * 
     * @returns {MediaPlaybackSession} 
     */
    get_PlaybackSession() {
        if (!this.HasProp("__IMediaPlayer3")) {
            if ((queryResult := this.QueryInterface(IMediaPlayer3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayer3 := IMediaPlayer3(outPtr)
        }

        return this.__IMediaPlayer3.get_PlaybackSession()
    }

    /**
     * Causes the [MediaPlayer](mediaplayer.md) to move forward in the current media by one frame.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplayer.stepforwardoneframe
     */
    StepForwardOneFrame() {
        if (!this.HasProp("__IMediaPlayer3")) {
            if ((queryResult := this.QueryInterface(IMediaPlayer3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayer3 := IMediaPlayer3(outPtr)
        }

        return this.__IMediaPlayer3.StepForwardOneFrame()
    }

    /**
     * Causes the playback position of the [MediaPlayer](mediaplayer.md) to move backward by .042 seconds, which corresponds to one frame at 24 fps, regardless of the actual frame rate of the content being played.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplayer.stepbackwardoneframe
     */
    StepBackwardOneFrame() {
        if (!this.HasProp("__IMediaPlayer3")) {
            if ((queryResult := this.QueryInterface(IMediaPlayer3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayer3 := IMediaPlayer3(outPtr)
        }

        return this.__IMediaPlayer3.StepBackwardOneFrame()
    }

    /**
     * Gets a [CastingSource](../windows.media.casting/castingsource.md) representing the [MediaPlayer](mediaplayer.md), which allows its media to be cast to other devices.
     * @remarks
     * For more information on casting media to remote devices, see [Media casting](/windows/uwp/audio-video-camera/media-casting).
     * @returns {CastingSource} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplayer.getascastingsource
     */
    GetAsCastingSource() {
        if (!this.HasProp("__IMediaPlayer3")) {
            if ((queryResult := this.QueryInterface(IMediaPlayer3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayer3 := IMediaPlayer3(outPtr)
        }

        return this.__IMediaPlayer3.GetAsCastingSource()
    }

    /**
     * Sets the size of the composition surface returned by [GetSurface](mediaplayer_getsurface_812026623.md).
     * @remarks
     * The default size for the composition surface returned by [GetSurface](mediaplayer_getsurface_812026623.md) is 640x480, in pixels.
     * @param {SIZE} size_ An object representing the size of the composition surface.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplayer.setsurfacesize
     */
    SetSurfaceSize(size_) {
        if (!this.HasProp("__IMediaPlayer4")) {
            if ((queryResult := this.QueryInterface(IMediaPlayer4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayer4 := IMediaPlayer4(outPtr)
        }

        return this.__IMediaPlayer4.SetSurfaceSize(size_)
    }

    /**
     * Gets a [MediaPlayerSurface](mediaplayersurface.md) object for the [MediaPlayer](mediaplayer.md), which allows you to render the player's contents using a [Compositor](mediaplayersurface_compositor.md) without relying on the XAML framework.
     * @remarks
     * By default, the [CompositionSurface](../windows.ui.composition/icompositionsurface.md) generated by this method will have the dimensions 640x 480, in pixels. To get a different size, call [SetSurfaceSize](mediaplayer_setsurfacesize_1529588590.md) before calling **GetSurface**.
     * 
     * You can obtain multiple surfaces from a single [MediaPlayer](mediaplayer.md) instance by calling **GetSurface** multiple times.
     * 
     * For more information on using the [Windows.UI.Composition](../windows.ui.composition/windows_ui_composition.md) APIs to render visuals, see [Visual layer](/windows/uwp/graphics/visual-layer).
     * 
     * For how-to guidance for rendering video to a composition surface, see [Play audio and video with MediaPlayer](/windows/uwp/audio-video-camera/play-audio-and-video-with-mediaplayer).
     * @param {Compositor} compositor_ The [Compositor](../windows.ui.composition/compositor.md) with which the returned surface will be used.
     * @returns {MediaPlayerSurface} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplayer.getsurface
     */
    GetSurface(compositor_) {
        if (!this.HasProp("__IMediaPlayer4")) {
            if ((queryResult := this.QueryInterface(IMediaPlayer4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayer4 := IMediaPlayer4(outPtr)
        }

        return this.__IMediaPlayer4.GetSurface(compositor_)
    }

    /**
     * Applies a video effect to media playback.
     * @param {HSTRING} activatableClassId The identifier of the effect.
     * @param {Boolean} effectOptional Tue if the effect shouldn't block playback when the effect can't be used at run time. False if the effect should block playback when the effect can't be used at run time.
     * @param {IPropertySet} effectConfiguration A property set that transmits property values to the effect specified by *effectID*.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplayer.addvideoeffect
     */
    AddVideoEffect(activatableClassId, effectOptional, effectConfiguration) {
        if (!this.HasProp("__IMediaPlayerEffects2")) {
            if ((queryResult := this.QueryInterface(IMediaPlayerEffects2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayerEffects2 := IMediaPlayerEffects2(outPtr)
        }

        return this.__IMediaPlayerEffects2.AddVideoEffect(activatableClassId, effectOptional, effectConfiguration)
    }

    /**
     * 
     * @param {TypedEventHandler<MediaPlayer, IInspectable>} value 
     * @returns {EventRegistrationToken} 
     */
    add_VideoFrameAvailable(value) {
        if (!this.HasProp("__IMediaPlayer5")) {
            if ((queryResult := this.QueryInterface(IMediaPlayer5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayer5 := IMediaPlayer5(outPtr)
        }

        return this.__IMediaPlayer5.add_VideoFrameAvailable(value)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_VideoFrameAvailable(token) {
        if (!this.HasProp("__IMediaPlayer5")) {
            if ((queryResult := this.QueryInterface(IMediaPlayer5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayer5 := IMediaPlayer5(outPtr)
        }

        return this.__IMediaPlayer5.remove_VideoFrameAvailable(token)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsVideoFrameServerEnabled() {
        if (!this.HasProp("__IMediaPlayer5")) {
            if ((queryResult := this.QueryInterface(IMediaPlayer5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayer5 := IMediaPlayer5(outPtr)
        }

        return this.__IMediaPlayer5.get_IsVideoFrameServerEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsVideoFrameServerEnabled(value) {
        if (!this.HasProp("__IMediaPlayer5")) {
            if ((queryResult := this.QueryInterface(IMediaPlayer5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayer5 := IMediaPlayer5(outPtr)
        }

        return this.__IMediaPlayer5.put_IsVideoFrameServerEnabled(value)
    }

    /**
     * Copies the current video frame from the **MediaPlayer** to the provided **IDirect3DSurface**.
     * @remarks
     * For information on using **CopyFrameToVideoSurface** to apply GPU effects to video frames, see the [Use MediaPlayer in frame server mode](/windows/uwp/audio-video-camera/play-audio-and-video-with-mediaplayer#use-mediaplayer-in-frame-server-mode) section of [Play audio and video with MediaPlayer](/windows/uwp/audio-video-camera/play-audio-and-video-with-mediaplayer).
     * @param {IDirect3DSurface} destination The **IDirect3DSurface** to which the video frame is copied.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplayer.copyframetovideosurface
     */
    CopyFrameToVideoSurface(destination) {
        if (!this.HasProp("__IMediaPlayer5")) {
            if ((queryResult := this.QueryInterface(IMediaPlayer5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayer5 := IMediaPlayer5(outPtr)
        }

        return this.__IMediaPlayer5.CopyFrameToVideoSurface(destination)
    }

    /**
     * Copies the current video frame from the **MediaPlayer** to the specified target rectangle within the provided **IDirect3DSurface**.
     * @remarks
     * For information on using **CopyFrameToVideoSurface** to apply GPU effects to video frames, see the [Use MediaPlayer in frame server mode](/windows/uwp/audio-video-camera/play-audio-and-video-with-mediaplayer#use-mediaplayer-in-frame-server-mode) section of [Play audio and video with MediaPlayer](/windows/uwp/audio-video-camera/play-audio-and-video-with-mediaplayer).
     * @param {IDirect3DSurface} destination The **IDirect3DSurface** to which the video frame is copied.
     * @param {RECT} targetRectangle The target rectangle within the **IDirect3DSurface** to which the video frame is copied.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplayer.copyframetovideosurface
     */
    CopyFrameToVideoSurfaceWithTargetRectangle(destination, targetRectangle) {
        if (!this.HasProp("__IMediaPlayer5")) {
            if ((queryResult := this.QueryInterface(IMediaPlayer5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayer5 := IMediaPlayer5(outPtr)
        }

        return this.__IMediaPlayer5.CopyFrameToVideoSurfaceWithTargetRectangle(destination, targetRectangle)
    }

    /**
     * Copies the video frame currently displayed by the **MediaPlayer** to the two provided **IDirect3DSurface** objects which represent the left eye and right eye content of a stereoscopic video frame.
     * @remarks
     * For information on using **CopyFrameToVideoSurface** to apply GPU effects to video frames, see the [Use MediaPlayer in frame server mode](/windows/uwp/audio-video-camera/play-audio-and-video-with-mediaplayer#use-mediaplayer-in-frame-server-mode) section of [Play audio and video with MediaPlayer](/windows/uwp/audio-video-camera/play-audio-and-video-with-mediaplayer).
     * @param {IDirect3DSurface} destinationLeftEye The surface to which the left eye content is copied.
     * @param {IDirect3DSurface} destinationRightEye The surface to which the right eye content is copied.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplayer.copyframetostereoscopicvideosurfaces
     */
    CopyFrameToStereoscopicVideoSurfaces(destinationLeftEye, destinationRightEye) {
        if (!this.HasProp("__IMediaPlayer5")) {
            if ((queryResult := this.QueryInterface(IMediaPlayer5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayer5 := IMediaPlayer5(outPtr)
        }

        return this.__IMediaPlayer5.CopyFrameToStereoscopicVideoSurfaces(destinationLeftEye, destinationRightEye)
    }

    /**
     * 
     * @param {TypedEventHandler<MediaPlayer, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SubtitleFrameChanged(handler) {
        if (!this.HasProp("__IMediaPlayer6")) {
            if ((queryResult := this.QueryInterface(IMediaPlayer6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayer6 := IMediaPlayer6(outPtr)
        }

        return this.__IMediaPlayer6.add_SubtitleFrameChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_SubtitleFrameChanged(token) {
        if (!this.HasProp("__IMediaPlayer6")) {
            if ((queryResult := this.QueryInterface(IMediaPlayer6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayer6 := IMediaPlayer6(outPtr)
        }

        return this.__IMediaPlayer6.remove_SubtitleFrameChanged(token)
    }

    /**
     * Requests for the system to render the current subtitle text to the specified target rectangle within the provided [IDirect3DSurface](/uwp/api/Windows.Graphics.DirectX.Direct3D11.IDirect3DSurface).
     * @remarks
     * Note that this method is less efficient than the other overload of **RenderSubtitleToSurface**, but it allows you to use the same surface for rendering video and subtitles rather than requiring a separate surface for subtitles.
     * 
     * Handle the [SubtitleFrameChanged](/uwp/api/windows.media.playback.mediaplayer.SubtitleFrameChanged) event to receive a notification that the subtitle content has changed. Check the return value to see if subtitles were rendered.
     * 
     * In order to use this feature, you must place the [MediaPlayer](/uwp/api/windows.media.playback.mediaplayer) into frame server mode by setting [IsVideoFrameServerEnabled](/uwp/api/windows.media.playback.mediaplayer.IsVideoFrameServerEnabled) to **true**, and the playing media content must have at least one timed metadata track that has had its presentation mode set to [PlatformPresented](/uwp/api/windows.media.playback.timedmetadatatrackpresentationmode) with a call to [Media​Playback​Timed​Metadata​Track​List.SetPresentationMode](/uwp/api/windows.media.playback.mediaplaybacktimedmetadatatracklist#Windows_Media_Playback_MediaPlaybackTimedMetadataTrackList_SetPresentationMode_System_UInt32_Windows_Media_Playback_TimedMetadataTrackPresentationMode_). For more information on using MediaPlayer in frame server mode, see [Play audio and video with MediaPlayer](/windows/uwp/audio-video-camera/play-audio-and-video-with-mediaplayer). For more information on working with metadata tracks, see [Media items, playlists, and tracks](/windows/uwp/audio-video-camera/media-playback-with-mediasource).
     * @param {IDirect3DSurface} destination The object that implements **IDirect3DSurface**  to which the subtitle text is rendered.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplayer.rendersubtitlestosurface
     */
    RenderSubtitlesToSurface(destination) {
        if (!this.HasProp("__IMediaPlayer6")) {
            if ((queryResult := this.QueryInterface(IMediaPlayer6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayer6 := IMediaPlayer6(outPtr)
        }

        return this.__IMediaPlayer6.RenderSubtitlesToSurface(destination)
    }

    /**
     * Requests for the system to render the current subtitle text to the provided [IDirect3DSurface](/uwp/api/Windows.Graphics.DirectX.Direct3D11.IDirect3DSurface).
     * @remarks
     * Handle the [SubtitleFrameChanged](/uwp/api/windows.media.playback.mediaplayer.SubtitleFrameChanged) event to receive a notification that the subtitle content has changed. Check the return value to see if subtitles were rendered. If the method returns false, then no subtitles were rendered. In this case you may decide to hide the subtitle render surface in your UI.
     * 
     * In order to use this feature, you must place the [MediaPlayer](/uwp/api/windows.media.playback.mediaplayer) into frame server mode by setting [IsVideoFrameServerEnabled](/uwp/api/windows.media.playback.mediaplayer.IsVideoFrameServerEnabled) to **true**, and the playing media content must have at least one timed metadata track that has had its presentation mode set to [PlatformPresented](/uwp/api/windows.media.playback.timedmetadatatrackpresentationmode) with a call to [Media​Playback​Timed​Metadata​Track​List.SetPresentationMode](/uwp/api/windows.media.playback.mediaplaybacktimedmetadatatracklist#Windows_Media_Playback_MediaPlaybackTimedMetadataTrackList_SetPresentationMode_System_UInt32_Windows_Media_Playback_TimedMetadataTrackPresentationMode_). For more information on using MediaPlayer in frame server mode, see [Play audio and video with MediaPlayer](/windows/uwp/audio-video-camera/play-audio-and-video-with-mediaplayer). For more information on working with metadata tracks, see [Media items, playlists, and tracks](/windows/uwp/audio-video-camera/media-playback-with-mediasource).
     * @param {IDirect3DSurface} destination The object that implements **IDirect3DSurface**  to which the subtitle text is rendered.
     * @param {RECT} targetRectangle 
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplayer.rendersubtitlestosurface
     */
    RenderSubtitlesToSurfaceWithTargetRectangle(destination, targetRectangle) {
        if (!this.HasProp("__IMediaPlayer6")) {
            if ((queryResult := this.QueryInterface(IMediaPlayer6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayer6 := IMediaPlayer6(outPtr)
        }

        return this.__IMediaPlayer6.RenderSubtitlesToSurfaceWithTargetRectangle(destination, targetRectangle)
    }

    /**
     * 
     * @returns {AudioStateMonitor} 
     */
    get_AudioStateMonitor() {
        if (!this.HasProp("__IMediaPlayer7")) {
            if ((queryResult := this.QueryInterface(IMediaPlayer7.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlayer7 := IMediaPlayer7(outPtr)
        }

        return this.__IMediaPlayer7.get_AudioStateMonitor()
    }

;@endregion Instance Methods
}
