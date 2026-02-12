#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMediaBreakManager.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\MediaBreakManager.ahk
#Include .\MediaBreakSeekedOverEventArgs.ahk
#Include .\MediaBreakStartedEventArgs.ahk
#Include .\MediaBreakEndedEventArgs.ahk
#Include .\MediaBreakSkippedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Provides information about and control over the [MediaBreak](mediabreak.md) objects associated with a [MediaPlayer](mediaplayer.md). This class provides events for when a media break starts playback, ends playback, is skipped, or is seeked over. You can also use this class to determine the currently playing [MediaBreak](mediabreak.md) or to start or skip playback of a [MediaBreak](mediabreak.md).
 * @remarks
 * Get an instance of this class by accessing the [MediaPlayer.BreakManager](mediaplayer_breakmanager.md) property.
 * 
 * For how-to guidance for working with media breaks, see [Create, schedule, and manage media breaks](/windows/uwp/audio-video-camera/create-schedule-and-manage-media-breaks).
 * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediabreakmanager
 * @namespace Windows.Media.Playback
 * @version WindowsRuntime 1.4
 */
class MediaBreakManager extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMediaBreakManager

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMediaBreakManager.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [MediaBreak](mediabreak.md) that is currently being played by the [MediaPlayer](mediaplayer.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediabreakmanager.currentbreak
     * @type {MediaBreak} 
     */
    CurrentBreak {
        get => this.get_CurrentBreak()
    }

    /**
     * Gets the [MediaPlaybackSession](mediaplaybacksession.md) associated with the [MediaBreakManager](mediabreakmanager.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediabreakmanager.playbacksession
     * @type {MediaPlaybackSession} 
     */
    PlaybackSession {
        get => this.get_PlaybackSession()
    }

    /**
     * Occurs when the user seeks the media playback position past one or more pending media breaks.
     * @type {TypedEventHandler<MediaBreakManager, MediaBreakSeekedOverEventArgs>}
    */
    OnBreaksSeekedOver {
        get {
            if(!this.HasProp("__OnBreaksSeekedOver")){
                this.__OnBreaksSeekedOver := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{a6954c30-99dc-5f84-b482-7d0692c0277b}"),
                    MediaBreakManager,
                    MediaBreakSeekedOverEventArgs
                )
                this.__OnBreaksSeekedOverToken := this.add_BreaksSeekedOver(this.__OnBreaksSeekedOver.iface)
            }
            return this.__OnBreaksSeekedOver
        }
    }

    /**
     * Occurs when playback of a [MediaBreak](mediabreak.md) starts.
     * @type {TypedEventHandler<MediaBreakManager, MediaBreakStartedEventArgs>}
    */
    OnBreakStarted {
        get {
            if(!this.HasProp("__OnBreakStarted")){
                this.__OnBreakStarted := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{4bf2cca1-cd9d-5d88-9e47-1881201bb72d}"),
                    MediaBreakManager,
                    MediaBreakStartedEventArgs
                )
                this.__OnBreakStartedToken := this.add_BreakStarted(this.__OnBreakStarted.iface)
            }
            return this.__OnBreakStarted
        }
    }

    /**
     * Occurs when a [MediaBreak](mediabreak.md) ends playback.
     * @type {TypedEventHandler<MediaBreakManager, MediaBreakEndedEventArgs>}
    */
    OnBreakEnded {
        get {
            if(!this.HasProp("__OnBreakEnded")){
                this.__OnBreakEnded := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{04afafa9-d83a-5ccb-8cab-82c9d92a19ab}"),
                    MediaBreakManager,
                    MediaBreakEndedEventArgs
                )
                this.__OnBreakEndedToken := this.add_BreakEnded(this.__OnBreakEnded.iface)
            }
            return this.__OnBreakEnded
        }
    }

    /**
     * Occurs when a [MediaBreak](mediabreak.md) is skipped.
     * @type {TypedEventHandler<MediaBreakManager, MediaBreakSkippedEventArgs>}
    */
    OnBreakSkipped {
        get {
            if(!this.HasProp("__OnBreakSkipped")){
                this.__OnBreakSkipped := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{c530fa5d-1a56-582a-a254-1b1ae17b8d2d}"),
                    MediaBreakManager,
                    MediaBreakSkippedEventArgs
                )
                this.__OnBreakSkippedToken := this.add_BreakSkipped(this.__OnBreakSkipped.iface)
            }
            return this.__OnBreakSkipped
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnBreaksSeekedOverToken")) {
            this.remove_BreaksSeekedOver(this.__OnBreaksSeekedOverToken)
            this.__OnBreaksSeekedOver.iface.Dispose()
        }

        if(this.HasProp("__OnBreakStartedToken")) {
            this.remove_BreakStarted(this.__OnBreakStartedToken)
            this.__OnBreakStarted.iface.Dispose()
        }

        if(this.HasProp("__OnBreakEndedToken")) {
            this.remove_BreakEnded(this.__OnBreakEndedToken)
            this.__OnBreakEnded.iface.Dispose()
        }

        if(this.HasProp("__OnBreakSkippedToken")) {
            this.remove_BreakSkipped(this.__OnBreakSkippedToken)
            this.__OnBreakSkipped.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @param {TypedEventHandler<MediaBreakManager, MediaBreakSeekedOverEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_BreaksSeekedOver(handler) {
        if (!this.HasProp("__IMediaBreakManager")) {
            if ((queryResult := this.QueryInterface(IMediaBreakManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaBreakManager := IMediaBreakManager(outPtr)
        }

        return this.__IMediaBreakManager.add_BreaksSeekedOver(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_BreaksSeekedOver(token) {
        if (!this.HasProp("__IMediaBreakManager")) {
            if ((queryResult := this.QueryInterface(IMediaBreakManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaBreakManager := IMediaBreakManager(outPtr)
        }

        return this.__IMediaBreakManager.remove_BreaksSeekedOver(token)
    }

    /**
     * 
     * @param {TypedEventHandler<MediaBreakManager, MediaBreakStartedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_BreakStarted(handler) {
        if (!this.HasProp("__IMediaBreakManager")) {
            if ((queryResult := this.QueryInterface(IMediaBreakManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaBreakManager := IMediaBreakManager(outPtr)
        }

        return this.__IMediaBreakManager.add_BreakStarted(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_BreakStarted(token) {
        if (!this.HasProp("__IMediaBreakManager")) {
            if ((queryResult := this.QueryInterface(IMediaBreakManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaBreakManager := IMediaBreakManager(outPtr)
        }

        return this.__IMediaBreakManager.remove_BreakStarted(token)
    }

    /**
     * 
     * @param {TypedEventHandler<MediaBreakManager, MediaBreakEndedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_BreakEnded(handler) {
        if (!this.HasProp("__IMediaBreakManager")) {
            if ((queryResult := this.QueryInterface(IMediaBreakManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaBreakManager := IMediaBreakManager(outPtr)
        }

        return this.__IMediaBreakManager.add_BreakEnded(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_BreakEnded(token) {
        if (!this.HasProp("__IMediaBreakManager")) {
            if ((queryResult := this.QueryInterface(IMediaBreakManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaBreakManager := IMediaBreakManager(outPtr)
        }

        return this.__IMediaBreakManager.remove_BreakEnded(token)
    }

    /**
     * 
     * @param {TypedEventHandler<MediaBreakManager, MediaBreakSkippedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_BreakSkipped(handler) {
        if (!this.HasProp("__IMediaBreakManager")) {
            if ((queryResult := this.QueryInterface(IMediaBreakManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaBreakManager := IMediaBreakManager(outPtr)
        }

        return this.__IMediaBreakManager.add_BreakSkipped(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_BreakSkipped(token) {
        if (!this.HasProp("__IMediaBreakManager")) {
            if ((queryResult := this.QueryInterface(IMediaBreakManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaBreakManager := IMediaBreakManager(outPtr)
        }

        return this.__IMediaBreakManager.remove_BreakSkipped(token)
    }

    /**
     * 
     * @returns {MediaBreak} 
     */
    get_CurrentBreak() {
        if (!this.HasProp("__IMediaBreakManager")) {
            if ((queryResult := this.QueryInterface(IMediaBreakManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaBreakManager := IMediaBreakManager(outPtr)
        }

        return this.__IMediaBreakManager.get_CurrentBreak()
    }

    /**
     * 
     * @returns {MediaPlaybackSession} 
     */
    get_PlaybackSession() {
        if (!this.HasProp("__IMediaBreakManager")) {
            if ((queryResult := this.QueryInterface(IMediaBreakManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaBreakManager := IMediaBreakManager(outPtr)
        }

        return this.__IMediaBreakManager.get_PlaybackSession()
    }

    /**
     * Directs the [MediaPlayer](mediaplayer.md) to begin playing the specified [MediaBreak](mediabreak.md) immediately.
     * @param {MediaBreak} value The [MediaBreak](mediabreak.md) to be played.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediabreakmanager.playbreak
     */
    PlayBreak(value) {
        if (!this.HasProp("__IMediaBreakManager")) {
            if ((queryResult := this.QueryInterface(IMediaBreakManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaBreakManager := IMediaBreakManager(outPtr)
        }

        return this.__IMediaBreakManager.PlayBreak(value)
    }

    /**
     * Directs the [MediaPlayer](mediaplayer.md) to skip over the current [MediaBreak](mediabreak.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediabreakmanager.skipcurrentbreak
     */
    SkipCurrentBreak() {
        if (!this.HasProp("__IMediaBreakManager")) {
            if ((queryResult := this.QueryInterface(IMediaBreakManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaBreakManager := IMediaBreakManager(outPtr)
        }

        return this.__IMediaBreakManager.SkipCurrentBreak()
    }

;@endregion Instance Methods
}
