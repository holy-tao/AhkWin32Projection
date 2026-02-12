#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ITriggeredConnectionStateChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains properties that the [TriggeredConnectionStateChanged](peerfinder_triggeredconnectionstatechanged.md) event passes to an application.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.proximity.triggeredconnectionstatechangedeventargs
 * @namespace Windows.Networking.Proximity
 * @version WindowsRuntime 1.4
 */
class TriggeredConnectionStateChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITriggeredConnectionStateChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITriggeredConnectionStateChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the state of the connection in progress.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.proximity.triggeredconnectionstatechangedeventargs.state
     * @type {Integer} 
     */
    State {
        get => this.get_State()
    }

    /**
     * Gets the unique identifier for the connection in progress.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.proximity.triggeredconnectionstatechangedeventargs.id
     * @type {Integer} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * Gets the [StreamSocket](../windows.networking.sockets/streamsocket_streamsocket_1221375020.md) instance for the connection.
     * @remarks
     * The Socket property is null until a successful connection has been completed. When a successful connection is completed, [State](triggeredconnectionstatechangedeventargs_state.md) equals **Completed**.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.proximity.triggeredconnectionstatechangedeventargs.socket
     * @type {StreamSocket} 
     */
    Socket {
        get => this.get_Socket()
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
    get_State() {
        if (!this.HasProp("__ITriggeredConnectionStateChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(ITriggeredConnectionStateChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITriggeredConnectionStateChangedEventArgs := ITriggeredConnectionStateChangedEventArgs(outPtr)
        }

        return this.__ITriggeredConnectionStateChangedEventArgs.get_State()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Id() {
        if (!this.HasProp("__ITriggeredConnectionStateChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(ITriggeredConnectionStateChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITriggeredConnectionStateChangedEventArgs := ITriggeredConnectionStateChangedEventArgs(outPtr)
        }

        return this.__ITriggeredConnectionStateChangedEventArgs.get_Id()
    }

    /**
     * 
     * @returns {StreamSocket} 
     */
    get_Socket() {
        if (!this.HasProp("__ITriggeredConnectionStateChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(ITriggeredConnectionStateChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITriggeredConnectionStateChangedEventArgs := ITriggeredConnectionStateChangedEventArgs(outPtr)
        }

        return this.__ITriggeredConnectionStateChangedEventArgs.get_Socket()
    }

;@endregion Instance Methods
}
