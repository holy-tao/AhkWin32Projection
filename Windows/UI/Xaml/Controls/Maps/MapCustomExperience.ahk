#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\DependencyObject.ahk
#Include .\IMapCustomExperience.ahk
#Include .\IMapCustomExperienceFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Represents a custom experience for the [MapControl](mapcontrol.md).
 * @remarks
 * A custom experience changes the way a map appears in the [MapControl](mapcontrol.md). For example, the [StreetsideExperience](streetsideexperience.md) changes the perspective of the map to appear as though you were viewing a location from the street level.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcustomexperience
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class MapCustomExperience extends DependencyObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMapCustomExperience

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMapCustomExperience.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {MapCustomExperience} 
     */
    static CreateInstance() {
        if (!MapCustomExperience.HasProp("__IMapCustomExperienceFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapCustomExperience")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapCustomExperienceFactory.IID)
            MapCustomExperience.__IMapCustomExperienceFactory := IMapCustomExperienceFactory(factoryPtr)
        }

        return MapCustomExperience.__IMapCustomExperienceFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
