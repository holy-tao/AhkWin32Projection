#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWiFiDirectLegacySettings.ahk
#Include ..\..\..\Guid.ahk

/**
 * Settings governing "legacy" mode (non-Wi-Fi Direct connections to the access point being advertised.)
 * @remarks
 * The access point allows devices that do not support Wi-Fi Direct to connect to a device that does support it, and to use the services offered by the Wi-Fi Direct device. The connection does not serve as a general-purpose Wi-Fi access point.
 * 
 * Your code retrieves instances of this class through the [WiFiDirectAdvertisement.LegacySettings](wifidirectadvertisement_legacysettings.md) property. It does not instantiate the class directly.
 * 
 * The SSID is initially set to a Wi-Fi Direct-compatible random string beginning with ""DIRECT-"". Your code can change this value to a different SSID if you choose to do so.
 * 
 * The pass phrase is initialized to a random alphanumeric string. Your code can change this value to a different pass phrase if you choose to do so.
 * 
 * Windows 10, version 1607 supports Mobile Hotspot, an enhanced version of the mobile broadband tethering feature. If an application uses the functionality of the **WiFiDirectLegacySettings** class to start the Wi-Fi Direct group owner role, and if the Mobile Hotspot is subsequently started, the functionality of this class is not supported. It is likely to stop working. 
 * 
 * The Mobile Hotspot and Wi-Fi Direct technologies cannot run at the same time. Mobile Hotspot takes precedence over all Wi-Fi Direct scenarios.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.wifidirectlegacysettings
 * @namespace Windows.Devices.WiFiDirect
 * @version WindowsRuntime 1.4
 */
class WiFiDirectLegacySettings extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWiFiDirectLegacySettings

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWiFiDirectLegacySettings.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets a value specifying whether "legacy mode" is enabled. When enabled, this mode causes this device to act as a normal Wi-Fi access point, and is intended to support devices which do not support connection via Wi-Fi Direct.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.wifidirectlegacysettings.isenabled
     * @type {Boolean} 
     */
    IsEnabled {
        get => this.get_IsEnabled()
        set => this.put_IsEnabled(value)
    }

    /**
     * Gets or sets the Service Set Identifier (SSID, or "access point ID").
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.wifidirectlegacysettings.ssid
     * @type {HSTRING} 
     */
    Ssid {
        get => this.get_Ssid()
        set => this.put_Ssid(value)
    }

    /**
     * Gets or sets the pass phrase used by non-Wi-Fi Direct clients to connect to this access point in "legacy mode".
     * @remarks
     * Windows 10 and Windows 10 Mobile can be configured to allow embedded mode, which allows a device to run a single app. If embedded mode is configured, the Passphrase value can be explicitly set to **null** to support Open/None Authentication. Not all Wi-Fi adapters may support this feature on Windows. For more information, see [Embedded mode](/windows/iot-core/develop-your-app/EmbeddedMode).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.wifidirectlegacysettings.passphrase
     * @type {PasswordCredential} 
     */
    Passphrase {
        get => this.get_Passphrase()
        set => this.put_Passphrase(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsEnabled() {
        if (!this.HasProp("__IWiFiDirectLegacySettings")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectLegacySettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectLegacySettings := IWiFiDirectLegacySettings(outPtr)
        }

        return this.__IWiFiDirectLegacySettings.get_IsEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsEnabled(value) {
        if (!this.HasProp("__IWiFiDirectLegacySettings")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectLegacySettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectLegacySettings := IWiFiDirectLegacySettings(outPtr)
        }

        return this.__IWiFiDirectLegacySettings.put_IsEnabled(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Ssid() {
        if (!this.HasProp("__IWiFiDirectLegacySettings")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectLegacySettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectLegacySettings := IWiFiDirectLegacySettings(outPtr)
        }

        return this.__IWiFiDirectLegacySettings.get_Ssid()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Ssid(value) {
        if (!this.HasProp("__IWiFiDirectLegacySettings")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectLegacySettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectLegacySettings := IWiFiDirectLegacySettings(outPtr)
        }

        return this.__IWiFiDirectLegacySettings.put_Ssid(value)
    }

    /**
     * 
     * @returns {PasswordCredential} 
     */
    get_Passphrase() {
        if (!this.HasProp("__IWiFiDirectLegacySettings")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectLegacySettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectLegacySettings := IWiFiDirectLegacySettings(outPtr)
        }

        return this.__IWiFiDirectLegacySettings.get_Passphrase()
    }

    /**
     * 
     * @param {PasswordCredential} value 
     * @returns {HRESULT} 
     */
    put_Passphrase(value) {
        if (!this.HasProp("__IWiFiDirectLegacySettings")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectLegacySettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectLegacySettings := IWiFiDirectLegacySettings(outPtr)
        }

        return this.__IWiFiDirectLegacySettings.put_Passphrase(value)
    }

;@endregion Instance Methods
}
