#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IStreamSocketListenerInformation.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides socket information on a [StreamSocketListener](streamsocketlistener.md) object.
 * @remarks
 * The StreamSocketListenerInformation class retrieves information on a [StreamSocketListener](streamsocketlistener.md) and can be called any time after the [StreamSocketListener](streamsocketlistener.md) has been created.
 * 
 * A StreamSocketListenerInformation object is automatically created with the parent [StreamSocketListener](streamsocketlistener.md) object. The [StreamSocketListener.Information](streamsocketlistener_information.md) property provides access to the associated [StreamSocketListenerControl](streamsocketlistenercontrol.md) object.
 * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.streamsocketlistenerinformation
 * @namespace Windows.Networking.Sockets
 * @version WindowsRuntime 1.4
 */
class StreamSocketListenerInformation extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IStreamSocketListenerInformation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IStreamSocketListenerInformation.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Get the local TCP port number associated with a [StreamSocketListener](streamsocketlistener.md) object.
     * @remarks
     * The LocalPort property represents the local TCP port number bound to the [StreamSocketListener](streamsocketlistener.md) object.
     * 
     * An app can set the local service name or TCP port number by calling the [BindServiceNameAsync](streamsocketlistener_bindservicenameasync_1713574846.md) or [BindEndpointAsync](streamsocketlistener_bindendpointasync_1396029045.md) method on the [StreamSocketListener](streamsocketlistener.md). These methods will bind the [StreamSocketListener](streamsocketlistener.md) object to the specific local IP address and local UDP port number. After the bind completes, the [LocalPort](streamsocketinformation_localport.md) property contains the local TCP port number that the local service name resolved to.
     * 
     * The [BindEndpointAsync](streamsocketlistener_bindendpointasync_1396029045.md) method will bind the socket to a specific IP address or hostname and a specific local TCP port number or service name .
     * 
     * The [BindServiceNameAsync](streamsocketlistener_bindservicenameasync_1713574846.md) method will bind the socket to the specific TCP port number or service name. The system will determine the local IP address or hostname to associate with a [StreamSocketListener](streamsocketlistener.md) object.
     * 
     * After the initial bind operation completes, LocalPort is read only and cannot be changed by calling the [BindServiceNameAsync](streamsocketlistener_bindservicenameasync_1713574846.md) or [BindEndpointAsync](streamsocketlistener_bindendpointasync_1396029045.md) method again. The LocalPort property can be used at any time to get the local TCP port number associated with a [StreamSocketListener](streamsocketlistener.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.streamsocketlistenerinformation.localport
     * @type {HSTRING} 
     */
    LocalPort {
        get => this.get_LocalPort()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_LocalPort() {
        if (!this.HasProp("__IStreamSocketListenerInformation")) {
            if ((queryResult := this.QueryInterface(IStreamSocketListenerInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreamSocketListenerInformation := IStreamSocketListenerInformation(outPtr)
        }

        return this.__IStreamSocketListenerInformation.get_LocalPort()
    }

;@endregion Instance Methods
}
