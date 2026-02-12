#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IStreamSocketListenerConnectionReceivedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for a [ConnectionReceived](streamsocketlistener_connectionreceived.md) event on a [StreamSocketListener](streamsocketlistener.md) object.
 * @remarks
 * The StreamSocketListenerConnectionReceivedEventArgs is used to receive connection data on a [StreamSocketListener](streamsocketlistener.md) object.
 * 
 * The [StreamSocketListener.BindServiceNameAsync](streamsocketlistener_bindservicenameasync_1713574846.md) or [StreamSocketListener.BindEndpointAsync](streamsocketlistener_bindendpointasync_1396029045.md) method is used to bind a [StreamSocketListener](streamsocketlistener.md) to a local service name or TCP port.
 * 
 * A [StreamSocketListener.ConnectionReceived](streamsocketlistener_connectionreceived.md) event occurs if a [StreamSocketListener](streamsocketlistener.md) object has been bound to a local service name or TCP port and a connection is received. A StreamSocketListenerConnectionReceivedEventArgs instance is a parameter specified in the callback.
 * 
 * **Note** From the perspective of a **StreamSocket**, a Parallel Patterns Library (PPL) completion handler is done executing (and the socket is eligible for disposal) before the continuation body runs. So, to keep your socket from being disposed if you want to use it inside a continuation, you'll need to use one of the techniques described in [References to StreamSockets in C++ PPL continuations](/windows/uwp/networking/sockets#references-to-streamsockets-in-c-ppl-continuations).
 * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.streamsocketlistenerconnectionreceivedeventargs
 * @namespace Windows.Networking.Sockets
 * @version WindowsRuntime 1.4
 */
class StreamSocketListenerConnectionReceivedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IStreamSocketListenerConnectionReceivedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IStreamSocketListenerConnectionReceivedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The [StreamSocket](streamsocket.md) object created when a connection is received by the [StreamSocketListener](streamsocketlistener.md) object.
     * @remarks
     * **Note** From the perspective of a **StreamSocket**, a Parallel Patterns Library (PPL) completion handler is done executing (and the socket is eligible for disposal) before the continuation body runs. So, to keep your socket from being disposed if you want to use it inside a continuation, you'll need to use one of the techniques described in [References to StreamSockets in C++ PPL continuations](/windows/uwp/networking/sockets#references-to-streamsockets-in-c-ppl-continuations).
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.streamsocketlistenerconnectionreceivedeventargs.socket
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
     * @returns {StreamSocket} 
     */
    get_Socket() {
        if (!this.HasProp("__IStreamSocketListenerConnectionReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IStreamSocketListenerConnectionReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreamSocketListenerConnectionReceivedEventArgs := IStreamSocketListenerConnectionReceivedEventArgs(outPtr)
        }

        return this.__IStreamSocketListenerConnectionReceivedEventArgs.get_Socket()
    }

;@endregion Instance Methods
}
