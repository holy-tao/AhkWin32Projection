#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGuidanceRoadSignpost.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a sign on the road.
  * 
  * > [!NOTE]
  * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.services.maps.guidance.guidanceroadsignpost
 * @namespace Windows.Services.Maps.Guidance
 * @version WindowsRuntime 1.4
 */
class GuidanceRoadSignpost extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGuidanceRoadSignpost

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGuidanceRoadSignpost.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the exit number written on the sign.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.guidance.guidanceroadsignpost.exitnumber
     * @type {HSTRING} 
     */
    ExitNumber {
        get => this.get_ExitNumber()
    }

    /**
     * Gets the text written on the sign.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.guidance.guidanceroadsignpost.exit
     * @type {HSTRING} 
     */
    Exit {
        get => this.get_Exit()
    }

    /**
     * Gets the background color of the sign.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.guidance.guidanceroadsignpost.backgroundcolor
     * @type {Color} 
     */
    BackgroundColor {
        get => this.get_BackgroundColor()
    }

    /**
     * Gets the text color of the sign.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.guidance.guidanceroadsignpost.foregroundcolor
     * @type {Color} 
     */
    ForegroundColor {
        get => this.get_ForegroundColor()
    }

    /**
     * Gets the directions written on the sign. For example, city names and distances.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.guidance.guidanceroadsignpost.exitdirections
     * @type {IVectorView<HSTRING>} 
     */
    ExitDirections {
        get => this.get_ExitDirections()
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
    get_ExitNumber() {
        if (!this.HasProp("__IGuidanceRoadSignpost")) {
            if ((queryResult := this.QueryInterface(IGuidanceRoadSignpost.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGuidanceRoadSignpost := IGuidanceRoadSignpost(outPtr)
        }

        return this.__IGuidanceRoadSignpost.get_ExitNumber()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Exit() {
        if (!this.HasProp("__IGuidanceRoadSignpost")) {
            if ((queryResult := this.QueryInterface(IGuidanceRoadSignpost.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGuidanceRoadSignpost := IGuidanceRoadSignpost(outPtr)
        }

        return this.__IGuidanceRoadSignpost.get_Exit()
    }

    /**
     * 
     * @returns {Color} 
     */
    get_BackgroundColor() {
        if (!this.HasProp("__IGuidanceRoadSignpost")) {
            if ((queryResult := this.QueryInterface(IGuidanceRoadSignpost.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGuidanceRoadSignpost := IGuidanceRoadSignpost(outPtr)
        }

        return this.__IGuidanceRoadSignpost.get_BackgroundColor()
    }

    /**
     * 
     * @returns {Color} 
     */
    get_ForegroundColor() {
        if (!this.HasProp("__IGuidanceRoadSignpost")) {
            if ((queryResult := this.QueryInterface(IGuidanceRoadSignpost.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGuidanceRoadSignpost := IGuidanceRoadSignpost(outPtr)
        }

        return this.__IGuidanceRoadSignpost.get_ForegroundColor()
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_ExitDirections() {
        if (!this.HasProp("__IGuidanceRoadSignpost")) {
            if ((queryResult := this.QueryInterface(IGuidanceRoadSignpost.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGuidanceRoadSignpost := IGuidanceRoadSignpost(outPtr)
        }

        return this.__IGuidanceRoadSignpost.get_ExitDirections()
    }

;@endregion Instance Methods
}
