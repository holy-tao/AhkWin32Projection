#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPlaceInfo.ahk
#Include .\IPlaceInfoStatics.ahk
#Include .\IPlaceInfoStatics2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Displays a map location and information that describes that location in a light-dismissible window which closes automatically when the user clicks outside of the window.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.services.maps.placeinfo
 * @namespace Windows.Services.Maps
 * @version WindowsRuntime 1.4
 */
class PlaceInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPlaceInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPlaceInfo.IID

    /**
     * Gets a value that indicates whether your app can show a light-dismissible window that contains a map location and related information given the current context.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.placeinfo.isshowsupported
     * @type {Boolean} 
     */
    static IsShowSupported {
        get => PlaceInfo.get_IsShowSupported()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a [PlaceInfo](placeinfo.md) instance.
     * @param {Geopoint} referencePoint The geographic map location that you want to show in a light-dismissible window.
     * @returns {PlaceInfo} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.placeinfo.create
     */
    static Create(referencePoint) {
        if (!PlaceInfo.HasProp("__IPlaceInfoStatics")) {
            activatableClassId := HSTRING.Create("Windows.Services.Maps.PlaceInfo")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPlaceInfoStatics.IID)
            PlaceInfo.__IPlaceInfoStatics := IPlaceInfoStatics(factoryPtr)
        }

        return PlaceInfo.__IPlaceInfoStatics.Create(referencePoint)
    }

    /**
     * Creates a [PlaceInfo](placeinfo.md) instance.
     * @param {Geopoint} referencePoint The geographic map location that you want to show in a light-dismissible window.
     * @param {PlaceInfoCreateOptions} options 
     * @returns {PlaceInfo} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.placeinfo.create
     */
    static CreateWithGeopointAndOptions(referencePoint, options) {
        if (!PlaceInfo.HasProp("__IPlaceInfoStatics")) {
            activatableClassId := HSTRING.Create("Windows.Services.Maps.PlaceInfo")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPlaceInfoStatics.IID)
            PlaceInfo.__IPlaceInfoStatics := IPlaceInfoStatics(factoryPtr)
        }

        return PlaceInfo.__IPlaceInfoStatics.CreateWithGeopointAndOptions(referencePoint, options)
    }

    /**
     * Creates a [PlaceInfo](placeinfo.md) instance.
     * @param {HSTRING} identifier The identifier of the location.
     * @returns {PlaceInfo} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.placeinfo.createfromidentifier
     */
    static CreateFromIdentifier(identifier) {
        if (!PlaceInfo.HasProp("__IPlaceInfoStatics")) {
            activatableClassId := HSTRING.Create("Windows.Services.Maps.PlaceInfo")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPlaceInfoStatics.IID)
            PlaceInfo.__IPlaceInfoStatics := IPlaceInfoStatics(factoryPtr)
        }

        return PlaceInfo.__IPlaceInfoStatics.CreateFromIdentifier(identifier)
    }

    /**
     * Creates a [PlaceInfo](placeinfo.md) instance.
     * @param {HSTRING} identifier The identifier of the location.
     * @param {Geopoint} defaultPoint 
     * @param {PlaceInfoCreateOptions} options 
     * @returns {PlaceInfo} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.placeinfo.createfromidentifier
     */
    static CreateFromIdentifierWithOptions(identifier, defaultPoint, options) {
        if (!PlaceInfo.HasProp("__IPlaceInfoStatics")) {
            activatableClassId := HSTRING.Create("Windows.Services.Maps.PlaceInfo")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPlaceInfoStatics.IID)
            PlaceInfo.__IPlaceInfoStatics := IPlaceInfoStatics(factoryPtr)
        }

        return PlaceInfo.__IPlaceInfoStatics.CreateFromIdentifierWithOptions(identifier, defaultPoint, options)
    }

    /**
     * Creates a [PlaceInfo](placeinfo.md) instance.
     * @remarks
     * You can get a [MapLocation](maplocation.md) object by using any of the methods in the [MapLocationFinder](maplocationfinder.md) class.
     * @param {MapLocation} location_ The geographic map location that you want to show in a light-dismissible window.
     * @returns {PlaceInfo} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.placeinfo.createfrommaplocation
     */
    static CreateFromMapLocation(location_) {
        if (!PlaceInfo.HasProp("__IPlaceInfoStatics")) {
            activatableClassId := HSTRING.Create("Windows.Services.Maps.PlaceInfo")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPlaceInfoStatics.IID)
            PlaceInfo.__IPlaceInfoStatics := IPlaceInfoStatics(factoryPtr)
        }

        return PlaceInfo.__IPlaceInfoStatics.CreateFromMapLocation(location_)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    static get_IsShowSupported() {
        if (!PlaceInfo.HasProp("__IPlaceInfoStatics")) {
            activatableClassId := HSTRING.Create("Windows.Services.Maps.PlaceInfo")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPlaceInfoStatics.IID)
            PlaceInfo.__IPlaceInfoStatics := IPlaceInfoStatics(factoryPtr)
        }

        return PlaceInfo.__IPlaceInfoStatics.get_IsShowSupported()
    }

    /**
     * Creates a [PlaceInfo](placeinfo.md) instance by using an address and a display name.
     * @param {HSTRING} displayAddress The address of the location that you want to appear in the placecard.
     * @returns {PlaceInfo} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.placeinfo.createfromaddress
     */
    static CreateFromAddress(displayAddress) {
        if (!PlaceInfo.HasProp("__IPlaceInfoStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Services.Maps.PlaceInfo")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPlaceInfoStatics2.IID)
            PlaceInfo.__IPlaceInfoStatics2 := IPlaceInfoStatics2(factoryPtr)
        }

        return PlaceInfo.__IPlaceInfoStatics2.CreateFromAddress(displayAddress)
    }

    /**
     * Creates a [PlaceInfo](placeinfo.md) instance by using an address.
     * @param {HSTRING} displayAddress The address of the location that you want to appear in the placecard.
     * @param {HSTRING} displayName 
     * @returns {PlaceInfo} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.placeinfo.createfromaddress
     */
    static CreateFromAddressWithName(displayAddress, displayName) {
        if (!PlaceInfo.HasProp("__IPlaceInfoStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Services.Maps.PlaceInfo")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPlaceInfoStatics2.IID)
            PlaceInfo.__IPlaceInfoStatics2 := IPlaceInfoStatics2(factoryPtr)
        }

        return PlaceInfo.__IPlaceInfoStatics2.CreateFromAddressWithName(displayAddress, displayName)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the identifier associated with the [PlaceInfo](placeinfo.md).
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.placeinfo.identifier
     * @type {HSTRING} 
     */
    Identifier {
        get => this.get_Identifier()
    }

    /**
     * Gets the display name associated with the [PlaceInfo](placeinfo.md).
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.placeinfo.displayname
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
    }

    /**
     * Gets the address associated with the [PlaceInfo](placeinfo.md).
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.placeinfo.displayaddress
     * @type {HSTRING} 
     */
    DisplayAddress {
        get => this.get_DisplayAddress()
    }

    /**
     * Gets the geographical shape associated with the [PlaceInfo](placeinfo.md).
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.placeinfo.geoshape
     * @type {IGeoshape} 
     */
    Geoshape {
        get => this.get_Geoshape()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Shows in a pop-up window, the map location and related information that is described in the [PlaceInfo](placeinfo.md).
     * @remarks
     * By default, this window appears below the selection rectangle. If you want to specify a different placement for this window, use the overloaded version of this method that accepts a [Placement](/uwp/api/windows.ui.popups.placement) value as a parameter.
     * This method closes any place card UIs that are already visible.
     * @param {RECT} selection The [Rect](../windows.foundation/rect.md) is the rectangular area of user selection (for example, pressing a button), around which the operating system displays the light-dismissible window, not within that rectangular area. For example, if an app uses a button to show the place, pass the [Rect](../windows.foundation/rect.md) of the button so the light-dismissible window displays around the button, not overlapping it.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.placeinfo.show
     */
    Show(selection) {
        if (!this.HasProp("__IPlaceInfo")) {
            if ((queryResult := this.QueryInterface(IPlaceInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlaceInfo := IPlaceInfo(outPtr)
        }

        return this.__IPlaceInfo.Show(selection)
    }

    /**
     * Shows in a light-dismissible window, the map location and related information that is described in the [PlaceInfo](placeinfo.md).
     * @remarks
     * This method closes any place card UIs that are already visible.
     * @param {RECT} selection The [Rect](../windows.foundation/rect.md) is the rectangular area of user selection (for example, pressing a button), around which the operating system displays the light-dismissible window, not within that rectangular area. For example, if an app uses a button to show the place, pass the [Rect](../windows.foundation/rect.md) of the button so the light-dismissible window displays around the button, not overlapping it.
     * @param {Integer} preferredPlacement The preferred placement of the light-dismissible window relative to the rectangle.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.placeinfo.show
     */
    ShowWithPreferredPlacement(selection, preferredPlacement) {
        if (!this.HasProp("__IPlaceInfo")) {
            if ((queryResult := this.QueryInterface(IPlaceInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlaceInfo := IPlaceInfo(outPtr)
        }

        return this.__IPlaceInfo.ShowWithPreferredPlacement(selection, preferredPlacement)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Identifier() {
        if (!this.HasProp("__IPlaceInfo")) {
            if ((queryResult := this.QueryInterface(IPlaceInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlaceInfo := IPlaceInfo(outPtr)
        }

        return this.__IPlaceInfo.get_Identifier()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayName() {
        if (!this.HasProp("__IPlaceInfo")) {
            if ((queryResult := this.QueryInterface(IPlaceInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlaceInfo := IPlaceInfo(outPtr)
        }

        return this.__IPlaceInfo.get_DisplayName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayAddress() {
        if (!this.HasProp("__IPlaceInfo")) {
            if ((queryResult := this.QueryInterface(IPlaceInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlaceInfo := IPlaceInfo(outPtr)
        }

        return this.__IPlaceInfo.get_DisplayAddress()
    }

    /**
     * 
     * @returns {IGeoshape} 
     */
    get_Geoshape() {
        if (!this.HasProp("__IPlaceInfo")) {
            if ((queryResult := this.QueryInterface(IPlaceInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlaceInfo := IPlaceInfo(outPtr)
        }

        return this.__IPlaceInfo.get_Geoshape()
    }

;@endregion Instance Methods
}
