#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMapRouteManeuver.ahk
#Include .\IMapRouteManeuver2.ahk
#Include .\IMapRouteManeuver3.ahk
#Include ..\..\..\Guid.ahk

/**
 * [Deprecated - see Remarks.] Represents actions to be taken along the path of a route leg.
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
 * A collection of MapRouteManeuver objects is returned through the [Maneuvers](maprouteleg_maneuvers.md) property of a [MapRouteLeg](maprouteleg.md) object. A collection of [MapRouteLeg](maprouteleg.md) objects is returned through the [Legs](maproute_legs.md) property of a [MapRoute](maproute.md) object. A [MapRoute](maproute.md) object is returned through the [Route](maproute.md) property of the [MapRouteFinderResult](maproutefinderresult.md) when you call the methods of the [MapRouteFinder](maproutefinder.md) class.
 * 
 * Your app must be authenticated before it can use the [MapControl](../windows.ui.xaml.controls.maps/mapcontrol.md) and map services in the [Windows.Services.Maps](windows_services_maps.md) namespace. To authenticate your app, you must specify a maps authentication key.
 * 
 * See [Request a maps authentication key](/windows/uwp/maps-and-location/authentication-key).
 * @see https://learn.microsoft.com/uwp/api/windows.services.maps.maproutemaneuver
 * @namespace Windows.Services.Maps
 * @version WindowsRuntime 1.4
 */
class MapRouteManeuver extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMapRouteManeuver

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMapRouteManeuver.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the location where the maneuver starts.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.maproutemaneuver.startingpoint
     * @type {Geopoint} 
     */
    StartingPoint {
        get => this.get_StartingPoint()
    }

    /**
     * Gets the distance in meters to the start of the next maneuver.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.maproutemaneuver.lengthinmeters
     * @type {Float} 
     */
    LengthInMeters {
        get => this.get_LengthInMeters()
    }

    /**
     * Gets the instruction text associated with the maneuver.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.maproutemaneuver.instructiontext
     * @type {HSTRING} 
     */
    InstructionText {
        get => this.get_InstructionText()
    }

    /**
     * Gets the type of the maneuver.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.maproutemaneuver.kind
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
    }

    /**
     * Gets the exit number of route maneuver.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.maproutemaneuver.exitnumber
     * @type {HSTRING} 
     */
    ExitNumber {
        get => this.get_ExitNumber()
    }

    /**
     * Gets additional information associated with the maneuver.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.maproutemaneuver.maneuvernotices
     * @type {Integer} 
     */
    ManeuverNotices {
        get => this.get_ManeuverNotices()
    }

    /**
     * Gets a value that indicates the heading at the start of the maneuver in degrees, where 0 or 360 = North, 90 = East, 180 = South, and 270 = West.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.maproutemaneuver.startheading
     * @type {Float} 
     */
    StartHeading {
        get => this.get_StartHeading()
    }

    /**
     * Gets a value that indicates the heading at the end of the maneuver in degrees, where 0 or 360 = North, 90 = East, 180 = South, and 270 = West.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.maproutemaneuver.endheading
     * @type {Float} 
     */
    EndHeading {
        get => this.get_EndHeading()
    }

    /**
     * Gets the street name specified in [InstructionText](maproutemaneuver_instructiontext.md), if available.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.maproutemaneuver.streetname
     * @type {HSTRING} 
     */
    StreetName {
        get => this.get_StreetName()
    }

    /**
     * Gets a list of potential issues along a route leg.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.maproutemaneuver.warnings
     * @type {IVectorView<ManeuverWarning>} 
     */
    Warnings {
        get => this.get_Warnings()
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
    get_StartingPoint() {
        if (!this.HasProp("__IMapRouteManeuver")) {
            if ((queryResult := this.QueryInterface(IMapRouteManeuver.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapRouteManeuver := IMapRouteManeuver(outPtr)
        }

        return this.__IMapRouteManeuver.get_StartingPoint()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_LengthInMeters() {
        if (!this.HasProp("__IMapRouteManeuver")) {
            if ((queryResult := this.QueryInterface(IMapRouteManeuver.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapRouteManeuver := IMapRouteManeuver(outPtr)
        }

        return this.__IMapRouteManeuver.get_LengthInMeters()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_InstructionText() {
        if (!this.HasProp("__IMapRouteManeuver")) {
            if ((queryResult := this.QueryInterface(IMapRouteManeuver.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapRouteManeuver := IMapRouteManeuver(outPtr)
        }

        return this.__IMapRouteManeuver.get_InstructionText()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Kind() {
        if (!this.HasProp("__IMapRouteManeuver")) {
            if ((queryResult := this.QueryInterface(IMapRouteManeuver.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapRouteManeuver := IMapRouteManeuver(outPtr)
        }

        return this.__IMapRouteManeuver.get_Kind()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ExitNumber() {
        if (!this.HasProp("__IMapRouteManeuver")) {
            if ((queryResult := this.QueryInterface(IMapRouteManeuver.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapRouteManeuver := IMapRouteManeuver(outPtr)
        }

        return this.__IMapRouteManeuver.get_ExitNumber()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ManeuverNotices() {
        if (!this.HasProp("__IMapRouteManeuver")) {
            if ((queryResult := this.QueryInterface(IMapRouteManeuver.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapRouteManeuver := IMapRouteManeuver(outPtr)
        }

        return this.__IMapRouteManeuver.get_ManeuverNotices()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_StartHeading() {
        if (!this.HasProp("__IMapRouteManeuver2")) {
            if ((queryResult := this.QueryInterface(IMapRouteManeuver2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapRouteManeuver2 := IMapRouteManeuver2(outPtr)
        }

        return this.__IMapRouteManeuver2.get_StartHeading()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_EndHeading() {
        if (!this.HasProp("__IMapRouteManeuver2")) {
            if ((queryResult := this.QueryInterface(IMapRouteManeuver2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapRouteManeuver2 := IMapRouteManeuver2(outPtr)
        }

        return this.__IMapRouteManeuver2.get_EndHeading()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_StreetName() {
        if (!this.HasProp("__IMapRouteManeuver2")) {
            if ((queryResult := this.QueryInterface(IMapRouteManeuver2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapRouteManeuver2 := IMapRouteManeuver2(outPtr)
        }

        return this.__IMapRouteManeuver2.get_StreetName()
    }

    /**
     * 
     * @returns {IVectorView<ManeuverWarning>} 
     */
    get_Warnings() {
        if (!this.HasProp("__IMapRouteManeuver3")) {
            if ((queryResult := this.QueryInterface(IMapRouteManeuver3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapRouteManeuver3 := IMapRouteManeuver3(outPtr)
        }

        return this.__IMapRouteManeuver3.get_Warnings()
    }

;@endregion Instance Methods
}
