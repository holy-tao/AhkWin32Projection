#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMapAddress.ahk
#Include .\IMapAddress2.ahk
#Include ..\..\..\Guid.ahk

/**
 * [Deprecated - see Remarks.] Represents an address.
 * @remarks
 * > [!IMPORTANT]
 * > The UWP [MapControl](../windows.ui.xaml.controls.maps/mapcontrol.md) and Windows Maps platform APIs ([Windows.Services.Maps.*](../windows.services.maps/windows_services_maps.md)) are deprecated and may not be available in future versions of Windows. For more information, see [Resources for deprecated features](/windows/whats-new/deprecated-features-resources#windows-uwp-map-control-and-windows-maps-platform-apis).
 * 
 * > [!IMPORTANT]
 * > **Bing Maps for Enterprise service retirement**
 * >
 * > The UWP [MapControl](../windows.ui.xaml.controls.maps/mapcontrol.md) and map services from the [Windows.Services.Maps](windows_services_maps.md) namespaces rely on Bing Maps. Bing Maps for Enterprise is deprecated and will be retired, at which point the MapControl and services will no longer receive data.
 * >
 * > For more information, see the [Bing Maps Developer Center](https://www.bingmapsportal.com/) and [Bing Maps documentation](/bingmaps/getting-started/).
 * 
 * A collection of [MapLocation](maplocation.md) objects is returned through the [Locations](maplocationfinderresult_locations.md) property of the [MapLocationFinderResult](maplocationfinderresult.md) when you call the methods of the [MapLocationFinder](maplocationfinder.md) class. Each [MapLocation](maplocation.md) object has an [Address](maplocation_address.md) property which returns a MapAddress.
 * 
 * Your app must be authenticated before it can use the [MapControl](../windows.ui.xaml.controls.maps/mapcontrol.md) and map services in the [Windows.Services.Maps](windows_services_maps.md) namespace. To authenticate your app, you must specify a maps authentication key.
 * 
 * See [Request a maps authentication key](/windows/uwp/maps-and-location/authentication-key).
 * @see https://learn.microsoft.com/uwp/api/windows.services.maps.mapaddress
 * @namespace Windows.Services.Maps
 * @version WindowsRuntime 1.4
 */
class MapAddress extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMapAddress

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMapAddress.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the building name of an address.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.mapaddress.buildingname
     * @type {HSTRING} 
     */
    BuildingName {
        get => this.get_BuildingName()
    }

    /**
     * Gets or sets the building floor of an address.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.mapaddress.buildingfloor
     * @type {HSTRING} 
     */
    BuildingFloor {
        get => this.get_BuildingFloor()
    }

    /**
     * Gets or sets the building room of an address.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.mapaddress.buildingroom
     * @type {HSTRING} 
     */
    BuildingRoom {
        get => this.get_BuildingRoom()
    }

    /**
     * Gets or sets the building wing of an address.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.mapaddress.buildingwing
     * @type {HSTRING} 
     */
    BuildingWing {
        get => this.get_BuildingWing()
    }

    /**
     * Gets or sets the street number of an address.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.mapaddress.streetnumber
     * @type {HSTRING} 
     */
    StreetNumber {
        get => this.get_StreetNumber()
    }

    /**
     * Gets or sets the street of an address.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.mapaddress.street
     * @type {HSTRING} 
     */
    Street {
        get => this.get_Street()
    }

    /**
     * Gets or sets the neighborhood of an address.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.mapaddress.neighborhood
     * @type {HSTRING} 
     */
    Neighborhood {
        get => this.get_Neighborhood()
    }

    /**
     * Gets or sets the district of an address.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.mapaddress.district
     * @type {HSTRING} 
     */
    District {
        get => this.get_District()
    }

    /**
     * Gets or sets the town or city of an address.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.mapaddress.town
     * @type {HSTRING} 
     */
    Town {
        get => this.get_Town()
    }

    /**
     * Gets or sets the region (for example, the state or province) of an address.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.mapaddress.region
     * @type {HSTRING} 
     */
    Region {
        get => this.get_Region()
    }

    /**
     * Gets or sets the code for the region (for example, the state or province) of an address.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.mapaddress.regioncode
     * @type {HSTRING} 
     */
    RegionCode {
        get => this.get_RegionCode()
    }

    /**
     * Gets or sets the country of an address.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.mapaddress.country
     * @type {HSTRING} 
     */
    Country {
        get => this.get_Country()
    }

    /**
     * Gets or sets the country code of an address.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.mapaddress.countrycode
     * @type {HSTRING} 
     */
    CountryCode {
        get => this.get_CountryCode()
    }

    /**
     * Gets or sets the postal code of an address.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.mapaddress.postcode
     * @type {HSTRING} 
     */
    PostCode {
        get => this.get_PostCode()
    }

    /**
     * Gets or sets the continent of an address.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.mapaddress.continent
     * @type {HSTRING} 
     */
    Continent {
        get => this.get_Continent()
    }

    /**
     * Gets the complete address in string format.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.mapaddress.formattedaddress
     * @type {HSTRING} 
     */
    FormattedAddress {
        get => this.get_FormattedAddress()
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
    get_BuildingName() {
        if (!this.HasProp("__IMapAddress")) {
            if ((queryResult := this.QueryInterface(IMapAddress.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapAddress := IMapAddress(outPtr)
        }

        return this.__IMapAddress.get_BuildingName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_BuildingFloor() {
        if (!this.HasProp("__IMapAddress")) {
            if ((queryResult := this.QueryInterface(IMapAddress.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapAddress := IMapAddress(outPtr)
        }

        return this.__IMapAddress.get_BuildingFloor()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_BuildingRoom() {
        if (!this.HasProp("__IMapAddress")) {
            if ((queryResult := this.QueryInterface(IMapAddress.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapAddress := IMapAddress(outPtr)
        }

        return this.__IMapAddress.get_BuildingRoom()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_BuildingWing() {
        if (!this.HasProp("__IMapAddress")) {
            if ((queryResult := this.QueryInterface(IMapAddress.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapAddress := IMapAddress(outPtr)
        }

        return this.__IMapAddress.get_BuildingWing()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_StreetNumber() {
        if (!this.HasProp("__IMapAddress")) {
            if ((queryResult := this.QueryInterface(IMapAddress.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapAddress := IMapAddress(outPtr)
        }

        return this.__IMapAddress.get_StreetNumber()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Street() {
        if (!this.HasProp("__IMapAddress")) {
            if ((queryResult := this.QueryInterface(IMapAddress.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapAddress := IMapAddress(outPtr)
        }

        return this.__IMapAddress.get_Street()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Neighborhood() {
        if (!this.HasProp("__IMapAddress")) {
            if ((queryResult := this.QueryInterface(IMapAddress.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapAddress := IMapAddress(outPtr)
        }

        return this.__IMapAddress.get_Neighborhood()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_District() {
        if (!this.HasProp("__IMapAddress")) {
            if ((queryResult := this.QueryInterface(IMapAddress.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapAddress := IMapAddress(outPtr)
        }

        return this.__IMapAddress.get_District()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Town() {
        if (!this.HasProp("__IMapAddress")) {
            if ((queryResult := this.QueryInterface(IMapAddress.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapAddress := IMapAddress(outPtr)
        }

        return this.__IMapAddress.get_Town()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Region() {
        if (!this.HasProp("__IMapAddress")) {
            if ((queryResult := this.QueryInterface(IMapAddress.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapAddress := IMapAddress(outPtr)
        }

        return this.__IMapAddress.get_Region()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_RegionCode() {
        if (!this.HasProp("__IMapAddress")) {
            if ((queryResult := this.QueryInterface(IMapAddress.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapAddress := IMapAddress(outPtr)
        }

        return this.__IMapAddress.get_RegionCode()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Country() {
        if (!this.HasProp("__IMapAddress")) {
            if ((queryResult := this.QueryInterface(IMapAddress.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapAddress := IMapAddress(outPtr)
        }

        return this.__IMapAddress.get_Country()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CountryCode() {
        if (!this.HasProp("__IMapAddress")) {
            if ((queryResult := this.QueryInterface(IMapAddress.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapAddress := IMapAddress(outPtr)
        }

        return this.__IMapAddress.get_CountryCode()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PostCode() {
        if (!this.HasProp("__IMapAddress")) {
            if ((queryResult := this.QueryInterface(IMapAddress.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapAddress := IMapAddress(outPtr)
        }

        return this.__IMapAddress.get_PostCode()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Continent() {
        if (!this.HasProp("__IMapAddress")) {
            if ((queryResult := this.QueryInterface(IMapAddress.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapAddress := IMapAddress(outPtr)
        }

        return this.__IMapAddress.get_Continent()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_FormattedAddress() {
        if (!this.HasProp("__IMapAddress2")) {
            if ((queryResult := this.QueryInterface(IMapAddress2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapAddress2 := IMapAddress2(outPtr)
        }

        return this.__IMapAddress2.get_FormattedAddress()
    }

;@endregion Instance Methods
}
