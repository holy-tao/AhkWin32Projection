#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICivicAddress.ahk
#Include ..\..\..\Guid.ahk

/**
 * Unsupported API.
 * @remarks
 * Civic address is no longer available. Even when a Civic Address provider is installed, [Geoposition.CivicAddress](geoposition_civicaddress.md) will always return `null`.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.civicaddress
 * @namespace Windows.Devices.Geolocation
 * @version WindowsRuntime 1.4
 */
class CivicAddress extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICivicAddress

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICivicAddress.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Unsupported API.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.civicaddress.country
     * @type {HSTRING} 
     */
    Country {
        get => this.get_Country()
    }

    /**
     * Unsupported API.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.civicaddress.state
     * @type {HSTRING} 
     */
    State {
        get => this.get_State()
    }

    /**
     * Unsupported API.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.civicaddress.city
     * @type {HSTRING} 
     */
    City {
        get => this.get_City()
    }

    /**
     * Unsupported API.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.civicaddress.postalcode
     * @type {HSTRING} 
     */
    PostalCode {
        get => this.get_PostalCode()
    }

    /**
     * Unsupported API.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.civicaddress.timestamp
     * @type {DateTime} 
     */
    Timestamp {
        get => this.get_Timestamp()
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
    get_Country() {
        if (!this.HasProp("__ICivicAddress")) {
            if ((queryResult := this.QueryInterface(ICivicAddress.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICivicAddress := ICivicAddress(outPtr)
        }

        return this.__ICivicAddress.get_Country()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_State() {
        if (!this.HasProp("__ICivicAddress")) {
            if ((queryResult := this.QueryInterface(ICivicAddress.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICivicAddress := ICivicAddress(outPtr)
        }

        return this.__ICivicAddress.get_State()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_City() {
        if (!this.HasProp("__ICivicAddress")) {
            if ((queryResult := this.QueryInterface(ICivicAddress.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICivicAddress := ICivicAddress(outPtr)
        }

        return this.__ICivicAddress.get_City()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PostalCode() {
        if (!this.HasProp("__ICivicAddress")) {
            if ((queryResult := this.QueryInterface(ICivicAddress.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICivicAddress := ICivicAddress(outPtr)
        }

        return this.__ICivicAddress.get_PostalCode()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_Timestamp() {
        if (!this.HasProp("__ICivicAddress")) {
            if ((queryResult := this.QueryInterface(ICivicAddress.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICivicAddress := ICivicAddress(outPtr)
        }

        return this.__ICivicAddress.get_Timestamp()
    }

;@endregion Instance Methods
}
