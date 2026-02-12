#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMapTileUriRequest.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Represents a Uri request for a tile for an [HttpMapTileDataSource](httpmaptiledatasource.md) or a [LocalMapTileDataSource](localmaptiledatasource.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.maptileurirequest
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class MapTileUriRequest extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMapTileUriRequest

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMapTileUriRequest.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the Uri of the request.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.maptileurirequest.uri
     * @type {Uri} 
     */
    Uri {
        get => this.get_Uri()
        set => this.put_Uri(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [MapTileUriRequest](maptileurirequest.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapTileUriRequest")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_Uri() {
        if (!this.HasProp("__IMapTileUriRequest")) {
            if ((queryResult := this.QueryInterface(IMapTileUriRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapTileUriRequest := IMapTileUriRequest(outPtr)
        }

        return this.__IMapTileUriRequest.get_Uri()
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_Uri(value) {
        if (!this.HasProp("__IMapTileUriRequest")) {
            if ((queryResult := this.QueryInterface(IMapTileUriRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapTileUriRequest := IMapTileUriRequest(outPtr)
        }

        return this.__IMapTileUriRequest.put_Uri(value)
    }

    /**
     * Gets a [MapTileUriRequestDeferral](maptileurirequestdeferral.md) that the app can use to respond asynchronously to the Uri request.
     * @returns {MapTileUriRequestDeferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.maptileurirequest.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IMapTileUriRequest")) {
            if ((queryResult := this.QueryInterface(IMapTileUriRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapTileUriRequest := IMapTileUriRequest(outPtr)
        }

        return this.__IMapTileUriRequest.GetDeferral()
    }

;@endregion Instance Methods
}
