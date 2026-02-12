#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGuidanceMapMatchedCoordinate.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Describes the navigational conditions at the user's current location.
  * 
  * > [!NOTE]
  * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
 * @remarks
 * During a guidance update, the geographic location returned by [GuidanceUpdatedEventArgs](guidanceupdatedeventargs.md) corresponds to the nearest point on the route near the user's actual geographic location. This helps compensate for GPS inaccuracies. If the route is not nearby, a point on the nearest road will be used. For example, if the user misses a turn.
 * @see https://learn.microsoft.com/uwp/api/windows.services.maps.guidance.guidancemapmatchedcoordinate
 * @namespace Windows.Services.Maps.Guidance
 * @version WindowsRuntime 1.4
 */
class GuidanceMapMatchedCoordinate extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGuidanceMapMatchedCoordinate

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGuidanceMapMatchedCoordinate.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the current geographic location.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
     * @remarks
     * During a guidance update, the geographic location returned by [GuidanceUpdatedEventArgs](guidanceupdatedeventargs.md) corresponds to the nearest point on the route near the user's actual geographic location. This helps compensate for GPS inaccuracies. If the route is not nearby, a point on the nearest road will be used. For example, if the user misses a turn.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.guidance.guidancemapmatchedcoordinate.location
     * @type {Geopoint} 
     */
    Location {
        get => this.get_Location()
    }

    /**
     * Gets a value that indicates the current heading in degrees, where 0 or 360 = North, 90 = East, 180 = South, and 270 = West.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.guidance.guidancemapmatchedcoordinate.currentheading
     * @type {Float} 
     */
    CurrentHeading {
        get => this.get_CurrentHeading()
    }

    /**
     * Gets a value that indicates the current speed, in meters per second.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.guidance.guidancemapmatchedcoordinate.currentspeed
     * @type {Float} 
     */
    CurrentSpeed {
        get => this.get_CurrentSpeed()
    }

    /**
     * Gets a value that indicates if the current location is on a street.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.guidance.guidancemapmatchedcoordinate.isonstreet
     * @type {Boolean} 
     */
    IsOnStreet {
        get => this.get_IsOnStreet()
    }

    /**
     * Gets a value that describes the road at the current location.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.guidance.guidancemapmatchedcoordinate.road
     * @type {GuidanceRoadSegment} 
     */
    Road {
        get => this.get_Road()
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
    get_Location() {
        if (!this.HasProp("__IGuidanceMapMatchedCoordinate")) {
            if ((queryResult := this.QueryInterface(IGuidanceMapMatchedCoordinate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGuidanceMapMatchedCoordinate := IGuidanceMapMatchedCoordinate(outPtr)
        }

        return this.__IGuidanceMapMatchedCoordinate.get_Location()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_CurrentHeading() {
        if (!this.HasProp("__IGuidanceMapMatchedCoordinate")) {
            if ((queryResult := this.QueryInterface(IGuidanceMapMatchedCoordinate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGuidanceMapMatchedCoordinate := IGuidanceMapMatchedCoordinate(outPtr)
        }

        return this.__IGuidanceMapMatchedCoordinate.get_CurrentHeading()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_CurrentSpeed() {
        if (!this.HasProp("__IGuidanceMapMatchedCoordinate")) {
            if ((queryResult := this.QueryInterface(IGuidanceMapMatchedCoordinate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGuidanceMapMatchedCoordinate := IGuidanceMapMatchedCoordinate(outPtr)
        }

        return this.__IGuidanceMapMatchedCoordinate.get_CurrentSpeed()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsOnStreet() {
        if (!this.HasProp("__IGuidanceMapMatchedCoordinate")) {
            if ((queryResult := this.QueryInterface(IGuidanceMapMatchedCoordinate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGuidanceMapMatchedCoordinate := IGuidanceMapMatchedCoordinate(outPtr)
        }

        return this.__IGuidanceMapMatchedCoordinate.get_IsOnStreet()
    }

    /**
     * 
     * @returns {GuidanceRoadSegment} 
     */
    get_Road() {
        if (!this.HasProp("__IGuidanceMapMatchedCoordinate")) {
            if ((queryResult := this.QueryInterface(IGuidanceMapMatchedCoordinate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGuidanceMapMatchedCoordinate := IGuidanceMapMatchedCoordinate(outPtr)
        }

        return this.__IGuidanceMapMatchedCoordinate.get_Road()
    }

;@endregion Instance Methods
}
