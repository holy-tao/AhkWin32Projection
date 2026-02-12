#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IEnhancedWaypoint.ahk
#Include .\IEnhancedWaypointFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a stop, start, or intermediate waypoint that a route must pass through.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.services.maps.enhancedwaypoint
 * @namespace Windows.Services.Maps
 * @version WindowsRuntime 1.4
 */
class EnhancedWaypoint extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IEnhancedWaypoint

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IEnhancedWaypoint.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates an instance of the [EnhancedWayPoint](enhancedwaypoint.md) class.
     * @param {Geopoint} point_ The coordinates of a geographic location.
     * @param {Integer} kind The type of waypoint.
     * @returns {EnhancedWaypoint} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.enhancedwaypoint.#ctor
     */
    static Create(point_, kind) {
        if (!EnhancedWaypoint.HasProp("__IEnhancedWaypointFactory")) {
            activatableClassId := HSTRING.Create("Windows.Services.Maps.EnhancedWaypoint")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IEnhancedWaypointFactory.IID)
            EnhancedWaypoint.__IEnhancedWaypointFactory := IEnhancedWaypointFactory(factoryPtr)
        }

        return EnhancedWaypoint.__IEnhancedWaypointFactory.Create(point_, kind)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the coordinates of a geographic location.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.enhancedwaypoint.point
     * @type {Geopoint} 
     */
    Point {
        get => this.get_Point()
    }

    /**
     * Gets the type of waypoint.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.enhancedwaypoint.kind
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
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
        if (!this.HasProp("__IEnhancedWaypoint")) {
            if ((queryResult := this.QueryInterface(IEnhancedWaypoint.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEnhancedWaypoint := IEnhancedWaypoint(outPtr)
        }

        return this.__IEnhancedWaypoint.get_Point()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Kind() {
        if (!this.HasProp("__IEnhancedWaypoint")) {
            if ((queryResult := this.QueryInterface(IEnhancedWaypoint.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEnhancedWaypoint := IEnhancedWaypoint(outPtr)
        }

        return this.__IEnhancedWaypoint.get_Kind()
    }

;@endregion Instance Methods
}
