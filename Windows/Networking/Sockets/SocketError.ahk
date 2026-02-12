#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISocketErrorStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides socket error status for operations on a [DatagramSocket](datagramsocket.md), [StreamSocket](streamsocket.md), or [StreamSocketListener](streamsocketlistener.md).
 * @remarks
 * An error encountered on socket operation is returned as **HRESULT** value. The [GetStatus](socketerror_getstatus_1856274933.md) method on the SocketError object is used to convert an error from a socket operation to a [SocketErrorStatus](socketerrorstatus.md) enumeration value. Most of the [SocketErrorStatus](socketerrorstatus.md) enumeration values correspond to an error returned by the native Windows sockets operation.
 * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.socketerror
 * @namespace Windows.Networking.Sockets
 * @version WindowsRuntime 1.4
 */
class SocketError extends IInspectable {
;@region Static Methods
    /**
     * Gets a [SocketErrorStatus](socketerrorstatus.md) value based on an error encountered by a socket operation.
     * @remarks
     * An error encountered on socket operation is returned as **HRESULT** value. The GetStatus method is used to convert an error from a socket operation to a [SocketErrorStatus](socketerrorstatus.md) enumeration value. Most of the [SocketErrorStatus](socketerrorstatus.md) enumeration values correspond to an error returned by the native Windows sockets operation.
     * 
     * The [SocketError](socketerror.md) object and the GetStatus method would be used when the developer wants to programmatically handle errors that occur during the operation of an app.
     * @param {Integer} hresult_ The error encountered by a socket operation represented as an **HRESULT**.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.socketerror.getstatus
     */
    static GetStatus(hresult_) {
        if (!SocketError.HasProp("__ISocketErrorStatics")) {
            activatableClassId := HSTRING.Create("Windows.Networking.Sockets.SocketError")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISocketErrorStatics.IID)
            SocketError.__ISocketErrorStatics := ISocketErrorStatics(factoryPtr)
        }

        return SocketError.__ISocketErrorStatics.GetStatus(hresult_)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
