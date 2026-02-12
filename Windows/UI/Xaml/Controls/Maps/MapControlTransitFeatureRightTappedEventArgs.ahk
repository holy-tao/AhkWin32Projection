#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMapControlTransitFeatureRightTappedEventArgs.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Provides data for the [TransitFeatureRightTapped](mapcontroldatahelper_transitfeaturerighttapped.md) event.
  * 
  * > [!NOTE]
  * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about this API and the [Windows.Services.Maps.LocalSearch](../windows.services.maps.localsearch/windows_services_maps_localsearch.md) namespace, please work with your Microsoft Account Team representative.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontroltransitfeaturerighttappedeventargs
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class MapControlTransitFeatureRightTappedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMapControlTransitFeatureRightTappedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMapControlTransitFeatureRightTappedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the name of the transit feature.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about this API and the [Windows.Services.Maps.LocalSearch](../windows.services.maps.localsearch/windows_services_maps_localsearch.md) namespace, please work with your Microsoft Account Team representative.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontroltransitfeaturerighttappedeventargs.displayname
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
    }

    /**
     * Gets the geographic location of the transit feature.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about this API and the [Windows.Services.Maps.LocalSearch](../windows.services.maps.localsearch/windows_services_maps_localsearch.md) namespace, please work with your Microsoft Account Team representative.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontroltransitfeaturerighttappedeventargs.location
     * @type {Geopoint} 
     */
    Location {
        get => this.get_Location()
    }

    /**
     * Gets the property bag for the transit feature.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about this API and the [Windows.Services.Maps.LocalSearch](../windows.services.maps.localsearch/windows_services_maps_localsearch.md) namespace, please work with your Microsoft Account Team representative.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontroltransitfeaturerighttappedeventargs.transitproperties
     * @type {IMapView<HSTRING, IInspectable>} 
     */
    TransitProperties {
        get => this.get_TransitProperties()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [MapControlTransitFeatureRightTappedEventArgs](mapcontroltransitfeaturerighttappedeventargs.md) class.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about this API and the [Windows.Services.Maps.LocalSearch](../windows.services.maps.localsearch/windows_services_maps_localsearch.md) namespace, please work with your Microsoft Account Team representative.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapControlTransitFeatureRightTappedEventArgs")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayName() {
        if (!this.HasProp("__IMapControlTransitFeatureRightTappedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMapControlTransitFeatureRightTappedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControlTransitFeatureRightTappedEventArgs := IMapControlTransitFeatureRightTappedEventArgs(outPtr)
        }

        return this.__IMapControlTransitFeatureRightTappedEventArgs.get_DisplayName()
    }

    /**
     * 
     * @returns {Geopoint} 
     */
    get_Location() {
        if (!this.HasProp("__IMapControlTransitFeatureRightTappedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMapControlTransitFeatureRightTappedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControlTransitFeatureRightTappedEventArgs := IMapControlTransitFeatureRightTappedEventArgs(outPtr)
        }

        return this.__IMapControlTransitFeatureRightTappedEventArgs.get_Location()
    }

    /**
     * 
     * @returns {IMapView<HSTRING, IInspectable>} 
     */
    get_TransitProperties() {
        if (!this.HasProp("__IMapControlTransitFeatureRightTappedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMapControlTransitFeatureRightTappedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControlTransitFeatureRightTappedEventArgs := IMapControlTransitFeatureRightTappedEventArgs(outPtr)
        }

        return this.__IMapControlTransitFeatureRightTappedEventArgs.get_TransitProperties()
    }

;@endregion Instance Methods
}
