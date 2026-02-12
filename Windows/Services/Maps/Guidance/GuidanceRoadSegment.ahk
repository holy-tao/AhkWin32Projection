#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGuidanceRoadSegment.ahk
#Include .\IGuidanceRoadSegment2.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the road on a segment of the route.
  * 
  * > [!NOTE]
  * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.services.maps.guidance.guidanceroadsegment
 * @namespace Windows.Services.Maps.Guidance
 * @version WindowsRuntime 1.4
 */
class GuidanceRoadSegment extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGuidanceRoadSegment

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGuidanceRoadSegment.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the full name of the road.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.guidance.guidanceroadsegment.roadname
     * @type {HSTRING} 
     */
    RoadName {
        get => this.get_RoadName()
    }

    /**
     * Gets the short name of the road.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.guidance.guidanceroadsegment.shortroadname
     * @type {HSTRING} 
     */
    ShortRoadName {
        get => this.get_ShortRoadName()
    }

    /**
     * Gets the speed limit of the road segment.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.guidance.guidanceroadsegment.speedlimit
     * @type {Float} 
     */
    SpeedLimit {
        get => this.get_SpeedLimit()
    }

    /**
     * Gets the travel time of the road segment.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.guidance.guidanceroadsegment.traveltime
     * @type {TimeSpan} 
     */
    TravelTime {
        get => this.get_TravelTime()
    }

    /**
     * Gets an ordered series geographic points that describe road segment.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.guidance.guidanceroadsegment.path
     * @type {Geopath} 
     */
    Path {
        get => this.get_Path()
    }

    /**
     * Gets the identifier of the road segment.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.guidance.guidanceroadsegment.id
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * Gets a value that indicates of the road segment is a highway.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.guidance.guidanceroadsegment.ishighway
     * @type {Boolean} 
     */
    IsHighway {
        get => this.get_IsHighway()
    }

    /**
     * Gets a value that indicates of the road segment is a tunnel.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.guidance.guidanceroadsegment.istunnel
     * @type {Boolean} 
     */
    IsTunnel {
        get => this.get_IsTunnel()
    }

    /**
     * Gets a value that indicates of the road segment is a toll road.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.guidance.guidanceroadsegment.istollroad
     * @type {Boolean} 
     */
    IsTollRoad {
        get => this.get_IsTollRoad()
    }

    /**
     * Gets a value that indicates of the road segment is scenic.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.guidance.guidanceroadsegment.isscenic
     * @type {Boolean} 
     */
    IsScenic {
        get => this.get_IsScenic()
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
    get_RoadName() {
        if (!this.HasProp("__IGuidanceRoadSegment")) {
            if ((queryResult := this.QueryInterface(IGuidanceRoadSegment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGuidanceRoadSegment := IGuidanceRoadSegment(outPtr)
        }

        return this.__IGuidanceRoadSegment.get_RoadName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ShortRoadName() {
        if (!this.HasProp("__IGuidanceRoadSegment")) {
            if ((queryResult := this.QueryInterface(IGuidanceRoadSegment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGuidanceRoadSegment := IGuidanceRoadSegment(outPtr)
        }

        return this.__IGuidanceRoadSegment.get_ShortRoadName()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_SpeedLimit() {
        if (!this.HasProp("__IGuidanceRoadSegment")) {
            if ((queryResult := this.QueryInterface(IGuidanceRoadSegment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGuidanceRoadSegment := IGuidanceRoadSegment(outPtr)
        }

        return this.__IGuidanceRoadSegment.get_SpeedLimit()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_TravelTime() {
        if (!this.HasProp("__IGuidanceRoadSegment")) {
            if ((queryResult := this.QueryInterface(IGuidanceRoadSegment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGuidanceRoadSegment := IGuidanceRoadSegment(outPtr)
        }

        return this.__IGuidanceRoadSegment.get_TravelTime()
    }

    /**
     * 
     * @returns {Geopath} 
     */
    get_Path() {
        if (!this.HasProp("__IGuidanceRoadSegment")) {
            if ((queryResult := this.QueryInterface(IGuidanceRoadSegment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGuidanceRoadSegment := IGuidanceRoadSegment(outPtr)
        }

        return this.__IGuidanceRoadSegment.get_Path()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        if (!this.HasProp("__IGuidanceRoadSegment")) {
            if ((queryResult := this.QueryInterface(IGuidanceRoadSegment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGuidanceRoadSegment := IGuidanceRoadSegment(outPtr)
        }

        return this.__IGuidanceRoadSegment.get_Id()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsHighway() {
        if (!this.HasProp("__IGuidanceRoadSegment")) {
            if ((queryResult := this.QueryInterface(IGuidanceRoadSegment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGuidanceRoadSegment := IGuidanceRoadSegment(outPtr)
        }

        return this.__IGuidanceRoadSegment.get_IsHighway()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsTunnel() {
        if (!this.HasProp("__IGuidanceRoadSegment")) {
            if ((queryResult := this.QueryInterface(IGuidanceRoadSegment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGuidanceRoadSegment := IGuidanceRoadSegment(outPtr)
        }

        return this.__IGuidanceRoadSegment.get_IsTunnel()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsTollRoad() {
        if (!this.HasProp("__IGuidanceRoadSegment")) {
            if ((queryResult := this.QueryInterface(IGuidanceRoadSegment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGuidanceRoadSegment := IGuidanceRoadSegment(outPtr)
        }

        return this.__IGuidanceRoadSegment.get_IsTollRoad()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsScenic() {
        if (!this.HasProp("__IGuidanceRoadSegment2")) {
            if ((queryResult := this.QueryInterface(IGuidanceRoadSegment2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGuidanceRoadSegment2 := IGuidanceRoadSegment2(outPtr)
        }

        return this.__IGuidanceRoadSegment2.get_IsScenic()
    }

;@endregion Instance Methods
}
