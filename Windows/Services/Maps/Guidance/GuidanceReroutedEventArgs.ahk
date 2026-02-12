#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGuidanceReroutedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides data for the [Rerouted](guidancenavigator_rerouted.md) event.
  * 
  * > [!NOTE]
  * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.services.maps.guidance.guidancereroutedeventargs
 * @namespace Windows.Services.Maps.Guidance
 * @version WindowsRuntime 1.4
 */
class GuidanceReroutedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGuidanceReroutedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGuidanceReroutedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the new route that was created by rerouting.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.guidance.guidancereroutedeventargs.route
     * @type {GuidanceRoute} 
     */
    Route {
        get => this.get_Route()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {GuidanceRoute} 
     */
    get_Route() {
        if (!this.HasProp("__IGuidanceReroutedEventArgs")) {
            if ((queryResult := this.QueryInterface(IGuidanceReroutedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGuidanceReroutedEventArgs := IGuidanceReroutedEventArgs(outPtr)
        }

        return this.__IGuidanceReroutedEventArgs.get_Route()
    }

;@endregion Instance Methods
}
