#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\DependencyObject.ahk
#Include .\IStreetsidePanorama.ahk
#Include .\IStreetsidePanoramaStatics.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Represents a panoramic view of a geographic location from a street-level perspective.
 * @remarks
 * Use StreetsidePanorama with [StreetsideExperience](streetsideexperience_streetsideexperience_2014336380.md) to create a street-level map experience.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.streetsidepanorama
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class StreetsidePanorama extends DependencyObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IStreetsidePanorama

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IStreetsidePanorama.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a [StreetsidePanorama](streetsidepanorama.md) near the specified geographic location and radius.
     * @remarks
     * Panoramic street-level views are not available for all locations. We recommend checking for **null** return values before proceeding with a [StreetsideExperience](streetsideexperience.md).
     * @param {Geopoint} location_ The center of the panoramic view.
     * @returns {IAsyncOperation<StreetsidePanorama>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.streetsidepanorama.findnearbyasync
     */
    static FindNearbyWithLocationAsync(location_) {
        if (!StreetsidePanorama.HasProp("__IStreetsidePanoramaStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.StreetsidePanorama")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStreetsidePanoramaStatics.IID)
            StreetsidePanorama.__IStreetsidePanoramaStatics := IStreetsidePanoramaStatics(factoryPtr)
        }

        return StreetsidePanorama.__IStreetsidePanoramaStatics.FindNearbyWithLocationAsync(location_)
    }

    /**
     * Creates a [StreetsidePanorama](streetsidepanorama.md) near the specified geographic location.
     * @remarks
     * Panoramic street-level views are not available for all locations. We recommend checking for **null** return values before proceeding with a [StreetsideExperience](streetsideexperience.md).
     * @param {Geopoint} location_ The center of the panoramic view.
     * @param {Float} radiusInMeters 
     * @returns {IAsyncOperation<StreetsidePanorama>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.streetsidepanorama.findnearbyasync
     */
    static FindNearbyWithLocationAndRadiusAsync(location_, radiusInMeters) {
        if (!StreetsidePanorama.HasProp("__IStreetsidePanoramaStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.StreetsidePanorama")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStreetsidePanoramaStatics.IID)
            StreetsidePanorama.__IStreetsidePanoramaStatics := IStreetsidePanoramaStatics(factoryPtr)
        }

        return StreetsidePanorama.__IStreetsidePanoramaStatics.FindNearbyWithLocationAndRadiusAsync(location_, radiusInMeters)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the geographic location that corresponds to the [StreetsidePanorama](streetsidepanorama.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.streetsidepanorama.location
     * @type {Geopoint} 
     */
    Location {
        get => this.get_Location()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Geopoint} 
     */
    get_Location() {
        if (!this.HasProp("__IStreetsidePanorama")) {
            if ((queryResult := this.QueryInterface(IStreetsidePanorama.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStreetsidePanorama := IStreetsidePanorama(outPtr)
        }

        return this.__IStreetsidePanorama.get_Location()
    }

;@endregion Instance Methods
}
