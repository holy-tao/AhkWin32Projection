#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGeoposition.ahk
#Include .\IGeoposition2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a location that may contain latitude and longitude data or venue data.
 * @remarks
 * The [Geoposition](geoposition.md) class is the primary container for location information returned by the location service.
 * It wraps coordinate data and optional civic address information.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geoposition
 * @namespace Windows.Devices.Geolocation
 * @version WindowsRuntime 1.4
 */
class Geoposition extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGeoposition

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGeoposition.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The latitude and longitude associated with a geographic location.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geoposition.coordinate
     * @type {Geocoordinate} 
     */
    Coordinate {
        get => this.get_Coordinate()
    }

    /**
     * Unsupported API.
     * @remarks
     * Civic address is no longer available. Even when a Civic Address provider is installed, Geoposition.CivicAddress will always return `null`.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geoposition.civicaddress
     * @type {CivicAddress} 
     */
    CivicAddress {
        get => this.get_CivicAddress()
    }

    /**
     * Represents the venue associated with a geographic location.
     * @remarks
     * This property represents a venue, such as a shopping mall or office building. The [VenueData](venuedata.md) object is created as a property of the [Geoposition](geoposition.md) class when venue information is available for a geographic location. Otherwise, this property returns `null`.
     * 
     * Venue information is not available for all geographic locations. A [VenueData](venuedata.md) object will be returned only when the geographic location is within a venue that’s supported by the data provider.
     * 
     * 
     * 
     * > [!NOTE]
     * > In the current release, Bing is the exclusive data provider for all venue information.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geoposition.venuedata
     * @type {VenueData} 
     */
    VenueData {
        get => this.get_VenueData()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Geocoordinate} 
     */
    get_Coordinate() {
        if (!this.HasProp("__IGeoposition")) {
            if ((queryResult := this.QueryInterface(IGeoposition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeoposition := IGeoposition(outPtr)
        }

        return this.__IGeoposition.get_Coordinate()
    }

    /**
     * 
     * @returns {CivicAddress} 
     */
    get_CivicAddress() {
        if (!this.HasProp("__IGeoposition")) {
            if ((queryResult := this.QueryInterface(IGeoposition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeoposition := IGeoposition(outPtr)
        }

        return this.__IGeoposition.get_CivicAddress()
    }

    /**
     * 
     * @returns {VenueData} 
     */
    get_VenueData() {
        if (!this.HasProp("__IGeoposition2")) {
            if ((queryResult := this.QueryInterface(IGeoposition2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeoposition2 := IGeoposition2(outPtr)
        }

        return this.__IGeoposition2.get_VenueData()
    }

;@endregion Instance Methods
}
