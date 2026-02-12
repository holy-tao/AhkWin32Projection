#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IStreamSocketListener.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include .\IStreamSocketListener2.ahk
#Include .\IStreamSocketListener3.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\StreamSocketListener.ahk
#Include .\StreamSocketListenerConnectionReceivedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Supports listening for an incoming network connection using a TCP stream socket or Bluetooth RFCOMM.
 * @remarks
 * The StreamSocketListener class supports listening for an incoming network connection using a stream socket and accepting the connection.
 * 
 * The typical order of operations is as follows:
 * 
 * + Create the StreamSocketListener.
 * + Use the [Control](streamsocketlistener_control.md) property to retrieve a [StreamSocketListenerControl](streamsocketlistenercontrol.md) object and set the socket quality of service required.
 * + Assign the [ConnectionReceived](streamsocketlistener_connectionreceived.md) event to an event handler.
 * + Call the [BindServiceNameAsync](streamsocketlistener_bindservicenameasync_1713574846.md) or [BindEndpointAsync](streamsocketlistener_bindendpointasync_1396029045.md) method to bind to a local TCP port number or service name. For Bluetooth RFCOMM, the local service name parameter is the Bluetooth Service ID.
 * + When a connection is received, use the [StreamSocketListenerConnectionReceivedEventArgs](streamsocketlistenerconnectionreceivedeventargs.md) object to retrieve the [Socket](streamsocketlistenerconnectionreceivedeventargs_socket.md) property with the [StreamSocket](streamsocket.md) object created.
 * + Use the [StreamSocket](streamsocket.md) object to send and receive data.
 * + Call the [Close](streamsocketlistener_close_811482585.md) method to stop listening for and accepting incoming network connections and release all unmanaged resources associated with the StreamSocketListener object. Any [StreamSocket](streamsocket.md) objects created when a connection is received are unaffected and can continue to be used as needed.
 * 
 * The [SocketProtectionLevel](socketprotectionlevel.md) enumeration allows a server to control protocol negotiation with clients when using the StreamSocketListener object to listen and bind to sockets over Bluetooth. When the StreamSocketListener object is used over Bluetooth, the supported [SocketProtectionLevel](socketprotectionlevel.md) values are **PlainSocket**, **BluetoothEncryptionAllowNullAuthentication**, or **BluetoothEncryptionWithAuthentication**. When the StreamSocketListener object is used to listen and bind to sockets not using Bluetooth, the only supported [SocketProtectionLevel](socketprotectionlevel.md) value is **PlainSocket**.
 * 
 * To use StreamSocketListener with Bluetooth, the **bluetooth.rfcomm** device capability must be set in the app manifest. For more information, see [How to specify device capabilities for Bluetooth](/uwp/schemas/appxpackage/how-to-specify-device-capabilities-for-bluetooth).
 * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.streamsocketlistener
 * @namespace Windows.Networking.Sockets
 * @version WindowsRuntime 1.4
 */
class StreamSocketListener extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IStreamSocketListener

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IStreamSocketListener.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets socket control data on a [StreamSocketListener](streamsocketlistener.md) object.
     * @remarks
     * The Control property gets the [StreamSocketListenerControl](streamsocketlistenercontrol.md) instance associated with a [StreamSocketListener](streamsocketlistener.md) object.
     * 
     * A [StreamSocketListenerControl](streamsocketlistenercontrol.md) object is automatically created with the parent [StreamSocketListener](streamsocketlistener.md) object. The [StreamSocketListenerControl](streamsocketlistenercontrol.md) instance can then be used to get or set control data used by the [StreamSocketListener](streamsocketlistener.md) object. These properties on the [StreamSocketControl](streamsocketcontrol.md) instance include the following:
     * 
     * 
     * + [QualityOfService](streamsocketlistenercontrol_qualityofservice.md) - The quality of service to be set on a [StreamSocket](streamsocket.md) object created when a connection is received by the [StreamSocketListener](streamsocketlistener.md) object.
     * 
     * 
     * Any changes to the [StreamSocketListenerControl](streamsocketlistenercontrol.md) property values must be set before the [StreamSocketListener](streamsocketlistener.md) is bound. So changes to the [QualityOfService](streamsocketlistenercontrol_qualityofservice.md) property must be set before the [BindServiceNameAsync](streamsocketlistener_bindservicenameasync_1713574846.md) or [BindEndpointAsync](streamsocketlistener_bindendpointasync_1396029045.md) method is called on the [StreamSocketListener](streamsocketlistener.md).
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.streamsocketlistener.control
     * @type {StreamSocketListenerControl} 
     */
    Control {
        get => this.get_Control()
    }

    /**
     * Gets socket information for the [StreamSocketListener](streamsocketlistener.md) object.
     * @remarks
     * The [Information](datagramsocket_bindendpointasync_1396029045.md) property gets the [StreamSocketListenerInformation](streamsocketlistenerinformation.md) instance associated with a [StreamSocketListener](streamsocketlistener.md) object. The [Information](datagramsocket_bindendpointasync_1396029045.md) instance can then be used to get information used by the [StreamSocketListener](streamsocketlistener.md). The only information data supported is the [LocalPort](streamsocketlistenerinformation_localport.md) property which represents the local TCP port number bound to the [StreamSocketListener](streamsocketlistener.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.streamsocketlistener.information
     * @type {StreamSocketListenerInformation} 
     */
    Information {
        get => this.get_Information()
    }

    /**
     * An event that indicates that a connection was received on the [StreamSocketListener](streamsocketlistener.md) object.
     * @remarks
     * To listen for a connection on the [StreamSocketListener](streamsocketlistener.md) object, an app must assign the [ConnectionReceived](datagramsocket_messagereceived.md) event to an event handler and then call either the [BindEndpointAsync](streamsocketlistener_bindendpointasync_1396029045.md) or [BindServiceNameAsync](streamsocketlistener_bindservicenameasync_1713574846.md) method to bind the [StreamSocketListener](streamsocketlistener.md) to a local service name or TCP port on which to listen. To listen for Bluetooth RFCOMM, the bind is to the Bluetooth Service ID.
     * 
     * **Note** From the perspective of a **StreamSocket**, a Parallel Patterns Library (PPL) completion handler is done executing (and the socket is eligible for disposal) before the continuation body runs. So, to keep your socket from being disposed if you want to use it inside a continuation, you'll need to use one of the techniques described in [References to StreamSockets in C++ PPL continuations](/windows/uwp/networking/sockets#references-to-streamsockets-in-c-ppl-continuations).
     * @type {TypedEventHandler<StreamSocketListener, StreamSocketListenerConnectionReceivedEventArgs>}
    */
    OnConnectionReceived {
        get {
            if(!this.HasProp("__OnConnectionReceived")){
                this.__OnConnectionReceived := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{33d00d41-c94f-5a61-9ab7-280dcefa0b08}"),
                    StreamSocketListener,
                    StreamSocketListenerConnectionReceivedEventArgs
                )
                this.__OnConnectionReceivedToken := this.add_ConnectionReceived(this.__OnConnectionReceived.iface)
            }
            return this.__OnConnectionReceived
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new [StreamSocketListener](streamsocketlistener.md) object.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Networking.Sockets.StreamSocketListener")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnConnectionReceivedToken")) {
            this.remove_ConnectionReceived(this.__OnConnectionReceivedToken)
            this.__OnConnectionReceived.iface.Dispose()
        }

        this.Close()

        super.__Delete()
    }

    /**
     * 
     * @returns {StreamSocketListenerControl} 
     */
    get_Control() {
        if (!this.HasProp("__IStreamSocketListener")) {
            if ((queryResult := this.QueryInterface(IStreamSocketListener.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreamSocketListener := IStreamSocketListener(outPtr)
        }

        return this.__IStreamSocketListener.get_Control()
    }

    /**
     * 
     * @returns {StreamSocketListenerInformation} 
     */
    get_Information() {
        if (!this.HasProp("__IStreamSocketListener")) {
            if ((queryResult := this.QueryInterface(IStreamSocketListener.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreamSocketListener := IStreamSocketListener(outPtr)
        }

        return this.__IStreamSocketListener.get_Information()
    }

    /**
     * Starts a bind operation on a [StreamSocketListener](streamsocketlistener.md) to a local service name with a specified [SocketProtectionLevel](socketprotectionlevel.md) to set on any bound sockets.
     * @remarks
     * The [BindServiceNameAsync(String, SocketProtectionLevel) method binds to the local IP addresses of all network interfaces on the local computer and to the local service name or TCP port specified in the *localServiceName* parameter. For Bluetooth RFCOMM, this method binds to the Bluetooth Service ID specified in the *localServiceName* parameter on all Bluetooth interfaces. This method sets the protection level for encryption on any bound sockets to the *protectionLevel* parameter.
     * 
     * If the *localServiceName* parameter is an empty string, then the system will select the local TCP port on which to bind. A Bluetooth Service ID must be supplied to bind for Bluetooth.
     * 
     * The [BindServiceNameAsync(String, SocketProtectionLevel) method will fail if another app (another [StreamSocketListener](streamsocketlistener.md), for example) has already been bound to the local TCP port or Bluetooth Service ID specified in the *localServiceName* parameter.
     * 
     * The *protectionLevel* parameter must be set to **PlainSocket** for all sockets except those used over Bluetooth. When the socket is to be used over Bluetooth, the *protectionLevel* parameter can be set to **PlainSocket**, **BluetoothEncryptionAllowNullAuthentication**, or **BluetoothEncryptionWithAuthentication**. For more information, see the [SocketProtectionLevel](socketprotectionlevel.md) enumeration.
     * @param {HSTRING} localServiceName The local service name or TCP port on which to bind the [StreamSocketListener](streamsocketlistener.md) object. For Bluetooth RFCOMM, this parameter is the Bluetooth Service ID.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.streamsocketlistener.bindservicenameasync
     */
    BindServiceNameAsync(localServiceName) {
        if (!this.HasProp("__IStreamSocketListener")) {
            if ((queryResult := this.QueryInterface(IStreamSocketListener.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreamSocketListener := IStreamSocketListener(outPtr)
        }

        return this.__IStreamSocketListener.BindServiceNameAsync(localServiceName)
    }

    /**
     * Starts a bind operation on a [StreamSocketListener](streamsocketlistener.md) to a local hostname and a local service name.
     * @remarks
     * The BindEndpointAsync method binds a [StreamSocketListener](streamsocketlistener.md) object to a specific hostname or IP address specified in the *localHostName* parameter and the local service name or TCP port specified in the *localServiceName* parameter. If the *localHostName* parameter is null, then the system will select the local IP address to bind to the [StreamSocketListener](streamsocketlistener.md) object . If the *localServiceName* parameter contains an empty string, then the system will select the local TCP port to bind to the [StreamSocketListener](streamsocketlistener.md) object.
     * 
     * The BindEndpointAsync method will fail if another app using TCP (another [StreamSocketListener](streamsocketlistener.md), for example) has already been bound to the local IP address and TCP port specified in the *localHostName* and *localServiceName* parameters.
     * @param {HostName} localHostName The local hostname or IP address on which to bind the [StreamSocketListener](streamsocketlistener.md) object.
     * @param {HSTRING} localServiceName The local service name or TCP port on which to bind the [StreamSocketListener](streamsocketlistener.md) object.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.streamsocketlistener.bindendpointasync
     */
    BindEndpointAsync(localHostName, localServiceName) {
        if (!this.HasProp("__IStreamSocketListener")) {
            if ((queryResult := this.QueryInterface(IStreamSocketListener.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreamSocketListener := IStreamSocketListener(outPtr)
        }

        return this.__IStreamSocketListener.BindEndpointAsync(localHostName, localServiceName)
    }

    /**
     * 
     * @param {TypedEventHandler<StreamSocketListener, StreamSocketListenerConnectionReceivedEventArgs>} eventHandler 
     * @returns {EventRegistrationToken} 
     */
    add_ConnectionReceived(eventHandler) {
        if (!this.HasProp("__IStreamSocketListener")) {
            if ((queryResult := this.QueryInterface(IStreamSocketListener.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreamSocketListener := IStreamSocketListener(outPtr)
        }

        return this.__IStreamSocketListener.add_ConnectionReceived(eventHandler)
    }

    /**
     * 
     * @param {EventRegistrationToken} eventCookie 
     * @returns {HRESULT} 
     */
    remove_ConnectionReceived(eventCookie) {
        if (!this.HasProp("__IStreamSocketListener")) {
            if ((queryResult := this.QueryInterface(IStreamSocketListener.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreamSocketListener := IStreamSocketListener(outPtr)
        }

        return this.__IStreamSocketListener.remove_ConnectionReceived(eventCookie)
    }

    /**
     * Closes the [StreamSocketListener](streamsocketlistener.md) object.
     * @remarks
     * The Close method aborts any pending operations and releases all unmanaged resources associated with the [StreamSocketListener](streamsocketlistener.md) object.
     * 
     * The Close method is used by Windows app using JavaScript. For apps written using the .NET Framework 4.5 in C# and VB.NET, the Close method is exposed as the  method on the [StreamSocketListener](streamsocketlistener.md) object. For apps written in C++, the Close method will be called when using the delete keyword on the object.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.streamsocketlistener.close
     */
    Close() {
        if (!this.HasProp("__IClosable")) {
            if ((queryResult := this.QueryInterface(IClosable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClosable := IClosable(outPtr)
        }

        return this.__IClosable.Close()
    }

    /**
     * Starts a socket bind operation on a [StreamSocketListener](streamsocketlistener.md) to a local service name on a specified network adapter with a specified [SocketProtectionLevel](socketprotectionlevel.md) to set on any bound sockets.
     * @remarks
     * The [BindServiceNameAsync(String, SocketProtectionLevel, NetworkAdapter) method binds to the local service name or TCP port specified in the *localServiceName* parameter on the network adapter specified in the *adapter* parameter on the local computer. For Bluetooth RFCOMM, this method binds to the Bluetooth Service ID specified in the *localServiceName* parameter if the *adapter* parameter is **null**. A Bluetooth Service ID must be supplied to bind for Bluetooth. If a network adapter is specified in the *adapter* parameter and the *localServiceName* parameter contains a Bluetooth Service ID, then this method will fail.
     * 
     * This method sets the protection level for encryption on any bound sockets to the *protectionLevel* parameter.
     * 
     * If the *localServiceName* parameter is an empty string, then the system will select the local TCP port on which to bind. If the *adapter* parameter is **null** for a TCP socket bind, an error will occur.
     * 
     * The name resolution mechanism used by the [BindServiceNameAsync(String, SocketProtectionLevel, NetworkAdapter) method is limited to the specified interface for the domain name system (DNS) namespace.
     * 
     * The [BindServiceNameAsync(String, SocketProtectionLevel, NetworkAdapter) method will fail if another app (another [StreamSocketListener](streamsocketlistener.md), for example) has already been bound to the local TCP port specified in the *localServiceName* parameter on the network adapter specified in the *adapter* parameter. For Bluetooth, this method will fail if another app (another [StreamSocketListener](streamsocketlistener.md), for example) has already been bound to the Bluetooth Service ID specified in the *localServiceName* parameter.
     * 
     * Using the specified network adapter is on a best-effort basis. A system with adapters configured in weak-host or forwarding modes may use an adapter other than the specified adapter.
     * 
     * The *protectionLevel* parameter must be set to **PlainSocket** for all sockets except those used over Bluetooth. When the socket is to be used over Bluetooth, the *protectionLevel* parameter can be set to **PlainSocket**, **BluetoothEncryptionAllowNullAuthentication**, or **BluetoothEncryptionWithAuthentication**. For more information, see the [SocketProtectionLevel](socketprotectionlevel.md) enumeration.
     * @param {HSTRING} localServiceName The local service name or TCP port on which to bind the [StreamSocketListener](streamsocketlistener.md) object. For Bluetooth RFCOMM, this parameter is the Bluetooth Service ID.
     * @param {Integer} protectionLevel The protection level for encryption to set on any bound sockets.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.streamsocketlistener.bindservicenameasync
     */
    BindServiceNameWithProtectionLevelAsync(localServiceName, protectionLevel) {
        if (!this.HasProp("__IStreamSocketListener2")) {
            if ((queryResult := this.QueryInterface(IStreamSocketListener2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreamSocketListener2 := IStreamSocketListener2(outPtr)
        }

        return this.__IStreamSocketListener2.BindServiceNameWithProtectionLevelAsync(localServiceName, protectionLevel)
    }

    /**
     * Starts a bind operation on a [StreamSocketListener](streamsocketlistener.md) to a local service name.
     * @remarks
     * The BindServiceNameAsync(String) method binds to the local IP addresses of all network interfaces on the local computer and to the local service name or TCP port specified in the *localServiceName* parameter. If the *localServiceName* parameter is an empty string, then the system will select the local TCP port on which to bind.
     * 
     * For Bluetooth RFCOMM, this method binds to the Bluetooth Service ID specified in the *localServiceName* parameter on all Bluetooth interfaces. A Bluetooth Service ID must be supplied to bind for Bluetooth.
     * 
     * The BindServiceNameAsync(String) method will fail if another app (another [StreamSocketListener](streamsocketlistener.md), for example) has already been bound to the local TCP port or Bluetooth Service ID specified in the *localServiceName* parameter.
     * @param {HSTRING} localServiceName The local service name or TCP port on which to bind the [StreamSocketListener](streamsocketlistener.md) object. For Bluetooth RFCOMM, this parameter is the Bluetooth Service ID.
     * @param {Integer} protectionLevel 
     * @param {NetworkAdapter} adapter_ 
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.streamsocketlistener.bindservicenameasync
     */
    BindServiceNameWithProtectionLevelAndAdapterAsync(localServiceName, protectionLevel, adapter_) {
        if (!this.HasProp("__IStreamSocketListener2")) {
            if ((queryResult := this.QueryInterface(IStreamSocketListener2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreamSocketListener2 := IStreamSocketListener2(outPtr)
        }

        return this.__IStreamSocketListener2.BindServiceNameWithProtectionLevelAndAdapterAsync(localServiceName, protectionLevel, adapter_)
    }

    /**
     * Cancels pending reads and writes over a [StreamSocketListener](streamsocketlistener.md) object.
     * @remarks
     * Call CancelIOAsync to cancel any pending reads or writes on this socket before you call [TransferOwnership](/uwp/api/windows.networking.sockets.streamsocketlistener.transferownership) when your app is about to be suspended.
     * 
     * 
     * 
     * > [!NOTE]
     * > CancelIOAsync cancels pending writes and reads in the Windows Runtime, but if there is a write buffer pending in networking drivers, it flushes the write.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.streamsocketlistener.cancelioasync
     */
    CancelIOAsync() {
        if (!this.HasProp("__IStreamSocketListener3")) {
            if ((queryResult := this.QueryInterface(IStreamSocketListener3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreamSocketListener3 := IStreamSocketListener3(outPtr)
        }

        return this.__IStreamSocketListener3.CancelIOAsync()
    }

    /**
     * Enables your app's background task to be triggered by the socket broker when traffic for this [StreamSocketListener](streamsocketlistener.md) arrives while the app is not active.
     * @param {Guid} taskId The [IBackgroundTaskRegistration.TaskId](../windows.applicationmodel.background/ibackgroundtaskregistration_taskid.md) of the background task that will be triggered by the socket broker when traffic arrives for this [StreamSocketListener](streamsocketlistener.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.streamsocketlistener.enabletransferownership
     */
    EnableTransferOwnership(taskId) {
        if (!this.HasProp("__IStreamSocketListener3")) {
            if ((queryResult := this.QueryInterface(IStreamSocketListener3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreamSocketListener3 := IStreamSocketListener3(outPtr)
        }

        return this.__IStreamSocketListener3.EnableTransferOwnership(taskId)
    }

    /**
     * Enables your app's background task to be triggered by the socket broker when traffic for this [StreamSocketListener](streamsocketlistener.md) arrives while the system is in connected standby.
     * @param {Guid} taskId The [IBackgroundTaskRegistration.TaskId](../windows.applicationmodel.background/ibackgroundtaskregistration_taskid.md) of the background task that will be triggered by the socket broker when traffic arrives for this [StreamSocketListener](streamsocketlistener.md).
     * @param {Integer} connectedStandbyAction Specifies whether to enable or disable the activation of the background task when traffic arrives.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.streamsocketlistener.enabletransferownership
     */
    EnableTransferOwnershipWithConnectedStandbyAction(taskId, connectedStandbyAction) {
        if (!this.HasProp("__IStreamSocketListener3")) {
            if ((queryResult := this.QueryInterface(IStreamSocketListener3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreamSocketListener3 := IStreamSocketListener3(outPtr)
        }

        return this.__IStreamSocketListener3.EnableTransferOwnershipWithConnectedStandbyAction(taskId, connectedStandbyAction)
    }

    /**
     * Transfers ownership of the [StreamSocketListener](streamsocketlistener.md) to the socket brokering service, which monitors socket activity and notifies the app through a background task if there is any activity.
     * @param {HSTRING} socketId A string the app uses to identify the transferred socket. The string should identify this socket uniquely within the app. When activity occurs on this socket, this string will be provided to the app to identify the socket.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.streamsocketlistener.transferownership
     */
    TransferOwnership(socketId) {
        if (!this.HasProp("__IStreamSocketListener3")) {
            if ((queryResult := this.QueryInterface(IStreamSocketListener3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreamSocketListener3 := IStreamSocketListener3(outPtr)
        }

        return this.__IStreamSocketListener3.TransferOwnership(socketId)
    }

    /**
     * Transfers ownership of the [StreamSocketListener](streamsocketlistener.md) to the socket brokering service, which monitors socket activity and notifies the app through a background task if there is any activity.
     * @param {HSTRING} socketId A string the app uses to identify the transferred socket. The string should identify this socket uniquely within the app. When activity occurs on this socket, this string will be provided to the app to identify the socket.
     * @param {SocketActivityContext} data Use the [SocketActivityContext](socketactivitycontext.md) to pass context information through the socket broker. When your app is notified by the broker of activity, this [SocketActivityContext](socketactivitycontext.md) will be provided to your app to help establish the context in which you should handle the notification.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.streamsocketlistener.transferownership
     */
    TransferOwnershipWithContext(socketId, data) {
        if (!this.HasProp("__IStreamSocketListener3")) {
            if ((queryResult := this.QueryInterface(IStreamSocketListener3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreamSocketListener3 := IStreamSocketListener3(outPtr)
        }

        return this.__IStreamSocketListener3.TransferOwnershipWithContext(socketId, data)
    }

;@endregion Instance Methods
}
