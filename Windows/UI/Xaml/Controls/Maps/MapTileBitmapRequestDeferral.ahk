#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMapTileBitmapRequestDeferral.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Represents a deferral that can be used by an app to respond asynchronously to a bitmap request for a tile.
 * @remarks
 * For more info about using the [CustomMapTileDataSource](custommaptiledatasource_custommaptiledatasource_1221375020.md), see the [PixelData](maptilebitmaprequest_pixeldata.md) property of the [MapTileBitmapRequest](maptilebitmaprequest.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.maptilebitmaprequestdeferral
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class MapTileBitmapRequestDeferral extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMapTileBitmapRequestDeferral

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMapTileBitmapRequestDeferral.IID

;@endregion Static Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [MapTileBitmapRequestDeferral](maptilebitmaprequestdeferral.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapTileBitmapRequestDeferral")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * Notifies the system that the app has finished processing the bitmap request for a tile.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.maptilebitmaprequestdeferral.complete
     */
    Complete() {
        if (!this.HasProp("__IMapTileBitmapRequestDeferral")) {
            if ((queryResult := this.QueryInterface(IMapTileBitmapRequestDeferral.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapTileBitmapRequestDeferral := IMapTileBitmapRequestDeferral(outPtr)
        }

        return this.__IMapTileBitmapRequestDeferral.Complete()
    }

;@endregion Instance Methods
}
