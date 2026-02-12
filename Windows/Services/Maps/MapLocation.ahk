#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMapLocation.ahk
#Include ..\..\..\Guid.ahk

/**
 * [Deprecated - see Remarks.] Represents a geographic location.
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
 * A collection of MapLocation objects is returned through the [Locations](maplocationfinderresult_locations.md) property of the [MapLocationFinderResult](maplocationfinderresult.md) when you call the methods of the [MapLocationFinder](maplocationfinder.md) class.
 * 
 * Your app must be authenticated before it can use the [MapControl](../windows.ui.xaml.controls.maps/mapcontrol.md) and map services in the [Windows.Services.Maps](windows_services_maps.md) namespace. To authenticate your app, you must specify a maps authentication key.
 * 
 * See [Request a maps authentication key](/windows/uwp/maps-and-location/authentication-key).
 * @see https://learn.microsoft.com/uwp/api/windows.services.maps.maplocation
 * @namespace Windows.Services.Maps
 * @version WindowsRuntime 1.4
 */
class MapLocation extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMapLocation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMapLocation.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the coordinates of a geographic location.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.maplocation.point
     * @type {Geopoint} 
     */
    Point {
        get => this.get_Point()
    }

    /**
     * Gets the display name of a geographic location.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.maplocation.displayname
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
    }

    /**
     * Gets the description of a geographic location.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.maplocation.description
     * @type {HSTRING} 
     */
    Description {
        get => this.get_Description()
    }

    /**
     * Gets the address of a geographic location.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.maplocation.address
     * @type {MapAddress} 
     */
    Address {
        get => this.get_Address()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Geopoint} 
     */
    get_Point() {
        if (!this.HasProp("__IMapLocation")) {
            if ((queryResult := this.QueryInterface(IMapLocation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapLocation := IMapLocation(outPtr)
        }

        return this.__IMapLocation.get_Point()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayName() {
        if (!this.HasProp("__IMapLocation")) {
            if ((queryResult := this.QueryInterface(IMapLocation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapLocation := IMapLocation(outPtr)
        }

        return this.__IMapLocation.get_DisplayName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Description() {
        if (!this.HasProp("__IMapLocation")) {
            if ((queryResult := this.QueryInterface(IMapLocation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapLocation := IMapLocation(outPtr)
        }

        return this.__IMapLocation.get_Description()
    }

    /**
     * 
     * @returns {MapAddress} 
     */
    get_Address() {
        if (!this.HasProp("__IMapLocation")) {
            if ((queryResult := this.QueryInterface(IMapLocation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapLocation := IMapLocation(outPtr)
        }

        return this.__IMapLocation.get_Address()
    }

;@endregion Instance Methods
}
