#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMediaPlaybackCommandManagerNextReceivedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data or the [MediaPlaybackCommandManager.NextReceived](mediaplaybackcommandmanager_nextreceived.md) event, which occurs when the command manager receives a command from the **Next** button of the System Media Transport Controls.
 * @remarks
 * Get an instance of this class by handling the [MediaPlaybackCommandManager.NextReceived](mediaplaybackcommandmanager_nextreceived.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybackcommandmanagernextreceivedeventargs
 * @namespace Windows.Media.Playback
 * @version WindowsRuntime 1.4
 */
class MediaPlaybackCommandManagerNextReceivedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMediaPlaybackCommandManagerNextReceivedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMediaPlaybackCommandManagerNextReceivedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets a value indicating whether the [NextReceived](mediaplaybackcommandmanager_nextreceived.md) event has been handled.
     * @remarks
     * If you mark the event as handled by setting this property to true, the System Media Transport Controls will not take any action for the **Next** command that initiated the event. If this property is false, the system will perform the default action based on the current [NextBehavior](mediaplaybackcommandmanager_nextbehavior.md) setting.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybackcommandmanagernextreceivedeventargs.handled
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
        if (!this.HasProp("__IMediaPlaybackCommandManagerNextReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackCommandManagerNextReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackCommandManagerNextReceivedEventArgs := IMediaPlaybackCommandManagerNextReceivedEventArgs(outPtr)
        }

        return this.__IMediaPlaybackCommandManagerNextReceivedEventArgs.get_Handled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Handled(value) {
        if (!this.HasProp("__IMediaPlaybackCommandManagerNextReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackCommandManagerNextReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackCommandManagerNextReceivedEventArgs := IMediaPlaybackCommandManagerNextReceivedEventArgs(outPtr)
        }

        return this.__IMediaPlaybackCommandManagerNextReceivedEventArgs.put_Handled(value)
    }

    /**
     * Gets a [Deferral](../windows.foundation/deferral.md) object that causes the system to wait for you to perform asynchronous operations, such as creating a new [MediaPlaybackItem](mediaplaybackitem.md) from a network source, before it continues processing the **Next** command.
     * @remarks
     * Call [Complete](../windows.foundation/deferral_complete_1807836922.md) when your asynchronous operations are complete to signal the system to continue.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.playback.mediaplaybackcommandmanagernextreceivedeventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IMediaPlaybackCommandManagerNextReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMediaPlaybackCommandManagerNextReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaPlaybackCommandManagerNextReceivedEventArgs := IMediaPlaybackCommandManagerNextReceivedEventArgs(outPtr)
        }

        return this.__IMediaPlaybackCommandManagerNextReceivedEventArgs.GetDeferral()
    }

;@endregion Instance Methods
}
