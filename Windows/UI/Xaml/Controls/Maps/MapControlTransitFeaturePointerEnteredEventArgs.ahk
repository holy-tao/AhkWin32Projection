#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMapControlTransitFeaturePointerEnteredEventArgs.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Provides data for the [TransitFeaturePointerEntered](mapcontroldatahelper_transitfeaturepointerentered.md) event.
  * 
  * > [!NOTE]
  * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about this API and the [Windows.Services.Maps.LocalSearch](../windows.services.maps.localsearch/windows_services_maps_localsearch.md) namespace, please work with your Microsoft Account Team representative.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontroltransitfeaturepointerenteredeventargs
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class MapControlTransitFeaturePointerEnteredEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMapControlTransitFeaturePointerEnteredEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMapControlTransitFeaturePointerEnteredEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the display name.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontroltransitfeaturepointerenteredeventargs.displayname
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
    }

    /**
     * Gets the location.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontroltransitfeaturepointerenteredeventargs.location
     * @type {Geopoint} 
     */
    Location {
        get => this.get_Location()
    }

    /**
     * Gets the transit properties.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontroltransitfeaturepointerenteredeventargs.transitproperties
     * @type {IMapView<HSTRING, IInspectable>} 
     */
    TransitProperties {
        get => this.get_TransitProperties()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Constructs a new [MapControlTransitFeaturePointerEnteredEventArgs](mapcontroltransitfeaturepointerenteredeventargs.md) object.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapControlTransitFeaturePointerEnteredEventArgs")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayName() {
        if (!this.HasProp("__IMapControlTransitFeaturePointerEnteredEventArgs")) {
            if ((queryResult := this.QueryInterface(IMapControlTransitFeaturePointerEnteredEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControlTransitFeaturePointerEnteredEventArgs := IMapControlTransitFeaturePointerEnteredEventArgs(outPtr)
        }

        return this.__IMapControlTransitFeaturePointerEnteredEventArgs.get_DisplayName()
    }

    /**
     * 
     * @returns {Geopoint} 
     */
    get_Location() {
        if (!this.HasProp("__IMapControlTransitFeaturePointerEnteredEventArgs")) {
            if ((queryResult := this.QueryInterface(IMapControlTransitFeaturePointerEnteredEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControlTransitFeaturePointerEnteredEventArgs := IMapControlTransitFeaturePointerEnteredEventArgs(outPtr)
        }

        return this.__IMapControlTransitFeaturePointerEnteredEventArgs.get_Location()
    }

    /**
     * 
     * @returns {IMapView<HSTRING, IInspectable>} 
     */
    get_TransitProperties() {
        if (!this.HasProp("__IMapControlTransitFeaturePointerEnteredEventArgs")) {
            if ((queryResult := this.QueryInterface(IMapControlTransitFeaturePointerEnteredEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControlTransitFeaturePointerEnteredEventArgs := IMapControlTransitFeaturePointerEnteredEventArgs(outPtr)
        }

        return this.__IMapControlTransitFeaturePointerEnteredEventArgs.get_TransitProperties()
    }

;@endregion Instance Methods
}
