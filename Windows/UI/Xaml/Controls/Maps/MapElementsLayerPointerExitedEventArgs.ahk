#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMapElementsLayerPointerExitedEventArgs.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Provides data for the [MapElementPointerExited](mapelementslayer_mapelementpointerexited.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapelementslayerpointerexitedeventargs
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class MapElementsLayerPointerExitedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMapElementsLayerPointerExitedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMapElementsLayerPointerExitedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the physical position on the [MapElementsLayer](mapelementslayer.md) where it received user input.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapelementslayerpointerexitedeventargs.position
     * @type {POINT} 
     */
    Position {
        get => this.get_Position()
    }

    /**
     * Gets the geographic location that corresponds to where the [MapElementsLayer](mapelementslayer.md) received user input.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapelementslayerpointerexitedeventargs.location
     * @type {Geopoint} 
     */
    Location {
        get => this.get_Location()
    }

    /**
     * Gets the map element that correspond to where the [MapElementsLayer](mapelementslayer.md) received user input.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapelementslayerpointerexitedeventargs.mapelement
     * @type {MapElement} 
     */
    MapElement {
        get => this.get_MapElement()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [MapElementsLayerPointerExitedEventArgs](mapelementslayerpointerexitedeventargs.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapElementsLayerPointerExitedEventArgs")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_Position() {
        if (!this.HasProp("__IMapElementsLayerPointerExitedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMapElementsLayerPointerExitedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapElementsLayerPointerExitedEventArgs := IMapElementsLayerPointerExitedEventArgs(outPtr)
        }

        return this.__IMapElementsLayerPointerExitedEventArgs.get_Position()
    }

    /**
     * 
     * @returns {Geopoint} 
     */
    get_Location() {
        if (!this.HasProp("__IMapElementsLayerPointerExitedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMapElementsLayerPointerExitedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapElementsLayerPointerExitedEventArgs := IMapElementsLayerPointerExitedEventArgs(outPtr)
        }

        return this.__IMapElementsLayerPointerExitedEventArgs.get_Location()
    }

    /**
     * 
     * @returns {MapElement} 
     */
    get_MapElement() {
        if (!this.HasProp("__IMapElementsLayerPointerExitedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMapElementsLayerPointerExitedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapElementsLayerPointerExitedEventArgs := IMapElementsLayerPointerExitedEventArgs(outPtr)
        }

        return this.__IMapElementsLayerPointerExitedEventArgs.get_MapElement()
    }

;@endregion Instance Methods
}
