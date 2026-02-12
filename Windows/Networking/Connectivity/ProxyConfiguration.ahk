#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IProxyConfiguration.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents resolved proxy settings (proxy endpoints and direct-connect flag) for a specific target URI.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.proxyconfiguration
 * @namespace Windows.Networking.Connectivity
 * @version WindowsRuntime 1.4
 */
class ProxyConfiguration extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IProxyConfiguration

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IProxyConfiguration.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a list of URIs for the proxies from the proxy configuration.
     * @remarks
     * The Web Proxy Auto-Discovery Protocol (WPAD) is used by web browsers and other apps to locate a proxy configuration file. This proxy auto-config (PAC) file defines the proxy server that should be used to retrieve a specific URI or whether to bypass the proxy for certain URIs. The PAC allows different proxies to be defined for different URIs.
     * 
     * The ProxyUris property contains a list of URIs that an app should connect directly to and bypass the proxy.
     * 
     * In a UWP app, the [StreamSocket](../windows.networking.sockets/streamsocket.md) class supports connecting to a remote endpoint when proxies are required to complete the connection. This support for proxies is automatic and transparent to the app. For more detailed information, see the remarks on *Support for proxies* in the [StreamSocket](../windows.networking.sockets/streamsocket.md) class reference.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.proxyconfiguration.proxyuris
     * @type {IVectorView<Uri>} 
     */
    ProxyUris {
        get => this.get_ProxyUris()
    }

    /**
     * Gets a value that indicates whether this configuration can connect directly.
     * @remarks
     * There may be cases where `CanConnectDirectly` returns `false`, yet the resource remains reachable directly. A local
     * network can support both a proxy and network address translation (NAT). The WPAD script used to supply proxy
     * information to a web browser or [HttpClient](../windows.web.http/httpclient.md) tells Windows to use the proxy.
     * Disregarding that policy and going directly through NAT can cause problems when the remote endpoint is not expecting a
     * proxy-less connection.
     * 
     * In a UWP app, the [StreamSocket](../windows.networking.sockets/streamsocket.md) class supports connecting to a remote
     * endpoint when proxies are required to complete the connection. This proxy support is automatic and transparent to the
     * app. For more detailed information, see the remarks on *Support for proxies* in the
     * [StreamSocket](../windows.networking.sockets/streamsocket.md) class reference.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.proxyconfiguration.canconnectdirectly
     * @type {Boolean} 
     */
    CanConnectDirectly {
        get => this.get_CanConnectDirectly()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVectorView<Uri>} 
     */
    get_ProxyUris() {
        if (!this.HasProp("__IProxyConfiguration")) {
            if ((queryResult := this.QueryInterface(IProxyConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProxyConfiguration := IProxyConfiguration(outPtr)
        }

        return this.__IProxyConfiguration.get_ProxyUris()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanConnectDirectly() {
        if (!this.HasProp("__IProxyConfiguration")) {
            if ((queryResult := this.QueryInterface(IProxyConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProxyConfiguration := IProxyConfiguration(outPtr)
        }

        return this.__IProxyConfiguration.get_CanConnectDirectly()
    }

;@endregion Instance Methods
}
