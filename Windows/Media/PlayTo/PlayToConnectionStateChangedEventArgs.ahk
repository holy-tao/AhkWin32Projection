#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPlayToConnectionStateChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides information about the [StateChanged](playtoconnection_statechanged.md) event.
 * @remarks
 * For an example of how to use Play To in an application, see [PlayReady DRM](/windows/uwp/audio-video-camera/playready-client-sdk).
 * @see https://learn.microsoft.com/uwp/api/windows.media.playto.playtoconnectionstatechangedeventargs
 * @namespace Windows.Media.PlayTo
 * @version WindowsRuntime 1.4
 */
class PlayToConnectionStateChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPlayToConnectionStateChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPlayToConnectionStateChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the previous state before the Play To connection state was changed.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playto.playtoconnectionstatechangedeventargs.previousstate
     * @type {Integer} 
     */
    PreviousState {
        get => this.get_PreviousState()
    }

    /**
     * Gets the current state after the Play To connection state has changed.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playto.playtoconnectionstatechangedeventargs.currentstate
     * @type {Integer} 
     */
    CurrentState {
        get => this.get_CurrentState()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PreviousState() {
        if (!this.HasProp("__IPlayToConnectionStateChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPlayToConnectionStateChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayToConnectionStateChangedEventArgs := IPlayToConnectionStateChangedEventArgs(outPtr)
        }

        return this.__IPlayToConnectionStateChangedEventArgs.get_PreviousState()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CurrentState() {
        if (!this.HasProp("__IPlayToConnectionStateChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPlayToConnectionStateChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayToConnectionStateChangedEventArgs := IPlayToConnectionStateChangedEventArgs(outPtr)
        }

        return this.__IPlayToConnectionStateChangedEventArgs.get_CurrentState()
    }

;@endregion Instance Methods
}
