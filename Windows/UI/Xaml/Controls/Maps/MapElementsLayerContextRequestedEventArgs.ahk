#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMapElementsLayerContextRequestedEventArgs.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Provides event data for the [MapContextRequested](mapelementslayer_mapcontextrequested.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapelementslayercontextrequestedeventargs
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class MapElementsLayerContextRequestedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMapElementsLayerContextRequestedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMapElementsLayerContextRequestedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the x- and y-coordinate values that define the point on the map layer of a context input gesture, such as a right-click.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapelementslayercontextrequestedeventargs.position
     * @type {POINT} 
     */
    Position {
        get => this.get_Position()
    }

    /**
     * Gets a geolocation on the map layer of a context input gesture, such as a right-click.
     * @remarks
     * To get the x- and y-coordinate values that define the point on the map layer of a context input gesture, use the [Position](mapelementslayercontextrequestedeventargs_position.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapelementslayercontextrequestedeventargs.location
     * @type {Geopoint} 
     */
    Location {
        get => this.get_Location()
    }

    /**
     * Gets a collection of [MapElement](mapcontrol_mapelements.md) objects at the point on the map layer specified by the [Location](mapelementslayercontextrequestedeventargs_location.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapelementslayercontextrequestedeventargs.mapelements
     * @type {IVectorView<MapElement>} 
     */
    MapElements {
        get => this.get_MapElements()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [MapElementsLayerContextRequestedEventArgs](mapelementslayercontextrequestedeventargs.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapElementsLayerContextRequestedEventArgs")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_Position() {
        if (!this.HasProp("__IMapElementsLayerContextRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMapElementsLayerContextRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapElementsLayerContextRequestedEventArgs := IMapElementsLayerContextRequestedEventArgs(outPtr)
        }

        return this.__IMapElementsLayerContextRequestedEventArgs.get_Position()
    }

    /**
     * 
     * @returns {Geopoint} 
     */
    get_Location() {
        if (!this.HasProp("__IMapElementsLayerContextRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMapElementsLayerContextRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapElementsLayerContextRequestedEventArgs := IMapElementsLayerContextRequestedEventArgs(outPtr)
        }

        return this.__IMapElementsLayerContextRequestedEventArgs.get_Location()
    }

    /**
     * 
     * @returns {IVectorView<MapElement>} 
     */
    get_MapElements() {
        if (!this.HasProp("__IMapElementsLayerContextRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMapElementsLayerContextRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapElementsLayerContextRequestedEventArgs := IMapElementsLayerContextRequestedEventArgs(outPtr)
        }

        return this.__IMapElementsLayerContextRequestedEventArgs.get_MapElements()
    }

;@endregion Instance Methods
}
