#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMapTileBitmapRequestedEventArgs.ahk
#Include .\IMapTileBitmapRequestedEventArgs2.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Provides data for the [CustomMapTileDataSource.BitmapRequested](custommaptiledatasource_bitmaprequested.md) event.
 * @remarks
 * For more info about using the [CustomMapTileDataSource](custommaptiledatasource_custommaptiledatasource_1221375020.md), see the [PixelData](maptilebitmaprequest_pixeldata.md) property of the [MapTileBitmapRequest](maptilebitmaprequest.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.maptilebitmaprequestedeventargs
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class MapTileBitmapRequestedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMapTileBitmapRequestedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMapTileBitmapRequestedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the X value of the requested tile.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.maptilebitmaprequestedeventargs.x
     * @type {Integer} 
     */
    X {
        get => this.get_X()
    }

    /**
     * Gets the Y value of the requested tile.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.maptilebitmaprequestedeventargs.y
     * @type {Integer} 
     */
    Y {
        get => this.get_Y()
    }

    /**
     * Gets the zoom level of the requested tile.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.maptilebitmaprequestedeventargs.zoomlevel
     * @type {Integer} 
     */
    ZoomLevel {
        get => this.get_ZoomLevel()
    }

    /**
     * Gets the bitmap request.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.maptilebitmaprequestedeventargs.request
     * @type {MapTileBitmapRequest} 
     */
    Request {
        get => this.get_Request()
    }

    /**
     * Gets the number of frame of the requested tile.
     * @remarks
     * For a non-animating [MapTileSource](maptilesource.md), the frame index is always zero.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.maptilebitmaprequestedeventargs.frameindex
     * @type {Integer} 
     */
    FrameIndex {
        get => this.get_FrameIndex()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [MapTileBitmapRequestedEventArgs](maptilebitmaprequestedeventargs.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapTileBitmapRequestedEventArgs")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_X() {
        if (!this.HasProp("__IMapTileBitmapRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMapTileBitmapRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapTileBitmapRequestedEventArgs := IMapTileBitmapRequestedEventArgs(outPtr)
        }

        return this.__IMapTileBitmapRequestedEventArgs.get_X()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Y() {
        if (!this.HasProp("__IMapTileBitmapRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMapTileBitmapRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapTileBitmapRequestedEventArgs := IMapTileBitmapRequestedEventArgs(outPtr)
        }

        return this.__IMapTileBitmapRequestedEventArgs.get_Y()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ZoomLevel() {
        if (!this.HasProp("__IMapTileBitmapRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMapTileBitmapRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapTileBitmapRequestedEventArgs := IMapTileBitmapRequestedEventArgs(outPtr)
        }

        return this.__IMapTileBitmapRequestedEventArgs.get_ZoomLevel()
    }

    /**
     * 
     * @returns {MapTileBitmapRequest} 
     */
    get_Request() {
        if (!this.HasProp("__IMapTileBitmapRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMapTileBitmapRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapTileBitmapRequestedEventArgs := IMapTileBitmapRequestedEventArgs(outPtr)
        }

        return this.__IMapTileBitmapRequestedEventArgs.get_Request()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FrameIndex() {
        if (!this.HasProp("__IMapTileBitmapRequestedEventArgs2")) {
            if ((queryResult := this.QueryInterface(IMapTileBitmapRequestedEventArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapTileBitmapRequestedEventArgs2 := IMapTileBitmapRequestedEventArgs2(outPtr)
        }

        return this.__IMapTileBitmapRequestedEventArgs2.get_FrameIndex()
    }

;@endregion Instance Methods
}
