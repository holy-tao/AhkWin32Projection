#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IVpnNativeProfile.ahk
#Include .\IVpnProfile.ahk
#Include .\IVpnNativeProfile2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a profile for an OS Native/Inbox VPN protocol.
 * @remarks
 * Using **VpnNativeProfile** is approximately equivalent to using the **Add a VPN connection** dialog, in that you can specify a server, sign-in information, and other info, and then Windows takes care of the VPN connection from there. Consequently, you can't use **VpnNativeProfile** to capture received packets, nor to trigger a background task.
 * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnnativeprofile
 * @namespace Windows.Networking.Vpn
 * @version WindowsRuntime 1.4
 */
class VpnNativeProfile extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVpnNativeProfile

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVpnNativeProfile.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a list of VPN servers for the Inbox VPN profile.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnnativeprofile.servers
     * @type {IVector<HSTRING>} 
     */
    Servers {
        get => this.get_Servers()
    }

    /**
     * Gets or sets whether the apps allowed by this traffic filter are force tunneled through the VPN interface, or whether they are split tunneled and allowed to talk through other interfaces.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnnativeprofile.routingpolicytype
     * @type {Integer} 
     */
    RoutingPolicyType {
        get => this.get_RoutingPolicyType()
        set => this.put_RoutingPolicyType(value)
    }

    /**
     * Gets or sets the tunnel protocol type for the Inbox VPN connection.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnnativeprofile.nativeprotocoltype
     * @type {Integer} 
     */
    NativeProtocolType {
        get => this.get_NativeProtocolType()
        set => this.put_NativeProtocolType(value)
    }

    /**
     * Gets or sets the authentication method to be used to authenticate the user.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnnativeprofile.userauthenticationmethod
     * @type {Integer} 
     */
    UserAuthenticationMethod {
        get => this.get_UserAuthenticationMethod()
        set => this.put_UserAuthenticationMethod(value)
    }

    /**
     * Gets or sets the authentication method to be used in the tunnel layer of the native VPN protocol.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnnativeprofile.tunnelauthenticationmethod
     * @type {Integer} 
     */
    TunnelAuthenticationMethod {
        get => this.get_TunnelAuthenticationMethod()
        set => this.put_TunnelAuthenticationMethod(value)
    }

    /**
     * Gets or sets the EAP Authentication configuration for an Inbox/Native VPN profile.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnnativeprofile.eapconfiguration
     * @type {HSTRING} 
     */
    EapConfiguration {
        get => this.get_EapConfiguration()
        set => this.put_EapConfiguration(value)
    }

    /**
     * Gets or sets the profile name for the Inbox/Native VPN profile.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnnativeprofile.profilename
     * @type {HSTRING} 
     */
    ProfileName {
        get => this.get_ProfileName()
        set => this.put_ProfileName(value)
    }

    /**
     * Gets a list of apps that can trigger the Inbox VPN profile.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnnativeprofile.apptriggers
     * @type {IVector<VpnAppId>} 
     */
    AppTriggers {
        get => this.get_AppTriggers()
    }

    /**
     * Gets a list of routes that should go over the VPN interface in the case of a Split Tunneled VPN.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnnativeprofile.routes
     * @type {IVector<VpnRoute>} 
     */
    Routes {
        get => this.get_Routes()
    }

    /**
     * Gets a list of domain name policies to be used for the profile.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnnativeprofile.domainnameinfolist
     * @type {IVector<VpnDomainNameInfo>} 
     */
    DomainNameInfoList {
        get => this.get_DomainNameInfoList()
    }

    /**
     * Gets a list of Traffic Filters (including per App) included in the VPN profile.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnnativeprofile.trafficfilters
     * @type {IVector<VpnTrafficFilter>} 
     */
    TrafficFilters {
        get => this.get_TrafficFilters()
    }

    /**
     * Gets or sets whether the credentials for the VPN profile will be cached. If TRUE, the credentials for the VPN profile will be cached where applicable.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnnativeprofile.remembercredentials
     * @type {Boolean} 
     */
    RememberCredentials {
        get => this.get_RememberCredentials()
        set => this.put_RememberCredentials(value)
    }

    /**
     * Gets or sets a value that indicates whether the VPN profile is for [Always-On VPN](/windows-server/remote/remote-access/vpn/always-on-vpn/); that is, whether the profile is *capable* of being always connected.
     * @remarks
     * When this property value has the value `true`, the profile is *capable* of being always-on; when the user also click the **always connected** setting, the profile *actually is* always-on.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnnativeprofile.alwayson
     * @type {Boolean} 
     */
    AlwaysOn {
        get => this.get_AlwaysOn()
        set => this.put_AlwaysOn(value)
    }

    /**
     * Gets or sets a value that determines whether this VPN profile appears in the system's VPN connection UI.
     * @remarks
     * When a profile is not visible in the VPN connection UI, it can still be used by VPN apps that know the profile's name.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnnativeprofile.requirevpnclientappui
     * @type {Boolean} 
     */
    RequireVpnClientAppUI {
        get => this.get_RequireVpnClientAppUI()
        set => this.put_RequireVpnClientAppUI(value)
    }

    /**
     * Gets the current connection status.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnnativeprofile.connectionstatus
     * @type {Integer} 
     */
    ConnectionStatus {
        get => this.get_ConnectionStatus()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Allows a VPN management app to create a native VPN profile.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Networking.Vpn.VpnNativeProfile")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_Servers() {
        if (!this.HasProp("__IVpnNativeProfile")) {
            if ((queryResult := this.QueryInterface(IVpnNativeProfile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnNativeProfile := IVpnNativeProfile(outPtr)
        }

        return this.__IVpnNativeProfile.get_Servers()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RoutingPolicyType() {
        if (!this.HasProp("__IVpnNativeProfile")) {
            if ((queryResult := this.QueryInterface(IVpnNativeProfile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnNativeProfile := IVpnNativeProfile(outPtr)
        }

        return this.__IVpnNativeProfile.get_RoutingPolicyType()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_RoutingPolicyType(value) {
        if (!this.HasProp("__IVpnNativeProfile")) {
            if ((queryResult := this.QueryInterface(IVpnNativeProfile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnNativeProfile := IVpnNativeProfile(outPtr)
        }

        return this.__IVpnNativeProfile.put_RoutingPolicyType(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NativeProtocolType() {
        if (!this.HasProp("__IVpnNativeProfile")) {
            if ((queryResult := this.QueryInterface(IVpnNativeProfile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnNativeProfile := IVpnNativeProfile(outPtr)
        }

        return this.__IVpnNativeProfile.get_NativeProtocolType()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_NativeProtocolType(value) {
        if (!this.HasProp("__IVpnNativeProfile")) {
            if ((queryResult := this.QueryInterface(IVpnNativeProfile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnNativeProfile := IVpnNativeProfile(outPtr)
        }

        return this.__IVpnNativeProfile.put_NativeProtocolType(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_UserAuthenticationMethod() {
        if (!this.HasProp("__IVpnNativeProfile")) {
            if ((queryResult := this.QueryInterface(IVpnNativeProfile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnNativeProfile := IVpnNativeProfile(outPtr)
        }

        return this.__IVpnNativeProfile.get_UserAuthenticationMethod()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_UserAuthenticationMethod(value) {
        if (!this.HasProp("__IVpnNativeProfile")) {
            if ((queryResult := this.QueryInterface(IVpnNativeProfile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnNativeProfile := IVpnNativeProfile(outPtr)
        }

        return this.__IVpnNativeProfile.put_UserAuthenticationMethod(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TunnelAuthenticationMethod() {
        if (!this.HasProp("__IVpnNativeProfile")) {
            if ((queryResult := this.QueryInterface(IVpnNativeProfile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnNativeProfile := IVpnNativeProfile(outPtr)
        }

        return this.__IVpnNativeProfile.get_TunnelAuthenticationMethod()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_TunnelAuthenticationMethod(value) {
        if (!this.HasProp("__IVpnNativeProfile")) {
            if ((queryResult := this.QueryInterface(IVpnNativeProfile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnNativeProfile := IVpnNativeProfile(outPtr)
        }

        return this.__IVpnNativeProfile.put_TunnelAuthenticationMethod(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_EapConfiguration() {
        if (!this.HasProp("__IVpnNativeProfile")) {
            if ((queryResult := this.QueryInterface(IVpnNativeProfile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnNativeProfile := IVpnNativeProfile(outPtr)
        }

        return this.__IVpnNativeProfile.get_EapConfiguration()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_EapConfiguration(value) {
        if (!this.HasProp("__IVpnNativeProfile")) {
            if ((queryResult := this.QueryInterface(IVpnNativeProfile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnNativeProfile := IVpnNativeProfile(outPtr)
        }

        return this.__IVpnNativeProfile.put_EapConfiguration(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ProfileName() {
        if (!this.HasProp("__IVpnProfile")) {
            if ((queryResult := this.QueryInterface(IVpnProfile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnProfile := IVpnProfile(outPtr)
        }

        return this.__IVpnProfile.get_ProfileName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_ProfileName(value) {
        if (!this.HasProp("__IVpnProfile")) {
            if ((queryResult := this.QueryInterface(IVpnProfile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnProfile := IVpnProfile(outPtr)
        }

        return this.__IVpnProfile.put_ProfileName(value)
    }

    /**
     * 
     * @returns {IVector<VpnAppId>} 
     */
    get_AppTriggers() {
        if (!this.HasProp("__IVpnProfile")) {
            if ((queryResult := this.QueryInterface(IVpnProfile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnProfile := IVpnProfile(outPtr)
        }

        return this.__IVpnProfile.get_AppTriggers()
    }

    /**
     * 
     * @returns {IVector<VpnRoute>} 
     */
    get_Routes() {
        if (!this.HasProp("__IVpnProfile")) {
            if ((queryResult := this.QueryInterface(IVpnProfile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnProfile := IVpnProfile(outPtr)
        }

        return this.__IVpnProfile.get_Routes()
    }

    /**
     * 
     * @returns {IVector<VpnDomainNameInfo>} 
     */
    get_DomainNameInfoList() {
        if (!this.HasProp("__IVpnProfile")) {
            if ((queryResult := this.QueryInterface(IVpnProfile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnProfile := IVpnProfile(outPtr)
        }

        return this.__IVpnProfile.get_DomainNameInfoList()
    }

    /**
     * 
     * @returns {IVector<VpnTrafficFilter>} 
     */
    get_TrafficFilters() {
        if (!this.HasProp("__IVpnProfile")) {
            if ((queryResult := this.QueryInterface(IVpnProfile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnProfile := IVpnProfile(outPtr)
        }

        return this.__IVpnProfile.get_TrafficFilters()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_RememberCredentials() {
        if (!this.HasProp("__IVpnProfile")) {
            if ((queryResult := this.QueryInterface(IVpnProfile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnProfile := IVpnProfile(outPtr)
        }

        return this.__IVpnProfile.get_RememberCredentials()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_RememberCredentials(value) {
        if (!this.HasProp("__IVpnProfile")) {
            if ((queryResult := this.QueryInterface(IVpnProfile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnProfile := IVpnProfile(outPtr)
        }

        return this.__IVpnProfile.put_RememberCredentials(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AlwaysOn() {
        if (!this.HasProp("__IVpnProfile")) {
            if ((queryResult := this.QueryInterface(IVpnProfile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnProfile := IVpnProfile(outPtr)
        }

        return this.__IVpnProfile.get_AlwaysOn()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AlwaysOn(value) {
        if (!this.HasProp("__IVpnProfile")) {
            if ((queryResult := this.QueryInterface(IVpnProfile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnProfile := IVpnProfile(outPtr)
        }

        return this.__IVpnProfile.put_AlwaysOn(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_RequireVpnClientAppUI() {
        if (!this.HasProp("__IVpnNativeProfile2")) {
            if ((queryResult := this.QueryInterface(IVpnNativeProfile2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnNativeProfile2 := IVpnNativeProfile2(outPtr)
        }

        return this.__IVpnNativeProfile2.get_RequireVpnClientAppUI()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_RequireVpnClientAppUI(value) {
        if (!this.HasProp("__IVpnNativeProfile2")) {
            if ((queryResult := this.QueryInterface(IVpnNativeProfile2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnNativeProfile2 := IVpnNativeProfile2(outPtr)
        }

        return this.__IVpnNativeProfile2.put_RequireVpnClientAppUI(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ConnectionStatus() {
        if (!this.HasProp("__IVpnNativeProfile2")) {
            if ((queryResult := this.QueryInterface(IVpnNativeProfile2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnNativeProfile2 := IVpnNativeProfile2(outPtr)
        }

        return this.__IVpnNativeProfile2.get_ConnectionStatus()
    }

;@endregion Instance Methods
}
