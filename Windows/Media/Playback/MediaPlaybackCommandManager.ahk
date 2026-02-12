#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMediaPlaybackCommandManager.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\MediaPlaybackCommandManager.ahk
#Include .\MediaPlaybackCommandManagerPlayReceivedEventArgs.ahk
#Include .\MediaPlaybackCommandManagerPauseReceivedEventArgs.ahk
#Include .\MediaPlaybackCommandManagerNextReceivedEventArgs.ahk
#Include .\MediaPlaybackCommandManagerPreviousReceivedEventArgs.ahk
#Include .\MediaPlaybackCommandManagerFastForwardReceivedEventArgs.ahk
#Include .\MediaPlaybackCommandManagerRewindReceivedEventArgs.ahk
#Include .\MediaPlaybackCommandManagerShuffleReceivedEventArgs.ahk
#Include .\MediaPlaybackCommandManagerAutoRepeatModeReceivedEventArgs.ahk
#Include .\MediaPlaybackCommandManagerPositionReceivedEventArgs.ahk
#Include .\MediaPlaybackCommandManagerRateReceivedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Specifies the behavior of and receives events from the System Media Transport Controls. Use this class to customize the interaction between a [MediaPlayer](mediaplayer.md) and the System Media Transport Controls.
 * @remarks
 * Get an instance of the **MediaPlaybackCommandManager** by accessing the [CommandManager](mediaplayer_commandmanager.md) property of a [MediaPlayer](mediaplayer.md) object.
 * 
 * For how-to guidance for integrating with the SMTC, see [Integrate with the System Media Transport Controls](/windows/uwp/audio-video-camera/integrate-with-systemmediatransportcontrols).
 * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybackcommandmanager
 * @namespace Windows.Media.Playback
 * @version WindowsRuntime 1.4
 */
class MediaPlaybackCommandManager extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMediaPlaybackCommandManager

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMediaPlaybackCommandManager.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets a value indicating whether the [MediaPlaybackCommandManager](mediaplaybackcommandmanager.md) is enabled.
     * @remarks
     * If your app scenario requires manual control of the System Media Transport Controls you can disable the [MediaPlaybackCommandManager](mediaplaybackcommandmanager.md) and using the events and properties of the [SystemMediaTransportControls](mediaplayer_systemmediatransportcontrols.md) directly.
     * 
     * > [!NOTE]
     * > If you disable the **MediaPlaybackCommandManager** by setting **IsEnabled** to false, it will break the link between the [MediaPlayer](mediaplayer.md) the [TransportControls](../windows.ui.xaml.controls/mediaplayerelement_transportcontrols.md) provided by the [MediaPlayerElement](../windows.ui.xaml.controls/mediaplayerelement.md), so the built-in transport controls will no longer automatically control the playback of the player. Instead, you must implement your own controls to control the **MediaPlayer**.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybackcommandmanager.isenabled
     * @type {Boolean} 
     */
    IsEnabled {
        get => this.get_IsEnabled()
        set => this.put_IsEnabled(value)
    }

    /**
     * Gets the [MediaPlayer](mediaplayer.md) instance associated with the [MediaPlaybackCommandManager](mediaplaybackcommandmanager.md).
     * @remarks
     * You get an instance of the **MediaPlaybackCommandManager** by accessing the [CommandManager](mediaplayer_commandmanager.md) property of a [MediaPlayer](mediaplayer.md) object. This property gives you a reference to the media player from which the command manager was obtained.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybackcommandmanager.mediaplayer
     * @type {MediaPlayer} 
     */
    MediaPlayer {
        get => this.get_MediaPlayer()
    }

    /**
     * Gets an object that defines the behavior when the **Play** button in the System Media Transport Controls is tapped.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybackcommandmanager.playbehavior
     * @type {MediaPlaybackCommandManagerCommandBehavior} 
     */
    PlayBehavior {
        get => this.get_PlayBehavior()
    }

    /**
     * Gets an object that defines the behavior when the **Pause** button in the System Media Transport Controls is tapped.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybackcommandmanager.pausebehavior
     * @type {MediaPlaybackCommandManagerCommandBehavior} 
     */
    PauseBehavior {
        get => this.get_PauseBehavior()
    }

    /**
     * Gets an object that defines the behavior when the **Next** button in the System Media Transport Controls is tapped.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybackcommandmanager.nextbehavior
     * @type {MediaPlaybackCommandManagerCommandBehavior} 
     */
    NextBehavior {
        get => this.get_NextBehavior()
    }

    /**
     * Gets an object that defines the behavior when the **Previous** button in the System Media Transport Controls is tapped.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybackcommandmanager.previousbehavior
     * @type {MediaPlaybackCommandManagerCommandBehavior} 
     */
    PreviousBehavior {
        get => this.get_PreviousBehavior()
    }

    /**
     * Gets an object that defines the behavior when the **Fast-forward** button in the System Media Transport Controls is tapped.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybackcommandmanager.fastforwardbehavior
     * @type {MediaPlaybackCommandManagerCommandBehavior} 
     */
    FastForwardBehavior {
        get => this.get_FastForwardBehavior()
    }

    /**
     * Gets an object that defines the behavior when the **Rewind** button in the System Media Transport Controls is tapped.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybackcommandmanager.rewindbehavior
     * @type {MediaPlaybackCommandManagerCommandBehavior} 
     */
    RewindBehavior {
        get => this.get_RewindBehavior()
    }

    /**
     * Gets an object that defines the behavior when the **Shuffle** button in the System Media Transport Controls is toggled.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybackcommandmanager.shufflebehavior
     * @type {MediaPlaybackCommandManagerCommandBehavior} 
     */
    ShuffleBehavior {
        get => this.get_ShuffleBehavior()
    }

    /**
     * Gets an object that defines the behavior when the **Auto-repeat** control in the System Media Transport Controls is toggled.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybackcommandmanager.autorepeatmodebehavior
     * @type {MediaPlaybackCommandManagerCommandBehavior} 
     */
    AutoRepeatModeBehavior {
        get => this.get_AutoRepeatModeBehavior()
    }

    /**
     * Gets an object that defines the behavior when the playback position control in the System Media Transport Controls is moved.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybackcommandmanager.positionbehavior
     * @type {MediaPlaybackCommandManagerCommandBehavior} 
     */
    PositionBehavior {
        get => this.get_PositionBehavior()
    }

    /**
     * Gets an object that defines the behavior when the playback rate is changed using the System Media Transport Controls.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybackcommandmanager.ratebehavior
     * @type {MediaPlaybackCommandManagerCommandBehavior} 
     */
    RateBehavior {
        get => this.get_RateBehavior()
    }

    /**
     * Occurs when the command manager receives a command from the **Play** control of the System Media Transport Controls.
     * @type {TypedEventHandler<MediaPlaybackCommandManager, MediaPlaybackCommandManagerPlayReceivedEventArgs>}
    */
    OnPlayReceived {
        get {
            if(!this.HasProp("__OnPlayReceived")){
                this.__OnPlayReceived := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{76d59f7c-edf3-5dde-9529-6f806bdb1fcb}"),
                    MediaPlaybackCommandManager,
                    MediaPlaybackCommandManagerPlayReceivedEventArgs
                )
                this.__OnPlayReceivedToken := this.add_PlayReceived(this.__OnPlayReceived.iface)
            }
            return this.__OnPlayReceived
        }
    }

    /**
     * Occurs when the command manager receives a command from the **Pause** button of the System Media Transport Controls.
     * @type {TypedEventHandler<MediaPlaybackCommandManager, MediaPlaybackCommandManagerPauseReceivedEventArgs>}
    */
    OnPauseReceived {
        get {
            if(!this.HasProp("__OnPauseReceived")){
                this.__OnPauseReceived := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{79eb2ad3-0781-5f64-b0cd-31e1145d109f}"),
                    MediaPlaybackCommandManager,
                    MediaPlaybackCommandManagerPauseReceivedEventArgs
                )
                this.__OnPauseReceivedToken := this.add_PauseReceived(this.__OnPauseReceived.iface)
            }
            return this.__OnPauseReceived
        }
    }

    /**
     * Occurs when the command manager receives a command from the **Next** button of the System Media Transport Controls.
     * @type {TypedEventHandler<MediaPlaybackCommandManager, MediaPlaybackCommandManagerNextReceivedEventArgs>}
    */
    OnNextReceived {
        get {
            if(!this.HasProp("__OnNextReceived")){
                this.__OnNextReceived := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{ce41af40-93a6-52bf-9cad-4d5fffd10ee0}"),
                    MediaPlaybackCommandManager,
                    MediaPlaybackCommandManagerNextReceivedEventArgs
                )
                this.__OnNextReceivedToken := this.add_NextReceived(this.__OnNextReceived.iface)
            }
            return this.__OnNextReceived
        }
    }

    /**
     * Occurs when the command manager receives a command from the **Previous** button of the System Media Transport Controls.
     * @type {TypedEventHandler<MediaPlaybackCommandManager, MediaPlaybackCommandManagerPreviousReceivedEventArgs>}
    */
    OnPreviousReceived {
        get {
            if(!this.HasProp("__OnPreviousReceived")){
                this.__OnPreviousReceived := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{25726db4-8913-5967-90eb-10f09f30dd33}"),
                    MediaPlaybackCommandManager,
                    MediaPlaybackCommandManagerPreviousReceivedEventArgs
                )
                this.__OnPreviousReceivedToken := this.add_PreviousReceived(this.__OnPreviousReceived.iface)
            }
            return this.__OnPreviousReceived
        }
    }

    /**
     * Occurs when the command manager receives a command from the **Fast-forward** button of the System Media Transport Controls.
     * @type {TypedEventHandler<MediaPlaybackCommandManager, MediaPlaybackCommandManagerFastForwardReceivedEventArgs>}
    */
    OnFastForwardReceived {
        get {
            if(!this.HasProp("__OnFastForwardReceived")){
                this.__OnFastForwardReceived := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{d7cd6ce3-516f-5b34-beaf-3ee90b622872}"),
                    MediaPlaybackCommandManager,
                    MediaPlaybackCommandManagerFastForwardReceivedEventArgs
                )
                this.__OnFastForwardReceivedToken := this.add_FastForwardReceived(this.__OnFastForwardReceived.iface)
            }
            return this.__OnFastForwardReceived
        }
    }

    /**
     * Occurs when the command manager receives a command from the **Rewind** button of the System Media Transport Controls.
     * @type {TypedEventHandler<MediaPlaybackCommandManager, MediaPlaybackCommandManagerRewindReceivedEventArgs>}
    */
    OnRewindReceived {
        get {
            if(!this.HasProp("__OnRewindReceived")){
                this.__OnRewindReceived := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{3c37e026-8d0b-5d73-a650-9f18abbc353d}"),
                    MediaPlaybackCommandManager,
                    MediaPlaybackCommandManagerRewindReceivedEventArgs
                )
                this.__OnRewindReceivedToken := this.add_RewindReceived(this.__OnRewindReceived.iface)
            }
            return this.__OnRewindReceived
        }
    }

    /**
     * Occurs when the command manager receives a command from the **Shuffle** control of the System Media Transport Controls.
     * @type {TypedEventHandler<MediaPlaybackCommandManager, MediaPlaybackCommandManagerShuffleReceivedEventArgs>}
    */
    OnShuffleReceived {
        get {
            if(!this.HasProp("__OnShuffleReceived")){
                this.__OnShuffleReceived := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{6c972f91-f626-5799-ba86-5e941f0202c8}"),
                    MediaPlaybackCommandManager,
                    MediaPlaybackCommandManagerShuffleReceivedEventArgs
                )
                this.__OnShuffleReceivedToken := this.add_ShuffleReceived(this.__OnShuffleReceived.iface)
            }
            return this.__OnShuffleReceived
        }
    }

    /**
     * Occurs when the command manager receives a command from the **Auto-repeat** control of the System Media Transport Controls.
     * @type {TypedEventHandler<MediaPlaybackCommandManager, MediaPlaybackCommandManagerAutoRepeatModeReceivedEventArgs>}
    */
    OnAutoRepeatModeReceived {
        get {
            if(!this.HasProp("__OnAutoRepeatModeReceived")){
                this.__OnAutoRepeatModeReceived := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{824845b8-c5df-560b-a722-c15b25d4463a}"),
                    MediaPlaybackCommandManager,
                    MediaPlaybackCommandManagerAutoRepeatModeReceivedEventArgs
                )
                this.__OnAutoRepeatModeReceivedToken := this.add_AutoRepeatModeReceived(this.__OnAutoRepeatModeReceived.iface)
            }
            return this.__OnAutoRepeatModeReceived
        }
    }

    /**
     * Occurs when the command manager receives a command changing the current playback position from the System Media Transport Controls.
     * @type {TypedEventHandler<MediaPlaybackCommandManager, MediaPlaybackCommandManagerPositionReceivedEventArgs>}
    */
    OnPositionReceived {
        get {
            if(!this.HasProp("__OnPositionReceived")){
                this.__OnPositionReceived := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{d863b1c4-7442-53c4-94d2-20d8973df585}"),
                    MediaPlaybackCommandManager,
                    MediaPlaybackCommandManagerPositionReceivedEventArgs
                )
                this.__OnPositionReceivedToken := this.add_PositionReceived(this.__OnPositionReceived.iface)
            }
            return this.__OnPositionReceived
        }
    }

    /**
     * Occurs when the command manager receives a command changing the current playback rate from the System Media Transport Controls.
     * @type {TypedEventHandler<MediaPlaybackCommandManager, MediaPlaybackCommandManagerRateReceivedEventArgs>}
    */
    OnRateReceived {
        get {
            if(!this.HasProp("__OnRateReceived")){
                this.__OnRateReceived := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{3f8a8ea1-ff9a-5613-9846-33799f6b8c8a}"),
                    MediaPlaybackCommandManager,
                    MediaPlaybackCommandManagerRateReceivedEventArgs
                )
                this.__OnRateReceivedToken := this.add_RateReceived(this.__OnRateReceived.iface)
            }
            return this.__OnRateReceived
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnPlayReceivedToken")) {
            this.remove_PlayReceived(this.__OnPlayReceivedToken)
            this.__OnPlayReceived.iface.Dispose()
        }

        if(this.HasProp("__OnPauseReceivedToken")) {
            this.remove_PauseReceived(this.__OnPauseReceivedToken)
            this.__OnPauseReceived.iface.Dispose()
        }

        if(this.HasProp("__OnNextReceivedToken")) {
            this.remove_NextReceived(this.__OnNextReceivedToken)
            this.__OnNextReceived.iface.Dispose()
        }

        if(this.HasProp("__OnPreviousReceivedToken")) {
            this.remove_PreviousReceived(this.__OnPreviousReceivedToken)
            this.__OnPreviousReceived.iface.Dispose()
        }

        if(this.HasProp("__OnFastForwardReceivedToken")) {
            this.remove_FastForwardReceived(this.__OnFastForwardReceivedToken)
            this.__OnFastForwardReceived.iface.Dispose()
        }

        if(this.HasProp("__OnRewindReceivedToken")) {
            this.remove_RewindReceived(this.__OnRewindReceivedToken)
            this.__OnRewindReceived.iface.Dispose()
        }

        if(this.HasProp("__OnShuffleReceivedToken")) {
            this.remove_ShuffleReceived(this.__OnShuffleReceivedToken)
            this.__OnShuffleReceived.iface.Dispose()
        }

        if(this.HasProp("__OnAutoRepeatModeReceivedToken")) {
            this.remove_AutoRepeatModeReceived(this.__OnAutoRepeatModeReceivedToken)
            this.__OnAutoRepeatModeReceived.iface.Dispose()
        }

        if(this.HasProp("__OnPositionReceivedToken")) {
            this.remove_PositionReceived(this.__OnPositionReceivedToken)
            this.__OnPositionReceived.iface.Dispose()
        }

        if(this.HasProp("__OnRateReceivedToken")) {
            this.remove_RateReceived(this.__OnRateReceivedToken)
            this.__OnRateReceived.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsEnabled() {
        if (!this.HasProp("__IMediaPlaybackCommandManager")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackCommandManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackCommandManager := IMediaPlaybackCommandManager(outPtr)
        }

        return this.__IMediaPlaybackCommandManager.get_IsEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsEnabled(value) {
        if (!this.HasProp("__IMediaPlaybackCommandManager")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackCommandManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackCommandManager := IMediaPlaybackCommandManager(outPtr)
        }

        return this.__IMediaPlaybackCommandManager.put_IsEnabled(value)
    }

    /**
     * 
     * @returns {MediaPlayer} 
     */
    get_MediaPlayer() {
        if (!this.HasProp("__IMediaPlaybackCommandManager")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackCommandManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackCommandManager := IMediaPlaybackCommandManager(outPtr)
        }

        return this.__IMediaPlaybackCommandManager.get_MediaPlayer()
    }

    /**
     * 
     * @returns {MediaPlaybackCommandManagerCommandBehavior} 
     */
    get_PlayBehavior() {
        if (!this.HasProp("__IMediaPlaybackCommandManager")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackCommandManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackCommandManager := IMediaPlaybackCommandManager(outPtr)
        }

        return this.__IMediaPlaybackCommandManager.get_PlayBehavior()
    }

    /**
     * 
     * @returns {MediaPlaybackCommandManagerCommandBehavior} 
     */
    get_PauseBehavior() {
        if (!this.HasProp("__IMediaPlaybackCommandManager")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackCommandManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackCommandManager := IMediaPlaybackCommandManager(outPtr)
        }

        return this.__IMediaPlaybackCommandManager.get_PauseBehavior()
    }

    /**
     * 
     * @returns {MediaPlaybackCommandManagerCommandBehavior} 
     */
    get_NextBehavior() {
        if (!this.HasProp("__IMediaPlaybackCommandManager")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackCommandManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackCommandManager := IMediaPlaybackCommandManager(outPtr)
        }

        return this.__IMediaPlaybackCommandManager.get_NextBehavior()
    }

    /**
     * 
     * @returns {MediaPlaybackCommandManagerCommandBehavior} 
     */
    get_PreviousBehavior() {
        if (!this.HasProp("__IMediaPlaybackCommandManager")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackCommandManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackCommandManager := IMediaPlaybackCommandManager(outPtr)
        }

        return this.__IMediaPlaybackCommandManager.get_PreviousBehavior()
    }

    /**
     * 
     * @returns {MediaPlaybackCommandManagerCommandBehavior} 
     */
    get_FastForwardBehavior() {
        if (!this.HasProp("__IMediaPlaybackCommandManager")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackCommandManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackCommandManager := IMediaPlaybackCommandManager(outPtr)
        }

        return this.__IMediaPlaybackCommandManager.get_FastForwardBehavior()
    }

    /**
     * 
     * @returns {MediaPlaybackCommandManagerCommandBehavior} 
     */
    get_RewindBehavior() {
        if (!this.HasProp("__IMediaPlaybackCommandManager")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackCommandManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackCommandManager := IMediaPlaybackCommandManager(outPtr)
        }

        return this.__IMediaPlaybackCommandManager.get_RewindBehavior()
    }

    /**
     * 
     * @returns {MediaPlaybackCommandManagerCommandBehavior} 
     */
    get_ShuffleBehavior() {
        if (!this.HasProp("__IMediaPlaybackCommandManager")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackCommandManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackCommandManager := IMediaPlaybackCommandManager(outPtr)
        }

        return this.__IMediaPlaybackCommandManager.get_ShuffleBehavior()
    }

    /**
     * 
     * @returns {MediaPlaybackCommandManagerCommandBehavior} 
     */
    get_AutoRepeatModeBehavior() {
        if (!this.HasProp("__IMediaPlaybackCommandManager")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackCommandManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackCommandManager := IMediaPlaybackCommandManager(outPtr)
        }

        return this.__IMediaPlaybackCommandManager.get_AutoRepeatModeBehavior()
    }

    /**
     * 
     * @returns {MediaPlaybackCommandManagerCommandBehavior} 
     */
    get_PositionBehavior() {
        if (!this.HasProp("__IMediaPlaybackCommandManager")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackCommandManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackCommandManager := IMediaPlaybackCommandManager(outPtr)
        }

        return this.__IMediaPlaybackCommandManager.get_PositionBehavior()
    }

    /**
     * 
     * @returns {MediaPlaybackCommandManagerCommandBehavior} 
     */
    get_RateBehavior() {
        if (!this.HasProp("__IMediaPlaybackCommandManager")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackCommandManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackCommandManager := IMediaPlaybackCommandManager(outPtr)
        }

        return this.__IMediaPlaybackCommandManager.get_RateBehavior()
    }

    /**
     * 
     * @param {TypedEventHandler<MediaPlaybackCommandManager, MediaPlaybackCommandManagerPlayReceivedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PlayReceived(handler) {
        if (!this.HasProp("__IMediaPlaybackCommandManager")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackCommandManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackCommandManager := IMediaPlaybackCommandManager(outPtr)
        }

        return this.__IMediaPlaybackCommandManager.add_PlayReceived(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PlayReceived(token) {
        if (!this.HasProp("__IMediaPlaybackCommandManager")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackCommandManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackCommandManager := IMediaPlaybackCommandManager(outPtr)
        }

        return this.__IMediaPlaybackCommandManager.remove_PlayReceived(token)
    }

    /**
     * 
     * @param {TypedEventHandler<MediaPlaybackCommandManager, MediaPlaybackCommandManagerPauseReceivedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PauseReceived(handler) {
        if (!this.HasProp("__IMediaPlaybackCommandManager")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackCommandManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackCommandManager := IMediaPlaybackCommandManager(outPtr)
        }

        return this.__IMediaPlaybackCommandManager.add_PauseReceived(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PauseReceived(token) {
        if (!this.HasProp("__IMediaPlaybackCommandManager")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackCommandManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackCommandManager := IMediaPlaybackCommandManager(outPtr)
        }

        return this.__IMediaPlaybackCommandManager.remove_PauseReceived(token)
    }

    /**
     * 
     * @param {TypedEventHandler<MediaPlaybackCommandManager, MediaPlaybackCommandManagerNextReceivedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_NextReceived(handler) {
        if (!this.HasProp("__IMediaPlaybackCommandManager")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackCommandManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackCommandManager := IMediaPlaybackCommandManager(outPtr)
        }

        return this.__IMediaPlaybackCommandManager.add_NextReceived(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_NextReceived(token) {
        if (!this.HasProp("__IMediaPlaybackCommandManager")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackCommandManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackCommandManager := IMediaPlaybackCommandManager(outPtr)
        }

        return this.__IMediaPlaybackCommandManager.remove_NextReceived(token)
    }

    /**
     * 
     * @param {TypedEventHandler<MediaPlaybackCommandManager, MediaPlaybackCommandManagerPreviousReceivedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PreviousReceived(handler) {
        if (!this.HasProp("__IMediaPlaybackCommandManager")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackCommandManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackCommandManager := IMediaPlaybackCommandManager(outPtr)
        }

        return this.__IMediaPlaybackCommandManager.add_PreviousReceived(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PreviousReceived(token) {
        if (!this.HasProp("__IMediaPlaybackCommandManager")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackCommandManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackCommandManager := IMediaPlaybackCommandManager(outPtr)
        }

        return this.__IMediaPlaybackCommandManager.remove_PreviousReceived(token)
    }

    /**
     * 
     * @param {TypedEventHandler<MediaPlaybackCommandManager, MediaPlaybackCommandManagerFastForwardReceivedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_FastForwardReceived(handler) {
        if (!this.HasProp("__IMediaPlaybackCommandManager")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackCommandManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackCommandManager := IMediaPlaybackCommandManager(outPtr)
        }

        return this.__IMediaPlaybackCommandManager.add_FastForwardReceived(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_FastForwardReceived(token) {
        if (!this.HasProp("__IMediaPlaybackCommandManager")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackCommandManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackCommandManager := IMediaPlaybackCommandManager(outPtr)
        }

        return this.__IMediaPlaybackCommandManager.remove_FastForwardReceived(token)
    }

    /**
     * 
     * @param {TypedEventHandler<MediaPlaybackCommandManager, MediaPlaybackCommandManagerRewindReceivedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_RewindReceived(handler) {
        if (!this.HasProp("__IMediaPlaybackCommandManager")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackCommandManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackCommandManager := IMediaPlaybackCommandManager(outPtr)
        }

        return this.__IMediaPlaybackCommandManager.add_RewindReceived(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_RewindReceived(token) {
        if (!this.HasProp("__IMediaPlaybackCommandManager")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackCommandManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackCommandManager := IMediaPlaybackCommandManager(outPtr)
        }

        return this.__IMediaPlaybackCommandManager.remove_RewindReceived(token)
    }

    /**
     * 
     * @param {TypedEventHandler<MediaPlaybackCommandManager, MediaPlaybackCommandManagerShuffleReceivedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ShuffleReceived(handler) {
        if (!this.HasProp("__IMediaPlaybackCommandManager")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackCommandManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackCommandManager := IMediaPlaybackCommandManager(outPtr)
        }

        return this.__IMediaPlaybackCommandManager.add_ShuffleReceived(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ShuffleReceived(token) {
        if (!this.HasProp("__IMediaPlaybackCommandManager")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackCommandManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackCommandManager := IMediaPlaybackCommandManager(outPtr)
        }

        return this.__IMediaPlaybackCommandManager.remove_ShuffleReceived(token)
    }

    /**
     * 
     * @param {TypedEventHandler<MediaPlaybackCommandManager, MediaPlaybackCommandManagerAutoRepeatModeReceivedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_AutoRepeatModeReceived(handler) {
        if (!this.HasProp("__IMediaPlaybackCommandManager")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackCommandManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackCommandManager := IMediaPlaybackCommandManager(outPtr)
        }

        return this.__IMediaPlaybackCommandManager.add_AutoRepeatModeReceived(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_AutoRepeatModeReceived(token) {
        if (!this.HasProp("__IMediaPlaybackCommandManager")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackCommandManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackCommandManager := IMediaPlaybackCommandManager(outPtr)
        }

        return this.__IMediaPlaybackCommandManager.remove_AutoRepeatModeReceived(token)
    }

    /**
     * 
     * @param {TypedEventHandler<MediaPlaybackCommandManager, MediaPlaybackCommandManagerPositionReceivedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PositionReceived(handler) {
        if (!this.HasProp("__IMediaPlaybackCommandManager")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackCommandManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackCommandManager := IMediaPlaybackCommandManager(outPtr)
        }

        return this.__IMediaPlaybackCommandManager.add_PositionReceived(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PositionReceived(token) {
        if (!this.HasProp("__IMediaPlaybackCommandManager")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackCommandManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackCommandManager := IMediaPlaybackCommandManager(outPtr)
        }

        return this.__IMediaPlaybackCommandManager.remove_PositionReceived(token)
    }

    /**
     * 
     * @param {TypedEventHandler<MediaPlaybackCommandManager, MediaPlaybackCommandManagerRateReceivedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_RateReceived(handler) {
        if (!this.HasProp("__IMediaPlaybackCommandManager")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackCommandManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackCommandManager := IMediaPlaybackCommandManager(outPtr)
        }

        return this.__IMediaPlaybackCommandManager.add_RateReceived(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_RateReceived(token) {
        if (!this.HasProp("__IMediaPlaybackCommandManager")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackCommandManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackCommandManager := IMediaPlaybackCommandManager(outPtr)
        }

        return this.__IMediaPlaybackCommandManager.remove_RateReceived(token)
    }

;@endregion Instance Methods
}
