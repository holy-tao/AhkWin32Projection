#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ILocalLocationRatingInfo.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Contains the location rating information.
  * 
  * > [!NOTE]
  * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.LocalSearch](windows_services_maps_localsearch.md) namespace, please work with your Microsoft Account Team representative.
 * @remarks
 * This class is retrieved by accessing the [RatingInfo](locallocation_ratinginfo.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.services.maps.localsearch.locallocationratinginfo
 * @namespace Windows.Services.Maps.LocalSearch
 * @version WindowsRuntime 1.4
 */
class LocalLocationRatingInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILocalLocationRatingInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILocalLocationRatingInfo.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the aggregate rating of the location.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.LocalSearch](windows_services_maps_localsearch.md) namespace, please work with your Microsoft Account Team representative.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.localsearch.locallocationratinginfo.aggregaterating
     * @type {IReference<Float>} 
     */
    AggregateRating {
        get => this.get_AggregateRating()
    }

    /**
     * Gets the rating count for this location.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.LocalSearch](windows_services_maps_localsearch.md) namespace, please work with your Microsoft Account Team representative.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.localsearch.locallocationratinginfo.ratingcount
     * @type {IReference<Integer>} 
     */
    RatingCount {
        get => this.get_RatingCount()
    }

    /**
     * Gets the provider ID for the rating.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.LocalSearch](windows_services_maps_localsearch.md) namespace, please work with your Microsoft Account Team representative.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.localsearch.locallocationratinginfo.provideridentifier
     * @type {HSTRING} 
     */
    ProviderIdentifier {
        get => this.get_ProviderIdentifier()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_AggregateRating() {
        if (!this.HasProp("__ILocalLocationRatingInfo")) {
            if ((queryResult := this.QueryInterface(ILocalLocationRatingInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILocalLocationRatingInfo := ILocalLocationRatingInfo(outPtr)
        }

        return this.__ILocalLocationRatingInfo.get_AggregateRating()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_RatingCount() {
        if (!this.HasProp("__ILocalLocationRatingInfo")) {
            if ((queryResult := this.QueryInterface(ILocalLocationRatingInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILocalLocationRatingInfo := ILocalLocationRatingInfo(outPtr)
        }

        return this.__ILocalLocationRatingInfo.get_RatingCount()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ProviderIdentifier() {
        if (!this.HasProp("__ILocalLocationRatingInfo")) {
            if ((queryResult := this.QueryInterface(ILocalLocationRatingInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILocalLocationRatingInfo := ILocalLocationRatingInfo(outPtr)
        }

        return this.__ILocalLocationRatingInfo.get_ProviderIdentifier()
    }

;@endregion Instance Methods
}
