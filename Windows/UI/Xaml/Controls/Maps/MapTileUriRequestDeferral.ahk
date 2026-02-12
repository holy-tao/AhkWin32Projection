#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMapTileUriRequestDeferral.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Represents a deferral that can be used by an app to respond asynchronously to a Uri request for a tile.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.maptileurirequestdeferral
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class MapTileUriRequestDeferral extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMapTileUriRequestDeferral

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMapTileUriRequestDeferral.IID

;@endregion Static Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [MapTileUriRequestDeferral](maptileurirequestdeferral.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapTileUriRequestDeferral")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * Notifies the system that the app has finished processing the Uri request for a tile.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.maptileurirequestdeferral.complete
     */
    Complete() {
        if (!this.HasProp("__IMapTileUriRequestDeferral")) {
            if ((queryResult := this.QueryInterface(IMapTileUriRequestDeferral.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapTileUriRequestDeferral := IMapTileUriRequestDeferral(outPtr)
        }

        return this.__IMapTileUriRequestDeferral.Complete()
    }

;@endregion Instance Methods
}
