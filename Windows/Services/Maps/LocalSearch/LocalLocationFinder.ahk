#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ILocalLocationFinderStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * [Deprecated - see Remarks.] Searches for businesses and places.
 * @remarks
 * > [!IMPORTANT]
 * > The UWP [MapControl](../windows.ui.xaml.controls.maps/mapcontrol.md) and Windows Maps platform APIs ([Windows.Services.Maps.*](../windows.services.maps/windows_services_maps.md)) are deprecated and may not be available in future versions of Windows. For more information, see [Resources for deprecated features](/windows/whats-new/deprecated-features-resources#windows-uwp-map-control-and-windows-maps-platform-apis).
 * 
 * > [!IMPORTANT]
 * > **Bing Maps for Enterprise service retirement**
 * >
 * > The UWP [MapControl](../windows.ui.xaml.controls.maps/mapcontrol.md) and map services from the [Windows.Services.Maps](../windows.services.maps/windows_services_maps.md) namespaces rely on Bing Maps. Bing Maps for Enterprise is deprecated and will be retired, at which point the MapControl and services will no longer receive data.
 * >
 * > For more information, see the [Bing Maps Developer Center](https://www.bingmapsportal.com/) and [Bing Maps documentation](/bingmaps/getting-started/).
 * 
 * > [!NOTE]
 * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.LocalSearch](windows_services_maps_localsearch.md) namespace, please work with your Microsoft Account Team representative.
 * @see https://learn.microsoft.com/uwp/api/windows.services.maps.localsearch.locallocationfinder
 * @namespace Windows.Services.Maps.LocalSearch
 * @version WindowsRuntime 1.4
 */
class LocalLocationFinder extends IInspectable {
;@region Static Methods
    /**
     * Gets information about businesses and places that meet the specified search criteria.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.LocalSearch](windows_services_maps_localsearch.md) namespace, please work with your Microsoft Account Team representative.
     * @param {HSTRING} searchTerm The query text of the search; that which you're searching for.
     * @param {Geocircle} searchArea The geographic area to be included in the search.
     * @param {HSTRING} localCategory The search categories used to limit search results. We recommend using one or more [LocalCategories](localcategories.md) properties to specify *localCategory*. Use a semicolon "**;** " separator to specify more than one category.
     * @param {Integer} maxResults The maximum number of results to return from the search.
     * @returns {IAsyncOperation<LocalLocationFinderResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.localsearch.locallocationfinder.findlocallocationsasync
     */
    static FindLocalLocationsAsync(searchTerm, searchArea, localCategory, maxResults) {
        if (!LocalLocationFinder.HasProp("__ILocalLocationFinderStatics")) {
            activatableClassId := HSTRING.Create("Windows.Services.Maps.LocalSearch.LocalLocationFinder")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILocalLocationFinderStatics.IID)
            LocalLocationFinder.__ILocalLocationFinderStatics := ILocalLocationFinderStatics(factoryPtr)
        }

        return LocalLocationFinder.__ILocalLocationFinderStatics.FindLocalLocationsAsync(searchTerm, searchArea, localCategory, maxResults)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
