#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMediaPlaybackCommandManagerAutoRepeatModeReceivedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data or the [MediaPlaybackCommandManager.AutoRepeatModeReceived](mediaplaybackcommandmanager_autorepeatmodereceived.md) event, which occurs when the command manager receives a command from the **Auto-repeat** control of the System Media Transport Controls.
 * @remarks
 * Get an instance of this class by handling the [MediaPlaybackCommandManager.AutoRepeatModeReceived](mediaplaybackcommandmanager_autorepeatmodereceived.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybackcommandmanagerautorepeatmodereceivedeventargs
 * @namespace Windows.Media.Playback
 * @version WindowsRuntime 1.4
 */
class MediaPlaybackCommandManagerAutoRepeatModeReceivedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMediaPlaybackCommandManagerAutoRepeatModeReceivedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMediaPlaybackCommandManagerAutoRepeatModeReceivedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets a value indicating whether the [AutoRepeatModeReceived](mediaplaybackcommandmanager_autorepeatmodereceived.md) event has been handled.
     * @remarks
     * If you mark the event as handled by setting this property to true, the System Media Transport Controls will not take any action for the **Auto-repeat** command that initiated the event. If this property is false, the system will perform the default action based on the current [AutoRepeatModeBehavior](mediaplaybackcommandmanager_autorepeatmodebehavior.md) setting.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybackcommandmanagerautorepeatmodereceivedeventargs.handled
     * @type {Boolean} 
     */
    Handled {
        get => this.get_Handled()
        set => this.put_Handled(value)
    }

    /**
     * Gets a value indicating the current auto-repeat mode.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybackcommandmanagerautorepeatmodereceivedeventargs.autorepeatmode
     * @type {Integer} 
     */
    AutoRepeatMode {
        get => this.get_AutoRepeatMode()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Handled() {
        if (!this.HasProp("__IMediaPlaybackCommandManagerAutoRepeatModeReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackCommandManagerAutoRepeatModeReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackCommandManagerAutoRepeatModeReceivedEventArgs := IMediaPlaybackCommandManagerAutoRepeatModeReceivedEventArgs(outPtr)
        }

        return this.__IMediaPlaybackCommandManagerAutoRepeatModeReceivedEventArgs.get_Handled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Handled(value) {
        if (!this.HasProp("__IMediaPlaybackCommandManagerAutoRepeatModeReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackCommandManagerAutoRepeatModeReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackCommandManagerAutoRepeatModeReceivedEventArgs := IMediaPlaybackCommandManagerAutoRepeatModeReceivedEventArgs(outPtr)
        }

        return this.__IMediaPlaybackCommandManagerAutoRepeatModeReceivedEventArgs.put_Handled(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AutoRepeatMode() {
        if (!this.HasProp("__IMediaPlaybackCommandManagerAutoRepeatModeReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackCommandManagerAutoRepeatModeReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackCommandManagerAutoRepeatModeReceivedEventArgs := IMediaPlaybackCommandManagerAutoRepeatModeReceivedEventArgs(outPtr)
        }

        return this.__IMediaPlaybackCommandManagerAutoRepeatModeReceivedEventArgs.get_AutoRepeatMode()
    }

    /**
     * Gets a [Deferral](../windows.foundation/deferral.md) object that causes the system to wait for you to perform asynchronous operations, such as creating a new [MediaPlaybackItem](mediaplaybackitem.md) from a network source, before it continues processing the **Auto-repeat** command.
     * @remarks
     * Call [Complete](../windows.foundation/deferral_complete_1807836922.md) when your asynchronous operations are complete to signal the system to continue.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybackcommandmanagerautorepeatmodereceivedeventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IMediaPlaybackCommandManagerAutoRepeatModeReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackCommandManagerAutoRepeatModeReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackCommandManagerAutoRepeatModeReceivedEventArgs := IMediaPlaybackCommandManagerAutoRepeatModeReceivedEventArgs(outPtr)
        }

        return this.__IMediaPlaybackCommandManagerAutoRepeatModeReceivedEventArgs.GetDeferral()
    }

;@endregion Instance Methods
}
