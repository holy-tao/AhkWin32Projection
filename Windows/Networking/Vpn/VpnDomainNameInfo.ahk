#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IVpnDomainNameInfo.ahk
#Include .\IVpnDomainNameInfo2.ahk
#Include .\IVpnDomainNameInfoFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Specifies the name policy for a specific namespace. It can specify the DNS servers to use for name resolution of the namespace, the web proxies to use when connecting to the namespace, or whether it should be exempted from the policy itself.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpndomainnameinfo
 * @namespace Windows.Networking.Vpn
 * @version WindowsRuntime 1.4
 */
class VpnDomainNameInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVpnDomainNameInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVpnDomainNameInfo.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Allows the VPN plug-in to construct this object to be added to a [VpnDomainNameAssignment](vpndomainnameassignment.md) object.
     * @param {HSTRING} name The domain name. This could be an FQDN, or a DNS suffix.
     * @param {Integer} nameType An enum value indicating whether the namespace in question is a FQDN, or a DNS suffix.
     * @param {IIterable<HostName>} dnsServerList A list of DNS servers to perform DNS resolution against when resolving a name in the namespace.
     * @param {IIterable<HostName>} proxyServerList A list of web proxy servers to be used when connecting to a resource in the specified namespace.
     * @returns {VpnDomainNameInfo} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpndomainnameinfo.#ctor
     */
    static CreateVpnDomainNameInfo(name, nameType, dnsServerList, proxyServerList) {
        if (!VpnDomainNameInfo.HasProp("__IVpnDomainNameInfoFactory")) {
            activatableClassId := HSTRING.Create("Windows.Networking.Vpn.VpnDomainNameInfo")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IVpnDomainNameInfoFactory.IID)
            VpnDomainNameInfo.__IVpnDomainNameInfoFactory := IVpnDomainNameInfoFactory(factoryPtr)
        }

        return VpnDomainNameInfo.__IVpnDomainNameInfoFactory.CreateVpnDomainNameInfo(name, nameType, dnsServerList, proxyServerList)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the domain name. This could be an FQDN, or a DNS suffix.
     * @remarks
     * Domain name resolution generally works in two stages. First, if the host is a short name ("example"), then it is expanded into a fully-qualified domain name (FQDN) using a suffix style domain. Second, a search is performed for the FQDN based on the specified rules.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpndomainnameinfo.domainname
     * @type {HostName} 
     */
    DomainName {
        get => this.get_DomainName()
        set => this.put_DomainName(value)
    }

    /**
     * Gets or sets whether the namespace in question is a FQDN, or a DNS suffix.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpndomainnameinfo.domainnametype
     * @type {Integer} 
     */
    DomainNameType {
        get => this.get_DomainNameType()
        set => this.put_DomainNameType(value)
    }

    /**
     * Gets a list of DNS servers to perform DNS resolution against when resolving a name in the namespace.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpndomainnameinfo.dnsservers
     * @type {IVector<HostName>} 
     */
    DnsServers {
        get => this.get_DnsServers()
    }

    /**
     * Gets a list of web proxy servers to be used when connecting to a resource in the specified namespace.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpndomainnameinfo.webproxyservers
     * @type {IVector<HostName>} 
     */
    WebProxyServers {
        get => this.get_WebProxyServers()
    }

    /**
     * Gets a web proxy URI to be used when connecting to a resource in the specified namespace. This value differs from [WebProxyServers](vpndomainnameinfo_webproxyservers.md) in that the URI can be specify a custom port number, while the [WebProxyServers](vpndomainnameinfo_webproxyservers.md) value assumes port 80.
     * 
     * Note that even though the property name is plural, the returned list of URIs never has more than one element.
     * @remarks
     * To specify a custom port number, use URI syntax. For example, to use port 56789 at example.com, specify `http://example.com:56789` to the URI constructor.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpndomainnameinfo.webproxyuris
     * @type {IVector<Uri>} 
     */
    WebProxyUris {
        get => this.get_WebProxyUris()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @param {HostName} value 
     * @returns {HRESULT} 
     */
    put_DomainName(value) {
        if (!this.HasProp("__IVpnDomainNameInfo")) {
            if ((queryResult := this.QueryInterface(IVpnDomainNameInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnDomainNameInfo := IVpnDomainNameInfo(outPtr)
        }

        return this.__IVpnDomainNameInfo.put_DomainName(value)
    }

    /**
     * 
     * @returns {HostName} 
     */
    get_DomainName() {
        if (!this.HasProp("__IVpnDomainNameInfo")) {
            if ((queryResult := this.QueryInterface(IVpnDomainNameInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnDomainNameInfo := IVpnDomainNameInfo(outPtr)
        }

        return this.__IVpnDomainNameInfo.get_DomainName()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_DomainNameType(value) {
        if (!this.HasProp("__IVpnDomainNameInfo")) {
            if ((queryResult := this.QueryInterface(IVpnDomainNameInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnDomainNameInfo := IVpnDomainNameInfo(outPtr)
        }

        return this.__IVpnDomainNameInfo.put_DomainNameType(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DomainNameType() {
        if (!this.HasProp("__IVpnDomainNameInfo")) {
            if ((queryResult := this.QueryInterface(IVpnDomainNameInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnDomainNameInfo := IVpnDomainNameInfo(outPtr)
        }

        return this.__IVpnDomainNameInfo.get_DomainNameType()
    }

    /**
     * 
     * @returns {IVector<HostName>} 
     */
    get_DnsServers() {
        if (!this.HasProp("__IVpnDomainNameInfo")) {
            if ((queryResult := this.QueryInterface(IVpnDomainNameInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnDomainNameInfo := IVpnDomainNameInfo(outPtr)
        }

        return this.__IVpnDomainNameInfo.get_DnsServers()
    }

    /**
     * 
     * @returns {IVector<HostName>} 
     */
    get_WebProxyServers() {
        if (!this.HasProp("__IVpnDomainNameInfo")) {
            if ((queryResult := this.QueryInterface(IVpnDomainNameInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnDomainNameInfo := IVpnDomainNameInfo(outPtr)
        }

        return this.__IVpnDomainNameInfo.get_WebProxyServers()
    }

    /**
     * 
     * @returns {IVector<Uri>} 
     */
    get_WebProxyUris() {
        if (!this.HasProp("__IVpnDomainNameInfo2")) {
            if ((queryResult := this.QueryInterface(IVpnDomainNameInfo2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnDomainNameInfo2 := IVpnDomainNameInfo2(outPtr)
        }

        return this.__IVpnDomainNameInfo2.get_WebProxyUris()
    }

;@endregion Instance Methods
}
