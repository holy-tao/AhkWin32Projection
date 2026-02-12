#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWebSocketErrorStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides socket error status on a [MessageWebSocket](messagewebsocket.md) or [StreamWebSocket](streamwebsocket.md) object.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.websocketerror
 * @namespace Windows.Networking.Sockets
 * @version WindowsRuntime 1.4
 */
class WebSocketError extends IInspectable {
;@region Static Methods
    /**
     * Gets a [WebErrorStatus](../windows.web/weberrorstatus.md) value based on an error encountered by a WebSocket operation.
     * @remarks
     * An error encountered on a WebSocket operation is returned as **HRESULT** value. The GetStatus method is used to convert an error from a WebSocket operation to a [WebErrorStatus](../windows.web/weberrorstatus.md) enumeration value. This can be useful for handling errors programmatically.
     * @param {Integer} hresult_ The error encountered by a WebSocket operation represented as an **HRESULT**.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.websocketerror.getstatus
     */
    static GetStatus(hresult_) {
        if (!WebSocketError.HasProp("__IWebSocketErrorStatics")) {
            activatableClassId := HSTRING.Create("Windows.Networking.Sockets.WebSocketError")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWebSocketErrorStatics.IID)
            WebSocketError.__IWebSocketErrorStatics := IWebSocketErrorStatics(factoryPtr)
        }

        return WebSocketError.__IWebSocketErrorStatics.GetStatus(hresult_)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
