#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ILocalCategoriesStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides names of search categories that you can use to limit search results when calling the [FindLocalLocationsAsync](locallocationfinder_findlocallocationsasync_1108099862.md) method.
  * 
  * > [!NOTE]
  * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.LocalSearch](windows_services_maps_localsearch.md) namespace, please work with your Microsoft Account Team representative.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.services.maps.localsearch.localcategories
 * @namespace Windows.Services.Maps.LocalSearch
 * @version WindowsRuntime 1.4
 */
class LocalCategories extends IInspectable {
;@region Static Properties
    /**
     * Gets the name of the search category for banks and credit unions.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.LocalSearch](windows_services_maps_localsearch.md) namespace, please work with your Microsoft Account Team representative.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.localsearch.localcategories.bankandcreditunions
     * @type {HSTRING} 
     */
    static BankAndCreditUnions {
        get => LocalCategories.get_BankAndCreditUnions()
    }

    /**
     * Gets the name of the search category for places to eat and drink.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.LocalSearch](windows_services_maps_localsearch.md) namespace, please work with your Microsoft Account Team representative.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.localsearch.localcategories.eatdrink
     * @type {HSTRING} 
     */
    static EatDrink {
        get => LocalCategories.get_EatDrink()
    }

    /**
     * Gets the name of the search category for hospitals.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.LocalSearch](windows_services_maps_localsearch.md) namespace, please work with your Microsoft Account Team representative.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.localsearch.localcategories.hospitals
     * @type {HSTRING} 
     */
    static Hospitals {
        get => LocalCategories.get_Hospitals()
    }

    /**
     * Gets the name of the search category for hotels and motels.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.LocalSearch](windows_services_maps_localsearch.md) namespace, please work with your Microsoft Account Team representative.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.localsearch.localcategories.hotelsandmotels
     * @type {HSTRING} 
     */
    static HotelsAndMotels {
        get => LocalCategories.get_HotelsAndMotels()
    }

    /**
     * Gets a value that represents all search categories.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.LocalSearch](windows_services_maps_localsearch.md) namespace, please work with your Microsoft Account Team representative.
     * @remarks
     * If the All category is specified, the [FindLocalLocationsAsync](locallocationfinder_findlocallocationsasync_1108099862.md) method returns results for all search categories.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.localsearch.localcategories.all
     * @type {HSTRING} 
     */
    static All {
        get => LocalCategories.get_All()
    }

    /**
     * Gets the name of the search category for parking locations.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.LocalSearch](windows_services_maps_localsearch.md) namespace, please work with your Microsoft Account Team representative.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.localsearch.localcategories.parking
     * @type {HSTRING} 
     */
    static Parking {
        get => LocalCategories.get_Parking()
    }

    /**
     * Gets the name of the search category for places to see and things to do.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.LocalSearch](windows_services_maps_localsearch.md) namespace, please work with your Microsoft Account Team representative.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.localsearch.localcategories.seedo
     * @type {HSTRING} 
     */
    static SeeDo {
        get => LocalCategories.get_SeeDo()
    }

    /**
     * Gets the name of the search category for places to shop.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.LocalSearch](windows_services_maps_localsearch.md) namespace, please work with your Microsoft Account Team representative.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.localsearch.localcategories.shop
     * @type {HSTRING} 
     */
    static Shop {
        get => LocalCategories.get_Shop()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {HSTRING} 
     */
    static get_BankAndCreditUnions() {
        if (!LocalCategories.HasProp("__ILocalCategoriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Services.Maps.LocalSearch.LocalCategories")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILocalCategoriesStatics.IID)
            LocalCategories.__ILocalCategoriesStatics := ILocalCategoriesStatics(factoryPtr)
        }

        return LocalCategories.__ILocalCategoriesStatics.get_BankAndCreditUnions()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_EatDrink() {
        if (!LocalCategories.HasProp("__ILocalCategoriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Services.Maps.LocalSearch.LocalCategories")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILocalCategoriesStatics.IID)
            LocalCategories.__ILocalCategoriesStatics := ILocalCategoriesStatics(factoryPtr)
        }

        return LocalCategories.__ILocalCategoriesStatics.get_EatDrink()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Hospitals() {
        if (!LocalCategories.HasProp("__ILocalCategoriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Services.Maps.LocalSearch.LocalCategories")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILocalCategoriesStatics.IID)
            LocalCategories.__ILocalCategoriesStatics := ILocalCategoriesStatics(factoryPtr)
        }

        return LocalCategories.__ILocalCategoriesStatics.get_Hospitals()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_HotelsAndMotels() {
        if (!LocalCategories.HasProp("__ILocalCategoriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Services.Maps.LocalSearch.LocalCategories")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILocalCategoriesStatics.IID)
            LocalCategories.__ILocalCategoriesStatics := ILocalCategoriesStatics(factoryPtr)
        }

        return LocalCategories.__ILocalCategoriesStatics.get_HotelsAndMotels()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_All() {
        if (!LocalCategories.HasProp("__ILocalCategoriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Services.Maps.LocalSearch.LocalCategories")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILocalCategoriesStatics.IID)
            LocalCategories.__ILocalCategoriesStatics := ILocalCategoriesStatics(factoryPtr)
        }

        return LocalCategories.__ILocalCategoriesStatics.get_All()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Parking() {
        if (!LocalCategories.HasProp("__ILocalCategoriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Services.Maps.LocalSearch.LocalCategories")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILocalCategoriesStatics.IID)
            LocalCategories.__ILocalCategoriesStatics := ILocalCategoriesStatics(factoryPtr)
        }

        return LocalCategories.__ILocalCategoriesStatics.get_Parking()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_SeeDo() {
        if (!LocalCategories.HasProp("__ILocalCategoriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Services.Maps.LocalSearch.LocalCategories")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILocalCategoriesStatics.IID)
            LocalCategories.__ILocalCategoriesStatics := ILocalCategoriesStatics(factoryPtr)
        }

        return LocalCategories.__ILocalCategoriesStatics.get_SeeDo()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Shop() {
        if (!LocalCategories.HasProp("__ILocalCategoriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Services.Maps.LocalSearch.LocalCategories")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILocalCategoriesStatics.IID)
            LocalCategories.__ILocalCategoriesStatics := ILocalCategoriesStatics(factoryPtr)
        }

        return LocalCategories.__ILocalCategoriesStatics.get_Shop()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
