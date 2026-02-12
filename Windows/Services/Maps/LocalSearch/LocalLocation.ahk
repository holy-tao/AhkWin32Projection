#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ILocalLocation.ahk
#Include .\ILocalLocation2.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a business or place.
  * 
  * > [!NOTE]
  * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.LocalSearch](windows_services_maps_localsearch.md) namespace, please work with your Microsoft Account Team representative.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.services.maps.localsearch.locallocation
 * @namespace Windows.Services.Maps.LocalSearch
 * @version WindowsRuntime 1.4
 */
class LocalLocation extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILocalLocation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILocalLocation.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the postal address of the business or place.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.LocalSearch](windows_services_maps_localsearch.md) namespace, please work with your Microsoft Account Team representative.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.localsearch.locallocation.address
     * @type {MapAddress} 
     */
    Address {
        get => this.get_Address()
    }

    /**
     * Gets the search result identifier of the business or place.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.LocalSearch](windows_services_maps_localsearch.md) namespace, please work with your Microsoft Account Team representative.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.localsearch.locallocation.identifier
     * @type {HSTRING} 
     */
    Identifier {
        get => this.get_Identifier()
    }

    /**
     * Gets the description of the business or place.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.LocalSearch](windows_services_maps_localsearch.md) namespace, please work with your Microsoft Account Team representative.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.localsearch.locallocation.description
     * @type {HSTRING} 
     */
    Description {
        get => this.get_Description()
    }

    /**
     * Gets the name of the business or place.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.LocalSearch](windows_services_maps_localsearch.md) namespace, please work with your Microsoft Account Team representative.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.localsearch.locallocation.displayname
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
    }

    /**
     * Gets the geographic location of the business or place.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.LocalSearch](windows_services_maps_localsearch.md) namespace, please work with your Microsoft Account Team representative.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.localsearch.locallocation.point
     * @type {Geopoint} 
     */
    Point {
        get => this.get_Point()
    }

    /**
     * Gets the phone number of the business or place.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.LocalSearch](windows_services_maps_localsearch.md) namespace, please work with your Microsoft Account Team representative.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.localsearch.locallocation.phonenumber
     * @type {HSTRING} 
     */
    PhoneNumber {
        get => this.get_PhoneNumber()
    }

    /**
     * Gets the name of the data source that provided the business or place information.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.LocalSearch](windows_services_maps_localsearch.md) namespace, please work with your Microsoft Account Team representative.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.localsearch.locallocation.dataattribution
     * @type {HSTRING} 
     */
    DataAttribution {
        get => this.get_DataAttribution()
    }

    /**
     * Get the category of this location.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.LocalSearch](windows_services_maps_localsearch.md) namespace, please work with your Microsoft Account Team representative.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.localsearch.locallocation.category
     * @type {HSTRING} 
     */
    Category {
        get => this.get_Category()
    }

    /**
     * Gets the rating information of this place.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.LocalSearch](windows_services_maps_localsearch.md) namespace, please work with your Microsoft Account Team representative.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.localsearch.locallocation.ratinginfo
     * @type {LocalLocationRatingInfo} 
     */
    RatingInfo {
        get => this.get_RatingInfo()
    }

    /**
     * Gets the hours of operation of this location.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.LocalSearch](windows_services_maps_localsearch.md) namespace, please work with your Microsoft Account Team representative.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.localsearch.locallocation.hoursofoperation
     * @type {IVectorView<LocalLocationHoursOfOperationItem>} 
     */
    HoursOfOperation {
        get => this.get_HoursOfOperation()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {MapAddress} 
     */
    get_Address() {
        if (!this.HasProp("__ILocalLocation")) {
            if ((queryResult := this.QueryInterface(ILocalLocation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILocalLocation := ILocalLocation(outPtr)
        }

        return this.__ILocalLocation.get_Address()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Identifier() {
        if (!this.HasProp("__ILocalLocation")) {
            if ((queryResult := this.QueryInterface(ILocalLocation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILocalLocation := ILocalLocation(outPtr)
        }

        return this.__ILocalLocation.get_Identifier()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Description() {
        if (!this.HasProp("__ILocalLocation")) {
            if ((queryResult := this.QueryInterface(ILocalLocation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILocalLocation := ILocalLocation(outPtr)
        }

        return this.__ILocalLocation.get_Description()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayName() {
        if (!this.HasProp("__ILocalLocation")) {
            if ((queryResult := this.QueryInterface(ILocalLocation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILocalLocation := ILocalLocation(outPtr)
        }

        return this.__ILocalLocation.get_DisplayName()
    }

    /**
     * 
     * @returns {Geopoint} 
     */
    get_Point() {
        if (!this.HasProp("__ILocalLocation")) {
            if ((queryResult := this.QueryInterface(ILocalLocation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILocalLocation := ILocalLocation(outPtr)
        }

        return this.__ILocalLocation.get_Point()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PhoneNumber() {
        if (!this.HasProp("__ILocalLocation")) {
            if ((queryResult := this.QueryInterface(ILocalLocation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILocalLocation := ILocalLocation(outPtr)
        }

        return this.__ILocalLocation.get_PhoneNumber()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DataAttribution() {
        if (!this.HasProp("__ILocalLocation")) {
            if ((queryResult := this.QueryInterface(ILocalLocation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILocalLocation := ILocalLocation(outPtr)
        }

        return this.__ILocalLocation.get_DataAttribution()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Category() {
        if (!this.HasProp("__ILocalLocation2")) {
            if ((queryResult := this.QueryInterface(ILocalLocation2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILocalLocation2 := ILocalLocation2(outPtr)
        }

        return this.__ILocalLocation2.get_Category()
    }

    /**
     * 
     * @returns {LocalLocationRatingInfo} 
     */
    get_RatingInfo() {
        if (!this.HasProp("__ILocalLocation2")) {
            if ((queryResult := this.QueryInterface(ILocalLocation2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILocalLocation2 := ILocalLocation2(outPtr)
        }

        return this.__ILocalLocation2.get_RatingInfo()
    }

    /**
     * 
     * @returns {IVectorView<LocalLocationHoursOfOperationItem>} 
     */
    get_HoursOfOperation() {
        if (!this.HasProp("__ILocalLocation2")) {
            if ((queryResult := this.QueryInterface(ILocalLocation2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILocalLocation2 := ILocalLocation2(outPtr)
        }

        return this.__ILocalLocation2.get_HoursOfOperation()
    }

;@endregion Instance Methods
}
