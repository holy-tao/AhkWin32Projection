#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ILocalLocationFinderResult.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the results of a search performed by the [FindLocalLocationsAsync](locallocationfinder_findlocallocationsasync_1108099862.md) method.
  * 
  * > [!NOTE]
  * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.LocalSearch](windows_services_maps_localsearch.md) namespace, please work with your Microsoft Account Team representative.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.services.maps.localsearch.locallocationfinderresult
 * @namespace Windows.Services.Maps.LocalSearch
 * @version WindowsRuntime 1.4
 */
class LocalLocationFinderResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILocalLocationFinderResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILocalLocationFinderResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the businesses and places that meet the specified search criteria, if any.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.LocalSearch](windows_services_maps_localsearch.md) namespace, please work with your Microsoft Account Team representative.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.localsearch.locallocationfinderresult.locallocations
     * @type {IVectorView<LocalLocation>} 
     */
    LocalLocations {
        get => this.get_LocalLocations()
    }

    /**
     * Gets the status of the search performed by the [FindLocalLocationsAsync](locallocationfinder_findlocallocationsasync_1108099862.md) method.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.LocalSearch](windows_services_maps_localsearch.md) namespace, please work with your Microsoft Account Team representative.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.localsearch.locallocationfinderresult.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVectorView<LocalLocation>} 
     */
    get_LocalLocations() {
        if (!this.HasProp("__ILocalLocationFinderResult")) {
            if ((queryResult := this.QueryInterface(ILocalLocationFinderResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILocalLocationFinderResult := ILocalLocationFinderResult(outPtr)
        }

        return this.__ILocalLocationFinderResult.get_LocalLocations()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__ILocalLocationFinderResult")) {
            if ((queryResult := this.QueryInterface(ILocalLocationFinderResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILocalLocationFinderResult := ILocalLocationFinderResult(outPtr)
        }

        return this.__ILocalLocationFinderResult.get_Status()
    }

;@endregion Instance Methods
}
