#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMapControlBusinessLandmarkPointerEnteredEventArgs.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Provides data for the [BusinessLandmarkPointerEntered](mapcontroldatahelper_businesslandmarkpointerentered.md) event.
  * 
  * > [!NOTE]
  * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about this API and the [Windows.Services.Maps.LocalSearch](../windows.services.maps.localsearch/windows_services_maps_localsearch.md) namespace, please work with your Microsoft Account Team representative.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrolbusinesslandmarkpointerenteredeventargs
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class MapControlBusinessLandmarkPointerEnteredEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMapControlBusinessLandmarkPointerEnteredEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMapControlBusinessLandmarkPointerEnteredEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the local locations for the business landmark.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrolbusinesslandmarkpointerenteredeventargs.locallocations
     * @type {IVectorView<LocalLocation>} 
     */
    LocalLocations {
        get => this.get_LocalLocations()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new [MapControlBusinessLandmarkPointerEnteredEventArgs](mapcontrolbusinesslandmarkpointerenteredeventargs.md) object.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapControlBusinessLandmarkPointerEnteredEventArgs")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVectorView<LocalLocation>} 
     */
    get_LocalLocations() {
        if (!this.HasProp("__IMapControlBusinessLandmarkPointerEnteredEventArgs")) {
            if ((queryResult := this.QueryInterface(IMapControlBusinessLandmarkPointerEnteredEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControlBusinessLandmarkPointerEnteredEventArgs := IMapControlBusinessLandmarkPointerEnteredEventArgs(outPtr)
        }

        return this.__IMapControlBusinessLandmarkPointerEnteredEventArgs.get_LocalLocations()
    }

;@endregion Instance Methods
}
