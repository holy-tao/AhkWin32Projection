#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IControlChannelTrigger.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include .\IControlChannelTrigger2.ahk
#Include .\IControlChannelTriggerFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Enables real time notifications to be received in the background for objects that establish a TCP connection and wish to be notified of incoming traffic.
  * 
  * Call [**BackgroundExecutionManager.RequestAccessAsync**](../windows.applicationmodel.background/backgroundexecutionmanager_requestaccessasync_1328635663.md) before using **ControlChannelTrigger**.
 * @remarks
 * The ControlChannelTrigger class and related interfaces are used to enable your app to use the network when your app is not the foreground app. A Universal Windows app is normally suspended when it is no longer in the foreground app and moved to the background. There are some exceptions to suspending an app (actively printing, accessing an audio stream, and transferring files in the background, for example). The ControlChannelTrigger class allows a network app that has established a TCP connection to notify the system that an established network connection should be kept operational and the system should wake up the suspended app when network data is received for the app or the server keep-alive timer interval expires. Use control channel triggers when your app needs to maintain a network connection even if it is in the background.
 * 
 * While the ControlChannelTrigger class can be used with [DatagramSocket](datagramsocket.md), [StreamSocket](streamsocket.md), or [StreamSocketListener](streamsocketlistener.md), Windows 10 provides an improved mechanism for apps that use those classes and want to maintain connections while in the background. See [Network communications in the background](/windows/uwp/networking/network-communications-in-the-background) for details about [SocketActivityTrigger](../windows.applicationmodel.background/socketactivitytrigger.md) and the socket broker.
 * 
 * The ControlChannelTrigger class is recommended to be used by instances of the following that establish a TCP connection:
 * 
 * + The [HttpClient](../windows.web.http/httpclient.md) class in the [Windows.Web.Http](../windows.web.http/windows_web_http.md) namespace.
 * + The [HttpClient](/dotnet/api/system.net.http.httpclient?view=dotnet-uwp-10.0&preserve-view=true) and [HttpClientHandler](/dotnet/api/system.net.http.httpclienthandler?view=dotnet-uwp-10.0&preserve-view=true) classes in the [System.Net.Http](/dotnet/api/system.net.http?view=dotnet-uwp-10.0&preserve-view=true) namespace in the .NET Framework. Custom classes that derive from these classes are also supported.
 * + The [IXMLHTTPRequest2](/previous-versions/windows/desktop/api/msxml6/nn-msxml6-ixmlhttprequest2) interface. The [IXMLHTTPRequest2](/previous-versions/windows/desktop/api/msxml6/nn-msxml6-ixmlhttprequest2) interface is an extension to XMLHttpRequest object defined in several working drafts published by the World Wide Web Consortium (W3C)
 * 
 * There are several types of keep-alive intervals that may relate to network apps. At the lowest level, an app can set a TCP keep-alive option to send TCP keep-alive packets between a client app and a server to maintain an established TCP connection that is not being used. The [HttpClient](/dotnet/api/system.net.http.httpclient?view=dotnet-uwp-10.0&preserve-view=true) class and the XMLHttpRequest JavaScript object do not have an option to enable TCP keep-alive and this option is disabled by default. The TCP keep-alive must be disabled in order to use the ControlChannelTrigger class to support background network notifications.
 * 
 * In the context of the ControlChannelTrigger class, there are two other keep-alive intervals that have an impact.
 * 
 * + Server keep-alive interval - This refers to a keep-alive interval in minutes that the app registers with the system for how often to be woken up when the app has been suspended. The system will wake up the app based on the value set for this keep-alive interval. This value is represented by the [ServerKeepAliveIntervalInMinutes](controlchanneltrigger_serverkeepaliveintervalinminutes.md) property on a ControlChannelTrigger class and is set as an argument to the ControlChannelTrigger constructor. This value is considered a server keep-alive interval since a network app might normally set this based on known behavior of the server to which the app has established a TCP connection. For example, if it is known that a web server will disconnect and drop TCP connections if there is no data sent by the app for 30 minutes, the network app could set this server keep-alive interval to 25 minutes.
 * + Network keep-alive interval - This refers to an internal keep-alive timer maintained by low-level network components in the TCP stack based on current network conditions. This value represents the value needed by network intermediaries to keep the TCP connection intact. These network intermediaries represent hardware and devices such as network proxies and network address translators. A network app cannot set this value, since this value is determined dynamically by low-level system components in the TCP stack. The internal calculation of the network keep-alive interval does take account of the server keep-alive interval. A network app can indicate to the system that the network keep-alive timer should be decreased if established TCP connections are regularly dropped by calling the [DecreaseNetworkKeepAliveInterval](controlchanneltrigger_decreasenetworkkeepaliveinterval_1909166565.md) method on a ControlChannelTrigger class.
 * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.controlchanneltrigger
 * @namespace Windows.Networking.Sockets
 * @version WindowsRuntime 1.4
 */
class ControlChannelTrigger extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IControlChannelTrigger

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IControlChannelTrigger.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a new [ControlChannelTrigger](controlchanneltrigger.md) object with a control channel trigger ID and a value for the server keep-alive interval.
     * @remarks
     * The [ControlChannelTrigger(String, UInt32) constructor creates a [ControlChannelTrigger](controlchanneltrigger.md) object. By default, the resource type requested for the control channel trigger is a [ControlChannelTriggerResourceType](controlchanneltriggerresourcetype.md) set to **RequestSoftwareSlot**.
     * 
     * If an app needs a hardware slot to support connected standby, then the [ControlChannelTrigger(String, UInt32, ControlChannelTriggerResourceType)](controlchanneltrigger_controlchanneltrigger_2092736614.md) constructor should be used to create the [ControlChannelTrigger](controlchanneltrigger.md) object since this allows an app to specific the requested resource type.
     * @param {HSTRING} channelId A string used to differentiate various control channel triggers on the local computer. The maximum length allowed for this string is 64 characters.
     * @param {Integer} serverKeepAliveIntervalInMinutes The keep-alive interval, in minutes, registered with the system to indicate when the app and network connections used should wake up.
     * 
     * The minimum value that can be set for this parameter is 15 minutes. The maximum value that can be set is 1439 minutes (approximately 24 hours).
     * @returns {ControlChannelTrigger} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.controlchanneltrigger.#ctor
     */
    static CreateControlChannelTrigger(channelId, serverKeepAliveIntervalInMinutes) {
        if (!ControlChannelTrigger.HasProp("__IControlChannelTriggerFactory")) {
            activatableClassId := HSTRING.Create("Windows.Networking.Sockets.ControlChannelTrigger")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IControlChannelTriggerFactory.IID)
            ControlChannelTrigger.__IControlChannelTriggerFactory := IControlChannelTriggerFactory(factoryPtr)
        }

        return ControlChannelTrigger.__IControlChannelTriggerFactory.CreateControlChannelTrigger(channelId, serverKeepAliveIntervalInMinutes)
    }

    /**
     * Creates a new [ControlChannelTrigger](controlchanneltrigger.md) object with a control channel trigger ID, a value for the server keep-alive interval, and the resource type requested for the control channel trigger.
     * @remarks
     * The [ControlChannelTrigger(String, UInt32, ControlChannelTriggerResourceType) constructor allows an app to create a [ControlChannelTrigger](controlchanneltrigger.md) object with a specific the resource type requested for the control channel trigger. If an app needs a hardware slot to support connected standby, then the *resourceRequestType* should be set to **RequestHardwareSlot**.
     * @param {HSTRING} channelId A string used to differentiate various control channel triggers on the local computer. The maximum length allowed for this string is 64 characters.
     * @param {Integer} serverKeepAliveIntervalInMinutes The keep-alive interval, in minutes, registered with the system to indicate when the app and network connections used should wake up.
     * 
     * The minimum value that can be set for this parameter is 15 minutes. The maximum value that can be set is 1439 minutes (approximately 24 hours).
     * @param {Integer} resourceRequestType The resource type requested for the control channel trigger.
     * @returns {ControlChannelTrigger} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.controlchanneltrigger.#ctor
     */
    static CreateControlChannelTriggerEx(channelId, serverKeepAliveIntervalInMinutes, resourceRequestType) {
        if (!ControlChannelTrigger.HasProp("__IControlChannelTriggerFactory")) {
            activatableClassId := HSTRING.Create("Windows.Networking.Sockets.ControlChannelTrigger")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IControlChannelTriggerFactory.IID)
            ControlChannelTrigger.__IControlChannelTriggerFactory := IControlChannelTriggerFactory(factoryPtr)
        }

        return ControlChannelTrigger.__IControlChannelTriggerFactory.CreateControlChannelTriggerEx(channelId, serverKeepAliveIntervalInMinutes, resourceRequestType)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets a string that can be used to differentiate various control channel triggers on the local computer.
     * @remarks
     * This ControlChannelTriggerId property is set when creating a [ControlChannelTrigger](controlchanneltrigger.md) object using one of the [ControlChannelTrigger](/uwp/api/windows.networking.sockets.controlchanneltrigger) constructors. The *channelId* parameter passed to the constructor sets this property.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.controlchanneltrigger.controlchanneltriggerid
     * @type {HSTRING} 
     */
    ControlChannelTriggerId {
        get => this.get_ControlChannelTriggerId()
    }

    /**
     * Get or set the server keep-alive interval, in minutes, registered with the system to indicate when the app and associated network connections used should wake up.
     * @remarks
     * The minimum value that can be set for this property is 15 minutes. The maximum value that can be set for this property is 1439 minutes (approximately 24 hours).
     * 
     * An app should set this to the maximum interval that works with the target network service.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.controlchanneltrigger.serverkeepaliveintervalinminutes
     * @type {Integer} 
     */
    ServerKeepAliveIntervalInMinutes {
        get => this.get_ServerKeepAliveIntervalInMinutes()
        set => this.put_ServerKeepAliveIntervalInMinutes(value)
    }

    /**
     * Gets the network keep-alive interval, in minutes, maintained by low-level network components in the TCP stack based on current network conditions.
     * @remarks
     * The CurrentKeepAliveIntervalInMinutes property represents the network keep-alive interval, in minutes, maintained by low-level network components in the TCP stack based on current network conditions. This value represents the value needed by network intermediaries to keep the TCP connection intact. These network intermediaries represent hardware and devices such as network proxies and network address translators. A network app cannot set this value, since this value is determined dynamically by low-level system components in the TCP stack . However, a network app can indicate to the system that the network keep-alive timer should be decreased if established TCP connections are regularly dropped by calling the [DecreaseNetworkKeepAliveInterval](controlchanneltrigger_decreasenetworkkeepaliveinterval_1909166565.md) method on the [ControlChannelTrigger](controlchanneltrigger.md) class.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.controlchanneltrigger.currentkeepaliveintervalinminutes
     * @type {Integer} 
     */
    CurrentKeepAliveIntervalInMinutes {
        get => this.get_CurrentKeepAliveIntervalInMinutes()
    }

    /**
     * Gets the transport object that the system is using for the transport connection associated with the [ControlChannelTrigger](controlchanneltrigger.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.controlchanneltrigger.transportobject
     * @type {IInspectable} 
     */
    TransportObject {
        get => this.get_TransportObject()
    }

    /**
     * Gets an object that represents the keep-alive trigger associated with the [ControlChannelTrigger](controlchanneltrigger.md) object that an app should use to bind the activation class with the background broker infrastructure.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.controlchanneltrigger.keepalivetrigger
     * @type {IBackgroundTrigger} 
     */
    KeepAliveTrigger {
        get => this.get_KeepAliveTrigger()
    }

    /**
     * Gets an object that represents the push notification trigger associated with the [ControlChannelTrigger](controlchanneltrigger.md) object that an app should use to bind the activation class with the background broker infrastructure.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.controlchanneltrigger.pushnotificationtrigger
     * @type {IBackgroundTrigger} 
     */
    PushNotificationTrigger {
        get => this.get_PushNotificationTrigger()
    }

    /**
     * Gets a value indicating whether waking from low power states is supported.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.controlchanneltrigger.iswakefromlowpowersupported
     * @type {Boolean} 
     */
    IsWakeFromLowPowerSupported {
        get => this.get_IsWakeFromLowPowerSupported()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        this.Close()

        super.__Delete()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ControlChannelTriggerId() {
        if (!this.HasProp("__IControlChannelTrigger")) {
            if ((queryResult := this.QueryInterface(IControlChannelTrigger.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControlChannelTrigger := IControlChannelTrigger(outPtr)
        }

        return this.__IControlChannelTrigger.get_ControlChannelTriggerId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ServerKeepAliveIntervalInMinutes() {
        if (!this.HasProp("__IControlChannelTrigger")) {
            if ((queryResult := this.QueryInterface(IControlChannelTrigger.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControlChannelTrigger := IControlChannelTrigger(outPtr)
        }

        return this.__IControlChannelTrigger.get_ServerKeepAliveIntervalInMinutes()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ServerKeepAliveIntervalInMinutes(value) {
        if (!this.HasProp("__IControlChannelTrigger")) {
            if ((queryResult := this.QueryInterface(IControlChannelTrigger.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControlChannelTrigger := IControlChannelTrigger(outPtr)
        }

        return this.__IControlChannelTrigger.put_ServerKeepAliveIntervalInMinutes(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CurrentKeepAliveIntervalInMinutes() {
        if (!this.HasProp("__IControlChannelTrigger")) {
            if ((queryResult := this.QueryInterface(IControlChannelTrigger.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControlChannelTrigger := IControlChannelTrigger(outPtr)
        }

        return this.__IControlChannelTrigger.get_CurrentKeepAliveIntervalInMinutes()
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_TransportObject() {
        if (!this.HasProp("__IControlChannelTrigger")) {
            if ((queryResult := this.QueryInterface(IControlChannelTrigger.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControlChannelTrigger := IControlChannelTrigger(outPtr)
        }

        return this.__IControlChannelTrigger.get_TransportObject()
    }

    /**
     * 
     * @returns {IBackgroundTrigger} 
     */
    get_KeepAliveTrigger() {
        if (!this.HasProp("__IControlChannelTrigger")) {
            if ((queryResult := this.QueryInterface(IControlChannelTrigger.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControlChannelTrigger := IControlChannelTrigger(outPtr)
        }

        return this.__IControlChannelTrigger.get_KeepAliveTrigger()
    }

    /**
     * 
     * @returns {IBackgroundTrigger} 
     */
    get_PushNotificationTrigger() {
        if (!this.HasProp("__IControlChannelTrigger")) {
            if ((queryResult := this.QueryInterface(IControlChannelTrigger.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControlChannelTrigger := IControlChannelTrigger(outPtr)
        }

        return this.__IControlChannelTrigger.get_PushNotificationTrigger()
    }

    /**
     * Sets the transport connection to be used by a control channel trigger by class elements in the [Windows.Networking.Sockets](windows_networking_sockets.md) and related namespaces.
     * @remarks
     * The UsingTransport method indicates to the system the transport connection to be used by the [ControlChannelTrigger](controlchanneltrigger.md) .
     * 
     * An app must call the UsingTransport method after the transport object (a [StreamSocket](streamsocket.md) instance, for example) has been created, but before a network connection is established.
     * 
     * For a [StreamSocket](streamsocket.md), the constructor for the [StreamSocket](streamsocket.md) would first be called to create the transport object. Then the returned [StreamSocket](streamsocket.md) instance would be passed to the UsingTransport method as the *transport* parameter. Only then can one of the [StreamSocket.ConnectAsync](streamsocket_connectasync_13692504.md) methods be called to establish the network connection.
     * 
     * For [HttpClient](../windows.web.http/httpclient.md) in the [Windows.Web.Http](../windows.web.http/windows_web_http.md) namespace, the UsingTransport method needs to be called with the initialized [HttpClient](../windows.web.http/httpclient.md) instance before any of the GET, PUT, POST, SEND, OR DELETE request methods on the [HttpClient](../windows.web.http/httpclient.md) or related classes are invoked.
     * 
     * For [IXMLHTTPRequest2](/previous-versions/windows/desktop/api/msxml6/nn-msxml6-ixmlhttprequest2) interface, the HTTP request must be opened first using the [Open](/previous-versions/windows/desktop/api/msxml6/nf-msxml6-ixmlhttprequest2-open) method and passed to the UsingTransport method. Then the [Send](/previous-versions/windows/desktop/api/msxml6/nf-msxml6-ixmlhttprequest2-send) method on the [IXMLHTTPRequest2](/previous-versions/windows/desktop/api/msxml6/nn-msxml6-ixmlhttprequest2) object can be invoked to send the HTTP request.
     * 
     * For , the UsingTransport method needs to be called with the initialized  instance before any of the GET, PUT, POST, SEND, OR DELETE request methods on the  or related classes are invoked.
     * @param {IInspectable} transport The instance of the network class that represents the network transport.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.controlchanneltrigger.usingtransport
     */
    UsingTransport(transport) {
        if (!this.HasProp("__IControlChannelTrigger")) {
            if ((queryResult := this.QueryInterface(IControlChannelTrigger.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControlChannelTrigger := IControlChannelTrigger(outPtr)
        }

        return this.__IControlChannelTrigger.UsingTransport(transport)
    }

    /**
     * Allows an app to notify the system that a connection has been established and the system should complete the internal configuration of the control channel trigger.
     * @remarks
     * Once an app is connected, it must call the WaitForPushEnabled method in order to enable the system to complete the internal configuration of the control channel trigger. If an app tries to use the network trigger mechanism without calling the WaitForPushEnabled method, it will get an exception.
     * 
     * This call to the WaitForPushEnabled method is to be made only after the transport connection is established.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.controlchanneltrigger.waitforpushenabled
     */
    WaitForPushEnabled() {
        if (!this.HasProp("__IControlChannelTrigger")) {
            if ((queryResult := this.QueryInterface(IControlChannelTrigger.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControlChannelTrigger := IControlChannelTrigger(outPtr)
        }

        return this.__IControlChannelTrigger.WaitForPushEnabled()
    }

    /**
     * Provides a way for an app to indicate that the network keep-alive interval maintained by the system with network intermediaries to wake up was too long and should be decreased. This method applies to class elements in the [Windows.Networking.Sockets](windows_networking_sockets.md) and related namespaces.
     * @remarks
     * Network intermediaries represent hardware and devices such as proxies and network address translators.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.controlchanneltrigger.decreasenetworkkeepaliveinterval
     */
    DecreaseNetworkKeepAliveInterval() {
        if (!this.HasProp("__IControlChannelTrigger")) {
            if ((queryResult := this.QueryInterface(IControlChannelTrigger.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControlChannelTrigger := IControlChannelTrigger(outPtr)
        }

        return this.__IControlChannelTrigger.DecreaseNetworkKeepAliveInterval()
    }

    /**
     * Flushes any networking data used by the transport connection associated with the [ControlChannelTrigger](controlchanneltrigger.md) to the networking stack.
     * @remarks
     * The FlushTransport method flushes any networking data used by the transport connection associated with the [ControlChannelTrigger](controlchanneltrigger.md) to the networking stack. This method is called at the end of a background task. It ensures any networking data that is being sent leaves the process and has a chance to get to networking stack.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.controlchanneltrigger.flushtransport
     */
    FlushTransport() {
        if (!this.HasProp("__IControlChannelTrigger")) {
            if ((queryResult := this.QueryInterface(IControlChannelTrigger.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControlChannelTrigger := IControlChannelTrigger(outPtr)
        }

        return this.__IControlChannelTrigger.FlushTransport()
    }

    /**
     * Closes the [ControlChannelTrigger](controlchanneltrigger.md) object.
     * @remarks
     * The Close method aborts any pending operations and releases all unmanaged resources associated with the [ControlChannelTrigger](controlchanneltrigger.md) object. Calling this method frees any hardware resources allocated for the [ControlChannelTrigger](controlchanneltrigger.md).
     * 
     * In .NET Framework 4.5, this method is projected as the  method. In C++, this method is projected as part of the destructor (delete operator).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.controlchanneltrigger.close
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
     * 
     * @returns {Boolean} 
     */
    get_IsWakeFromLowPowerSupported() {
        if (!this.HasProp("__IControlChannelTrigger2")) {
            if ((queryResult := this.QueryInterface(IControlChannelTrigger2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IControlChannelTrigger2 := IControlChannelTrigger2(outPtr)
        }

        return this.__IControlChannelTrigger2.get_IsWakeFromLowPowerSupported()
    }

;@endregion Instance Methods
}
