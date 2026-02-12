#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISystemMediaTransportControls.ahk
#Include .\ISystemMediaTransportControls2.ahk
#Include .\ISystemMediaTransportControlsStatics.ahk
#Include ..\Foundation\TypedEventHandler.ahk
#Include .\SystemMediaTransportControls.ahk
#Include .\SystemMediaTransportControlsButtonPressedEventArgs.ahk
#Include .\SystemMediaTransportControlsPropertyChangedEventArgs.ahk
#Include .\PlaybackPositionChangeRequestedEventArgs.ahk
#Include .\PlaybackRateChangeRequestedEventArgs.ahk
#Include .\ShuffleEnabledChangeRequestedEventArgs.ahk
#Include .\AutoRepeatModeChangeRequestedEventArgs.ahk
#Include ..\..\Guid.ahk
#Include ..\..\WinRTEventHandler.ahk

/**
 * Represents an object that enables integration with the system media transport controls and support for media commands.
 * @remarks
 * The SystemMediaTransportControls replaces the [MediaControl](mediacontrol.md) class. In Windows 8.1 and later, you should use this control instead of [MediaControl](mediacontrol.md) to interact with the system transport controls. The system transport controls enable media application developers integrate with the built-in system UI to display media metadata such as artist, album title, or chapter title. The system transport control also allows a user to control the playback of a media app using the built-in system UI, such as pausing playback and skipping forward and backward in a playlist.
 * 
 * <img alt="System Media Transtport Controls" src="images/smtc.png" />
 * 
 * Starting with Windows 10, version 1607, UWP apps that use the [MediaPlayer](../windows.media.playback/mediaplayer.md) class or [AudioGraph](../windows.media.audio/audiograph.md) class to play media are automatically integrated with the SMTC by default. Simply instantiate a new instance of **MediaPlayer** and assign a [MediaSource](../windows.media.core/mediasource.md), [MediaPlaybackItem](../windows.media.playback/mediaplaybackitem.md), or [MediaPlaybackList](../windows.media.playback/mediaplaybacklist.md) to the player's [Source](../windows.media.playback/mediaplayer_source.md) property and the user will see your app name in the SMTC and can play, pause, and move through your playback lists by using the SMTC controls. Get an instance of the SMTC by accessing the **MediaPlayer** object's [SystemMediaTransportControls](../windows.media.playback/mediaplayer_systemmediatransportcontrols.md) property. For how-to guidance on using the SMTC from your app, see [Integrate with the SystemMediaTransportControls](/windows/uwp/audio-video-camera/integrate-with-systemmediatransportcontrols).
 * 
 * For some scenarios, you may want to disable automatic integration with the SMTC. In this case, you should disable the **MediaPlayer** object's [CommandManager](../windows.media.playback/mediaplayer_commandmanager.md) by setting the [IsEnabled](../windows.media.playback/mediaplaybackcommandmanager_isenabled.md) property to false. Call [GetForCurrentView](systemmediatransportcontrols_getforcurrentview_1363600702.md) to get an instance of the SystemMediaTransportControls for current view. You will also need to get an instance this way if you are targeting an older version of Windows. For how-to guidance on manually controlling the SMTC, see [Manual control of the System Media Transport Controls](/windows/uwp/audio-video-camera/system-media-transport-controls).
 * @see https://learn.microsoft.com/uwp/api/windows.media.systemmediatransportcontrols
 * @namespace Windows.Media
 * @version WindowsRuntime 1.4
 */
class SystemMediaTransportControls extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISystemMediaTransportControls

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISystemMediaTransportControls.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * The system media transport controls for the current view.
     * @remarks
     * For information about using this API to get a reference to manually integrate your app with the system media transport controls,
     * see [Manual control of the System Media Transport Controls](/windows/uwp/audio-video-camera/system-media-transport-controls).
     * @returns {SystemMediaTransportControls} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.systemmediatransportcontrols.getforcurrentview
     */
    static GetForCurrentView() {
        if (!SystemMediaTransportControls.HasProp("__ISystemMediaTransportControlsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.SystemMediaTransportControls")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISystemMediaTransportControlsStatics.IID)
            SystemMediaTransportControls.__ISystemMediaTransportControlsStatics := ISystemMediaTransportControlsStatics(factoryPtr)
        }

        return SystemMediaTransportControls.__ISystemMediaTransportControlsStatics.GetForCurrentView()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the playback status of the media.
     * @see https://learn.microsoft.com/uwp/api/windows.media.systemmediatransportcontrols.playbackstatus
     * @type {Integer} 
     */
    PlaybackStatus {
        get => this.get_PlaybackStatus()
        set => this.put_PlaybackStatus(value)
    }

    /**
     * Gets the display updater for the [SystemMediaTransportControls](systemmediatransportcontrols.md) which enable updating the information displayed about the currently playing song.
     * @see https://learn.microsoft.com/uwp/api/windows.media.systemmediatransportcontrols.displayupdater
     * @type {SystemMediaTransportControlsDisplayUpdater} 
     */
    DisplayUpdater {
        get => this.get_DisplayUpdater()
    }

    /**
     * Gets the sound level of the media for the capture and render streams.
     * @remarks
     * Music and media capture apps should monitor the SoundLevel to determine whether the audio streams on the app have been [Muted](soundlevel.md). For apps using the [MediaCapture](../windows.media.capture/mediacapture.md) object, capture will be automatically stopped when the capture streams of the app are muted. Capture is not re-started automatically when the audio streams are unmuted, so the SoundLevel changed notification can be used to restart capture. Use the [PropertyChanged](systemmediatransportcontrols_propertychanged.md) event to determine when the SoundLevel property changes.
     * @see https://learn.microsoft.com/uwp/api/windows.media.systemmediatransportcontrols.soundlevel
     * @type {Integer} 
     */
    SoundLevel {
        get => this.get_SoundLevel()
    }

    /**
     * Enables and disables the system media transport controls for the app.
     * @remarks
     * Setting IsEnabled to **false** will disable the apps support for the system media transport controls, so the controls will not show. Setting IsEnabled to **true** will re-enable the controls for the app.
     * @see https://learn.microsoft.com/uwp/api/windows.media.systemmediatransportcontrols.isenabled
     * @type {Boolean} 
     */
    IsEnabled {
        get => this.get_IsEnabled()
        set => this.put_IsEnabled(value)
    }

    /**
     * Gets or sets a value that specifies if the play button is supported.
     * @see https://learn.microsoft.com/uwp/api/windows.media.systemmediatransportcontrols.isplayenabled
     * @type {Boolean} 
     */
    IsPlayEnabled {
        get => this.get_IsPlayEnabled()
        set => this.put_IsPlayEnabled(value)
    }

    /**
     * Gets or sets a value that specifies if the stop button is supported.
     * @see https://learn.microsoft.com/uwp/api/windows.media.systemmediatransportcontrols.isstopenabled
     * @type {Boolean} 
     */
    IsStopEnabled {
        get => this.get_IsStopEnabled()
        set => this.put_IsStopEnabled(value)
    }

    /**
     * Gets or sets a value that specifies if the pause button is supported.**true** if the pause button is supported; otherwise, **false**.
     * @see https://learn.microsoft.com/uwp/api/windows.media.systemmediatransportcontrols.ispauseenabled
     * @type {Boolean} 
     */
    IsPauseEnabled {
        get => this.get_IsPauseEnabled()
        set => this.put_IsPauseEnabled(value)
    }

    /**
     * Gets or sets a value that specifies if the record button is supported.**true** if the record button is supported; otherwise, **false**.
     * @see https://learn.microsoft.com/uwp/api/windows.media.systemmediatransportcontrols.isrecordenabled
     * @type {Boolean} 
     */
    IsRecordEnabled {
        get => this.get_IsRecordEnabled()
        set => this.put_IsRecordEnabled(value)
    }

    /**
     * Gets or sets a value that specifies if the fast forward button is supported.
     * @see https://learn.microsoft.com/uwp/api/windows.media.systemmediatransportcontrols.isfastforwardenabled
     * @type {Boolean} 
     */
    IsFastForwardEnabled {
        get => this.get_IsFastForwardEnabled()
        set => this.put_IsFastForwardEnabled(value)
    }

    /**
     * Gets or sets a value that specifies if the rewind button is supported.
     * @see https://learn.microsoft.com/uwp/api/windows.media.systemmediatransportcontrols.isrewindenabled
     * @type {Boolean} 
     */
    IsRewindEnabled {
        get => this.get_IsRewindEnabled()
        set => this.put_IsRewindEnabled(value)
    }

    /**
     * Gets or sets a value that specifies if the previous button is supported.
     * @see https://learn.microsoft.com/uwp/api/windows.media.systemmediatransportcontrols.ispreviousenabled
     * @type {Boolean} 
     */
    IsPreviousEnabled {
        get => this.get_IsPreviousEnabled()
        set => this.put_IsPreviousEnabled(value)
    }

    /**
     * Gets or sets a value that specifies if the next button is supported.
     * @see https://learn.microsoft.com/uwp/api/windows.media.systemmediatransportcontrols.isnextenabled
     * @type {Boolean} 
     */
    IsNextEnabled {
        get => this.get_IsNextEnabled()
        set => this.put_IsNextEnabled(value)
    }

    /**
     * Gets or sets a value that specifies if the channel up button is supported.
     * @see https://learn.microsoft.com/uwp/api/windows.media.systemmediatransportcontrols.ischannelupenabled
     * @type {Boolean} 
     */
    IsChannelUpEnabled {
        get => this.get_IsChannelUpEnabled()
        set => this.put_IsChannelUpEnabled(value)
    }

    /**
     * Gets or sets a value that specifies if the channel down button is supported.
     * @see https://learn.microsoft.com/uwp/api/windows.media.systemmediatransportcontrols.ischanneldownenabled
     * @type {Boolean} 
     */
    IsChannelDownEnabled {
        get => this.get_IsChannelDownEnabled()
        set => this.put_IsChannelDownEnabled(value)
    }

    /**
     * Gets or sets a value representing the current auto-repeat mode of the [SystemMediaTransportControls](systemmediatransportcontrols.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.systemmediatransportcontrols.autorepeatmode
     * @type {Integer} 
     */
    AutoRepeatMode {
        get => this.get_AutoRepeatMode()
        set => this.put_AutoRepeatMode(value)
    }

    /**
     * Gets or sets a value representing the current shuffle state of the [SystemMediaTransportControls](systemmediatransportcontrols.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.systemmediatransportcontrols.shuffleenabled
     * @type {Boolean} 
     */
    ShuffleEnabled {
        get => this.get_ShuffleEnabled()
        set => this.put_ShuffleEnabled(value)
    }

    /**
     * Gets or sets the playback rate of the [SystemMediaTransportControls](systemmediatransportcontrols.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.systemmediatransportcontrols.playbackrate
     * @type {Float} 
     */
    PlaybackRate {
        get => this.get_PlaybackRate()
        set => this.put_PlaybackRate(value)
    }

    /**
     * Occurs when a button is pressed on the [SystemMediaTransportControls](systemmediatransportcontrols.md).
     * @remarks
     * Starting with Windows 10, version 1607, UWP apps that use the [MediaPlayer](../windows.media.playback/mediaplayer.md) class or [AudioGraph](../windows.media.audio/audiograph.md) class to play media are automatically integrated with the SMTC by default. For some scenarios, you may want to manually control the SMTC. In this case, you should **ButtonPressed** event to be notified that the user has pressed one of the SMTC buttons. For how-to guidance on manually controlling the SMTC, see [Manual control of the System Media Transport Controls](/windows/uwp/audio-video-camera/system-media-transport-controls).
     * @type {TypedEventHandler<SystemMediaTransportControls, SystemMediaTransportControlsButtonPressedEventArgs>}
    */
    OnButtonPressed {
        get {
            if(!this.HasProp("__OnButtonPressed")){
                this.__OnButtonPressed := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{0557e996-7b23-5bae-aa81-ea0d671143a4}"),
                    SystemMediaTransportControls,
                    SystemMediaTransportControlsButtonPressedEventArgs
                )
                this.__OnButtonPressedToken := this.add_ButtonPressed(this.__OnButtonPressed.iface)
            }
            return this.__OnButtonPressed
        }
    }

    /**
     * Occurs when a property on the [SystemMediaTransportControls](systemmediatransportcontrols.md) has changed.
     * @remarks
     * Use the [Property](systemmediatransportcontrolspropertychangedeventargs_property.md) value of the event [SystemMediaTransportControlsPropertyChangedEventArgs](systemmediatransportcontrolspropertychangedeventargs.md) to determine which property has changed.
     * @type {TypedEventHandler<SystemMediaTransportControls, SystemMediaTransportControlsPropertyChangedEventArgs>}
    */
    OnPropertyChanged {
        get {
            if(!this.HasProp("__OnPropertyChanged")){
                this.__OnPropertyChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{9fd61dad-1746-5fa1-a908-ef7cb4603c85}"),
                    SystemMediaTransportControls,
                    SystemMediaTransportControlsPropertyChangedEventArgs
                )
                this.__OnPropertyChangedToken := this.add_PropertyChanged(this.__OnPropertyChanged.iface)
            }
            return this.__OnPropertyChanged
        }
    }

    /**
     * Occurs when the user modifies the playback position of the [SystemMediaTransportControls](systemmediatransportcontrols.md).
     * @remarks
     * Registering for this event causes an app to be notified when the **SystemMediaTransportControls** playback position changes. An app can change its auto-repeat behavior based on the request or ignore the request and update the **SystemMediaTransportControls** by populating a [SystemMediaTransportControlsTimelineProperties](systemmediatransportcontrolstimelineproperties.md) object with values indicating the actual playback position and calling [SystemMediaTransportControls.UpdateTimelineProperties](systemmediatransportcontrols_updatetimelineproperties_1933562266.md).
     * @type {TypedEventHandler<SystemMediaTransportControls, PlaybackPositionChangeRequestedEventArgs>}
    */
    OnPlaybackPositionChangeRequested {
        get {
            if(!this.HasProp("__OnPlaybackPositionChangeRequested")){
                this.__OnPlaybackPositionChangeRequested := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{44e34f15-bdc0-50a7-ace4-39e91fb753f1}"),
                    SystemMediaTransportControls,
                    PlaybackPositionChangeRequestedEventArgs
                )
                this.__OnPlaybackPositionChangeRequestedToken := this.add_PlaybackPositionChangeRequested(this.__OnPlaybackPositionChangeRequested.iface)
            }
            return this.__OnPlaybackPositionChangeRequested
        }
    }

    /**
     * Occurs when the user modifies the [SystemMediaTransportControls](systemmediatransportcontrols.md) playback rate.
     * @remarks
     * Registering for this event causes an app to be notified when the **SystemMediaTransportControls** playback rate changes. An app can change its playback rate based on the request or ignore the request and update the **SystemMediaTransportControls** by setting the [PlaybackRate](systemmediatransportcontrols_playbackrate.md) property to a value that reflects the app's actual playback rate.
     * @type {TypedEventHandler<SystemMediaTransportControls, PlaybackRateChangeRequestedEventArgs>}
    */
    OnPlaybackRateChangeRequested {
        get {
            if(!this.HasProp("__OnPlaybackRateChangeRequested")){
                this.__OnPlaybackRateChangeRequested := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{15eb0182-6366-5b9f-bd8c-8ab4fa9d7cd9}"),
                    SystemMediaTransportControls,
                    PlaybackRateChangeRequestedEventArgs
                )
                this.__OnPlaybackRateChangeRequestedToken := this.add_PlaybackRateChangeRequested(this.__OnPlaybackRateChangeRequested.iface)
            }
            return this.__OnPlaybackRateChangeRequested
        }
    }

    /**
     * Occurs when the user modifies the [SystemMediaTransportControls](systemmediatransportcontrols.md) shuffle state.
     * @remarks
     * Registering for this event causes an app to be notified when the **SystemMediaTransportControls** shuffle state changes. An app can change its shuffle state based on the request or ignore the request and update the **SystemMediaTransportControls** by setting the [ShuffleEnabled](systemmediatransportcontrols_shuffleenabled.md) property to a value that reflects the app's actual shuffle state.
     * @type {TypedEventHandler<SystemMediaTransportControls, ShuffleEnabledChangeRequestedEventArgs>}
    */
    OnShuffleEnabledChangeRequested {
        get {
            if(!this.HasProp("__OnShuffleEnabledChangeRequested")){
                this.__OnShuffleEnabledChangeRequested := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{17ecea80-27e4-5dae-abb4-c858ad1c5307}"),
                    SystemMediaTransportControls,
                    ShuffleEnabledChangeRequestedEventArgs
                )
                this.__OnShuffleEnabledChangeRequestedToken := this.add_ShuffleEnabledChangeRequested(this.__OnShuffleEnabledChangeRequested.iface)
            }
            return this.__OnShuffleEnabledChangeRequested
        }
    }

    /**
     * Occurs when the user modifies the [SystemMediaTransportControls](systemmediatransportcontrols.md) auto-repeat mode.
     * @remarks
     * Registering for this event causes an app to be notified when the **SystemMediaTransportControls** auto-repeat mode changes. An app can change its auto-repeat behavior based on the request or ignore the request and update the **SystemMediaTransportControls** by setting the [AutoRepeatMode](mediaplaybackautorepeatmode.md) property to a value that reflects the app's actual auto-repeat state.
     * @type {TypedEventHandler<SystemMediaTransportControls, AutoRepeatModeChangeRequestedEventArgs>}
    */
    OnAutoRepeatModeChangeRequested {
        get {
            if(!this.HasProp("__OnAutoRepeatModeChangeRequested")){
                this.__OnAutoRepeatModeChangeRequested := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{a6214bde-02d5-55b3-ab0d-c6031be70da1}"),
                    SystemMediaTransportControls,
                    AutoRepeatModeChangeRequestedEventArgs
                )
                this.__OnAutoRepeatModeChangeRequestedToken := this.add_AutoRepeatModeChangeRequested(this.__OnAutoRepeatModeChangeRequested.iface)
            }
            return this.__OnAutoRepeatModeChangeRequested
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnButtonPressedToken")) {
            this.remove_ButtonPressed(this.__OnButtonPressedToken)
            this.__OnButtonPressed.iface.Dispose()
        }

        if(this.HasProp("__OnPropertyChangedToken")) {
            this.remove_PropertyChanged(this.__OnPropertyChangedToken)
            this.__OnPropertyChanged.iface.Dispose()
        }

        if(this.HasProp("__OnPlaybackPositionChangeRequestedToken")) {
            this.remove_PlaybackPositionChangeRequested(this.__OnPlaybackPositionChangeRequestedToken)
            this.__OnPlaybackPositionChangeRequested.iface.Dispose()
        }

        if(this.HasProp("__OnPlaybackRateChangeRequestedToken")) {
            this.remove_PlaybackRateChangeRequested(this.__OnPlaybackRateChangeRequestedToken)
            this.__OnPlaybackRateChangeRequested.iface.Dispose()
        }

        if(this.HasProp("__OnShuffleEnabledChangeRequestedToken")) {
            this.remove_ShuffleEnabledChangeRequested(this.__OnShuffleEnabledChangeRequestedToken)
            this.__OnShuffleEnabledChangeRequested.iface.Dispose()
        }

        if(this.HasProp("__OnAutoRepeatModeChangeRequestedToken")) {
            this.remove_AutoRepeatModeChangeRequested(this.__OnAutoRepeatModeChangeRequestedToken)
            this.__OnAutoRepeatModeChangeRequested.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PlaybackStatus() {
        if (!this.HasProp("__ISystemMediaTransportControls")) {
            if ((queryResult := this.QueryInterface(ISystemMediaTransportControls.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemMediaTransportControls := ISystemMediaTransportControls(outPtr)
        }

        return this.__ISystemMediaTransportControls.get_PlaybackStatus()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_PlaybackStatus(value) {
        if (!this.HasProp("__ISystemMediaTransportControls")) {
            if ((queryResult := this.QueryInterface(ISystemMediaTransportControls.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemMediaTransportControls := ISystemMediaTransportControls(outPtr)
        }

        return this.__ISystemMediaTransportControls.put_PlaybackStatus(value)
    }

    /**
     * 
     * @returns {SystemMediaTransportControlsDisplayUpdater} 
     */
    get_DisplayUpdater() {
        if (!this.HasProp("__ISystemMediaTransportControls")) {
            if ((queryResult := this.QueryInterface(ISystemMediaTransportControls.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemMediaTransportControls := ISystemMediaTransportControls(outPtr)
        }

        return this.__ISystemMediaTransportControls.get_DisplayUpdater()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SoundLevel() {
        if (!this.HasProp("__ISystemMediaTransportControls")) {
            if ((queryResult := this.QueryInterface(ISystemMediaTransportControls.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemMediaTransportControls := ISystemMediaTransportControls(outPtr)
        }

        return this.__ISystemMediaTransportControls.get_SoundLevel()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsEnabled() {
        if (!this.HasProp("__ISystemMediaTransportControls")) {
            if ((queryResult := this.QueryInterface(ISystemMediaTransportControls.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemMediaTransportControls := ISystemMediaTransportControls(outPtr)
        }

        return this.__ISystemMediaTransportControls.get_IsEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsEnabled(value) {
        if (!this.HasProp("__ISystemMediaTransportControls")) {
            if ((queryResult := this.QueryInterface(ISystemMediaTransportControls.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemMediaTransportControls := ISystemMediaTransportControls(outPtr)
        }

        return this.__ISystemMediaTransportControls.put_IsEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPlayEnabled() {
        if (!this.HasProp("__ISystemMediaTransportControls")) {
            if ((queryResult := this.QueryInterface(ISystemMediaTransportControls.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemMediaTransportControls := ISystemMediaTransportControls(outPtr)
        }

        return this.__ISystemMediaTransportControls.get_IsPlayEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsPlayEnabled(value) {
        if (!this.HasProp("__ISystemMediaTransportControls")) {
            if ((queryResult := this.QueryInterface(ISystemMediaTransportControls.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemMediaTransportControls := ISystemMediaTransportControls(outPtr)
        }

        return this.__ISystemMediaTransportControls.put_IsPlayEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsStopEnabled() {
        if (!this.HasProp("__ISystemMediaTransportControls")) {
            if ((queryResult := this.QueryInterface(ISystemMediaTransportControls.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemMediaTransportControls := ISystemMediaTransportControls(outPtr)
        }

        return this.__ISystemMediaTransportControls.get_IsStopEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsStopEnabled(value) {
        if (!this.HasProp("__ISystemMediaTransportControls")) {
            if ((queryResult := this.QueryInterface(ISystemMediaTransportControls.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemMediaTransportControls := ISystemMediaTransportControls(outPtr)
        }

        return this.__ISystemMediaTransportControls.put_IsStopEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPauseEnabled() {
        if (!this.HasProp("__ISystemMediaTransportControls")) {
            if ((queryResult := this.QueryInterface(ISystemMediaTransportControls.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemMediaTransportControls := ISystemMediaTransportControls(outPtr)
        }

        return this.__ISystemMediaTransportControls.get_IsPauseEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsPauseEnabled(value) {
        if (!this.HasProp("__ISystemMediaTransportControls")) {
            if ((queryResult := this.QueryInterface(ISystemMediaTransportControls.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemMediaTransportControls := ISystemMediaTransportControls(outPtr)
        }

        return this.__ISystemMediaTransportControls.put_IsPauseEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsRecordEnabled() {
        if (!this.HasProp("__ISystemMediaTransportControls")) {
            if ((queryResult := this.QueryInterface(ISystemMediaTransportControls.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemMediaTransportControls := ISystemMediaTransportControls(outPtr)
        }

        return this.__ISystemMediaTransportControls.get_IsRecordEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsRecordEnabled(value) {
        if (!this.HasProp("__ISystemMediaTransportControls")) {
            if ((queryResult := this.QueryInterface(ISystemMediaTransportControls.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemMediaTransportControls := ISystemMediaTransportControls(outPtr)
        }

        return this.__ISystemMediaTransportControls.put_IsRecordEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsFastForwardEnabled() {
        if (!this.HasProp("__ISystemMediaTransportControls")) {
            if ((queryResult := this.QueryInterface(ISystemMediaTransportControls.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemMediaTransportControls := ISystemMediaTransportControls(outPtr)
        }

        return this.__ISystemMediaTransportControls.get_IsFastForwardEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsFastForwardEnabled(value) {
        if (!this.HasProp("__ISystemMediaTransportControls")) {
            if ((queryResult := this.QueryInterface(ISystemMediaTransportControls.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemMediaTransportControls := ISystemMediaTransportControls(outPtr)
        }

        return this.__ISystemMediaTransportControls.put_IsFastForwardEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsRewindEnabled() {
        if (!this.HasProp("__ISystemMediaTransportControls")) {
            if ((queryResult := this.QueryInterface(ISystemMediaTransportControls.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemMediaTransportControls := ISystemMediaTransportControls(outPtr)
        }

        return this.__ISystemMediaTransportControls.get_IsRewindEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsRewindEnabled(value) {
        if (!this.HasProp("__ISystemMediaTransportControls")) {
            if ((queryResult := this.QueryInterface(ISystemMediaTransportControls.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemMediaTransportControls := ISystemMediaTransportControls(outPtr)
        }

        return this.__ISystemMediaTransportControls.put_IsRewindEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPreviousEnabled() {
        if (!this.HasProp("__ISystemMediaTransportControls")) {
            if ((queryResult := this.QueryInterface(ISystemMediaTransportControls.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemMediaTransportControls := ISystemMediaTransportControls(outPtr)
        }

        return this.__ISystemMediaTransportControls.get_IsPreviousEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsPreviousEnabled(value) {
        if (!this.HasProp("__ISystemMediaTransportControls")) {
            if ((queryResult := this.QueryInterface(ISystemMediaTransportControls.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemMediaTransportControls := ISystemMediaTransportControls(outPtr)
        }

        return this.__ISystemMediaTransportControls.put_IsPreviousEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsNextEnabled() {
        if (!this.HasProp("__ISystemMediaTransportControls")) {
            if ((queryResult := this.QueryInterface(ISystemMediaTransportControls.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemMediaTransportControls := ISystemMediaTransportControls(outPtr)
        }

        return this.__ISystemMediaTransportControls.get_IsNextEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsNextEnabled(value) {
        if (!this.HasProp("__ISystemMediaTransportControls")) {
            if ((queryResult := this.QueryInterface(ISystemMediaTransportControls.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemMediaTransportControls := ISystemMediaTransportControls(outPtr)
        }

        return this.__ISystemMediaTransportControls.put_IsNextEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsChannelUpEnabled() {
        if (!this.HasProp("__ISystemMediaTransportControls")) {
            if ((queryResult := this.QueryInterface(ISystemMediaTransportControls.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemMediaTransportControls := ISystemMediaTransportControls(outPtr)
        }

        return this.__ISystemMediaTransportControls.get_IsChannelUpEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsChannelUpEnabled(value) {
        if (!this.HasProp("__ISystemMediaTransportControls")) {
            if ((queryResult := this.QueryInterface(ISystemMediaTransportControls.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemMediaTransportControls := ISystemMediaTransportControls(outPtr)
        }

        return this.__ISystemMediaTransportControls.put_IsChannelUpEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsChannelDownEnabled() {
        if (!this.HasProp("__ISystemMediaTransportControls")) {
            if ((queryResult := this.QueryInterface(ISystemMediaTransportControls.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemMediaTransportControls := ISystemMediaTransportControls(outPtr)
        }

        return this.__ISystemMediaTransportControls.get_IsChannelDownEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsChannelDownEnabled(value) {
        if (!this.HasProp("__ISystemMediaTransportControls")) {
            if ((queryResult := this.QueryInterface(ISystemMediaTransportControls.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemMediaTransportControls := ISystemMediaTransportControls(outPtr)
        }

        return this.__ISystemMediaTransportControls.put_IsChannelDownEnabled(value)
    }

    /**
     * 
     * @param {TypedEventHandler<SystemMediaTransportControls, SystemMediaTransportControlsButtonPressedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ButtonPressed(handler) {
        if (!this.HasProp("__ISystemMediaTransportControls")) {
            if ((queryResult := this.QueryInterface(ISystemMediaTransportControls.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemMediaTransportControls := ISystemMediaTransportControls(outPtr)
        }

        return this.__ISystemMediaTransportControls.add_ButtonPressed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ButtonPressed(token) {
        if (!this.HasProp("__ISystemMediaTransportControls")) {
            if ((queryResult := this.QueryInterface(ISystemMediaTransportControls.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemMediaTransportControls := ISystemMediaTransportControls(outPtr)
        }

        return this.__ISystemMediaTransportControls.remove_ButtonPressed(token)
    }

    /**
     * 
     * @param {TypedEventHandler<SystemMediaTransportControls, SystemMediaTransportControlsPropertyChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PropertyChanged(handler) {
        if (!this.HasProp("__ISystemMediaTransportControls")) {
            if ((queryResult := this.QueryInterface(ISystemMediaTransportControls.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemMediaTransportControls := ISystemMediaTransportControls(outPtr)
        }

        return this.__ISystemMediaTransportControls.add_PropertyChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PropertyChanged(token) {
        if (!this.HasProp("__ISystemMediaTransportControls")) {
            if ((queryResult := this.QueryInterface(ISystemMediaTransportControls.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemMediaTransportControls := ISystemMediaTransportControls(outPtr)
        }

        return this.__ISystemMediaTransportControls.remove_PropertyChanged(token)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AutoRepeatMode() {
        if (!this.HasProp("__ISystemMediaTransportControls2")) {
            if ((queryResult := this.QueryInterface(ISystemMediaTransportControls2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemMediaTransportControls2 := ISystemMediaTransportControls2(outPtr)
        }

        return this.__ISystemMediaTransportControls2.get_AutoRepeatMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_AutoRepeatMode(value) {
        if (!this.HasProp("__ISystemMediaTransportControls2")) {
            if ((queryResult := this.QueryInterface(ISystemMediaTransportControls2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemMediaTransportControls2 := ISystemMediaTransportControls2(outPtr)
        }

        return this.__ISystemMediaTransportControls2.put_AutoRepeatMode(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ShuffleEnabled() {
        if (!this.HasProp("__ISystemMediaTransportControls2")) {
            if ((queryResult := this.QueryInterface(ISystemMediaTransportControls2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemMediaTransportControls2 := ISystemMediaTransportControls2(outPtr)
        }

        return this.__ISystemMediaTransportControls2.get_ShuffleEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_ShuffleEnabled(value) {
        if (!this.HasProp("__ISystemMediaTransportControls2")) {
            if ((queryResult := this.QueryInterface(ISystemMediaTransportControls2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemMediaTransportControls2 := ISystemMediaTransportControls2(outPtr)
        }

        return this.__ISystemMediaTransportControls2.put_ShuffleEnabled(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_PlaybackRate() {
        if (!this.HasProp("__ISystemMediaTransportControls2")) {
            if ((queryResult := this.QueryInterface(ISystemMediaTransportControls2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemMediaTransportControls2 := ISystemMediaTransportControls2(outPtr)
        }

        return this.__ISystemMediaTransportControls2.get_PlaybackRate()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_PlaybackRate(value) {
        if (!this.HasProp("__ISystemMediaTransportControls2")) {
            if ((queryResult := this.QueryInterface(ISystemMediaTransportControls2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemMediaTransportControls2 := ISystemMediaTransportControls2(outPtr)
        }

        return this.__ISystemMediaTransportControls2.put_PlaybackRate(value)
    }

    /**
     * Updates the [SystemMediaTransportControls](systemmediatransportcontrols.md) timeline properties with the values in the provided object.
     * @param {SystemMediaTransportControlsTimelineProperties} timelineProperties The object representing the new timeline property values.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.systemmediatransportcontrols.updatetimelineproperties
     */
    UpdateTimelineProperties(timelineProperties) {
        if (!this.HasProp("__ISystemMediaTransportControls2")) {
            if ((queryResult := this.QueryInterface(ISystemMediaTransportControls2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemMediaTransportControls2 := ISystemMediaTransportControls2(outPtr)
        }

        return this.__ISystemMediaTransportControls2.UpdateTimelineProperties(timelineProperties)
    }

    /**
     * 
     * @param {TypedEventHandler<SystemMediaTransportControls, PlaybackPositionChangeRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PlaybackPositionChangeRequested(handler) {
        if (!this.HasProp("__ISystemMediaTransportControls2")) {
            if ((queryResult := this.QueryInterface(ISystemMediaTransportControls2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemMediaTransportControls2 := ISystemMediaTransportControls2(outPtr)
        }

        return this.__ISystemMediaTransportControls2.add_PlaybackPositionChangeRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PlaybackPositionChangeRequested(token) {
        if (!this.HasProp("__ISystemMediaTransportControls2")) {
            if ((queryResult := this.QueryInterface(ISystemMediaTransportControls2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemMediaTransportControls2 := ISystemMediaTransportControls2(outPtr)
        }

        return this.__ISystemMediaTransportControls2.remove_PlaybackPositionChangeRequested(token)
    }

    /**
     * 
     * @param {TypedEventHandler<SystemMediaTransportControls, PlaybackRateChangeRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PlaybackRateChangeRequested(handler) {
        if (!this.HasProp("__ISystemMediaTransportControls2")) {
            if ((queryResult := this.QueryInterface(ISystemMediaTransportControls2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemMediaTransportControls2 := ISystemMediaTransportControls2(outPtr)
        }

        return this.__ISystemMediaTransportControls2.add_PlaybackRateChangeRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PlaybackRateChangeRequested(token) {
        if (!this.HasProp("__ISystemMediaTransportControls2")) {
            if ((queryResult := this.QueryInterface(ISystemMediaTransportControls2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemMediaTransportControls2 := ISystemMediaTransportControls2(outPtr)
        }

        return this.__ISystemMediaTransportControls2.remove_PlaybackRateChangeRequested(token)
    }

    /**
     * 
     * @param {TypedEventHandler<SystemMediaTransportControls, ShuffleEnabledChangeRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ShuffleEnabledChangeRequested(handler) {
        if (!this.HasProp("__ISystemMediaTransportControls2")) {
            if ((queryResult := this.QueryInterface(ISystemMediaTransportControls2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemMediaTransportControls2 := ISystemMediaTransportControls2(outPtr)
        }

        return this.__ISystemMediaTransportControls2.add_ShuffleEnabledChangeRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ShuffleEnabledChangeRequested(token) {
        if (!this.HasProp("__ISystemMediaTransportControls2")) {
            if ((queryResult := this.QueryInterface(ISystemMediaTransportControls2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemMediaTransportControls2 := ISystemMediaTransportControls2(outPtr)
        }

        return this.__ISystemMediaTransportControls2.remove_ShuffleEnabledChangeRequested(token)
    }

    /**
     * 
     * @param {TypedEventHandler<SystemMediaTransportControls, AutoRepeatModeChangeRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_AutoRepeatModeChangeRequested(handler) {
        if (!this.HasProp("__ISystemMediaTransportControls2")) {
            if ((queryResult := this.QueryInterface(ISystemMediaTransportControls2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemMediaTransportControls2 := ISystemMediaTransportControls2(outPtr)
        }

        return this.__ISystemMediaTransportControls2.add_AutoRepeatModeChangeRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_AutoRepeatModeChangeRequested(token) {
        if (!this.HasProp("__ISystemMediaTransportControls2")) {
            if ((queryResult := this.QueryInterface(ISystemMediaTransportControls2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemMediaTransportControls2 := ISystemMediaTransportControls2(outPtr)
        }

        return this.__ISystemMediaTransportControls2.remove_AutoRepeatModeChangeRequested(token)
    }

;@endregion Instance Methods
}
