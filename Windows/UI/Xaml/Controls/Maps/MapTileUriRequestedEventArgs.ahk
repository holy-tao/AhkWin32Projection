#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMapTileUriRequestedEventArgs.ahk
#Include .\IMapTileUriRequestedEventArgs2.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Provides data for the [HttpMapTileDataSource.UriRequested](httpmaptiledatasource_urirequested.md) event and the [LocalMapTileDataSource.UriRequested](localmaptiledatasource_urirequested.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.maptileurirequestedeventargs
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class MapTileUriRequestedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMapTileUriRequestedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMapTileUriRequestedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the X value of the requested tile.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.maptileurirequestedeventargs.x
     * @type {Integer} 
     */
    X {
        get => this.get_X()
    }

    /**
     * Gets the Y value of the requested tile.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.maptileurirequestedeventargs.y
     * @type {Integer} 
     */
    Y {
        get => this.get_Y()
    }

    /**
     * Gets the zoom level of the requested tile.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.maptileurirequestedeventargs.zoomlevel
     * @type {Integer} 
     */
    ZoomLevel {
        get => this.get_ZoomLevel()
    }

    /**
     * Gets the Uri request.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.maptileurirequestedeventargs.request
     * @type {MapTileUriRequest} 
     */
    Request {
        get => this.get_Request()
    }

    /**
     * Gets the number of frame of the requested tile.
     * @remarks
     * For a non-animating [MapTileSource](maptilesource.md), the frame index is always zero.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.maptileurirequestedeventargs.frameindex
     * @type {Integer} 
     */
    FrameIndex {
        get => this.get_FrameIndex()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [MapTileUriRequestedEventArgs](maptileurirequestedeventargs.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapTileUriRequestedEventArgs")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_X() {
        if (!this.HasProp("__IMapTileUriRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMapTileUriRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapTileUriRequestedEventArgs := IMapTileUriRequestedEventArgs(outPtr)
        }

        return this.__IMapTileUriRequestedEventArgs.get_X()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Y() {
        if (!this.HasProp("__IMapTileUriRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMapTileUriRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapTileUriRequestedEventArgs := IMapTileUriRequestedEventArgs(outPtr)
        }

        return this.__IMapTileUriRequestedEventArgs.get_Y()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ZoomLevel() {
        if (!this.HasProp("__IMapTileUriRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMapTileUriRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapTileUriRequestedEventArgs := IMapTileUriRequestedEventArgs(outPtr)
        }

        return this.__IMapTileUriRequestedEventArgs.get_ZoomLevel()
    }

    /**
     * 
     * @returns {MapTileUriRequest} 
     */
    get_Request() {
        if (!this.HasProp("__IMapTileUriRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMapTileUriRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapTileUriRequestedEventArgs := IMapTileUriRequestedEventArgs(outPtr)
        }

        return this.__IMapTileUriRequestedEventArgs.get_Request()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FrameIndex() {
        if (!this.HasProp("__IMapTileUriRequestedEventArgs2")) {
            if ((queryResult := this.QueryInterface(IMapTileUriRequestedEventArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapTileUriRequestedEventArgs2 := IMapTileUriRequestedEventArgs2(outPtr)
        }

        return this.__IMapTileUriRequestedEventArgs2.get_FrameIndex()
    }

;@endregion Instance Methods
}
