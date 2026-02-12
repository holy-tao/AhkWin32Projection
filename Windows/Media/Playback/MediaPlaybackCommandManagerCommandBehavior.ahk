#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMediaPlaybackCommandManagerCommandBehavior.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\MediaPlaybackCommandManagerCommandBehavior.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * For use with a MediaPlaybackCommandManager object, this class allows you to enable and disable System Media Transport Controls commands and allows you to respond to changes in the enabled state of a command.
 * @remarks
 * Get an instance of this class by accessing one of the behavior properties of a MediaPlaybackCommandManager object.
 * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybackcommandmanagercommandbehavior
 * @namespace Windows.Media.Playback
 * @version WindowsRuntime 1.4
 */
class MediaPlaybackCommandManagerCommandBehavior extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMediaPlaybackCommandManagerCommandBehavior

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMediaPlaybackCommandManagerCommandBehavior.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [MediaPlaybackCommandManager](mediaplaybackcommandmanager.md) associated with the behavior.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybackcommandmanagercommandbehavior.commandmanager
     * @type {MediaPlaybackCommandManager} 
     */
    CommandManager {
        get => this.get_CommandManager()
    }

    /**
     * Gets a value indicating whether a System Media Transport Controls command is currently enabled.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybackcommandmanagercommandbehavior.isenabled
     * @type {Boolean} 
     */
    IsEnabled {
        get => this.get_IsEnabled()
    }

    /**
     * Gets or sets a value indicating whether a System Media Transport Controls command should always be enabled, should never be enabled, or if the system should automatically determine whether the command is enabled.
     * @remarks
     * Use this property to override the default behavior for a System Media Transport Controls command managed by a [MediaPlaybackCommandManager](mediaplaybackcommandmanager.md). If a [MediaPlayer](mediaplayer.md) has no remaining items to play, the System Media Transport Controls will disable the **Next** button. If your app uses the **Next** button to trigger some other action, such as switching to a different playlist of media items, you can set the **EnablingRule** for the [NextBehavior](mediaplaybackcommandmanager_nextbehavior.md) to [Always](mediacommandenablingrule.md) to ensure that the **Next** button is always enabled. Or, if a **MediaPlayer** has remaining items to play, the System Media Transport Controls will enable the **Next** button by default. If your app requires some user action before playing the next media item, you can set the **EnablingRule** for the [NextBehavior](mediaplaybackcommandmanager_nextbehavior.md) to [Never](mediacommandenablingrule.md) to disable the **Next** button.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybackcommandmanagercommandbehavior.enablingrule
     * @type {Integer} 
     */
    EnablingRule {
        get => this.get_EnablingRule()
        set => this.put_EnablingRule(value)
    }

    /**
     * Occurs when the enabled state of a System Media Transport Controls command changes.
     * @type {TypedEventHandler<MediaPlaybackCommandManagerCommandBehavior, IInspectable>}
    */
    OnIsEnabledChanged {
        get {
            if(!this.HasProp("__OnIsEnabledChanged")){
                this.__OnIsEnabledChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{2675973a-eb2d-56a1-82a0-340b0ff041e6}"),
                    MediaPlaybackCommandManagerCommandBehavior,
                    IInspectable
                )
                this.__OnIsEnabledChangedToken := this.add_IsEnabledChanged(this.__OnIsEnabledChanged.iface)
            }
            return this.__OnIsEnabledChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnIsEnabledChangedToken")) {
            this.remove_IsEnabledChanged(this.__OnIsEnabledChangedToken)
            this.__OnIsEnabledChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {MediaPlaybackCommandManager} 
     */
    get_CommandManager() {
        if (!this.HasProp("__IMediaPlaybackCommandManagerCommandBehavior")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackCommandManagerCommandBehavior.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackCommandManagerCommandBehavior := IMediaPlaybackCommandManagerCommandBehavior(outPtr)
        }

        return this.__IMediaPlaybackCommandManagerCommandBehavior.get_CommandManager()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsEnabled() {
        if (!this.HasProp("__IMediaPlaybackCommandManagerCommandBehavior")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackCommandManagerCommandBehavior.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackCommandManagerCommandBehavior := IMediaPlaybackCommandManagerCommandBehavior(outPtr)
        }

        return this.__IMediaPlaybackCommandManagerCommandBehavior.get_IsEnabled()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_EnablingRule() {
        if (!this.HasProp("__IMediaPlaybackCommandManagerCommandBehavior")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackCommandManagerCommandBehavior.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackCommandManagerCommandBehavior := IMediaPlaybackCommandManagerCommandBehavior(outPtr)
        }

        return this.__IMediaPlaybackCommandManagerCommandBehavior.get_EnablingRule()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_EnablingRule(value) {
        if (!this.HasProp("__IMediaPlaybackCommandManagerCommandBehavior")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackCommandManagerCommandBehavior.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackCommandManagerCommandBehavior := IMediaPlaybackCommandManagerCommandBehavior(outPtr)
        }

        return this.__IMediaPlaybackCommandManagerCommandBehavior.put_EnablingRule(value)
    }

    /**
     * 
     * @param {TypedEventHandler<MediaPlaybackCommandManagerCommandBehavior, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_IsEnabledChanged(handler) {
        if (!this.HasProp("__IMediaPlaybackCommandManagerCommandBehavior")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackCommandManagerCommandBehavior.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackCommandManagerCommandBehavior := IMediaPlaybackCommandManagerCommandBehavior(outPtr)
        }

        return this.__IMediaPlaybackCommandManagerCommandBehavior.add_IsEnabledChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_IsEnabledChanged(token) {
        if (!this.HasProp("__IMediaPlaybackCommandManagerCommandBehavior")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackCommandManagerCommandBehavior.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackCommandManagerCommandBehavior := IMediaPlaybackCommandManagerCommandBehavior(outPtr)
        }

        return this.__IMediaPlaybackCommandManagerCommandBehavior.remove_IsEnabledChanged(token)
    }

;@endregion Instance Methods
}
