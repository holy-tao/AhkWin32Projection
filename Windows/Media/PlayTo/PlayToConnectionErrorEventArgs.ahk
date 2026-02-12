#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPlayToConnectionErrorEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides information about the [Error](playtoconnection_error.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.playto.playtoconnectionerroreventargs
 * @namespace Windows.Media.PlayTo
 * @version WindowsRuntime 1.4
 */
class PlayToConnectionErrorEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPlayToConnectionErrorEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPlayToConnectionErrorEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the error code for a Play To connection error.
     * @remarks
     * In Windows 8UWP apps, Code is always set to **DeviceError**.
     * 
     * In Windows 8.1UWP apps, Code is set to either **DeviceError** or **ProtectedPlaybackFailed**. This enables the app to determine if the failure is related to the media-protection status of the content. The app can continue playing the next item in the playlist or to stop. Apps can also use this new Code value to remove all protected music from the playlist.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playto.playtoconnectionerroreventargs.code
     * @type {Integer} 
     */
    Code {
        get => this.get_Code()
    }

    /**
     * Gets the error message for a Play To connection error.
     * @see https://learn.microsoft.com/uwp/api/windows.media.playto.playtoconnectionerroreventargs.message
     * @type {HSTRING} 
     */
    Message {
        get => this.get_Message()
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
    get_Code() {
        if (!this.HasProp("__IPlayToConnectionErrorEventArgs")) {
            if ((queryResult := this.QueryInterface(IPlayToConnectionErrorEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayToConnectionErrorEventArgs := IPlayToConnectionErrorEventArgs(outPtr)
        }

        return this.__IPlayToConnectionErrorEventArgs.get_Code()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Message() {
        if (!this.HasProp("__IPlayToConnectionErrorEventArgs")) {
            if ((queryResult := this.QueryInterface(IPlayToConnectionErrorEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayToConnectionErrorEventArgs := IPlayToConnectionErrorEventArgs(outPtr)
        }

        return this.__IPlayToConnectionErrorEventArgs.get_Message()
    }

;@endregion Instance Methods
}
