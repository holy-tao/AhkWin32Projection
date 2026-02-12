#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\INetworkOperatorTetheringSessionAccessPointConfiguration.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains all per-session configuration fields used to configure the Wi-Fi tethering hotspot, plus relevant helper methods.
  * 
  * **NetworkOperatorTetheringSessionAccessPointConfiguration** contains the same fields and helper methods as its persistent counterpart [NetworkOperatorTetheringAccessPointConfiguration](./networkoperatortetheringaccesspointconfiguration.md) does, with several additions. But all the configurable properties from **NetworkOperatorTetheringSessionAccessPointConfiguration** are treated as per-session, including all the shared properties.
  * 
  * **NetworkOperatorTetheringSessionAccessPointConfiguration** is used primarily in combination with [StartTetheringAsync](./networkoperatortetheringmanager_starttetheringasync_1060696031.md) to specify the per-session tethering configuration. Doing so won't clear or alter the existing persistent configuration. Calling **StartTetheringAsync** with no parameters always uses the persistent configuration pre-configured via [ConfigureAccessPointAsync](./networkoperatortetheringmanager_configureaccesspointasync_1399951422.md).
 * @remarks
 * Tethering is a feature that allows a Windows device to function as a mobile hotspot: providing internet connections to other devices over Wi-Fi or Bluetooth. Four persistent fields can be configured on the Wi-Fi tethering hotspot: the network SSID, the network password, the network wireless frequency band (for example, 2.4 GHz, 5 GHz, 6 GHz), and the network authentication algorithm (for example, WPA2, WPA3). Once set, all of those fields persist between tethering sessions; meaning that the values are stored in non-volatile storage.
 * 
 * But you can also start a tethering session using an entirely per-session configuration. A per-session tethering configuration doesn't persist between tethering sessions, and doesn't alter the current persistent configuration. A per-session field is *performance priority*.
 * 
 * So the purpose of **NetworkOperatorTetheringSessionAccessPointConfiguration** is to specify the per-session tethering configuration when starting the tethering session via [StartTetheringAsync](./networkoperatortetheringmanager_starttetheringasync_1060696031.md). The additional members of this per-session-only class are typically values that aren't currently configurable by users via Windows **Settings**.
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.networkoperatortetheringsessionaccesspointconfiguration
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class NetworkOperatorTetheringSessionAccessPointConfiguration extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => INetworkOperatorTetheringSessionAccessPointConfiguration

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => INetworkOperatorTetheringSessionAccessPointConfiguration.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the network SSID to be used for the Wi-Fi tethering connection. Similar to [NetworkOperatorTetheringAccessPointConfiguration.Ssid](./networkoperatortetheringaccesspointconfiguration_ssid.md).
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.networkoperatortetheringsessionaccesspointconfiguration.ssid
     * @type {HSTRING} 
     */
    Ssid {
        get => this.get_Ssid()
        set => this.put_Ssid(value)
    }

    /**
     * Gets or sets the network passphrase to be used for the Wi-Fi tethering connection. Similar to [NetworkOperatorTetheringAccessPointConfiguration.Passphrase](./networkoperatortetheringaccesspointconfiguration_passphrase.md).
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.networkoperatortetheringsessionaccesspointconfiguration.passphrase
     * @type {HSTRING} 
     */
    Passphrase {
        get => this.get_Passphrase()
        set => this.put_Passphrase(value)
    }

    /**
     * Gets or sets the frequency band to be used for the Wi-Fi tethering connection. Similar to [NetworkOperatorTetheringAccessPointConfiguration.Band](./networkoperatortetheringaccesspointconfiguration_band.md).
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.networkoperatortetheringsessionaccesspointconfiguration.band
     * @type {Integer} 
     */
    Band {
        get => this.get_Band()
        set => this.put_Band(value)
    }

    /**
     * Gets or sets the authentication kind to be used for the Wi-Fi tethering connection. Similar to [NetworkOperatorTetheringAccessPointConfiguration.AuthenticationKind](./networkoperatortetheringaccesspointconfiguration_authenticationkind.md).
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.networkoperatortetheringsessionaccesspointconfiguration.authenticationkind
     * @type {Integer} 
     */
    AuthenticationKind {
        get => this.get_AuthenticationKind()
        set => this.put_AuthenticationKind(value)
    }

    /**
     * Gets or sets the performance priority value to be used for the Wi-Fi tethering connection when the main internet connection is also over Wi-Fi. If the station connection is on a frequency band that interferes with the requested tethering frequency band, then the Wi-Fi chipset will attempt to change the connection's frequency band to another one that won't interfere.
     * 
     * Many Wi-Fi chipsets have a limitation where if the main connection is over a 5 GHz band, then the tethering hotspot can't be configured to use a 6 GHz band. Prioritizing the tethering connection ([TetheringOverStation](./tetheringwifiperformancepriority.md)) will tell the Wi-Fi chipset to attempt to change the main connection over to a 2.4 GHz band, so that there'll no longer be interference with the requested 6 GHz band for the tethering hotspot.
     * 
     * If the frequency band shift isn't possible or allowed by specifying a different performance priority value, then calling [StartTetheringAsync](./networkoperatortetheringmanager_starttetheringasync_1060696031.md) will fail with an appropriate result status (BandInterference).
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.networkoperatortetheringsessionaccesspointconfiguration.performancepriority
     * @type {Integer} 
     */
    PerformancePriority {
        get => this.get_PerformancePriority()
        set => this.put_PerformancePriority(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates an instance of the [NetworkOperatorTetheringSessionAccessPointConfiguration](./networkoperatortetheringsessionaccesspointconfiguration.md).
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Networking.NetworkOperators.NetworkOperatorTetheringSessionAccessPointConfiguration")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Ssid() {
        if (!this.HasProp("__INetworkOperatorTetheringSessionAccessPointConfiguration")) {
            if ((queryResult := this.QueryInterface(INetworkOperatorTetheringSessionAccessPointConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INetworkOperatorTetheringSessionAccessPointConfiguration := INetworkOperatorTetheringSessionAccessPointConfiguration(outPtr)
        }

        return this.__INetworkOperatorTetheringSessionAccessPointConfiguration.get_Ssid()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Ssid(value) {
        if (!this.HasProp("__INetworkOperatorTetheringSessionAccessPointConfiguration")) {
            if ((queryResult := this.QueryInterface(INetworkOperatorTetheringSessionAccessPointConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INetworkOperatorTetheringSessionAccessPointConfiguration := INetworkOperatorTetheringSessionAccessPointConfiguration(outPtr)
        }

        return this.__INetworkOperatorTetheringSessionAccessPointConfiguration.put_Ssid(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Passphrase() {
        if (!this.HasProp("__INetworkOperatorTetheringSessionAccessPointConfiguration")) {
            if ((queryResult := this.QueryInterface(INetworkOperatorTetheringSessionAccessPointConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INetworkOperatorTetheringSessionAccessPointConfiguration := INetworkOperatorTetheringSessionAccessPointConfiguration(outPtr)
        }

        return this.__INetworkOperatorTetheringSessionAccessPointConfiguration.get_Passphrase()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Passphrase(value) {
        if (!this.HasProp("__INetworkOperatorTetheringSessionAccessPointConfiguration")) {
            if ((queryResult := this.QueryInterface(INetworkOperatorTetheringSessionAccessPointConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INetworkOperatorTetheringSessionAccessPointConfiguration := INetworkOperatorTetheringSessionAccessPointConfiguration(outPtr)
        }

        return this.__INetworkOperatorTetheringSessionAccessPointConfiguration.put_Passphrase(value)
    }

    /**
     * Gets a value indicating whether the Wi-Fi adapter allows configuring the tethering hotspot with a specific frequency band. Similar to [NetworkOperatorTetheringAccessPointConfiguration.IsBandSupported](./networkoperatortetheringaccesspointconfiguration_isbandsupported_675204954.md).
     * @param {Integer} band Specifies the frequency band to query for.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.networkoperatortetheringsessionaccesspointconfiguration.isbandsupported
     */
    IsBandSupported(band) {
        if (!this.HasProp("__INetworkOperatorTetheringSessionAccessPointConfiguration")) {
            if ((queryResult := this.QueryInterface(INetworkOperatorTetheringSessionAccessPointConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INetworkOperatorTetheringSessionAccessPointConfiguration := INetworkOperatorTetheringSessionAccessPointConfiguration(outPtr)
        }

        return this.__INetworkOperatorTetheringSessionAccessPointConfiguration.IsBandSupported(band)
    }

    /**
     * Asynchronously gets a value indicating whether the Wi-Fi adapter allows configuring the tethering hotspot with a specific frequency band. Similar to [NetworkOperatorTetheringAccessPointConfiguration.IsBandSupportedAsync](./networkoperatortetheringaccesspointconfiguration_isbandsupportedasync_854171434.md).
     * @param {Integer} band Specifies the frequency band to query for.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.networkoperatortetheringsessionaccesspointconfiguration.isbandsupportedasync
     */
    IsBandSupportedAsync(band) {
        if (!this.HasProp("__INetworkOperatorTetheringSessionAccessPointConfiguration")) {
            if ((queryResult := this.QueryInterface(INetworkOperatorTetheringSessionAccessPointConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INetworkOperatorTetheringSessionAccessPointConfiguration := INetworkOperatorTetheringSessionAccessPointConfiguration(outPtr)
        }

        return this.__INetworkOperatorTetheringSessionAccessPointConfiguration.IsBandSupportedAsync(band)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Band() {
        if (!this.HasProp("__INetworkOperatorTetheringSessionAccessPointConfiguration")) {
            if ((queryResult := this.QueryInterface(INetworkOperatorTetheringSessionAccessPointConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INetworkOperatorTetheringSessionAccessPointConfiguration := INetworkOperatorTetheringSessionAccessPointConfiguration(outPtr)
        }

        return this.__INetworkOperatorTetheringSessionAccessPointConfiguration.get_Band()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Band(value) {
        if (!this.HasProp("__INetworkOperatorTetheringSessionAccessPointConfiguration")) {
            if ((queryResult := this.QueryInterface(INetworkOperatorTetheringSessionAccessPointConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INetworkOperatorTetheringSessionAccessPointConfiguration := INetworkOperatorTetheringSessionAccessPointConfiguration(outPtr)
        }

        return this.__INetworkOperatorTetheringSessionAccessPointConfiguration.put_Band(value)
    }

    /**
     * Gets a value indicating whether the Wi-Fi adapter allows configuring the tethering hotspot with a specific authentication kind. Similar to [NetworkOperatorTetheringAccessPointConfiguration.IsAuthenticationKindSupported](./networkoperatortetheringaccesspointconfiguration_isauthenticationkindsupported_1988795581.md).
     * @param {Integer} authenticationKind Specifies the authentication kind to query for.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.networkoperatortetheringsessionaccesspointconfiguration.isauthenticationkindsupported
     */
    IsAuthenticationKindSupported(authenticationKind) {
        if (!this.HasProp("__INetworkOperatorTetheringSessionAccessPointConfiguration")) {
            if ((queryResult := this.QueryInterface(INetworkOperatorTetheringSessionAccessPointConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INetworkOperatorTetheringSessionAccessPointConfiguration := INetworkOperatorTetheringSessionAccessPointConfiguration(outPtr)
        }

        return this.__INetworkOperatorTetheringSessionAccessPointConfiguration.IsAuthenticationKindSupported(authenticationKind)
    }

    /**
     * Asynchronously gets a value indicating whether the Wi-Fi adapter allows configuring the tethering hotspot with a specific authentication kind. Similar to [NetworkOperatorTetheringAccessPointConfiguration.IsAuthenticationKindSupportedAsync](./networkoperatortetheringaccesspointconfiguration_isauthenticationkindsupportedasync_453305428.md).
     * @param {Integer} authenticationKind Specifies the authentication kind to query for.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.networkoperatortetheringsessionaccesspointconfiguration.isauthenticationkindsupportedasync
     */
    IsAuthenticationKindSupportedAsync(authenticationKind) {
        if (!this.HasProp("__INetworkOperatorTetheringSessionAccessPointConfiguration")) {
            if ((queryResult := this.QueryInterface(INetworkOperatorTetheringSessionAccessPointConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INetworkOperatorTetheringSessionAccessPointConfiguration := INetworkOperatorTetheringSessionAccessPointConfiguration(outPtr)
        }

        return this.__INetworkOperatorTetheringSessionAccessPointConfiguration.IsAuthenticationKindSupportedAsync(authenticationKind)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AuthenticationKind() {
        if (!this.HasProp("__INetworkOperatorTetheringSessionAccessPointConfiguration")) {
            if ((queryResult := this.QueryInterface(INetworkOperatorTetheringSessionAccessPointConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INetworkOperatorTetheringSessionAccessPointConfiguration := INetworkOperatorTetheringSessionAccessPointConfiguration(outPtr)
        }

        return this.__INetworkOperatorTetheringSessionAccessPointConfiguration.get_AuthenticationKind()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_AuthenticationKind(value) {
        if (!this.HasProp("__INetworkOperatorTetheringSessionAccessPointConfiguration")) {
            if ((queryResult := this.QueryInterface(INetworkOperatorTetheringSessionAccessPointConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INetworkOperatorTetheringSessionAccessPointConfiguration := INetworkOperatorTetheringSessionAccessPointConfiguration(outPtr)
        }

        return this.__INetworkOperatorTetheringSessionAccessPointConfiguration.put_AuthenticationKind(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PerformancePriority() {
        if (!this.HasProp("__INetworkOperatorTetheringSessionAccessPointConfiguration")) {
            if ((queryResult := this.QueryInterface(INetworkOperatorTetheringSessionAccessPointConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INetworkOperatorTetheringSessionAccessPointConfiguration := INetworkOperatorTetheringSessionAccessPointConfiguration(outPtr)
        }

        return this.__INetworkOperatorTetheringSessionAccessPointConfiguration.get_PerformancePriority()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_PerformancePriority(value) {
        if (!this.HasProp("__INetworkOperatorTetheringSessionAccessPointConfiguration")) {
            if ((queryResult := this.QueryInterface(INetworkOperatorTetheringSessionAccessPointConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INetworkOperatorTetheringSessionAccessPointConfiguration := INetworkOperatorTetheringSessionAccessPointConfiguration(outPtr)
        }

        return this.__INetworkOperatorTetheringSessionAccessPointConfiguration.put_PerformancePriority(value)
    }

;@endregion Instance Methods
}
