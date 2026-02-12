#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGuidanceManeuver.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a maneuver along a guided route.
  * 
  * > [!NOTE]
  * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.services.maps.guidance.guidancemaneuver
 * @namespace Windows.Services.Maps.Guidance
 * @version WindowsRuntime 1.4
 */
class GuidanceManeuver extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGuidanceManeuver

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGuidanceManeuver.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the location where the maneuver starts.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.guidance.guidancemaneuver.startlocation
     * @type {Geopoint} 
     */
    StartLocation {
        get => this.get_StartLocation()
    }

    /**
     * Gets the distance from the route start to this maneuver, in meters.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
     * @remarks
     * Regardless of the measurement system used for audio guidance ([AudioMeasurementSystem](guidancenavigator_audiomeasurementsystem.md)), the metric system is always used for distance and speed API values.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.guidance.guidancemaneuver.distancefromroutestart
     * @type {Integer} 
     */
    DistanceFromRouteStart {
        get => this.get_DistanceFromRouteStart()
    }

    /**
     * Gets the distance from the previous maneuver to this maneuver, in meters.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
     * @remarks
     * Regardless of the measurement system used for audio guidance ([AudioMeasurementSystem](guidancenavigator_audiomeasurementsystem.md)), the metric system is always used for distance and speed API values.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.guidance.guidancemaneuver.distancefrompreviousmaneuver
     * @type {Integer} 
     */
    DistanceFromPreviousManeuver {
        get => this.get_DistanceFromPreviousManeuver()
    }

    /**
     * Gets the full name of the road at the start of the maneuver.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.guidance.guidancemaneuver.departureroadname
     * @type {HSTRING} 
     */
    DepartureRoadName {
        get => this.get_DepartureRoadName()
    }

    /**
     * Gets the full name of the road at the end of the maneuver.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.guidance.guidancemaneuver.nextroadname
     * @type {HSTRING} 
     */
    NextRoadName {
        get => this.get_NextRoadName()
    }

    /**
     * Gets the short name of the road at the start of the maneuver. For example, a highway number such as "I-90."
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.guidance.guidancemaneuver.departureshortroadname
     * @type {HSTRING} 
     */
    DepartureShortRoadName {
        get => this.get_DepartureShortRoadName()
    }

    /**
     * Gets the short name of the road at the end of the maneuver. For example, a highway number such as "I-90."
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.guidance.guidancemaneuver.nextshortroadname
     * @type {HSTRING} 
     */
    NextShortRoadName {
        get => this.get_NextShortRoadName()
    }

    /**
     * Gets the type of the maneuver.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.guidance.guidancemaneuver.kind
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
    }

    /**
     * Gets a value that indicates the heading at the start of the maneuver in degrees, where 0 or 360 = North, 90 = East, 180 = South, and 270 = West.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.guidance.guidancemaneuver.startangle
     * @type {Integer} 
     */
    StartAngle {
        get => this.get_StartAngle()
    }

    /**
     * Gets a value that indicates the heading at the end of the maneuver in degrees, where 0 or 360 = North, 90 = East, 180 = South, and 270 = West.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.guidance.guidancemaneuver.endangle
     * @type {Integer} 
     */
    EndAngle {
        get => this.get_EndAngle()
    }

    /**
     * Gets a value that represents a sign on the road associated with the maneuver.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.guidance.guidancemaneuver.roadsignpost
     * @type {GuidanceRoadSignpost} 
     */
    RoadSignpost {
        get => this.get_RoadSignpost()
    }

    /**
     * Gets the instruction text associated with the maneuver.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.guidance.guidancemaneuver.instructiontext
     * @type {HSTRING} 
     */
    InstructionText {
        get => this.get_InstructionText()
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
    get_StartLocation() {
        if (!this.HasProp("__IGuidanceManeuver")) {
            if ((queryResult := this.QueryInterface(IGuidanceManeuver.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGuidanceManeuver := IGuidanceManeuver(outPtr)
        }

        return this.__IGuidanceManeuver.get_StartLocation()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DistanceFromRouteStart() {
        if (!this.HasProp("__IGuidanceManeuver")) {
            if ((queryResult := this.QueryInterface(IGuidanceManeuver.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGuidanceManeuver := IGuidanceManeuver(outPtr)
        }

        return this.__IGuidanceManeuver.get_DistanceFromRouteStart()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DistanceFromPreviousManeuver() {
        if (!this.HasProp("__IGuidanceManeuver")) {
            if ((queryResult := this.QueryInterface(IGuidanceManeuver.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGuidanceManeuver := IGuidanceManeuver(outPtr)
        }

        return this.__IGuidanceManeuver.get_DistanceFromPreviousManeuver()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DepartureRoadName() {
        if (!this.HasProp("__IGuidanceManeuver")) {
            if ((queryResult := this.QueryInterface(IGuidanceManeuver.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGuidanceManeuver := IGuidanceManeuver(outPtr)
        }

        return this.__IGuidanceManeuver.get_DepartureRoadName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_NextRoadName() {
        if (!this.HasProp("__IGuidanceManeuver")) {
            if ((queryResult := this.QueryInterface(IGuidanceManeuver.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGuidanceManeuver := IGuidanceManeuver(outPtr)
        }

        return this.__IGuidanceManeuver.get_NextRoadName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DepartureShortRoadName() {
        if (!this.HasProp("__IGuidanceManeuver")) {
            if ((queryResult := this.QueryInterface(IGuidanceManeuver.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGuidanceManeuver := IGuidanceManeuver(outPtr)
        }

        return this.__IGuidanceManeuver.get_DepartureShortRoadName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_NextShortRoadName() {
        if (!this.HasProp("__IGuidanceManeuver")) {
            if ((queryResult := this.QueryInterface(IGuidanceManeuver.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGuidanceManeuver := IGuidanceManeuver(outPtr)
        }

        return this.__IGuidanceManeuver.get_NextShortRoadName()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Kind() {
        if (!this.HasProp("__IGuidanceManeuver")) {
            if ((queryResult := this.QueryInterface(IGuidanceManeuver.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGuidanceManeuver := IGuidanceManeuver(outPtr)
        }

        return this.__IGuidanceManeuver.get_Kind()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_StartAngle() {
        if (!this.HasProp("__IGuidanceManeuver")) {
            if ((queryResult := this.QueryInterface(IGuidanceManeuver.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGuidanceManeuver := IGuidanceManeuver(outPtr)
        }

        return this.__IGuidanceManeuver.get_StartAngle()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_EndAngle() {
        if (!this.HasProp("__IGuidanceManeuver")) {
            if ((queryResult := this.QueryInterface(IGuidanceManeuver.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGuidanceManeuver := IGuidanceManeuver(outPtr)
        }

        return this.__IGuidanceManeuver.get_EndAngle()
    }

    /**
     * 
     * @returns {GuidanceRoadSignpost} 
     */
    get_RoadSignpost() {
        if (!this.HasProp("__IGuidanceManeuver")) {
            if ((queryResult := this.QueryInterface(IGuidanceManeuver.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGuidanceManeuver := IGuidanceManeuver(outPtr)
        }

        return this.__IGuidanceManeuver.get_RoadSignpost()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_InstructionText() {
        if (!this.HasProp("__IGuidanceManeuver")) {
            if ((queryResult := this.QueryInterface(IGuidanceManeuver.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGuidanceManeuver := IGuidanceManeuver(outPtr)
        }

        return this.__IGuidanceManeuver.get_InstructionText()
    }

;@endregion Instance Methods
}
