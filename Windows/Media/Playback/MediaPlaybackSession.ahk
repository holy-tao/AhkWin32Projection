#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMediaPlaybackSession.ahk
#Include .\IMediaPlaybackSession2.ahk
#Include .\IMediaPlaybackSession3.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\MediaPlaybackSession.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Provides information about the state of the current playback session of a [MediaPlayer](mediaplayer.md) and provides events for responding to changes in playback session state.
 * @remarks
 * Get an instance of this class by accessing the [PlaybackSession](mediaplayer_playbacksession.md) property of a [MediaPlayer](mediaplayer.md) or the [PlaybackSession](mediabreakmanager_playbacksession.md) property of a [MediaBreakManager](mediabreakmanager.md).
 * 
 * For how-to guidance for working with **MediaPlayer** and playback sessions, see [Play audio and video with MediaPlayer](/windows/uwp/audio-video-camera/play-audio-and-video-with-mediaplayer).
 * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybacksession
 * @namespace Windows.Media.Playback
 * @version WindowsRuntime 1.4
 */
class MediaPlaybackSession extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMediaPlaybackSession

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMediaPlaybackSession.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [MediaPlayer](mediaplayer.md) associated with the [MediaPlaybackSession](mediaplaybacksession.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybacksession.mediaplayer
     * @type {MediaPlayer} 
     */
    MediaPlayer {
        get => this.get_MediaPlayer()
    }

    /**
     * Gets a value indicating the duration of the currently playing media, when being played back at normal speed.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybacksession.naturalduration
     * @type {TimeSpan} 
     */
    NaturalDuration {
        get => this.get_NaturalDuration()
    }

    /**
     * Gets or sets the current playback position within the currently playing media.
     * @remarks
     * Note that after you call [MediaPlayer.Pause](/uwp/api/windows.media.playback.mediaplayer.Pause), the time represented by the **Position** property may not be precisely accurate. Apps that need a frame-accurate position value, such as media editors, should call [MediaPlayer.StepForwardOneFrame](/uwp/api/windows.media.playback.mediaplayer.StepForwardOneFrame) immediately after calling **Pause** before reading the **Position** value.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybacksession.position
     * @type {TimeSpan} 
     */
    Position {
        get => this.get_Position()
        set => this.put_Position(value)
    }

    /**
     * Gets a value indicating the current playback state of the [MediaPlaybackSession](mediaplaybacksession.md), such as buffering or playing.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybacksession.playbackstate
     * @type {Integer} 
     */
    PlaybackState {
        get => this.get_PlaybackState()
    }

    /**
     * Gets a value that indicates whether the current playback position of the media can be changed by setting the value of the [MediaPlayer.Position](mediaplayer_position.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybacksession.canseek
     * @type {Boolean} 
     */
    CanSeek {
        get => this.get_CanSeek()
    }

    /**
     * Gets a value that indicates whether media can be paused if the [MediaPlayer.Pause](mediaplayer_pause_1953642114.md) method is called.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybacksession.canpause
     * @type {Boolean} 
     */
    CanPause {
        get => this.get_CanPause()
    }

    /**
     * Gets a value that indicates whether the media that is currently playing in the [MediaPlaybackSession](mediaplaybacksession.md) is protected by digital rights management (DRM).
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybacksession.isprotected
     * @type {Boolean} 
     */
    IsProtected {
        get => this.get_IsProtected()
    }

    /**
     * Gets or sets a value representing the current playback rate for the [MediaPlaybackSession](mediaplaybacksession.md).
     * @remarks
     * This value is expressed as a ratio of the desired rate to the normal playback rate. For example, a value of 1.5 sets the playback rate to 150% of the original.
     * 
     * The playback rate can't be set to a value greater than 1.0 while a [MediaPlaybackItem](mediaplaybackitem.md) with [CanSkip](mediaplaybackitem_canskip.md) set to false is playing. Attempting to do so will cause an exception to be thrown.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybacksession.playbackrate
     * @type {Float} 
     */
    PlaybackRate {
        get => this.get_PlaybackRate()
        set => this.put_PlaybackRate(value)
    }

    /**
     * Gets a value that indicates the current buffering progress of a [MediaPlaybackSession](mediaplaybacksession.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybacksession.bufferingprogress
     * @type {Float} 
     */
    BufferingProgress {
        get => this.get_BufferingProgress()
    }

    /**
     * Gets a value indicating the position after the current playback [Position](mediaplaybacksession_position.md) to which downloading has completed and content is buffered.
     * @remarks
     * This value is expressed as a value between 0 and 1 where 0 is the beginning of the content and 1 is the entire duration of the content. Your app can assume that content is currently buffered between the current playback position and the position provided by this property. Content before the current playback position may or may not be buffered currently.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybacksession.downloadprogress
     * @type {Float} 
     */
    DownloadProgress {
        get => this.get_DownloadProgress()
    }

    /**
     * Gets the height of the video in the currently playing media item.
     * @remarks
     * If the currently playing media item is audio-only, the value of this property is 0.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybacksession.naturalvideoheight
     * @type {Integer} 
     */
    NaturalVideoHeight {
        get => this.get_NaturalVideoHeight()
    }

    /**
     * Gets the width of the video in the currently playing media item.
     * @remarks
     * If the currently playing media item is audio-only, the value of this property is 0.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybacksession.naturalvideowidth
     * @type {Integer} 
     */
    NaturalVideoWidth {
        get => this.get_NaturalVideoWidth()
    }

    /**
     * Gets or sets a normalized rectangle within the video source which is rendered by the [MediaPlayer](mediaplayer.md). This enables pan and zoom within video.
     * @remarks
     * The **x** and **y** fields of the supplied [Rect](../windows.foundation/rect.md) express the top and left coordinates of the source rectangle. The values for **x** and **y** must be non-negative and less than 1.0. To get a normalized top, left coordinate from pixel values, divide the desired **x** value, in pixels, by the value of the [NaturalVideoWidth](mediaplaybacksession_naturalvideowidth.md) property, and multiply the desired **y** value, in pixels, by the value of the [NaturalVideoHeight](mediaplaybacksession_naturalvideoheight.md) property.
     * 
     * The **width** and **height** fields of the supplied [Rect](../windows.foundation/rect.md) must be non-negative. To get normalized width and height values, divide the desired width, in pixels, by the value of the [NaturalVideoWidth](mediaplaybacksession_naturalvideowidth.md) property, and multiply the desired height value, in pixels, by the value of the [NaturalVideoHeight](mediaplaybacksession_naturalvideoheight.md) property.
     * 
     * The sum of the **x** value and the **width** value must be less than 1+10<sup>-4</sup>. The sum of the **y** value and the **height** value must be less than 1+10<sup>-4</sup>.
     * 
     * The default value for this property is (0,0,1,1) which selects the entire source rectangle to be rendered.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybacksession.normalizedsourcerect
     * @type {RECT} 
     */
    NormalizedSourceRect {
        get => this.get_NormalizedSourceRect()
        set => this.put_NormalizedSourceRect(value)
    }

    /**
     * Gets or sets a value specifying the stereoscopic video packing mode for the [MediaPlaybackSession](mediaplaybacksession.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybacksession.stereoscopicvideopackingmode
     * @type {Integer} 
     */
    StereoscopicVideoPackingMode {
        get => this.get_StereoscopicVideoPackingMode()
        set => this.put_StereoscopicVideoPackingMode(value)
    }

    /**
     * Gets an object that manages the spherical video projection settings used by the media playback session.
     * @remarks
     * The property values of the returned [MediaPlaybackSphericalVideoProjection](mediaplaybacksphericalvideoprojection.md) object are not guaranteed to be correct until after the [MediaPlayer.MediaOpened](mediaplayer_mediaopened.md) event has been raised for the associated media item.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybacksession.sphericalvideoprojection
     * @type {MediaPlaybackSphericalVideoProjection} 
     */
    SphericalVideoProjection {
        get => this.get_SphericalVideoProjection()
    }

    /**
     * Gets or sets a value indicating whether the content of the media playback session is currently being mirrored horizontally.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybacksession.ismirroring
     * @type {Boolean} 
     */
    IsMirroring {
        get => this.get_IsMirroring()
        set => this.put_IsMirroring(value)
    }

    /**
     * Gets or sets a value from the [MediaRotation](../windows.media.mediaproperties/mediarotation.md) enumeration that specifies the rotation applied to video content during playback.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybacksession.playbackrotation
     * @type {Integer} 
     */
    PlaybackRotation {
        get => this.get_PlaybackRotation()
        set => this.put_PlaybackRotation(value)
    }

    /**
     * Occurs when the current playback state changes.
     * @type {TypedEventHandler<MediaPlaybackSession, IInspectable>}
    */
    OnPlaybackStateChanged {
        get {
            if(!this.HasProp("__OnPlaybackStateChanged")){
                this.__OnPlaybackStateChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{7c70f38d-2aa1-5522-a6d6-34b52b988ae7}"),
                    MediaPlaybackSession,
                    IInspectable
                )
                this.__OnPlaybackStateChangedToken := this.add_PlaybackStateChanged(this.__OnPlaybackStateChanged.iface)
            }
            return this.__OnPlaybackStateChanged
        }
    }

    /**
     * Occurs when the current playback rate for the [MediaPlaybackSession](mediaplaybacksession.md) changes.
     * @type {TypedEventHandler<MediaPlaybackSession, IInspectable>}
    */
    OnPlaybackRateChanged {
        get {
            if(!this.HasProp("__OnPlaybackRateChanged")){
                this.__OnPlaybackRateChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{7c70f38d-2aa1-5522-a6d6-34b52b988ae7}"),
                    MediaPlaybackSession,
                    IInspectable
                )
                this.__OnPlaybackRateChangedToken := this.add_PlaybackRateChanged(this.__OnPlaybackRateChanged.iface)
            }
            return this.__OnPlaybackRateChanged
        }
    }

    /**
     * Occurs when a seek operation for the [MediaPlaybackSession](mediaplaybacksession.md) completes.
     * @type {TypedEventHandler<MediaPlaybackSession, IInspectable>}
    */
    OnSeekCompleted {
        get {
            if(!this.HasProp("__OnSeekCompleted")){
                this.__OnSeekCompleted := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{7c70f38d-2aa1-5522-a6d6-34b52b988ae7}"),
                    MediaPlaybackSession,
                    IInspectable
                )
                this.__OnSeekCompletedToken := this.add_SeekCompleted(this.__OnSeekCompleted.iface)
            }
            return this.__OnSeekCompleted
        }
    }

    /**
     * Occurs when buffering starts for the [MediaPlaybackSession](mediaplaybacksession.md).
     * @type {TypedEventHandler<MediaPlaybackSession, IInspectable>}
    */
    OnBufferingStarted {
        get {
            if(!this.HasProp("__OnBufferingStarted")){
                this.__OnBufferingStarted := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{7c70f38d-2aa1-5522-a6d6-34b52b988ae7}"),
                    MediaPlaybackSession,
                    IInspectable
                )
                this.__OnBufferingStartedToken := this.add_BufferingStarted(this.__OnBufferingStarted.iface)
            }
            return this.__OnBufferingStarted
        }
    }

    /**
     * Occurs when buffering ends for the [MediaPlaybackSession](mediaplaybacksession.md).
     * @type {TypedEventHandler<MediaPlaybackSession, IInspectable>}
    */
    OnBufferingEnded {
        get {
            if(!this.HasProp("__OnBufferingEnded")){
                this.__OnBufferingEnded := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{7c70f38d-2aa1-5522-a6d6-34b52b988ae7}"),
                    MediaPlaybackSession,
                    IInspectable
                )
                this.__OnBufferingEndedToken := this.add_BufferingEnded(this.__OnBufferingEnded.iface)
            }
            return this.__OnBufferingEnded
        }
    }

    /**
     * Occurs when the buffering progress for the [MediaPlaybackSession](mediaplaybacksession.md) changes.
     * @type {TypedEventHandler<MediaPlaybackSession, IInspectable>}
    */
    OnBufferingProgressChanged {
        get {
            if(!this.HasProp("__OnBufferingProgressChanged")){
                this.__OnBufferingProgressChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{7c70f38d-2aa1-5522-a6d6-34b52b988ae7}"),
                    MediaPlaybackSession,
                    IInspectable
                )
                this.__OnBufferingProgressChangedToken := this.add_BufferingProgressChanged(this.__OnBufferingProgressChanged.iface)
            }
            return this.__OnBufferingProgressChanged
        }
    }

    /**
     * Occurs when the download progress for a [MediaPlaybackSession](mediaplaybacksession.md) changes.
     * @type {TypedEventHandler<MediaPlaybackSession, IInspectable>}
    */
    OnDownloadProgressChanged {
        get {
            if(!this.HasProp("__OnDownloadProgressChanged")){
                this.__OnDownloadProgressChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{7c70f38d-2aa1-5522-a6d6-34b52b988ae7}"),
                    MediaPlaybackSession,
                    IInspectable
                )
                this.__OnDownloadProgressChangedToken := this.add_DownloadProgressChanged(this.__OnDownloadProgressChanged.iface)
            }
            return this.__OnDownloadProgressChanged
        }
    }

    /**
     * Occurs when the duration of the currently playing media item changes.
     * @type {TypedEventHandler<MediaPlaybackSession, IInspectable>}
    */
    OnNaturalDurationChanged {
        get {
            if(!this.HasProp("__OnNaturalDurationChanged")){
                this.__OnNaturalDurationChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{7c70f38d-2aa1-5522-a6d6-34b52b988ae7}"),
                    MediaPlaybackSession,
                    IInspectable
                )
                this.__OnNaturalDurationChangedToken := this.add_NaturalDurationChanged(this.__OnNaturalDurationChanged.iface)
            }
            return this.__OnNaturalDurationChanged
        }
    }

    /**
     * Occurs when the current playback position within the currently playing media changes.
     * @type {TypedEventHandler<MediaPlaybackSession, IInspectable>}
    */
    OnPositionChanged {
        get {
            if(!this.HasProp("__OnPositionChanged")){
                this.__OnPositionChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{7c70f38d-2aa1-5522-a6d6-34b52b988ae7}"),
                    MediaPlaybackSession,
                    IInspectable
                )
                this.__OnPositionChangedToken := this.add_PositionChanged(this.__OnPositionChanged.iface)
            }
            return this.__OnPositionChanged
        }
    }

    /**
     * Occurs when the size of the video in the currently playing media item changes.
     * @type {TypedEventHandler<MediaPlaybackSession, IInspectable>}
    */
    OnNaturalVideoSizeChanged {
        get {
            if(!this.HasProp("__OnNaturalVideoSizeChanged")){
                this.__OnNaturalVideoSizeChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{7c70f38d-2aa1-5522-a6d6-34b52b988ae7}"),
                    MediaPlaybackSession,
                    IInspectable
                )
                this.__OnNaturalVideoSizeChangedToken := this.add_NaturalVideoSizeChanged(this.__OnNaturalVideoSizeChanged.iface)
            }
            return this.__OnNaturalVideoSizeChanged
        }
    }

    /**
     * Occurs when the set of time ranges for which data is buffered changes.
     * @remarks
     * Get the current set of buffered time ranges by calling [GetBufferedRanges](mediaplaybacksession_getbufferedranges_977901416.md).
     * @type {TypedEventHandler<MediaPlaybackSession, IInspectable>}
    */
    OnBufferedRangesChanged {
        get {
            if(!this.HasProp("__OnBufferedRangesChanged")){
                this.__OnBufferedRangesChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{7c70f38d-2aa1-5522-a6d6-34b52b988ae7}"),
                    MediaPlaybackSession,
                    IInspectable
                )
                this.__OnBufferedRangesChangedToken := this.add_BufferedRangesChanged(this.__OnBufferedRangesChanged.iface)
            }
            return this.__OnBufferedRangesChanged
        }
    }

    /**
     * Occurs when the set of time ranges that have been played changes.
     * @remarks
     * Get the current set of buffered time ranges by calling [GetPlayedRanges](mediaplaybacksession_getplayedranges_31993417.md).
     * @type {TypedEventHandler<MediaPlaybackSession, IInspectable>}
    */
    OnPlayedRangesChanged {
        get {
            if(!this.HasProp("__OnPlayedRangesChanged")){
                this.__OnPlayedRangesChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{7c70f38d-2aa1-5522-a6d6-34b52b988ae7}"),
                    MediaPlaybackSession,
                    IInspectable
                )
                this.__OnPlayedRangesChangedToken := this.add_PlayedRangesChanged(this.__OnPlayedRangesChanged.iface)
            }
            return this.__OnPlayedRangesChanged
        }
    }

    /**
     * Occurs when the set of time ranges that can be seeked to changes.
     * @remarks
     * Get the current set of seekable time ranges by calling [GetSeekableRanges](mediaplaybacksession_getseekableranges_2031292234.md).
     * @type {TypedEventHandler<MediaPlaybackSession, IInspectable>}
    */
    OnSeekableRangesChanged {
        get {
            if(!this.HasProp("__OnSeekableRangesChanged")){
                this.__OnSeekableRangesChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{7c70f38d-2aa1-5522-a6d6-34b52b988ae7}"),
                    MediaPlaybackSession,
                    IInspectable
                )
                this.__OnSeekableRangesChangedToken := this.add_SeekableRangesChanged(this.__OnSeekableRangesChanged.iface)
            }
            return this.__OnSeekableRangesChanged
        }
    }

    /**
     * Occurs when the set of playback rates supported by the media playback session changes.
     * @remarks
     * Query whether a range of playback rates is supported by calling [IsSupportedPlaybackRateRange](mediaplaybacksession_issupportedplaybackraterange_1941141152.md).
     * @type {TypedEventHandler<MediaPlaybackSession, IInspectable>}
    */
    OnSupportedPlaybackRatesChanged {
        get {
            if(!this.HasProp("__OnSupportedPlaybackRatesChanged")){
                this.__OnSupportedPlaybackRatesChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{7c70f38d-2aa1-5522-a6d6-34b52b988ae7}"),
                    MediaPlaybackSession,
                    IInspectable
                )
                this.__OnSupportedPlaybackRatesChangedToken := this.add_SupportedPlaybackRatesChanged(this.__OnSupportedPlaybackRatesChanged.iface)
            }
            return this.__OnSupportedPlaybackRatesChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnPlaybackStateChangedToken")) {
            this.remove_PlaybackStateChanged(this.__OnPlaybackStateChangedToken)
            this.__OnPlaybackStateChanged.iface.Dispose()
        }

        if(this.HasProp("__OnPlaybackRateChangedToken")) {
            this.remove_PlaybackRateChanged(this.__OnPlaybackRateChangedToken)
            this.__OnPlaybackRateChanged.iface.Dispose()
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

        if(this.HasProp("__OnBufferingProgressChangedToken")) {
            this.remove_BufferingProgressChanged(this.__OnBufferingProgressChangedToken)
            this.__OnBufferingProgressChanged.iface.Dispose()
        }

        if(this.HasProp("__OnDownloadProgressChangedToken")) {
            this.remove_DownloadProgressChanged(this.__OnDownloadProgressChangedToken)
            this.__OnDownloadProgressChanged.iface.Dispose()
        }

        if(this.HasProp("__OnNaturalDurationChangedToken")) {
            this.remove_NaturalDurationChanged(this.__OnNaturalDurationChangedToken)
            this.__OnNaturalDurationChanged.iface.Dispose()
        }

        if(this.HasProp("__OnPositionChangedToken")) {
            this.remove_PositionChanged(this.__OnPositionChangedToken)
            this.__OnPositionChanged.iface.Dispose()
        }

        if(this.HasProp("__OnNaturalVideoSizeChangedToken")) {
            this.remove_NaturalVideoSizeChanged(this.__OnNaturalVideoSizeChangedToken)
            this.__OnNaturalVideoSizeChanged.iface.Dispose()
        }

        if(this.HasProp("__OnBufferedRangesChangedToken")) {
            this.remove_BufferedRangesChanged(this.__OnBufferedRangesChangedToken)
            this.__OnBufferedRangesChanged.iface.Dispose()
        }

        if(this.HasProp("__OnPlayedRangesChangedToken")) {
            this.remove_PlayedRangesChanged(this.__OnPlayedRangesChangedToken)
            this.__OnPlayedRangesChanged.iface.Dispose()
        }

        if(this.HasProp("__OnSeekableRangesChangedToken")) {
            this.remove_SeekableRangesChanged(this.__OnSeekableRangesChangedToken)
            this.__OnSeekableRangesChanged.iface.Dispose()
        }

        if(this.HasProp("__OnSupportedPlaybackRatesChangedToken")) {
            this.remove_SupportedPlaybackRatesChanged(this.__OnSupportedPlaybackRatesChangedToken)
            this.__OnSupportedPlaybackRatesChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @param {TypedEventHandler<MediaPlaybackSession, IInspectable>} value 
     * @returns {EventRegistrationToken} 
     */
    add_PlaybackStateChanged(value) {
        if (!this.HasProp("__IMediaPlaybackSession")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackSession := IMediaPlaybackSession(outPtr)
        }

        return this.__IMediaPlaybackSession.add_PlaybackStateChanged(value)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PlaybackStateChanged(token) {
        if (!this.HasProp("__IMediaPlaybackSession")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackSession := IMediaPlaybackSession(outPtr)
        }

        return this.__IMediaPlaybackSession.remove_PlaybackStateChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<MediaPlaybackSession, IInspectable>} value 
     * @returns {EventRegistrationToken} 
     */
    add_PlaybackRateChanged(value) {
        if (!this.HasProp("__IMediaPlaybackSession")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackSession := IMediaPlaybackSession(outPtr)
        }

        return this.__IMediaPlaybackSession.add_PlaybackRateChanged(value)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PlaybackRateChanged(token) {
        if (!this.HasProp("__IMediaPlaybackSession")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackSession := IMediaPlaybackSession(outPtr)
        }

        return this.__IMediaPlaybackSession.remove_PlaybackRateChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<MediaPlaybackSession, IInspectable>} value 
     * @returns {EventRegistrationToken} 
     */
    add_SeekCompleted(value) {
        if (!this.HasProp("__IMediaPlaybackSession")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackSession := IMediaPlaybackSession(outPtr)
        }

        return this.__IMediaPlaybackSession.add_SeekCompleted(value)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_SeekCompleted(token) {
        if (!this.HasProp("__IMediaPlaybackSession")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackSession := IMediaPlaybackSession(outPtr)
        }

        return this.__IMediaPlaybackSession.remove_SeekCompleted(token)
    }

    /**
     * 
     * @param {TypedEventHandler<MediaPlaybackSession, IInspectable>} value 
     * @returns {EventRegistrationToken} 
     */
    add_BufferingStarted(value) {
        if (!this.HasProp("__IMediaPlaybackSession")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackSession := IMediaPlaybackSession(outPtr)
        }

        return this.__IMediaPlaybackSession.add_BufferingStarted(value)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_BufferingStarted(token) {
        if (!this.HasProp("__IMediaPlaybackSession")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackSession := IMediaPlaybackSession(outPtr)
        }

        return this.__IMediaPlaybackSession.remove_BufferingStarted(token)
    }

    /**
     * 
     * @param {TypedEventHandler<MediaPlaybackSession, IInspectable>} value 
     * @returns {EventRegistrationToken} 
     */
    add_BufferingEnded(value) {
        if (!this.HasProp("__IMediaPlaybackSession")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackSession := IMediaPlaybackSession(outPtr)
        }

        return this.__IMediaPlaybackSession.add_BufferingEnded(value)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_BufferingEnded(token) {
        if (!this.HasProp("__IMediaPlaybackSession")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackSession := IMediaPlaybackSession(outPtr)
        }

        return this.__IMediaPlaybackSession.remove_BufferingEnded(token)
    }

    /**
     * 
     * @param {TypedEventHandler<MediaPlaybackSession, IInspectable>} value 
     * @returns {EventRegistrationToken} 
     */
    add_BufferingProgressChanged(value) {
        if (!this.HasProp("__IMediaPlaybackSession")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackSession := IMediaPlaybackSession(outPtr)
        }

        return this.__IMediaPlaybackSession.add_BufferingProgressChanged(value)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_BufferingProgressChanged(token) {
        if (!this.HasProp("__IMediaPlaybackSession")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackSession := IMediaPlaybackSession(outPtr)
        }

        return this.__IMediaPlaybackSession.remove_BufferingProgressChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<MediaPlaybackSession, IInspectable>} value 
     * @returns {EventRegistrationToken} 
     */
    add_DownloadProgressChanged(value) {
        if (!this.HasProp("__IMediaPlaybackSession")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackSession := IMediaPlaybackSession(outPtr)
        }

        return this.__IMediaPlaybackSession.add_DownloadProgressChanged(value)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_DownloadProgressChanged(token) {
        if (!this.HasProp("__IMediaPlaybackSession")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackSession := IMediaPlaybackSession(outPtr)
        }

        return this.__IMediaPlaybackSession.remove_DownloadProgressChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<MediaPlaybackSession, IInspectable>} value 
     * @returns {EventRegistrationToken} 
     */
    add_NaturalDurationChanged(value) {
        if (!this.HasProp("__IMediaPlaybackSession")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackSession := IMediaPlaybackSession(outPtr)
        }

        return this.__IMediaPlaybackSession.add_NaturalDurationChanged(value)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_NaturalDurationChanged(token) {
        if (!this.HasProp("__IMediaPlaybackSession")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackSession := IMediaPlaybackSession(outPtr)
        }

        return this.__IMediaPlaybackSession.remove_NaturalDurationChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<MediaPlaybackSession, IInspectable>} value 
     * @returns {EventRegistrationToken} 
     */
    add_PositionChanged(value) {
        if (!this.HasProp("__IMediaPlaybackSession")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackSession := IMediaPlaybackSession(outPtr)
        }

        return this.__IMediaPlaybackSession.add_PositionChanged(value)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PositionChanged(token) {
        if (!this.HasProp("__IMediaPlaybackSession")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackSession := IMediaPlaybackSession(outPtr)
        }

        return this.__IMediaPlaybackSession.remove_PositionChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<MediaPlaybackSession, IInspectable>} value 
     * @returns {EventRegistrationToken} 
     */
    add_NaturalVideoSizeChanged(value) {
        if (!this.HasProp("__IMediaPlaybackSession")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackSession := IMediaPlaybackSession(outPtr)
        }

        return this.__IMediaPlaybackSession.add_NaturalVideoSizeChanged(value)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_NaturalVideoSizeChanged(token) {
        if (!this.HasProp("__IMediaPlaybackSession")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackSession := IMediaPlaybackSession(outPtr)
        }

        return this.__IMediaPlaybackSession.remove_NaturalVideoSizeChanged(token)
    }

    /**
     * 
     * @returns {MediaPlayer} 
     */
    get_MediaPlayer() {
        if (!this.HasProp("__IMediaPlaybackSession")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackSession := IMediaPlaybackSession(outPtr)
        }

        return this.__IMediaPlaybackSession.get_MediaPlayer()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_NaturalDuration() {
        if (!this.HasProp("__IMediaPlaybackSession")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackSession := IMediaPlaybackSession(outPtr)
        }

        return this.__IMediaPlaybackSession.get_NaturalDuration()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_Position() {
        if (!this.HasProp("__IMediaPlaybackSession")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackSession := IMediaPlaybackSession(outPtr)
        }

        return this.__IMediaPlaybackSession.get_Position()
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_Position(value) {
        if (!this.HasProp("__IMediaPlaybackSession")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackSession := IMediaPlaybackSession(outPtr)
        }

        return this.__IMediaPlaybackSession.put_Position(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PlaybackState() {
        if (!this.HasProp("__IMediaPlaybackSession")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackSession := IMediaPlaybackSession(outPtr)
        }

        return this.__IMediaPlaybackSession.get_PlaybackState()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanSeek() {
        if (!this.HasProp("__IMediaPlaybackSession")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackSession := IMediaPlaybackSession(outPtr)
        }

        return this.__IMediaPlaybackSession.get_CanSeek()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanPause() {
        if (!this.HasProp("__IMediaPlaybackSession")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackSession := IMediaPlaybackSession(outPtr)
        }

        return this.__IMediaPlaybackSession.get_CanPause()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsProtected() {
        if (!this.HasProp("__IMediaPlaybackSession")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackSession := IMediaPlaybackSession(outPtr)
        }

        return this.__IMediaPlaybackSession.get_IsProtected()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_PlaybackRate() {
        if (!this.HasProp("__IMediaPlaybackSession")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackSession := IMediaPlaybackSession(outPtr)
        }

        return this.__IMediaPlaybackSession.get_PlaybackRate()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_PlaybackRate(value) {
        if (!this.HasProp("__IMediaPlaybackSession")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackSession := IMediaPlaybackSession(outPtr)
        }

        return this.__IMediaPlaybackSession.put_PlaybackRate(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_BufferingProgress() {
        if (!this.HasProp("__IMediaPlaybackSession")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackSession := IMediaPlaybackSession(outPtr)
        }

        return this.__IMediaPlaybackSession.get_BufferingProgress()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_DownloadProgress() {
        if (!this.HasProp("__IMediaPlaybackSession")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackSession := IMediaPlaybackSession(outPtr)
        }

        return this.__IMediaPlaybackSession.get_DownloadProgress()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NaturalVideoHeight() {
        if (!this.HasProp("__IMediaPlaybackSession")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackSession := IMediaPlaybackSession(outPtr)
        }

        return this.__IMediaPlaybackSession.get_NaturalVideoHeight()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NaturalVideoWidth() {
        if (!this.HasProp("__IMediaPlaybackSession")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackSession := IMediaPlaybackSession(outPtr)
        }

        return this.__IMediaPlaybackSession.get_NaturalVideoWidth()
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_NormalizedSourceRect() {
        if (!this.HasProp("__IMediaPlaybackSession")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackSession := IMediaPlaybackSession(outPtr)
        }

        return this.__IMediaPlaybackSession.get_NormalizedSourceRect()
    }

    /**
     * 
     * @param {RECT} value 
     * @returns {HRESULT} 
     */
    put_NormalizedSourceRect(value) {
        if (!this.HasProp("__IMediaPlaybackSession")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackSession := IMediaPlaybackSession(outPtr)
        }

        return this.__IMediaPlaybackSession.put_NormalizedSourceRect(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_StereoscopicVideoPackingMode() {
        if (!this.HasProp("__IMediaPlaybackSession")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackSession := IMediaPlaybackSession(outPtr)
        }

        return this.__IMediaPlaybackSession.get_StereoscopicVideoPackingMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_StereoscopicVideoPackingMode(value) {
        if (!this.HasProp("__IMediaPlaybackSession")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackSession := IMediaPlaybackSession(outPtr)
        }

        return this.__IMediaPlaybackSession.put_StereoscopicVideoPackingMode(value)
    }

    /**
     * 
     * @param {TypedEventHandler<MediaPlaybackSession, IInspectable>} value 
     * @returns {EventRegistrationToken} 
     */
    add_BufferedRangesChanged(value) {
        if (!this.HasProp("__IMediaPlaybackSession2")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackSession2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackSession2 := IMediaPlaybackSession2(outPtr)
        }

        return this.__IMediaPlaybackSession2.add_BufferedRangesChanged(value)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_BufferedRangesChanged(token) {
        if (!this.HasProp("__IMediaPlaybackSession2")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackSession2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackSession2 := IMediaPlaybackSession2(outPtr)
        }

        return this.__IMediaPlaybackSession2.remove_BufferedRangesChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<MediaPlaybackSession, IInspectable>} value 
     * @returns {EventRegistrationToken} 
     */
    add_PlayedRangesChanged(value) {
        if (!this.HasProp("__IMediaPlaybackSession2")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackSession2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackSession2 := IMediaPlaybackSession2(outPtr)
        }

        return this.__IMediaPlaybackSession2.add_PlayedRangesChanged(value)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PlayedRangesChanged(token) {
        if (!this.HasProp("__IMediaPlaybackSession2")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackSession2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackSession2 := IMediaPlaybackSession2(outPtr)
        }

        return this.__IMediaPlaybackSession2.remove_PlayedRangesChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<MediaPlaybackSession, IInspectable>} value 
     * @returns {EventRegistrationToken} 
     */
    add_SeekableRangesChanged(value) {
        if (!this.HasProp("__IMediaPlaybackSession2")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackSession2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackSession2 := IMediaPlaybackSession2(outPtr)
        }

        return this.__IMediaPlaybackSession2.add_SeekableRangesChanged(value)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_SeekableRangesChanged(token) {
        if (!this.HasProp("__IMediaPlaybackSession2")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackSession2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackSession2 := IMediaPlaybackSession2(outPtr)
        }

        return this.__IMediaPlaybackSession2.remove_SeekableRangesChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<MediaPlaybackSession, IInspectable>} value 
     * @returns {EventRegistrationToken} 
     */
    add_SupportedPlaybackRatesChanged(value) {
        if (!this.HasProp("__IMediaPlaybackSession2")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackSession2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackSession2 := IMediaPlaybackSession2(outPtr)
        }

        return this.__IMediaPlaybackSession2.add_SupportedPlaybackRatesChanged(value)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_SupportedPlaybackRatesChanged(token) {
        if (!this.HasProp("__IMediaPlaybackSession2")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackSession2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackSession2 := IMediaPlaybackSession2(outPtr)
        }

        return this.__IMediaPlaybackSession2.remove_SupportedPlaybackRatesChanged(token)
    }

    /**
     * 
     * @returns {MediaPlaybackSphericalVideoProjection} 
     */
    get_SphericalVideoProjection() {
        if (!this.HasProp("__IMediaPlaybackSession2")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackSession2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackSession2 := IMediaPlaybackSession2(outPtr)
        }

        return this.__IMediaPlaybackSession2.get_SphericalVideoProjection()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsMirroring() {
        if (!this.HasProp("__IMediaPlaybackSession2")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackSession2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackSession2 := IMediaPlaybackSession2(outPtr)
        }

        return this.__IMediaPlaybackSession2.get_IsMirroring()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsMirroring(value) {
        if (!this.HasProp("__IMediaPlaybackSession2")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackSession2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackSession2 := IMediaPlaybackSession2(outPtr)
        }

        return this.__IMediaPlaybackSession2.put_IsMirroring(value)
    }

    /**
     * Retrieves a read-only list of time ranges for which data is buffered and playback can begin immediately.
     * @returns {IVectorView<MediaTimeRange>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybacksession.getbufferedranges
     */
    GetBufferedRanges() {
        if (!this.HasProp("__IMediaPlaybackSession2")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackSession2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackSession2 := IMediaPlaybackSession2(outPtr)
        }

        return this.__IMediaPlaybackSession2.GetBufferedRanges()
    }

    /**
     * Retrieves a read-only list of time ranges for which content has been played back.
     * @returns {IVectorView<MediaTimeRange>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybacksession.getplayedranges
     */
    GetPlayedRanges() {
        if (!this.HasProp("__IMediaPlaybackSession2")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackSession2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackSession2 := IMediaPlaybackSession2(outPtr)
        }

        return this.__IMediaPlaybackSession2.GetPlayedRanges()
    }

    /**
     * Retrieves a read-only list of time ranges in which the playack position can be seeked to. For live streaming, these ranges represent the times ranges for which data is still available.
     * @returns {IVectorView<MediaTimeRange>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybacksession.getseekableranges
     */
    GetSeekableRanges() {
        if (!this.HasProp("__IMediaPlaybackSession2")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackSession2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackSession2 := IMediaPlaybackSession2(outPtr)
        }

        return this.__IMediaPlaybackSession2.GetSeekableRanges()
    }

    /**
     * Gets a value indicating whether the specified range of playback rates is supported.
     * @remarks
     * Playback rates are expressed as a ratio of the specified rate to the normal playback rate, so 2.0 is twice as fast as normal and .5 is half as fast as normal. You can use this method to see if slow motion playback is supported by testing the range (0, 1), or you can see if reverse playback is supported by testing the range (-1, 0). You can also test to see if a specific rate is supported by using the same value for both bounds, such as (2, 2) for double-speed playback or (4, 4) for four times the normal playback speed.
     * @param {Float} rate1 The lower bound of the playback rate range for which support is queried.
     * @param {Float} rate2 The upper bound of the playback rate range for which support is queried.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybacksession.issupportedplaybackraterange
     */
    IsSupportedPlaybackRateRange(rate1, rate2) {
        if (!this.HasProp("__IMediaPlaybackSession2")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackSession2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackSession2 := IMediaPlaybackSession2(outPtr)
        }

        return this.__IMediaPlaybackSession2.IsSupportedPlaybackRateRange(rate1, rate2)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PlaybackRotation() {
        if (!this.HasProp("__IMediaPlaybackSession3")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackSession3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackSession3 := IMediaPlaybackSession3(outPtr)
        }

        return this.__IMediaPlaybackSession3.get_PlaybackRotation()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_PlaybackRotation(value) {
        if (!this.HasProp("__IMediaPlaybackSession3")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackSession3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackSession3 := IMediaPlaybackSession3(outPtr)
        }

        return this.__IMediaPlaybackSession3.put_PlaybackRotation(value)
    }

    /**
     * Gets an object that expresses the current output degradation policy state of the [MediaPlaybackSession](mediaplaybacksession.md).
     * @remarks
     * In some circumstances the system may degrade the playback of a media item, such as reducing the resolution (constriction), based on a policy rather than a performance issue. The object retrieved with this property allows you to determine if and why this policy-based degredation is occurring for telemetry purposes.
     * @returns {MediaPlaybackSessionOutputDegradationPolicyState} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybacksession.getoutputdegradationpolicystate
     */
    GetOutputDegradationPolicyState() {
        if (!this.HasProp("__IMediaPlaybackSession3")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackSession3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackSession3 := IMediaPlaybackSession3(outPtr)
        }

        return this.__IMediaPlaybackSession3.GetOutputDegradationPolicyState()
    }

;@endregion Instance Methods
}
