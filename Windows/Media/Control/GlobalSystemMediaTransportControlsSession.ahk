#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGlobalSystemMediaTransportControlsSession.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\GlobalSystemMediaTransportControlsSession.ahk
#Include .\TimelinePropertiesChangedEventArgs.ahk
#Include .\PlaybackInfoChangedEventArgs.ahk
#Include .\MediaPropertiesChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents a playback session from another app providing info about that session and possibly allowing control.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.control.globalsystemmediatransportcontrolssession
 * @namespace Windows.Media.Control
 * @version WindowsRuntime 1.4
 */
class GlobalSystemMediaTransportControlsSession extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGlobalSystemMediaTransportControlsSession

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGlobalSystemMediaTransportControlsSession.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the App user model Id of the source app of the session.
     * @see https://learn.microsoft.com/uwp/api/windows.media.control.globalsystemmediatransportcontrolssession.sourceappusermodelid
     * @type {HSTRING} 
     */
    SourceAppUserModelId {
        get => this.get_SourceAppUserModelId()
    }

    /**
     * Occurs when the timeline properties of this session change.
     * @type {TypedEventHandler<GlobalSystemMediaTransportControlsSession, TimelinePropertiesChangedEventArgs>}
    */
    OnTimelinePropertiesChanged {
        get {
            if(!this.HasProp("__OnTimelinePropertiesChanged")){
                this.__OnTimelinePropertiesChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{e8bf62af-fac1-5fff-9053-0bf191ae777e}"),
                    GlobalSystemMediaTransportControlsSession,
                    TimelinePropertiesChangedEventArgs
                )
                this.__OnTimelinePropertiesChangedToken := this.add_TimelinePropertiesChanged(this.__OnTimelinePropertiesChanged.iface)
            }
            return this.__OnTimelinePropertiesChanged
        }
    }

    /**
     * Occurs when the session's playback info has changed.
     * @type {TypedEventHandler<GlobalSystemMediaTransportControlsSession, PlaybackInfoChangedEventArgs>}
    */
    OnPlaybackInfoChanged {
        get {
            if(!this.HasProp("__OnPlaybackInfoChanged")){
                this.__OnPlaybackInfoChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{2bdf1426-d41f-5896-897f-efc0b0fa7392}"),
                    GlobalSystemMediaTransportControlsSession,
                    PlaybackInfoChangedEventArgs
                )
                this.__OnPlaybackInfoChangedToken := this.add_PlaybackInfoChanged(this.__OnPlaybackInfoChanged.iface)
            }
            return this.__OnPlaybackInfoChanged
        }
    }

    /**
     * Occurs when the session's MediaProperties have changed.
     * @type {TypedEventHandler<GlobalSystemMediaTransportControlsSession, MediaPropertiesChangedEventArgs>}
    */
    OnMediaPropertiesChanged {
        get {
            if(!this.HasProp("__OnMediaPropertiesChanged")){
                this.__OnMediaPropertiesChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{0f2ce2b7-afa7-5ed0-8cb6-8c40cf9b3a5f}"),
                    GlobalSystemMediaTransportControlsSession,
                    MediaPropertiesChangedEventArgs
                )
                this.__OnMediaPropertiesChangedToken := this.add_MediaPropertiesChanged(this.__OnMediaPropertiesChanged.iface)
            }
            return this.__OnMediaPropertiesChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnTimelinePropertiesChangedToken")) {
            this.remove_TimelinePropertiesChanged(this.__OnTimelinePropertiesChangedToken)
            this.__OnTimelinePropertiesChanged.iface.Dispose()
        }

        if(this.HasProp("__OnPlaybackInfoChangedToken")) {
            this.remove_PlaybackInfoChanged(this.__OnPlaybackInfoChangedToken)
            this.__OnPlaybackInfoChanged.iface.Dispose()
        }

        if(this.HasProp("__OnMediaPropertiesChangedToken")) {
            this.remove_MediaPropertiesChanged(this.__OnMediaPropertiesChangedToken)
            this.__OnMediaPropertiesChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SourceAppUserModelId() {
        if (!this.HasProp("__IGlobalSystemMediaTransportControlsSession")) {
            if ((queryResult := this.QueryInterface(IGlobalSystemMediaTransportControlsSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGlobalSystemMediaTransportControlsSession := IGlobalSystemMediaTransportControlsSession(outPtr)
        }

        return this.__IGlobalSystemMediaTransportControlsSession.get_SourceAppUserModelId()
    }

    /**
     * Attempts to get the media properties for this session.
     * @returns {IAsyncOperation<GlobalSystemMediaTransportControlsSessionMediaProperties>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.control.globalsystemmediatransportcontrolssession.trygetmediapropertiesasync
     */
    TryGetMediaPropertiesAsync() {
        if (!this.HasProp("__IGlobalSystemMediaTransportControlsSession")) {
            if ((queryResult := this.QueryInterface(IGlobalSystemMediaTransportControlsSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGlobalSystemMediaTransportControlsSession := IGlobalSystemMediaTransportControlsSession(outPtr)
        }

        return this.__IGlobalSystemMediaTransportControlsSession.TryGetMediaPropertiesAsync()
    }

    /**
     * Gets the GlobalSystemMediaTransportControlsSessionTimelineProperties instance that represents this sessions timeline state.
     * @returns {GlobalSystemMediaTransportControlsSessionTimelineProperties} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.control.globalsystemmediatransportcontrolssession.gettimelineproperties
     */
    GetTimelineProperties() {
        if (!this.HasProp("__IGlobalSystemMediaTransportControlsSession")) {
            if ((queryResult := this.QueryInterface(IGlobalSystemMediaTransportControlsSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGlobalSystemMediaTransportControlsSession := IGlobalSystemMediaTransportControlsSession(outPtr)
        }

        return this.__IGlobalSystemMediaTransportControlsSession.GetTimelineProperties()
    }

    /**
     * Gets the GlobalSystemMediaTransportControlsSessionPlaybackInfo for this session, accurate to the time of the call.
     * @returns {GlobalSystemMediaTransportControlsSessionPlaybackInfo} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.control.globalsystemmediatransportcontrolssession.getplaybackinfo
     */
    GetPlaybackInfo() {
        if (!this.HasProp("__IGlobalSystemMediaTransportControlsSession")) {
            if ((queryResult := this.QueryInterface(IGlobalSystemMediaTransportControlsSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGlobalSystemMediaTransportControlsSession := IGlobalSystemMediaTransportControlsSession(outPtr)
        }

        return this.__IGlobalSystemMediaTransportControlsSession.GetPlaybackInfo()
    }

    /**
     * Attempts to request the session to start playback.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.control.globalsystemmediatransportcontrolssession.tryplayasync
     */
    TryPlayAsync() {
        if (!this.HasProp("__IGlobalSystemMediaTransportControlsSession")) {
            if ((queryResult := this.QueryInterface(IGlobalSystemMediaTransportControlsSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGlobalSystemMediaTransportControlsSession := IGlobalSystemMediaTransportControlsSession(outPtr)
        }

        return this.__IGlobalSystemMediaTransportControlsSession.TryPlayAsync()
    }

    /**
     * Attempts to request the session to pause.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.control.globalsystemmediatransportcontrolssession.trypauseasync
     */
    TryPauseAsync() {
        if (!this.HasProp("__IGlobalSystemMediaTransportControlsSession")) {
            if ((queryResult := this.QueryInterface(IGlobalSystemMediaTransportControlsSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGlobalSystemMediaTransportControlsSession := IGlobalSystemMediaTransportControlsSession(outPtr)
        }

        return this.__IGlobalSystemMediaTransportControlsSession.TryPauseAsync()
    }

    /**
     * Attempts to request the session to stop playback.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.control.globalsystemmediatransportcontrolssession.trystopasync
     */
    TryStopAsync() {
        if (!this.HasProp("__IGlobalSystemMediaTransportControlsSession")) {
            if ((queryResult := this.QueryInterface(IGlobalSystemMediaTransportControlsSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGlobalSystemMediaTransportControlsSession := IGlobalSystemMediaTransportControlsSession(outPtr)
        }

        return this.__IGlobalSystemMediaTransportControlsSession.TryStopAsync()
    }

    /**
     * Attempts to request that the session starts recording.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.control.globalsystemmediatransportcontrolssession.tryrecordasync
     */
    TryRecordAsync() {
        if (!this.HasProp("__IGlobalSystemMediaTransportControlsSession")) {
            if ((queryResult := this.QueryInterface(IGlobalSystemMediaTransportControlsSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGlobalSystemMediaTransportControlsSession := IGlobalSystemMediaTransportControlsSession(outPtr)
        }

        return this.__IGlobalSystemMediaTransportControlsSession.TryRecordAsync()
    }

    /**
     * Attempts to put the session into a FastForward state.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.control.globalsystemmediatransportcontrolssession.tryfastforwardasync
     */
    TryFastForwardAsync() {
        if (!this.HasProp("__IGlobalSystemMediaTransportControlsSession")) {
            if ((queryResult := this.QueryInterface(IGlobalSystemMediaTransportControlsSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGlobalSystemMediaTransportControlsSession := IGlobalSystemMediaTransportControlsSession(outPtr)
        }

        return this.__IGlobalSystemMediaTransportControlsSession.TryFastForwardAsync()
    }

    /**
     * Attempts to request the session to rewind.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.control.globalsystemmediatransportcontrolssession.tryrewindasync
     */
    TryRewindAsync() {
        if (!this.HasProp("__IGlobalSystemMediaTransportControlsSession")) {
            if ((queryResult := this.QueryInterface(IGlobalSystemMediaTransportControlsSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGlobalSystemMediaTransportControlsSession := IGlobalSystemMediaTransportControlsSession(outPtr)
        }

        return this.__IGlobalSystemMediaTransportControlsSession.TryRewindAsync()
    }

    /**
     * Attempts to request the session to skip next.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.control.globalsystemmediatransportcontrolssession.tryskipnextasync
     */
    TrySkipNextAsync() {
        if (!this.HasProp("__IGlobalSystemMediaTransportControlsSession")) {
            if ((queryResult := this.QueryInterface(IGlobalSystemMediaTransportControlsSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGlobalSystemMediaTransportControlsSession := IGlobalSystemMediaTransportControlsSession(outPtr)
        }

        return this.__IGlobalSystemMediaTransportControlsSession.TrySkipNextAsync()
    }

    /**
     * Attempts to request the session to skip previous.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.control.globalsystemmediatransportcontrolssession.tryskippreviousasync
     */
    TrySkipPreviousAsync() {
        if (!this.HasProp("__IGlobalSystemMediaTransportControlsSession")) {
            if ((queryResult := this.QueryInterface(IGlobalSystemMediaTransportControlsSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGlobalSystemMediaTransportControlsSession := IGlobalSystemMediaTransportControlsSession(outPtr)
        }

        return this.__IGlobalSystemMediaTransportControlsSession.TrySkipPreviousAsync()
    }

    /**
     * Attempts to change the channel up on the session.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.control.globalsystemmediatransportcontrolssession.trychangechannelupasync
     */
    TryChangeChannelUpAsync() {
        if (!this.HasProp("__IGlobalSystemMediaTransportControlsSession")) {
            if ((queryResult := this.QueryInterface(IGlobalSystemMediaTransportControlsSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGlobalSystemMediaTransportControlsSession := IGlobalSystemMediaTransportControlsSession(outPtr)
        }

        return this.__IGlobalSystemMediaTransportControlsSession.TryChangeChannelUpAsync()
    }

    /**
     * Attempts to change the channel down on the session.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.control.globalsystemmediatransportcontrolssession.trychangechanneldownasync
     */
    TryChangeChannelDownAsync() {
        if (!this.HasProp("__IGlobalSystemMediaTransportControlsSession")) {
            if ((queryResult := this.QueryInterface(IGlobalSystemMediaTransportControlsSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGlobalSystemMediaTransportControlsSession := IGlobalSystemMediaTransportControlsSession(outPtr)
        }

        return this.__IGlobalSystemMediaTransportControlsSession.TryChangeChannelDownAsync()
    }

    /**
     * Attempts to request the session to start or pause playback, based on its current playback state.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.control.globalsystemmediatransportcontrolssession.trytoggleplaypauseasync
     */
    TryTogglePlayPauseAsync() {
        if (!this.HasProp("__IGlobalSystemMediaTransportControlsSession")) {
            if ((queryResult := this.QueryInterface(IGlobalSystemMediaTransportControlsSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGlobalSystemMediaTransportControlsSession := IGlobalSystemMediaTransportControlsSession(outPtr)
        }

        return this.__IGlobalSystemMediaTransportControlsSession.TryTogglePlayPauseAsync()
    }

    /**
     * Attempts to change the MediaPlaybackAutoRepeatMode on the session.
     * @param {Integer} requestedAutoRepeatMode The requested auto repeat mode.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.control.globalsystemmediatransportcontrolssession.trychangeautorepeatmodeasync
     */
    TryChangeAutoRepeatModeAsync(requestedAutoRepeatMode) {
        if (!this.HasProp("__IGlobalSystemMediaTransportControlsSession")) {
            if ((queryResult := this.QueryInterface(IGlobalSystemMediaTransportControlsSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGlobalSystemMediaTransportControlsSession := IGlobalSystemMediaTransportControlsSession(outPtr)
        }

        return this.__IGlobalSystemMediaTransportControlsSession.TryChangeAutoRepeatModeAsync(requestedAutoRepeatMode)
    }

    /**
     * Attempts to change the playback rate on the session to the requested value.
     * @param {Float} requestedPlaybackRate The requested playback rate to change to
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.control.globalsystemmediatransportcontrolssession.trychangeplaybackrateasync
     */
    TryChangePlaybackRateAsync(requestedPlaybackRate) {
        if (!this.HasProp("__IGlobalSystemMediaTransportControlsSession")) {
            if ((queryResult := this.QueryInterface(IGlobalSystemMediaTransportControlsSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGlobalSystemMediaTransportControlsSession := IGlobalSystemMediaTransportControlsSession(outPtr)
        }

        return this.__IGlobalSystemMediaTransportControlsSession.TryChangePlaybackRateAsync(requestedPlaybackRate)
    }

    /**
     * Attempts to change whether the session is actively shuffling or not.
     * @param {Boolean} requestedShuffleState The requested shuffle state to switch to.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.control.globalsystemmediatransportcontrolssession.trychangeshuffleactiveasync
     */
    TryChangeShuffleActiveAsync(requestedShuffleState) {
        if (!this.HasProp("__IGlobalSystemMediaTransportControlsSession")) {
            if ((queryResult := this.QueryInterface(IGlobalSystemMediaTransportControlsSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGlobalSystemMediaTransportControlsSession := IGlobalSystemMediaTransportControlsSession(outPtr)
        }

        return this.__IGlobalSystemMediaTransportControlsSession.TryChangeShuffleActiveAsync(requestedShuffleState)
    }

    /**
     * Attempts to change the playback position on the session to the specified time, in ticks.
     * @param {Integer} requestedPlaybackPosition The requested playback position to seek to, specified in ticks.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.control.globalsystemmediatransportcontrolssession.trychangeplaybackpositionasync
     */
    TryChangePlaybackPositionAsync(requestedPlaybackPosition) {
        if (!this.HasProp("__IGlobalSystemMediaTransportControlsSession")) {
            if ((queryResult := this.QueryInterface(IGlobalSystemMediaTransportControlsSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGlobalSystemMediaTransportControlsSession := IGlobalSystemMediaTransportControlsSession(outPtr)
        }

        return this.__IGlobalSystemMediaTransportControlsSession.TryChangePlaybackPositionAsync(requestedPlaybackPosition)
    }

    /**
     * 
     * @param {TypedEventHandler<GlobalSystemMediaTransportControlsSession, TimelinePropertiesChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_TimelinePropertiesChanged(handler) {
        if (!this.HasProp("__IGlobalSystemMediaTransportControlsSession")) {
            if ((queryResult := this.QueryInterface(IGlobalSystemMediaTransportControlsSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGlobalSystemMediaTransportControlsSession := IGlobalSystemMediaTransportControlsSession(outPtr)
        }

        return this.__IGlobalSystemMediaTransportControlsSession.add_TimelinePropertiesChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_TimelinePropertiesChanged(token) {
        if (!this.HasProp("__IGlobalSystemMediaTransportControlsSession")) {
            if ((queryResult := this.QueryInterface(IGlobalSystemMediaTransportControlsSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGlobalSystemMediaTransportControlsSession := IGlobalSystemMediaTransportControlsSession(outPtr)
        }

        return this.__IGlobalSystemMediaTransportControlsSession.remove_TimelinePropertiesChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<GlobalSystemMediaTransportControlsSession, PlaybackInfoChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PlaybackInfoChanged(handler) {
        if (!this.HasProp("__IGlobalSystemMediaTransportControlsSession")) {
            if ((queryResult := this.QueryInterface(IGlobalSystemMediaTransportControlsSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGlobalSystemMediaTransportControlsSession := IGlobalSystemMediaTransportControlsSession(outPtr)
        }

        return this.__IGlobalSystemMediaTransportControlsSession.add_PlaybackInfoChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PlaybackInfoChanged(token) {
        if (!this.HasProp("__IGlobalSystemMediaTransportControlsSession")) {
            if ((queryResult := this.QueryInterface(IGlobalSystemMediaTransportControlsSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGlobalSystemMediaTransportControlsSession := IGlobalSystemMediaTransportControlsSession(outPtr)
        }

        return this.__IGlobalSystemMediaTransportControlsSession.remove_PlaybackInfoChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<GlobalSystemMediaTransportControlsSession, MediaPropertiesChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_MediaPropertiesChanged(handler) {
        if (!this.HasProp("__IGlobalSystemMediaTransportControlsSession")) {
            if ((queryResult := this.QueryInterface(IGlobalSystemMediaTransportControlsSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGlobalSystemMediaTransportControlsSession := IGlobalSystemMediaTransportControlsSession(outPtr)
        }

        return this.__IGlobalSystemMediaTransportControlsSession.add_MediaPropertiesChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_MediaPropertiesChanged(token) {
        if (!this.HasProp("__IGlobalSystemMediaTransportControlsSession")) {
            if ((queryResult := this.QueryInterface(IGlobalSystemMediaTransportControlsSession.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGlobalSystemMediaTransportControlsSession := IGlobalSystemMediaTransportControlsSession(outPtr)
        }

        return this.__IGlobalSystemMediaTransportControlsSession.remove_MediaPropertiesChanged(token)
    }

;@endregion Instance Methods
}
