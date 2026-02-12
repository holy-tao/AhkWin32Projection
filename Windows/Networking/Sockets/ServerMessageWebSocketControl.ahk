#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IServerMessageWebSocketControl.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides socket control data on a [ServerMessageWebSocket](servermessagewebsocket.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.servermessagewebsocketcontrol
 * @namespace Windows.Networking.Sockets
 * @version WindowsRuntime 1.4
 */
class ServerMessageWebSocketControl extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IServerMessageWebSocketControl

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IServerMessageWebSocketControl.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets and sets the WebSocket message type to be configured on a [ServerMessageWebSocket](servermessagewebsocket.md) object for write operations.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.servermessagewebsocketcontrol.messagetype
     * @type {Integer} 
     */
    MessageType {
        get => this.get_MessageType()
        set => this.put_MessageType(value)
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
    get_MessageType() {
        if (!this.HasProp("__IServerMessageWebSocketControl")) {
            if ((queryResult := this.QueryInterface(IServerMessageWebSocketControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IServerMessageWebSocketControl := IServerMessageWebSocketControl(outPtr)
        }

        return this.__IServerMessageWebSocketControl.get_MessageType()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_MessageType(value) {
        if (!this.HasProp("__IServerMessageWebSocketControl")) {
            if ((queryResult := this.QueryInterface(IServerMessageWebSocketControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IServerMessageWebSocketControl := IServerMessageWebSocketControl(outPtr)
        }

        return this.__IServerMessageWebSocketControl.put_MessageType(value)
    }

;@endregion Instance Methods
}
