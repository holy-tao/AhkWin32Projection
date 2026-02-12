#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPlayToConnectionTransferredEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides information about the [Transferred](playtoconnection_transferred.md) event.
 * @remarks
 * For an example of how to use Play To in an application, see [PlayReady DRM](/windows/uwp/audio-video-camera/playready-client-sdk).
 * @see https://learn.microsoft.com/uwp/api/windows.media.playto.playtoconnectiontransferredeventargs
 * @namespace Windows.Media.PlayTo
 * @version WindowsRuntime 1.4
 */
class PlayToConnectionTransferredEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPlayToConnectionTransferredEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPlayToConnectionTransferredEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the previous Play To source that a connection was transferred from.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playto.playtoconnectiontransferredeventargs.previoussource
     * @type {PlayToSource} 
     */
    PreviousSource {
        get => this.get_PreviousSource()
    }

    /**
     * Gets the current Play To source that a connection was transferred to.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playto.playtoconnectiontransferredeventargs.currentsource
     * @type {PlayToSource} 
     */
    CurrentSource {
        get => this.get_CurrentSource()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {PlayToSource} 
     */
    get_PreviousSource() {
        if (!this.HasProp("__IPlayToConnectionTransferredEventArgs")) {
            if ((queryResult := this.QueryInterface(IPlayToConnectionTransferredEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayToConnectionTransferredEventArgs := IPlayToConnectionTransferredEventArgs(outPtr)
        }

        return this.__IPlayToConnectionTransferredEventArgs.get_PreviousSource()
    }

    /**
     * 
     * @returns {PlayToSource} 
     */
    get_CurrentSource() {
        if (!this.HasProp("__IPlayToConnectionTransferredEventArgs")) {
            if ((queryResult := this.QueryInterface(IPlayToConnectionTransferredEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayToConnectionTransferredEventArgs := IPlayToConnectionTransferredEventArgs(outPtr)
        }

        return this.__IPlayToConnectionTransferredEventArgs.get_CurrentSource()
    }

;@endregion Instance Methods
}
