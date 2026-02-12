#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMapContextRequestedEventArgs.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Provides event data for the [MapContextRequested](mapcontrol_mapcontextrequested.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontextrequestedeventargs
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class MapContextRequestedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMapContextRequestedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMapContextRequestedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the x- and y-coordinate values that define the point on the map of a context input gesture, such as a right-click.
     * @remarks
     * To get the geolocation point on the map of a context input gesture, use the [Location](mapcontextrequestedeventargs_location.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontextrequestedeventargs.position
     * @type {POINT} 
     */
    Position {
        get => this.get_Position()
    }

    /**
     * Gets a geolocation on the map of a context input gesture, such as a right-click.
     * @remarks
     * To get the x- and y-coordinate values that define the point on the map of a context input gesture, use the [Position](mapcontextrequestedeventargs_position.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontextrequestedeventargs.location
     * @type {Geopoint} 
     */
    Location {
        get => this.get_Location()
    }

    /**
     * Gets a collection of [MapElement](mapcontrol_mapelements.md) objects at the point on the map specified by the [Location](mapcontextrequestedeventargs_location.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapcontextrequestedeventargs.mapelements
     * @type {IVectorView<MapElement>} 
     */
    MapElements {
        get => this.get_MapElements()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [MapContextRequestedEventArgs](mapcontextrequestedeventargs.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapContextRequestedEventArgs")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_Position() {
        if (!this.HasProp("__IMapContextRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMapContextRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapContextRequestedEventArgs := IMapContextRequestedEventArgs(outPtr)
        }

        return this.__IMapContextRequestedEventArgs.get_Position()
    }

    /**
     * 
     * @returns {Geopoint} 
     */
    get_Location() {
        if (!this.HasProp("__IMapContextRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMapContextRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapContextRequestedEventArgs := IMapContextRequestedEventArgs(outPtr)
        }

        return this.__IMapContextRequestedEventArgs.get_Location()
    }

    /**
     * 
     * @returns {IVectorView<MapElement>} 
     */
    get_MapElements() {
        if (!this.HasProp("__IMapContextRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMapContextRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapContextRequestedEventArgs := IMapContextRequestedEventArgs(outPtr)
        }

        return this.__IMapContextRequestedEventArgs.get_MapElements()
    }

;@endregion Instance Methods
}
