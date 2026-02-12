#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IVpnPlugInProfile.ahk
#Include .\IVpnProfile.ahk
#Include .\IVpnPlugInProfile2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a VPN plug-in profile.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnpluginprofile
 * @namespace Windows.Networking.Vpn
 * @version WindowsRuntime 1.4
 */
class VpnPlugInProfile extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVpnPlugInProfile

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVpnPlugInProfile.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a list of server URIs to connect to for the VPN profile.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnpluginprofile.serveruris
     * @type {IVector<Uri>} 
     */
    ServerUris {
        get => this.get_ServerUris()
    }

    /**
     * Gets or sets an XML string to configure the VPN plug-in. Refer to the documentation from the VPN plug-in for format and support.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnpluginprofile.customconfiguration
     * @type {HSTRING} 
     */
    CustomConfiguration {
        get => this.get_CustomConfiguration()
        set => this.put_CustomConfiguration(value)
    }

    /**
     * Gets or sets the package family name of the VPN plug-in to be used for this VPN plug-in profile. This field is required for VpnPlugInProfile to be valid.
     * @remarks
     * If creating or modifying a VPN plug-in profile from the App that is the VPN plug-in, [Package.Current.Id.FamilyName](../windows.applicationmodel/package_current.md) can be used to easily obtain the current package family name at run time.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnpluginprofile.vpnpluginpackagefamilyname
     * @type {HSTRING} 
     */
    VpnPluginPackageFamilyName {
        get => this.get_VpnPluginPackageFamilyName()
        set => this.put_VpnPluginPackageFamilyName(value)
    }

    /**
     * Gets or sets the name of the VPN profile.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnpluginprofile.profilename
     * @type {HSTRING} 
     */
    ProfileName {
        get => this.get_ProfileName()
        set => this.put_ProfileName(value)
    }

    /**
     * Gets a list of apps that will trigger the VPN connection to connect.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnpluginprofile.apptriggers
     * @type {IVector<VpnAppId>} 
     */
    AppTriggers {
        get => this.get_AppTriggers()
    }

    /**
     * Gets a list of routes that must go over the VPN interface in the case of a Split Tunneled VPN.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnpluginprofile.routes
     * @type {IVector<VpnRoute>} 
     */
    Routes {
        get => this.get_Routes()
    }

    /**
     * Gets a list of Name Resolution Policy Table (NRPT) rules for the VPN plug-in profile.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnpluginprofile.domainnameinfolist
     * @type {IVector<VpnDomainNameInfo>} 
     */
    DomainNameInfoList {
        get => this.get_DomainNameInfoList()
    }

    /**
     * Gets a list of Traffic Filters (including per App) included in the VPN profile.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnpluginprofile.trafficfilters
     * @type {IVector<VpnTrafficFilter>} 
     */
    TrafficFilters {
        get => this.get_TrafficFilters()
    }

    /**
     * Gets or sets whether the credentials for the VPN profile will be cached. If TRUE, the credentials for the VPN profile will be cached where applicable.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnpluginprofile.remembercredentials
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
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnpluginprofile.alwayson
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
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnpluginprofile.requirevpnclientappui
     * @type {Boolean} 
     */
    RequireVpnClientAppUI {
        get => this.get_RequireVpnClientAppUI()
        set => this.put_RequireVpnClientAppUI(value)
    }

    /**
     * Gets the current connection status.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnpluginprofile.connectionstatus
     * @type {Integer} 
     */
    ConnectionStatus {
        get => this.get_ConnectionStatus()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Allows VPN management apps to create, edit, and manage, VPN profiles for VPN plug-ins.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Networking.Vpn.VpnPlugInProfile")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVector<Uri>} 
     */
    get_ServerUris() {
        if (!this.HasProp("__IVpnPlugInProfile")) {
            if ((queryResult := this.QueryInterface(IVpnPlugInProfile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnPlugInProfile := IVpnPlugInProfile(outPtr)
        }

        return this.__IVpnPlugInProfile.get_ServerUris()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CustomConfiguration() {
        if (!this.HasProp("__IVpnPlugInProfile")) {
            if ((queryResult := this.QueryInterface(IVpnPlugInProfile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnPlugInProfile := IVpnPlugInProfile(outPtr)
        }

        return this.__IVpnPlugInProfile.get_CustomConfiguration()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_CustomConfiguration(value) {
        if (!this.HasProp("__IVpnPlugInProfile")) {
            if ((queryResult := this.QueryInterface(IVpnPlugInProfile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnPlugInProfile := IVpnPlugInProfile(outPtr)
        }

        return this.__IVpnPlugInProfile.put_CustomConfiguration(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_VpnPluginPackageFamilyName() {
        if (!this.HasProp("__IVpnPlugInProfile")) {
            if ((queryResult := this.QueryInterface(IVpnPlugInProfile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnPlugInProfile := IVpnPlugInProfile(outPtr)
        }

        return this.__IVpnPlugInProfile.get_VpnPluginPackageFamilyName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_VpnPluginPackageFamilyName(value) {
        if (!this.HasProp("__IVpnPlugInProfile")) {
            if ((queryResult := this.QueryInterface(IVpnPlugInProfile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnPlugInProfile := IVpnPlugInProfile(outPtr)
        }

        return this.__IVpnPlugInProfile.put_VpnPluginPackageFamilyName(value)
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
        if (!this.HasProp("__IVpnPlugInProfile2")) {
            if ((queryResult := this.QueryInterface(IVpnPlugInProfile2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnPlugInProfile2 := IVpnPlugInProfile2(outPtr)
        }

        return this.__IVpnPlugInProfile2.get_RequireVpnClientAppUI()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_RequireVpnClientAppUI(value) {
        if (!this.HasProp("__IVpnPlugInProfile2")) {
            if ((queryResult := this.QueryInterface(IVpnPlugInProfile2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnPlugInProfile2 := IVpnPlugInProfile2(outPtr)
        }

        return this.__IVpnPlugInProfile2.put_RequireVpnClientAppUI(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ConnectionStatus() {
        if (!this.HasProp("__IVpnPlugInProfile2")) {
            if ((queryResult := this.QueryInterface(IVpnPlugInProfile2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnPlugInProfile2 := IVpnPlugInProfile2(outPtr)
        }

        return this.__IVpnPlugInProfile2.get_ConnectionStatus()
    }

;@endregion Instance Methods
}
