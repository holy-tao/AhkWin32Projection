#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IVpnNamespaceInfo.ahk
#Include .\IVpnNamespaceInfoFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * **VpnNamespaceInfo** is not supported and may be altered or unavailable in the future. Instead, use [VpnDomainNameInfo](vpndomainnameinfo.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnnamespaceinfo
 * @namespace Windows.Networking.Vpn
 * @version WindowsRuntime 1.4
 */
class VpnNamespaceInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVpnNamespaceInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVpnNamespaceInfo.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Not supported.
     * @param {HSTRING} name A list of DNS servers to perform DNS resolution against when resolving a name in the namespace.
     * @param {IVector<HostName>} dnsServerList A list of DNS servers to perform DNS resolution against when resolving a name in the namespace.
     * @param {IVector<HostName>} proxyServerList A list of web proxy servers to be used when connecting to a resource in the specified namespace.
     * @returns {VpnNamespaceInfo} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnnamespaceinfo.#ctor
     */
    static CreateVpnNamespaceInfo(name, dnsServerList, proxyServerList) {
        if (!VpnNamespaceInfo.HasProp("__IVpnNamespaceInfoFactory")) {
            activatableClassId := HSTRING.Create("Windows.Networking.Vpn.VpnNamespaceInfo")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IVpnNamespaceInfoFactory.IID)
            VpnNamespaceInfo.__IVpnNamespaceInfoFactory := IVpnNamespaceInfoFactory(factoryPtr)
        }

        return VpnNamespaceInfo.__IVpnNamespaceInfoFactory.CreateVpnNamespaceInfo(name, dnsServerList, proxyServerList)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Not supported.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnnamespaceinfo.namespace
     * @type {HSTRING} 
     */
    Namespace {
        get => this.get_Namespace()
        set => this.put_Namespace(value)
    }

    /**
     * Not supported.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnnamespaceinfo.dnsservers
     * @type {IVector<HostName>} 
     */
    DnsServers {
        get => this.get_DnsServers()
        set => this.put_DnsServers(value)
    }

    /**
     * Not supported.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnnamespaceinfo.webproxyservers
     * @type {IVector<HostName>} 
     */
    WebProxyServers {
        get => this.get_WebProxyServers()
        set => this.put_WebProxyServers(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Namespace(value) {
        if (!this.HasProp("__IVpnNamespaceInfo")) {
            if ((queryResult := this.QueryInterface(IVpnNamespaceInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnNamespaceInfo := IVpnNamespaceInfo(outPtr)
        }

        return this.__IVpnNamespaceInfo.put_Namespace(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Namespace() {
        if (!this.HasProp("__IVpnNamespaceInfo")) {
            if ((queryResult := this.QueryInterface(IVpnNamespaceInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnNamespaceInfo := IVpnNamespaceInfo(outPtr)
        }

        return this.__IVpnNamespaceInfo.get_Namespace()
    }

    /**
     * 
     * @param {IVector<HostName>} value 
     * @returns {HRESULT} 
     */
    put_DnsServers(value) {
        if (!this.HasProp("__IVpnNamespaceInfo")) {
            if ((queryResult := this.QueryInterface(IVpnNamespaceInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnNamespaceInfo := IVpnNamespaceInfo(outPtr)
        }

        return this.__IVpnNamespaceInfo.put_DnsServers(value)
    }

    /**
     * 
     * @returns {IVector<HostName>} 
     */
    get_DnsServers() {
        if (!this.HasProp("__IVpnNamespaceInfo")) {
            if ((queryResult := this.QueryInterface(IVpnNamespaceInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnNamespaceInfo := IVpnNamespaceInfo(outPtr)
        }

        return this.__IVpnNamespaceInfo.get_DnsServers()
    }

    /**
     * 
     * @param {IVector<HostName>} value 
     * @returns {HRESULT} 
     */
    put_WebProxyServers(value) {
        if (!this.HasProp("__IVpnNamespaceInfo")) {
            if ((queryResult := this.QueryInterface(IVpnNamespaceInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnNamespaceInfo := IVpnNamespaceInfo(outPtr)
        }

        return this.__IVpnNamespaceInfo.put_WebProxyServers(value)
    }

    /**
     * 
     * @returns {IVector<HostName>} 
     */
    get_WebProxyServers() {
        if (!this.HasProp("__IVpnNamespaceInfo")) {
            if ((queryResult := this.QueryInterface(IVpnNamespaceInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnNamespaceInfo := IVpnNamespaceInfo(outPtr)
        }

        return this.__IVpnNamespaceInfo.get_WebProxyServers()
    }

;@endregion Instance Methods
}
