#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMediaPlaybackCommandManagerPositionReceivedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data or the [MediaPlaybackCommandManager.PositionReceived](mediaplaybackcommandmanager_positionreceived.md) event, which occurs when the command manager receives a command changing the current position from the System Media Transport Controls.
 * @remarks
 * Get an instance of this class by handling the [MediaPlaybackCommandManager.PlayReceived](mediaplaybackcommandmanager_playreceived.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybackcommandmanagerpositionreceivedeventargs
 * @namespace Windows.Media.Playback
 * @version WindowsRuntime 1.4
 */
class MediaPlaybackCommandManagerPositionReceivedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMediaPlaybackCommandManagerPositionReceivedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMediaPlaybackCommandManagerPositionReceivedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets a value indicating whether the [PositionReceived](mediaplaybackcommandmanager_positionreceived.md) event has been handled.
     * @remarks
     * If you mark the event as handled by setting this property to true, the System Media Transport Controls will not take any action for the change position command that initiated the event. If this property is false, the system will perform the default action based on the current [PositionBehavior](mediaplaybackcommandmanager_positionbehavior.md) setting.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybackcommandmanagerpositionreceivedeventargs.handled
     * @type {Boolean} 
     */
    Handled {
        get => this.get_Handled()
        set => this.put_Handled(value)
    }

    /**
     * Gets a value indicating the current playback position.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybackcommandmanagerpositionreceivedeventargs.position
     * @type {TimeSpan} 
     */
    Position {
        get => this.get_Position()
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
        if (!this.HasProp("__IMediaPlaybackCommandManagerPositionReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackCommandManagerPositionReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackCommandManagerPositionReceivedEventArgs := IMediaPlaybackCommandManagerPositionReceivedEventArgs(outPtr)
        }

        return this.__IMediaPlaybackCommandManagerPositionReceivedEventArgs.get_Handled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Handled(value) {
        if (!this.HasProp("__IMediaPlaybackCommandManagerPositionReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackCommandManagerPositionReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackCommandManagerPositionReceivedEventArgs := IMediaPlaybackCommandManagerPositionReceivedEventArgs(outPtr)
        }

        return this.__IMediaPlaybackCommandManagerPositionReceivedEventArgs.put_Handled(value)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_Position() {
        if (!this.HasProp("__IMediaPlaybackCommandManagerPositionReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackCommandManagerPositionReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackCommandManagerPositionReceivedEventArgs := IMediaPlaybackCommandManagerPositionReceivedEventArgs(outPtr)
        }

        return this.__IMediaPlaybackCommandManagerPositionReceivedEventArgs.get_Position()
    }

    /**
     * Gets a [Deferral](../windows.foundation/deferral.md) object that causes the system to wait for you to perform asynchronous operations, such as creating a new [MediaPlaybackItem](mediaplaybackitem.md) from a network source, before it continues processing the change position command.
     * @remarks
     * Call [Complete](../windows.foundation/deferral_complete_1807836922.md) when your asynchronous operations are complete to signal the system to continue.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybackcommandmanagerpositionreceivedeventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IMediaPlaybackCommandManagerPositionReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackCommandManagerPositionReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackCommandManagerPositionReceivedEventArgs := IMediaPlaybackCommandManagerPositionReceivedEventArgs(outPtr)
        }

        return this.__IMediaPlaybackCommandManagerPositionReceivedEventArgs.GetDeferral()
    }

;@endregion Instance Methods
}
