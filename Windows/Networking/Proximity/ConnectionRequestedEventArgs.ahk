#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IConnectionRequestedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains properties that are passed to an application with the [ConnectionRequested](peerfinder_connectionrequested.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.proximity.connectionrequestedeventargs
 * @namespace Windows.Networking.Proximity
 * @version WindowsRuntime 1.4
 */
class ConnectionRequestedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IConnectionRequestedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IConnectionRequestedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the information for a peer that's requesting a connection.
     * @remarks
     * Pass this reference to the [ConnectAsync](peerfinder_connectasync_380619906.md) method to accept the request.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.proximity.connectionrequestedeventargs.peerinformation
     * @type {PeerInformation} 
     */
    PeerInformation {
        get => this.get_PeerInformation()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {PeerInformation} 
     */
    get_PeerInformation() {
        if (!this.HasProp("__IConnectionRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IConnectionRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConnectionRequestedEventArgs := IConnectionRequestedEventArgs(outPtr)
        }

        return this.__IConnectionRequestedEventArgs.get_PeerInformation()
    }

;@endregion Instance Methods
}
