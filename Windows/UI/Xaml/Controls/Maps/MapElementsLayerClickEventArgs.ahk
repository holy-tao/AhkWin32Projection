#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMapElementsLayerClickEventArgs.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Provides data for the [MapElementClick](mapelementslayer_mapelementclick.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapelementslayerclickeventargs
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class MapElementsLayerClickEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMapElementsLayerClickEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMapElementsLayerClickEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the physical position on the [MapElementsLayer](mapelementslayer.md) where it received user input.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapelementslayerclickeventargs.position
     * @type {POINT} 
     */
    Position {
        get => this.get_Position()
    }

    /**
     * Gets the geographic location that corresponds to where the [MapElementsLayer](mapelementslayer.md) received user input.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapelementslayerclickeventargs.location
     * @type {Geopoint} 
     */
    Location {
        get => this.get_Location()
    }

    /**
     * Gets a list of map elements that correspond to where the [MapElementsLayer](mapelementslayer.md) received user input.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapelementslayerclickeventargs.mapelements
     * @type {IVector<MapElement>} 
     */
    MapElements {
        get => this.get_MapElements()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [MapElementsLayerClickEventArgs](mapelementslayerclickeventargs.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapElementsLayerClickEventArgs")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_Position() {
        if (!this.HasProp("__IMapElementsLayerClickEventArgs")) {
            if ((queryResult := this.QueryInterface(IMapElementsLayerClickEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapElementsLayerClickEventArgs := IMapElementsLayerClickEventArgs(outPtr)
        }

        return this.__IMapElementsLayerClickEventArgs.get_Position()
    }

    /**
     * 
     * @returns {Geopoint} 
     */
    get_Location() {
        if (!this.HasProp("__IMapElementsLayerClickEventArgs")) {
            if ((queryResult := this.QueryInterface(IMapElementsLayerClickEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapElementsLayerClickEventArgs := IMapElementsLayerClickEventArgs(outPtr)
        }

        return this.__IMapElementsLayerClickEventArgs.get_Location()
    }

    /**
     * 
     * @returns {IVector<MapElement>} 
     */
    get_MapElements() {
        if (!this.HasProp("__IMapElementsLayerClickEventArgs")) {
            if ((queryResult := this.QueryInterface(IMapElementsLayerClickEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapElementsLayerClickEventArgs := IMapElementsLayerClickEventArgs(outPtr)
        }

        return this.__IMapElementsLayerClickEventArgs.get_MapElements()
    }

;@endregion Instance Methods
}
