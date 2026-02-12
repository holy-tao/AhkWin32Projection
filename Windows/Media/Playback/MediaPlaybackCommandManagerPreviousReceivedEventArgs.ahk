#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMediaPlaybackCommandManagerPreviousReceivedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data or the [MediaPlaybackCommandManager.PreviousReceived](mediaplaybackcommandmanager_previousreceived.md) event, which occurs when the command manager receives a command from the **Play** button of the System Media Transport Controls.
 * @remarks
 * Get an instance of this class by handling the [MediaPlaybackCommandManager.PreviousReceived](mediaplaybackcommandmanager_previousreceived.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybackcommandmanagerpreviousreceivedeventargs
 * @namespace Windows.Media.Playback
 * @version WindowsRuntime 1.4
 */
class MediaPlaybackCommandManagerPreviousReceivedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMediaPlaybackCommandManagerPreviousReceivedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMediaPlaybackCommandManagerPreviousReceivedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets a value indicating whether the [PreviousReceived](mediaplaybackcommandmanager_previousreceived.md) event has been handled.
     * @remarks
     * If you mark the event as handled by setting this property to true, the System Media Transport Controls will not take any action for the **Previous** command that initiated the event. If this property is false, the system will perform the default action based on the current [PreviousBehavior](mediaplaybackcommandmanager_previousbehavior.md) setting.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybackcommandmanagerpreviousreceivedeventargs.handled
     * @type {Boolean} 
     */
    Handled {
        get => this.get_Handled()
        set => this.put_Handled(value)
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
        if (!this.HasProp("__IMediaPlaybackCommandManagerPreviousReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackCommandManagerPreviousReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackCommandManagerPreviousReceivedEventArgs := IMediaPlaybackCommandManagerPreviousReceivedEventArgs(outPtr)
        }

        return this.__IMediaPlaybackCommandManagerPreviousReceivedEventArgs.get_Handled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Handled(value) {
        if (!this.HasProp("__IMediaPlaybackCommandManagerPreviousReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackCommandManagerPreviousReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackCommandManagerPreviousReceivedEventArgs := IMediaPlaybackCommandManagerPreviousReceivedEventArgs(outPtr)
        }

        return this.__IMediaPlaybackCommandManagerPreviousReceivedEventArgs.put_Handled(value)
    }

    /**
     * Gets a [Deferral](../windows.foundation/deferral.md) object that causes the system to wait for you to perform asynchronous operations, such as creating a new [MediaPlaybackItem](mediaplaybackitem.md) from a network source, before it continues processing the **Previous** command.
     * @remarks
     * Call [Complete](../windows.foundation/deferral_complete_1807836922.md) when your asynchronous operations are complete to signal the system to continue.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybackcommandmanagerpreviousreceivedeventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IMediaPlaybackCommandManagerPreviousReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackCommandManagerPreviousReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackCommandManagerPreviousReceivedEventArgs := IMediaPlaybackCommandManagerPreviousReceivedEventArgs(outPtr)
        }

        return this.__IMediaPlaybackCommandManagerPreviousReceivedEventArgs.GetDeferral()
    }

;@endregion Instance Methods
}
