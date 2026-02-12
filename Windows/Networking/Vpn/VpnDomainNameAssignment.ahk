#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IVpnDomainNameAssignment.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains VPN domain name policies, like name resolution, namespace configuration, and web proxies.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpndomainnameassignment
 * @namespace Windows.Networking.Vpn
 * @version WindowsRuntime 1.4
 */
class VpnDomainNameAssignment extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVpnDomainNameAssignment

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVpnDomainNameAssignment.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a list of name resolution rule policies.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpndomainnameassignment.domainnamelist
     * @type {IVector<VpnDomainNameInfo>} 
     */
    DomainNameList {
        get => this.get_DomainNameList()
    }

    /**
     * Gets or sets the location of the global AutoConfigURL script in the corporate network. [This is an optional property.]
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpndomainnameassignment.proxyautoconfigurationuri
     * @type {Uri} 
     */
    ProxyAutoConfigurationUri {
        get => this.get_ProxyAutoConfigurationUri()
        set => this.put_ProxyAutoConfigurationUri(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Allows the plugin to construct a [VpnDomainNameAssignment](vpndomainnameassignment.md) object to create name resolution policy, and assign it to the VPN channel.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Networking.Vpn.VpnDomainNameAssignment")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVector<VpnDomainNameInfo>} 
     */
    get_DomainNameList() {
        if (!this.HasProp("__IVpnDomainNameAssignment")) {
            if ((queryResult := this.QueryInterface(IVpnDomainNameAssignment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnDomainNameAssignment := IVpnDomainNameAssignment(outPtr)
        }

        return this.__IVpnDomainNameAssignment.get_DomainNameList()
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_ProxyAutoConfigurationUri(value) {
        if (!this.HasProp("__IVpnDomainNameAssignment")) {
            if ((queryResult := this.QueryInterface(IVpnDomainNameAssignment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnDomainNameAssignment := IVpnDomainNameAssignment(outPtr)
        }

        return this.__IVpnDomainNameAssignment.put_ProxyAutoConfigurationUri(value)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_ProxyAutoConfigurationUri() {
        if (!this.HasProp("__IVpnDomainNameAssignment")) {
            if ((queryResult := this.QueryInterface(IVpnDomainNameAssignment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnDomainNameAssignment := IVpnDomainNameAssignment(outPtr)
        }

        return this.__IVpnDomainNameAssignment.get_ProxyAutoConfigurationUri()
    }

;@endregion Instance Methods
}
