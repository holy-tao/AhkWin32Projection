#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IVpnChannelConfiguration.ahk
#Include .\IVpnChannelConfiguration2.ahk
#Include ..\..\..\Guid.ahk

/**
 * The configuration of the [VpnChannel](vpnchannel.md), which dictates how to establish the communication with the VPN server.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnchannelconfiguration
 * @namespace Windows.Networking.Vpn
 * @version WindowsRuntime 1.4
 */
class VpnChannelConfiguration extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVpnChannelConfiguration

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVpnChannelConfiguration.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the service name of the VPN server listening for remote access connections.
     * @remarks
     * > [!NOTE]
     * > Any call to this API outside of a connected VPN plug-in will fail, as activity and interactions between the VPN plug-in and the system are controlled by the VPN profile. There can only be one VPN profile per process because the VPN plug-in only has one VPN profile mapped to it, and if a caller were to create more than one profile object, they would all refer to the same settings.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnchannelconfiguration.serverservicename
     * @type {HSTRING} 
     */
    ServerServiceName {
        get => this.get_ServerServiceName()
    }

    /**
     * Gets the server hostname of the VPN server to which the VPN plug-in should connect.
     * @remarks
     * > [!NOTE]
     * > Any call to this API outside of a connected VPN plug-in will fail, as activity and interactions between the VPN plug-in and the system are controlled by the VPN profile. There can only be one VPN profile per process because the VPN plug-in only has one VPN profile mapped to it, and if a caller were to create more than one profile object, they would all refer to the same settings.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnchannelconfiguration.serverhostnamelist
     * @type {IVectorView<HostName>} 
     */
    ServerHostNameList {
        get => this.get_ServerHostNameList()
    }

    /**
     * Gets the custom configuration as a string which the VPN plug-in parses to configure VPN vendor specific settings. The field is a string to allow XML as the data format of the configuration.
     * @remarks
     * > [!NOTE]
     * > Any call to this API outside of a connected VPN plug-in will fail, as activity and interactions between the VPN plug-in and the system are controlled by the VPN profile. There can only be one VPN profile per process because the VPN plug-in only has one VPN profile mapped to it, and if a caller were to create more than one profile object, they would all refer to the same settings.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnchannelconfiguration.customfield
     * @type {HSTRING} 
     */
    CustomField {
        get => this.get_CustomField()
    }

    /**
     * Gets the list of URIs that describe the VPN servers to connect to and the URI to use when connecting to them. This is analogous to the ServerHostNames, but are in URI format which allows for more information to be carried per server.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.vpnchannelconfiguration.serveruris
     * @type {IVectorView<Uri>} 
     */
    ServerUris {
        get => this.get_ServerUris()
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
    get_ServerServiceName() {
        if (!this.HasProp("__IVpnChannelConfiguration")) {
            if ((queryResult := this.QueryInterface(IVpnChannelConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnChannelConfiguration := IVpnChannelConfiguration(outPtr)
        }

        return this.__IVpnChannelConfiguration.get_ServerServiceName()
    }

    /**
     * 
     * @returns {IVectorView<HostName>} 
     */
    get_ServerHostNameList() {
        if (!this.HasProp("__IVpnChannelConfiguration")) {
            if ((queryResult := this.QueryInterface(IVpnChannelConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnChannelConfiguration := IVpnChannelConfiguration(outPtr)
        }

        return this.__IVpnChannelConfiguration.get_ServerHostNameList()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CustomField() {
        if (!this.HasProp("__IVpnChannelConfiguration")) {
            if ((queryResult := this.QueryInterface(IVpnChannelConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnChannelConfiguration := IVpnChannelConfiguration(outPtr)
        }

        return this.__IVpnChannelConfiguration.get_CustomField()
    }

    /**
     * 
     * @returns {IVectorView<Uri>} 
     */
    get_ServerUris() {
        if (!this.HasProp("__IVpnChannelConfiguration2")) {
            if ((queryResult := this.QueryInterface(IVpnChannelConfiguration2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVpnChannelConfiguration2 := IVpnChannelConfiguration2(outPtr)
        }

        return this.__IVpnChannelConfiguration2.get_ServerUris()
    }

;@endregion Instance Methods
}
