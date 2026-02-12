#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRemoteSystemWatcherErrorOccurredEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Gets information about an **[ErrorOccurred](remotesystemwatcher_erroroccurred.md)** event, namely the **[RemoteSystemWatcherError](remotesystemwatchererror.md)** value describing the error.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemwatchererroroccurredeventargs
 * @namespace Windows.System.RemoteSystems
 * @version WindowsRuntime 1.4
 */
class RemoteSystemWatcherErrorOccurredEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRemoteSystemWatcherErrorOccurredEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRemoteSystemWatcherErrorOccurredEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The **[RemoteSystemWatcherError](remotesystemwatchererror.md)** value representing the error that occurred during discovery, causing the containing **[ErrorOccurred](remotesystemwatcher_erroroccurred.md)** event to be raised.
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotesystems.remotesystemwatchererroroccurredeventargs.error
     * @type {Integer} 
     */
    Error {
        get => this.get_Error()
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
    get_Error() {
        if (!this.HasProp("__IRemoteSystemWatcherErrorOccurredEventArgs")) {
            if ((queryResult := this.QueryInterface(IRemoteSystemWatcherErrorOccurredEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteSystemWatcherErrorOccurredEventArgs := IRemoteSystemWatcherErrorOccurredEventArgs(outPtr)
        }

        return this.__IRemoteSystemWatcherErrorOccurredEventArgs.get_Error()
    }

;@endregion Instance Methods
}
