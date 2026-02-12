#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\INetworkOperatorTetheringAccessPointConfiguration.ahk
#Include .\INetworkOperatorTetheringAccessPointConfiguration2.ahk
#Include .\INetworkOperatorTetheringAccessPointConfiguration3.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides the ability to configure and create an object that contains a specific tethering network SSID, and specifies the passphrase used to authenticate clients trying to establish a network connection to the tethering network.
  * 
  * Tethering allows a Windows device to function as a mobile hotspot providing internet connections over Wi-Fi or Bluetooth. Properties can be configured on the Wi-Fi access point such as the network SSID, the password, and the wireless frequency band.
 * @remarks
 * Windows 10, version 1607, supports Mobile Hotspot, an enhanced version of the mobile broadband tethering feature. The Mobile Hotspot and Wi-Fi Direct technology can't both run at the same time. Mobile Hotspot takes precedence over all Wi-Fi Direct scenarios. For example, screen projection and tethering can't both run at the same time.
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.networkoperatortetheringaccesspointconfiguration
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class NetworkOperatorTetheringAccessPointConfiguration extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => INetworkOperatorTetheringAccessPointConfiguration

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => INetworkOperatorTetheringAccessPointConfiguration.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the SSID to be used for the tethering network.
     * 
     * > [!NOTE]
     * > The SSID is encoded using the Microsoft code page for the system's default locale. This SSID may appear differently in the Windows network selection UI on a system that uses a different system locale. It is highly recommended that you set the value using characters from the standard ASCII printable character set to avoid any cross-locale inconsistencies.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.networkoperatortetheringaccesspointconfiguration.ssid
     * @type {HSTRING} 
     */
    Ssid {
        get => this.get_Ssid()
        set => this.put_Ssid(value)
    }

    /**
     * Gets or sets the passphrase used to authenticate the connection.
     * 
     * > [!NOTE]
     * > As detailed in the [802.11 specification]( http://go.microsoft.com/fwlink/p/?LinkID=306038), a passphrase must contain between 8 and 63 characters in the standard ASCII printable character set.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.networkoperatortetheringaccesspointconfiguration.passphrase
     * @type {HSTRING} 
     */
    Passphrase {
        get => this.get_Passphrase()
        set => this.put_Passphrase(value)
    }

    /**
     * Gets or sets the wireless frequency band of the Wi-Fi access point. Use [IsBandSupported](networkoperatortetheringaccesspointconfiguration_isbandsupported_675204954.md) or [IsBandSupportedAsync](networkoperatortetheringaccesspointconfiguration_isbandsupportedasync_854171434.md) to check whether the Wi-Fi adapter allows configuring a specific frequency band.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.networkoperatortetheringaccesspointconfiguration.band
     * @type {Integer} 
     */
    Band {
        get => this.get_Band()
        set => this.put_Band(value)
    }

    /**
     * Gets or sets the authentication kind to be used for the Wi-Fi tethering connection.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.networkoperatortetheringaccesspointconfiguration.authenticationkind
     * @type {Integer} 
     */
    AuthenticationKind {
        get => this.get_AuthenticationKind()
        set => this.put_AuthenticationKind(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates an instance of the [NetworkOperatorTetheringAccessPointConfiguration](networkoperatortetheringaccesspointconfiguration.md).
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Networking.NetworkOperators.NetworkOperatorTetheringAccessPointConfiguration")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Ssid() {
        if (!this.HasProp("__INetworkOperatorTetheringAccessPointConfiguration")) {
            if ((queryResult := this.QueryInterface(INetworkOperatorTetheringAccessPointConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INetworkOperatorTetheringAccessPointConfiguration := INetworkOperatorTetheringAccessPointConfiguration(outPtr)
        }

        return this.__INetworkOperatorTetheringAccessPointConfiguration.get_Ssid()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Ssid(value) {
        if (!this.HasProp("__INetworkOperatorTetheringAccessPointConfiguration")) {
            if ((queryResult := this.QueryInterface(INetworkOperatorTetheringAccessPointConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INetworkOperatorTetheringAccessPointConfiguration := INetworkOperatorTetheringAccessPointConfiguration(outPtr)
        }

        return this.__INetworkOperatorTetheringAccessPointConfiguration.put_Ssid(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Passphrase() {
        if (!this.HasProp("__INetworkOperatorTetheringAccessPointConfiguration")) {
            if ((queryResult := this.QueryInterface(INetworkOperatorTetheringAccessPointConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INetworkOperatorTetheringAccessPointConfiguration := INetworkOperatorTetheringAccessPointConfiguration(outPtr)
        }

        return this.__INetworkOperatorTetheringAccessPointConfiguration.get_Passphrase()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Passphrase(value) {
        if (!this.HasProp("__INetworkOperatorTetheringAccessPointConfiguration")) {
            if ((queryResult := this.QueryInterface(INetworkOperatorTetheringAccessPointConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INetworkOperatorTetheringAccessPointConfiguration := INetworkOperatorTetheringAccessPointConfiguration(outPtr)
        }

        return this.__INetworkOperatorTetheringAccessPointConfiguration.put_Passphrase(value)
    }

    /**
     * Checks whether the Wi-Fi access point supports the specified wireless frequency band.
     * @param {Integer} band A [TetheringWiFiBand](tetheringwifiband.md) constant, specifying the frequency band to query about.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.networkoperatortetheringaccesspointconfiguration.isbandsupported
     */
    IsBandSupported(band) {
        if (!this.HasProp("__INetworkOperatorTetheringAccessPointConfiguration2")) {
            if ((queryResult := this.QueryInterface(INetworkOperatorTetheringAccessPointConfiguration2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INetworkOperatorTetheringAccessPointConfiguration2 := INetworkOperatorTetheringAccessPointConfiguration2(outPtr)
        }

        return this.__INetworkOperatorTetheringAccessPointConfiguration2.IsBandSupported(band)
    }

    /**
     * Asynchronously checks whether the Wi-Fi access point supports the specified wireless frequency band.
     * @param {Integer} band A [TetheringWiFiBand](tetheringwifiband.md) constant, specifying the frequency band to query about.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.networkoperatortetheringaccesspointconfiguration.isbandsupportedasync
     */
    IsBandSupportedAsync(band) {
        if (!this.HasProp("__INetworkOperatorTetheringAccessPointConfiguration2")) {
            if ((queryResult := this.QueryInterface(INetworkOperatorTetheringAccessPointConfiguration2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INetworkOperatorTetheringAccessPointConfiguration2 := INetworkOperatorTetheringAccessPointConfiguration2(outPtr)
        }

        return this.__INetworkOperatorTetheringAccessPointConfiguration2.IsBandSupportedAsync(band)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Band() {
        if (!this.HasProp("__INetworkOperatorTetheringAccessPointConfiguration2")) {
            if ((queryResult := this.QueryInterface(INetworkOperatorTetheringAccessPointConfiguration2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INetworkOperatorTetheringAccessPointConfiguration2 := INetworkOperatorTetheringAccessPointConfiguration2(outPtr)
        }

        return this.__INetworkOperatorTetheringAccessPointConfiguration2.get_Band()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Band(value) {
        if (!this.HasProp("__INetworkOperatorTetheringAccessPointConfiguration2")) {
            if ((queryResult := this.QueryInterface(INetworkOperatorTetheringAccessPointConfiguration2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INetworkOperatorTetheringAccessPointConfiguration2 := INetworkOperatorTetheringAccessPointConfiguration2(outPtr)
        }

        return this.__INetworkOperatorTetheringAccessPointConfiguration2.put_Band(value)
    }

    /**
     * Retrieves a value indicating whether the Wi-Fi adapter allows configuring the access point with a specific authentication kind.
     * @param {Integer} authenticationKind A [TetheringWiFiAuthenticationKind](./tetheringwifiauthenticationkind.md) enumeration value, specifying the authentication kind to query about.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.networkoperatortetheringaccesspointconfiguration.isauthenticationkindsupported
     */
    IsAuthenticationKindSupported(authenticationKind) {
        if (!this.HasProp("__INetworkOperatorTetheringAccessPointConfiguration3")) {
            if ((queryResult := this.QueryInterface(INetworkOperatorTetheringAccessPointConfiguration3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INetworkOperatorTetheringAccessPointConfiguration3 := INetworkOperatorTetheringAccessPointConfiguration3(outPtr)
        }

        return this.__INetworkOperatorTetheringAccessPointConfiguration3.IsAuthenticationKindSupported(authenticationKind)
    }

    /**
     * Asynchronously retrieves a value indicating whether the Wi-Fi adapter allows configuring the access point with a specific authentication kind.
     * @param {Integer} authenticationKind A [TetheringWiFiAuthenticationKind](./tetheringwifiauthenticationkind.md) enumeration value, specifying the authentication kind to query about.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.networkoperatortetheringaccesspointconfiguration.isauthenticationkindsupportedasync
     */
    IsAuthenticationKindSupportedAsync(authenticationKind) {
        if (!this.HasProp("__INetworkOperatorTetheringAccessPointConfiguration3")) {
            if ((queryResult := this.QueryInterface(INetworkOperatorTetheringAccessPointConfiguration3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INetworkOperatorTetheringAccessPointConfiguration3 := INetworkOperatorTetheringAccessPointConfiguration3(outPtr)
        }

        return this.__INetworkOperatorTetheringAccessPointConfiguration3.IsAuthenticationKindSupportedAsync(authenticationKind)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AuthenticationKind() {
        if (!this.HasProp("__INetworkOperatorTetheringAccessPointConfiguration3")) {
            if ((queryResult := this.QueryInterface(INetworkOperatorTetheringAccessPointConfiguration3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INetworkOperatorTetheringAccessPointConfiguration3 := INetworkOperatorTetheringAccessPointConfiguration3(outPtr)
        }

        return this.__INetworkOperatorTetheringAccessPointConfiguration3.get_AuthenticationKind()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_AuthenticationKind(value) {
        if (!this.HasProp("__INetworkOperatorTetheringAccessPointConfiguration3")) {
            if ((queryResult := this.QueryInterface(INetworkOperatorTetheringAccessPointConfiguration3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INetworkOperatorTetheringAccessPointConfiguration3 := INetworkOperatorTetheringAccessPointConfiguration3(outPtr)
        }

        return this.__INetworkOperatorTetheringAccessPointConfiguration3.put_AuthenticationKind(value)
    }

;@endregion Instance Methods
}
