#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMediaTimelineController.ahk
#Include .\IMediaTimelineController2.ahk
#Include ..\Foundation\TypedEventHandler.ahk
#Include .\MediaTimelineController.ahk
#Include .\MediaTimelineControllerFailedEventArgs.ahk
#Include ..\..\Guid.ahk
#Include ..\..\WinRTEventHandler.ahk

/**
 * Provides information about and control over the rate, position, and state of a [MediaPlayer](../windows.media.playback/mediaplayer.md). This class makes it possible to control and synchronize multiple media players from a single controller and makes it easier to create custom transport controls.
 * @remarks
 * Get an instance of this class using the constructor or by accessing the [TimelineController](../windows.media.playback/mediaplayer_timelinecontroller.md) property of a [MediaPlayer](../windows.media.playback/mediaplayer.md).
 * @see https://learn.microsoft.com/uwp/api/windows.media.mediatimelinecontroller
 * @namespace Windows.Media
 * @version WindowsRuntime 1.4
 */
class MediaTimelineController extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMediaTimelineController

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMediaTimelineController.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the current position of the [MediaTimelineController](mediatimelinecontroller.md).
     * @remarks
     * To receive periodic notifications when the timeline controller's position changes, handle the [PositionChanged](mediatimelinecontroller_positionchanged.md) event.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediatimelinecontroller.position
     * @type {TimeSpan} 
     */
    Position {
        get => this.get_Position()
        set => this.put_Position(value)
    }

    /**
     * Gets or sets the speed at which the position of the [MediaTimelineController](mediatimelinecontroller.md) changes, expressed as a ratio to normal playback speed. For example, setting a value of 1.0 will result in normal playback speed, a value of 4.0 will result in a playback speed 4 times the normal speed.
     * @remarks
     * Only positive values are supported for **ClockRate**. Attempting to set a negative value will result in an argument exception.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediatimelinecontroller.clockrate
     * @type {Float} 
     */
    ClockRate {
        get => this.get_ClockRate()
        set => this.put_ClockRate(value)
    }

    /**
     * Gets a value indicating the current state of the [MediaTimelineController](mediatimelinecontroller.md), which can be either running or paused.
     * @remarks
     * To receive notifications when the state of the [MediaTimelineController](mediatimelinecontroller.md) changes, handle the [StateChanged](mediatimelinecontroller_statechanged.md) event.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediatimelinecontroller.state
     * @type {Integer} 
     */
    State {
        get => this.get_State()
    }

    /**
     * Gets a value indicating the duration of the timeline. After the specified time span has elapsed, the timeline clock will no longer progress.
     * @remarks
     * The [Ended](mediatimelinecontroller_ended.md) event is raised when the timeline controller reaches the end of the **Duration** time window.
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediatimelinecontroller.duration
     * @type {IReference<TimeSpan>} 
     */
    Duration {
        get => this.get_Duration()
        set => this.put_Duration(value)
    }

    /**
     * Gets a value indicating whether the timeline will loop, restarting the clock at zero, when it reaches the end of the time window specified by the [Duration](mediatimelinecontroller_duration.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediatimelinecontroller.isloopingenabled
     * @type {Boolean} 
     */
    IsLoopingEnabled {
        get => this.get_IsLoopingEnabled()
        set => this.put_IsLoopingEnabled(value)
    }

    /**
     * Occurs when the position of the [MediaTimelineController](mediatimelinecontroller.md) changes.
     * @remarks
     * This event is raised by the system several times per second while the position of the **MediaTimelineController** is changing.
     * @type {TypedEventHandler<MediaTimelineController, IInspectable>}
    */
    OnPositionChanged {
        get {
            if(!this.HasProp("__OnPositionChanged")){
                this.__OnPositionChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{5c43e195-7d39-5d0d-a309-1991e68acdb7}"),
                    MediaTimelineController,
                    IInspectable
                )
                this.__OnPositionChangedToken := this.add_PositionChanged(this.__OnPositionChanged.iface)
            }
            return this.__OnPositionChanged
        }
    }

    /**
     * Occurs when the state of the [MediaTimelineController](mediatimelinecontroller.md) changes.
     * @type {TypedEventHandler<MediaTimelineController, IInspectable>}
    */
    OnStateChanged {
        get {
            if(!this.HasProp("__OnStateChanged")){
                this.__OnStateChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{5c43e195-7d39-5d0d-a309-1991e68acdb7}"),
                    MediaTimelineController,
                    IInspectable
                )
                this.__OnStateChangedToken := this.add_StateChanged(this.__OnStateChanged.iface)
            }
            return this.__OnStateChanged
        }
    }

    /**
     * Occurs when the timeline controller encounters an internal error and can't continue playback.
     * @type {TypedEventHandler<MediaTimelineController, MediaTimelineControllerFailedEventArgs>}
    */
    OnFailed {
        get {
            if(!this.HasProp("__OnFailed")){
                this.__OnFailed := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{07cd62fb-578d-56a6-a8ef-e653eb005d1b}"),
                    MediaTimelineController,
                    MediaTimelineControllerFailedEventArgs
                )
                this.__OnFailedToken := this.add_Failed(this.__OnFailed.iface)
            }
            return this.__OnFailed
        }
    }

    /**
     * Occurs when the timeline controller reaches the end of the time window specified by the [Duration](mediatimelinecontroller_duration.md) if [IsLoopingEnabled](mediatimelinecontroller_isloopingenabled.md) is set to false.
     * @type {TypedEventHandler<MediaTimelineController, IInspectable>}
    */
    OnEnded {
        get {
            if(!this.HasProp("__OnEnded")){
                this.__OnEnded := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{5c43e195-7d39-5d0d-a309-1991e68acdb7}"),
                    MediaTimelineController,
                    IInspectable
                )
                this.__OnEndedToken := this.add_Ended(this.__OnEnded.iface)
            }
            return this.__OnEnded
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [MediaTimelineController](mediatimelinecontroller.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaTimelineController")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnPositionChangedToken")) {
            this.remove_PositionChanged(this.__OnPositionChangedToken)
            this.__OnPositionChanged.iface.Dispose()
        }

        if(this.HasProp("__OnStateChangedToken")) {
            this.remove_StateChanged(this.__OnStateChangedToken)
            this.__OnStateChanged.iface.Dispose()
        }

        if(this.HasProp("__OnFailedToken")) {
            this.remove_Failed(this.__OnFailedToken)
            this.__OnFailed.iface.Dispose()
        }

        if(this.HasProp("__OnEndedToken")) {
            this.remove_Ended(this.__OnEndedToken)
            this.__OnEnded.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * Starts the playback of the [MediaTimelineController](mediatimelinecontroller.md) from the position 0.
     * @remarks
     * To resume playback of a paused [MediaTimelineController](mediatimelinecontroller.md) without resetting the position to 0, call [Pause](mediatimelinecontroller_pause_1953642114.md) instead.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediatimelinecontroller.start
     */
    Start() {
        if (!this.HasProp("__IMediaTimelineController")) {
            if ((queryResult := this.QueryInterface(IMediaTimelineController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTimelineController := IMediaTimelineController(outPtr)
        }

        return this.__IMediaTimelineController.Start()
    }

    /**
     * Resumes the playback of the [MediaTimelineController](mediatimelinecontroller.md) from the position at which the controller was paused.
     * @remarks
     * To restart the [MediaTimelineController](mediatimelinecontroller.md) at position 0, call [Start](mediatimelinecontroller_start_1587696324.md) instead.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediatimelinecontroller.resume
     */
    Resume() {
        if (!this.HasProp("__IMediaTimelineController")) {
            if ((queryResult := this.QueryInterface(IMediaTimelineController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTimelineController := IMediaTimelineController(outPtr)
        }

        return this.__IMediaTimelineController.Resume()
    }

    /**
     * Pauses playback of the [MediaTimelineController](mediatimelinecontroller.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediatimelinecontroller.pause
     */
    Pause() {
        if (!this.HasProp("__IMediaTimelineController")) {
            if ((queryResult := this.QueryInterface(IMediaTimelineController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTimelineController := IMediaTimelineController(outPtr)
        }

        return this.__IMediaTimelineController.Pause()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_Position() {
        if (!this.HasProp("__IMediaTimelineController")) {
            if ((queryResult := this.QueryInterface(IMediaTimelineController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTimelineController := IMediaTimelineController(outPtr)
        }

        return this.__IMediaTimelineController.get_Position()
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_Position(value) {
        if (!this.HasProp("__IMediaTimelineController")) {
            if ((queryResult := this.QueryInterface(IMediaTimelineController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTimelineController := IMediaTimelineController(outPtr)
        }

        return this.__IMediaTimelineController.put_Position(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ClockRate() {
        if (!this.HasProp("__IMediaTimelineController")) {
            if ((queryResult := this.QueryInterface(IMediaTimelineController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTimelineController := IMediaTimelineController(outPtr)
        }

        return this.__IMediaTimelineController.get_ClockRate()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_ClockRate(value) {
        if (!this.HasProp("__IMediaTimelineController")) {
            if ((queryResult := this.QueryInterface(IMediaTimelineController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTimelineController := IMediaTimelineController(outPtr)
        }

        return this.__IMediaTimelineController.put_ClockRate(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_State() {
        if (!this.HasProp("__IMediaTimelineController")) {
            if ((queryResult := this.QueryInterface(IMediaTimelineController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTimelineController := IMediaTimelineController(outPtr)
        }

        return this.__IMediaTimelineController.get_State()
    }

    /**
     * 
     * @param {TypedEventHandler<MediaTimelineController, IInspectable>} positionChangedEventHandler 
     * @returns {EventRegistrationToken} 
     */
    add_PositionChanged(positionChangedEventHandler) {
        if (!this.HasProp("__IMediaTimelineController")) {
            if ((queryResult := this.QueryInterface(IMediaTimelineController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTimelineController := IMediaTimelineController(outPtr)
        }

        return this.__IMediaTimelineController.add_PositionChanged(positionChangedEventHandler)
    }

    /**
     * 
     * @param {EventRegistrationToken} eventCookie 
     * @returns {HRESULT} 
     */
    remove_PositionChanged(eventCookie) {
        if (!this.HasProp("__IMediaTimelineController")) {
            if ((queryResult := this.QueryInterface(IMediaTimelineController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTimelineController := IMediaTimelineController(outPtr)
        }

        return this.__IMediaTimelineController.remove_PositionChanged(eventCookie)
    }

    /**
     * 
     * @param {TypedEventHandler<MediaTimelineController, IInspectable>} stateChangedEventHandler 
     * @returns {EventRegistrationToken} 
     */
    add_StateChanged(stateChangedEventHandler) {
        if (!this.HasProp("__IMediaTimelineController")) {
            if ((queryResult := this.QueryInterface(IMediaTimelineController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTimelineController := IMediaTimelineController(outPtr)
        }

        return this.__IMediaTimelineController.add_StateChanged(stateChangedEventHandler)
    }

    /**
     * 
     * @param {EventRegistrationToken} eventCookie 
     * @returns {HRESULT} 
     */
    remove_StateChanged(eventCookie) {
        if (!this.HasProp("__IMediaTimelineController")) {
            if ((queryResult := this.QueryInterface(IMediaTimelineController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTimelineController := IMediaTimelineController(outPtr)
        }

        return this.__IMediaTimelineController.remove_StateChanged(eventCookie)
    }

    /**
     * 
     * @returns {IReference<TimeSpan>} 
     */
    get_Duration() {
        if (!this.HasProp("__IMediaTimelineController2")) {
            if ((queryResult := this.QueryInterface(IMediaTimelineController2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTimelineController2 := IMediaTimelineController2(outPtr)
        }

        return this.__IMediaTimelineController2.get_Duration()
    }

    /**
     * 
     * @param {IReference<TimeSpan>} value 
     * @returns {HRESULT} 
     */
    put_Duration(value) {
        if (!this.HasProp("__IMediaTimelineController2")) {
            if ((queryResult := this.QueryInterface(IMediaTimelineController2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTimelineController2 := IMediaTimelineController2(outPtr)
        }

        return this.__IMediaTimelineController2.put_Duration(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsLoopingEnabled() {
        if (!this.HasProp("__IMediaTimelineController2")) {
            if ((queryResult := this.QueryInterface(IMediaTimelineController2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTimelineController2 := IMediaTimelineController2(outPtr)
        }

        return this.__IMediaTimelineController2.get_IsLoopingEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsLoopingEnabled(value) {
        if (!this.HasProp("__IMediaTimelineController2")) {
            if ((queryResult := this.QueryInterface(IMediaTimelineController2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTimelineController2 := IMediaTimelineController2(outPtr)
        }

        return this.__IMediaTimelineController2.put_IsLoopingEnabled(value)
    }

    /**
     * 
     * @param {TypedEventHandler<MediaTimelineController, MediaTimelineControllerFailedEventArgs>} eventHandler 
     * @returns {EventRegistrationToken} 
     */
    add_Failed(eventHandler) {
        if (!this.HasProp("__IMediaTimelineController2")) {
            if ((queryResult := this.QueryInterface(IMediaTimelineController2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTimelineController2 := IMediaTimelineController2(outPtr)
        }

        return this.__IMediaTimelineController2.add_Failed(eventHandler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Failed(token) {
        if (!this.HasProp("__IMediaTimelineController2")) {
            if ((queryResult := this.QueryInterface(IMediaTimelineController2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTimelineController2 := IMediaTimelineController2(outPtr)
        }

        return this.__IMediaTimelineController2.remove_Failed(token)
    }

    /**
     * 
     * @param {TypedEventHandler<MediaTimelineController, IInspectable>} eventHandler 
     * @returns {EventRegistrationToken} 
     */
    add_Ended(eventHandler) {
        if (!this.HasProp("__IMediaTimelineController2")) {
            if ((queryResult := this.QueryInterface(IMediaTimelineController2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTimelineController2 := IMediaTimelineController2(outPtr)
        }

        return this.__IMediaTimelineController2.add_Ended(eventHandler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Ended(token) {
        if (!this.HasProp("__IMediaTimelineController2")) {
            if ((queryResult := this.QueryInterface(IMediaTimelineController2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaTimelineController2 := IMediaTimelineController2(outPtr)
        }

        return this.__IMediaTimelineController2.remove_Ended(token)
    }

;@endregion Instance Methods
}
