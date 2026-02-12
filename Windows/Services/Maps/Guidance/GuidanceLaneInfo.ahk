#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGuidanceLaneInfo.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a lane near the current location and it's relation to the route.
  * 
  * > [!NOTE]
  * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.services.maps.guidance.guidancelaneinfo
 * @namespace Windows.Services.Maps.Guidance
 * @version WindowsRuntime 1.4
 */
class GuidanceLaneInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGuidanceLaneInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGuidanceLaneInfo.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value that describes the path of the lane.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.guidance.guidancelaneinfo.lanemarkers
     * @type {Integer} 
     */
    LaneMarkers {
        get => this.get_LaneMarkers()
    }

    /**
     * Gets a value that indicates if the lane is on the route.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.guidance.guidancelaneinfo.isonroute
     * @type {Boolean} 
     */
    IsOnRoute {
        get => this.get_IsOnRoute()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LaneMarkers() {
        if (!this.HasProp("__IGuidanceLaneInfo")) {
            if ((queryResult := this.QueryInterface(IGuidanceLaneInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGuidanceLaneInfo := IGuidanceLaneInfo(outPtr)
        }

        return this.__IGuidanceLaneInfo.get_LaneMarkers()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsOnRoute() {
        if (!this.HasProp("__IGuidanceLaneInfo")) {
            if ((queryResult := this.QueryInterface(IGuidanceLaneInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGuidanceLaneInfo := IGuidanceLaneInfo(outPtr)
        }

        return this.__IGuidanceLaneInfo.get_IsOnRoute()
    }

;@endregion Instance Methods
}
