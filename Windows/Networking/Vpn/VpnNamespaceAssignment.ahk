#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IVpnNamespaceAssignment.ahk
#Include ..\..\..\Guid.ahk

/**
 * **VpnNamespaceAssignment** is not supported and may be altered or unavailable in the future. Instead, use [VpnDomainNameAssignment](vpndomainnameassignment.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnnamespaceassignment
 * @namespace Windows.Networking.Vpn
 * @version WindowsRuntime 1.4
 */
class VpnNamespaceAssignment extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVpnNamespaceAssignment

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVpnNamespaceAssignment.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Not supported.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnnamespaceassignment.namespacelist
     * @type {IVector<VpnNamespaceInfo>} 
     */
    NamespaceList {
        get => this.get_NamespaceList()
        set => this.put_NamespaceList(value)
    }

    /**
     * Not supported.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnnamespaceassignment.proxyautoconfiguri
     * @type {Uri} 
     */
    ProxyAutoConfigUri {
        get => this.get_ProxyAutoConfigUri()
        set => this.put_ProxyAutoConfigUri(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Not supported.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Networking.Vpn.VpnNamespaceAssignment")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @param {IVector<VpnNamespaceInfo>} value 
     * @returns {HRESULT} 
     */
    put_NamespaceList(value) {
        if (!this.HasProp("__IVpnNamespaceAssignment")) {
            if ((queryResult := this.QueryInterface(IVpnNamespaceAssignment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnNamespaceAssignment := IVpnNamespaceAssignment(outPtr)
        }

        return this.__IVpnNamespaceAssignment.put_NamespaceList(value)
    }

    /**
     * 
     * @returns {IVector<VpnNamespaceInfo>} 
     */
    get_NamespaceList() {
        if (!this.HasProp("__IVpnNamespaceAssignment")) {
            if ((queryResult := this.QueryInterface(IVpnNamespaceAssignment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnNamespaceAssignment := IVpnNamespaceAssignment(outPtr)
        }

        return this.__IVpnNamespaceAssignment.get_NamespaceList()
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_ProxyAutoConfigUri(value) {
        if (!this.HasProp("__IVpnNamespaceAssignment")) {
            if ((queryResult := this.QueryInterface(IVpnNamespaceAssignment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnNamespaceAssignment := IVpnNamespaceAssignment(outPtr)
        }

        return this.__IVpnNamespaceAssignment.put_ProxyAutoConfigUri(value)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_ProxyAutoConfigUri() {
        if (!this.HasProp("__IVpnNamespaceAssignment")) {
            if ((queryResult := this.QueryInterface(IVpnNamespaceAssignment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnNamespaceAssignment := IVpnNamespaceAssignment(outPtr)
        }

        return this.__IVpnNamespaceAssignment.get_ProxyAutoConfigUri()
    }

;@endregion Instance Methods
}
