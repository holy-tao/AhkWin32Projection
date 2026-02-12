#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMobileBroadbandModemConfiguration.ahk
#Include .\IMobileBroadbandModemConfiguration2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains details about the mobile broadband modem configuration.
 * @remarks
 * Your code gets instances of this class by using the [MobileBroadbandModem.GetCurrentConfigurationAsync](mobilebroadbandmodem_getcurrentconfigurationasync_1045804725.md) method. It does not instantiate this class directly.
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandmodemconfiguration
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class MobileBroadbandModemConfiguration extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMobileBroadbandModemConfiguration

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMobileBroadbandModemConfiguration.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets an object representing the Universal Integrated Circuit Card (UICC), commonly called a "SIM card", associated with the mobile broadband modem.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandmodemconfiguration.uicc
     * @type {MobileBroadbandUicc} 
     */
    Uicc {
        get => this.get_Uicc()
    }

    /**
     * Gets the home provider ID associated with the mobile broadband modem.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandmodemconfiguration.homeproviderid
     * @type {HSTRING} 
     */
    HomeProviderId {
        get => this.get_HomeProviderId()
    }

    /**
     * Gets the home provider name for the mobile broadband modem.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandmodemconfiguration.homeprovidername
     * @type {HSTRING} 
     */
    HomeProviderName {
        get => this.get_HomeProviderName()
    }

    /**
     * Gets the [MobileBroadbandSarManager](mobilebroadbandsarmanager.md) object that manages SAR and antenna relevant operations.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandmodemconfiguration.sarmanager
     * @type {MobileBroadbandSarManager} 
     */
    SarManager {
        get => this.get_SarManager()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {MobileBroadbandUicc} 
     */
    get_Uicc() {
        if (!this.HasProp("__IMobileBroadbandModemConfiguration")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandModemConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandModemConfiguration := IMobileBroadbandModemConfiguration(outPtr)
        }

        return this.__IMobileBroadbandModemConfiguration.get_Uicc()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_HomeProviderId() {
        if (!this.HasProp("__IMobileBroadbandModemConfiguration")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandModemConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandModemConfiguration := IMobileBroadbandModemConfiguration(outPtr)
        }

        return this.__IMobileBroadbandModemConfiguration.get_HomeProviderId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_HomeProviderName() {
        if (!this.HasProp("__IMobileBroadbandModemConfiguration")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandModemConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandModemConfiguration := IMobileBroadbandModemConfiguration(outPtr)
        }

        return this.__IMobileBroadbandModemConfiguration.get_HomeProviderName()
    }

    /**
     * 
     * @returns {MobileBroadbandSarManager} 
     */
    get_SarManager() {
        if (!this.HasProp("__IMobileBroadbandModemConfiguration2")) {
            if ((queryResult := this.QueryInterface(IMobileBroadbandModemConfiguration2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMobileBroadbandModemConfiguration2 := IMobileBroadbandModemConfiguration2(outPtr)
        }

        return this.__IMobileBroadbandModemConfiguration2.get_SarManager()
    }

;@endregion Instance Methods
}
