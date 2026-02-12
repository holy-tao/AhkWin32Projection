#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWebSocketClosedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for a closed event on a [MessageWebSocket](messagewebsocket.md), [StreamWebSocket](streamwebsocket.md), or [IWebSocket](iwebsocket.md) object.
 * @remarks
 * A WebSocketClosedEventArgs instance is created when the [MessageWebSocket.Closed](messagewebsocket_closed.md), [StreamWebSocket.Closed](streamwebsocket_closed.md), or [IWebSocket.Closed](iwebsocket_closed.md) event occurs.
 * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.websocketclosedeventargs
 * @namespace Windows.Networking.Sockets
 * @version WindowsRuntime 1.4
 */
class WebSocketClosedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWebSocketClosedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWebSocketClosedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets information about the reason that a WebSocket object was closed.
     * @remarks
     * Status codes in the range 0-999 are not used.
     * 
     * Status codes in the range 1000-2999 are reserved for definition by the [WebSocket protocol](https://tools.ietf.org/html/rfc6455#section-7.4).
     * 
     * Status codes in the range 3000-3999 are reserved for use by libraries, frameworks, and applications. These status codes are registered directly with IANA. The interpretation of these codes is undefined by the WebSocket protocol.
     * 
     * Status codes in the range 4000-4999 are reserved for private use and cannot be registered. Such codes can be used by prior agreements between WebSocket applications. The interpretation of these codes is undefined by the WebSocket protocol.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.websocketclosedeventargs.code
     * @type {Integer} 
     */
    Code {
        get => this.get_Code()
    }

    /**
     * Gets additional details about the reason that a WebSocket object was closed.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.websocketclosedeventargs.reason
     * @type {HSTRING} 
     */
    Reason {
        get => this.get_Reason()
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
        if (!this.HasProp("__IWebSocketClosedEventArgs")) {
            if ((queryResult := this.QueryInterface(IWebSocketClosedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebSocketClosedEventArgs := IWebSocketClosedEventArgs(outPtr)
        }

        return this.__IWebSocketClosedEventArgs.get_Code()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Reason() {
        if (!this.HasProp("__IWebSocketClosedEventArgs")) {
            if ((queryResult := this.QueryInterface(IWebSocketClosedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebSocketClosedEventArgs := IWebSocketClosedEventArgs(outPtr)
        }

        return this.__IWebSocketClosedEventArgs.get_Reason()
    }

;@endregion Instance Methods
}
