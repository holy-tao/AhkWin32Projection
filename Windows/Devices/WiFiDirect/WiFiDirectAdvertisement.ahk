#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWiFiDirectAdvertisement.ahk
#Include .\IWiFiDirectAdvertisement2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a Wi-Fi Direct advertisement and allows the app to control the listen state and custom information elements in the advertisement.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.wifidirectadvertisement
 * @namespace Windows.Devices.WiFiDirect
 * @version WindowsRuntime 1.4
 */
class WiFiDirectAdvertisement extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWiFiDirectAdvertisement

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWiFiDirectAdvertisement.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Information elements to advertise in the Wi-Fi Direct advertisement.
     * @remarks
     * The default value for this property is **NULL**.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.wifidirectadvertisement.informationelements
     * @type {IVector<WiFiDirectInformationElement>} 
     */
    InformationElements {
        get => this.get_InformationElements()
        set => this.put_InformationElements(value)
    }

    /**
     * Gets or sets the listen state and whether the Wi-Fi Direct device is discoverable.
     * @remarks
     * The default value for this property is **None** (not discoverable).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.wifidirectadvertisement.listenstatediscoverability
     * @type {Integer} 
     */
    ListenStateDiscoverability {
        get => this.get_ListenStateDiscoverability()
        set => this.put_ListenStateDiscoverability(value)
    }

    /**
     * Whether autonomous group owner will be enabled.
     * @remarks
     * The default value for this property is **FALSE**.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.wifidirectadvertisement.isautonomousgroupownerenabled
     * @type {Boolean} 
     */
    IsAutonomousGroupOwnerEnabled {
        get => this.get_IsAutonomousGroupOwnerEnabled()
        set => this.put_IsAutonomousGroupOwnerEnabled(value)
    }

    /**
     * Gets the settings object for "legacy" (non-Wi-Fi Direct) connections.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.wifidirectadvertisement.legacysettings
     * @type {WiFiDirectLegacySettings} 
     */
    LegacySettings {
        get => this.get_LegacySettings()
    }

    /**
     * Gets a device's supported configuration methods.
     * 
     * When two devices are attempting to connect, their preferred pairing procedures and supported configuration methods are used to determine how pairing is accomplished.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifidirect.wifidirectadvertisement.supportedconfigurationmethods
     * @type {IVector<Integer>} 
     */
    SupportedConfigurationMethods {
        get => this.get_SupportedConfigurationMethods()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVector<WiFiDirectInformationElement>} 
     */
    get_InformationElements() {
        if (!this.HasProp("__IWiFiDirectAdvertisement")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectAdvertisement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectAdvertisement := IWiFiDirectAdvertisement(outPtr)
        }

        return this.__IWiFiDirectAdvertisement.get_InformationElements()
    }

    /**
     * 
     * @param {IVector<WiFiDirectInformationElement>} value 
     * @returns {HRESULT} 
     */
    put_InformationElements(value) {
        if (!this.HasProp("__IWiFiDirectAdvertisement")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectAdvertisement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectAdvertisement := IWiFiDirectAdvertisement(outPtr)
        }

        return this.__IWiFiDirectAdvertisement.put_InformationElements(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ListenStateDiscoverability() {
        if (!this.HasProp("__IWiFiDirectAdvertisement")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectAdvertisement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectAdvertisement := IWiFiDirectAdvertisement(outPtr)
        }

        return this.__IWiFiDirectAdvertisement.get_ListenStateDiscoverability()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ListenStateDiscoverability(value) {
        if (!this.HasProp("__IWiFiDirectAdvertisement")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectAdvertisement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectAdvertisement := IWiFiDirectAdvertisement(outPtr)
        }

        return this.__IWiFiDirectAdvertisement.put_ListenStateDiscoverability(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsAutonomousGroupOwnerEnabled() {
        if (!this.HasProp("__IWiFiDirectAdvertisement")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectAdvertisement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectAdvertisement := IWiFiDirectAdvertisement(outPtr)
        }

        return this.__IWiFiDirectAdvertisement.get_IsAutonomousGroupOwnerEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsAutonomousGroupOwnerEnabled(value) {
        if (!this.HasProp("__IWiFiDirectAdvertisement")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectAdvertisement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectAdvertisement := IWiFiDirectAdvertisement(outPtr)
        }

        return this.__IWiFiDirectAdvertisement.put_IsAutonomousGroupOwnerEnabled(value)
    }

    /**
     * 
     * @returns {WiFiDirectLegacySettings} 
     */
    get_LegacySettings() {
        if (!this.HasProp("__IWiFiDirectAdvertisement")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectAdvertisement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectAdvertisement := IWiFiDirectAdvertisement(outPtr)
        }

        return this.__IWiFiDirectAdvertisement.get_LegacySettings()
    }

    /**
     * 
     * @returns {IVector<Integer>} 
     */
    get_SupportedConfigurationMethods() {
        if (!this.HasProp("__IWiFiDirectAdvertisement2")) {
            if ((queryResult := this.QueryInterface(IWiFiDirectAdvertisement2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiDirectAdvertisement2 := IWiFiDirectAdvertisement2(outPtr)
        }

        return this.__IWiFiDirectAdvertisement2.get_SupportedConfigurationMethods()
    }

;@endregion Instance Methods
}
