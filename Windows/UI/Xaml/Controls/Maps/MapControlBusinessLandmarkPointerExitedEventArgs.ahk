#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMapControlBusinessLandmarkPointerExitedEventArgs.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Provides data for the [BusinessLandmarkPointerExited](mapcontroldatahelper_businesslandmarkpointerexited.md) event.
  * 
  * > [!NOTE]
  * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about this API and the [Windows.Services.Maps.LocalSearch](../windows.services.maps.localsearch/windows_services_maps_localsearch.md) namespace, please work with your Microsoft Account Team representative.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrolbusinesslandmarkpointerexitedeventargs
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class MapControlBusinessLandmarkPointerExitedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMapControlBusinessLandmarkPointerExitedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMapControlBusinessLandmarkPointerExitedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the local locations of the business land mark.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontrolbusinesslandmarkpointerexitedeventargs.locallocations
     * @type {IVectorView<LocalLocation>} 
     */
    LocalLocations {
        get => this.get_LocalLocations()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Constructs a new [MapControlBusinessLandmarkPointerExitedEventArgs](mapcontrolbusinesslandmarkpointerexitedeventargs.md) object.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapControlBusinessLandmarkPointerExitedEventArgs")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVectorView<LocalLocation>} 
     */
    get_LocalLocations() {
        if (!this.HasProp("__IMapControlBusinessLandmarkPointerExitedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMapControlBusinessLandmarkPointerExitedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapControlBusinessLandmarkPointerExitedEventArgs := IMapControlBusinessLandmarkPointerExitedEventArgs(outPtr)
        }

        return this.__IMapControlBusinessLandmarkPointerExitedEventArgs.get_LocalLocations()
    }

;@endregion Instance Methods
}
