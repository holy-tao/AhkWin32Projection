#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\MapTileDataSource.ahk
#Include .\IHttpMapTileDataSource.ahk
#Include .\IHttpMapTileDataSourceFactory.ahk
#Include ..\..\..\..\Foundation\TypedEventHandler.ahk
#Include .\HttpMapTileDataSource.ahk
#Include .\MapTileUriRequestedEventArgs.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\..\WinRTEventHandler.ahk

/**
 * Provides a source of tiles for a [MapTileSource](maptilesource.md). The tiles are fetched by using the HTTP or HTTPS protocol. Note that, as of build 15063, local uris don't work anymore.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.httpmaptiledatasource
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class HttpMapTileDataSource extends MapTileDataSource {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHttpMapTileDataSource

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHttpMapTileDataSource.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {HttpMapTileDataSource} 
     */
    static CreateInstance() {
        if (!HttpMapTileDataSource.HasProp("__IHttpMapTileDataSourceFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.HttpMapTileDataSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHttpMapTileDataSourceFactory.IID)
            HttpMapTileDataSource.__IHttpMapTileDataSourceFactory := IHttpMapTileDataSourceFactory(factoryPtr)
        }

        return HttpMapTileDataSource.__IHttpMapTileDataSourceFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

    /**
     * 
     * @param {HSTRING} uriFormatString 
     * @returns {HttpMapTileDataSource} 
     */
    static CreateInstanceWithUriFormatString(uriFormatString) {
        if (!HttpMapTileDataSource.HasProp("__IHttpMapTileDataSourceFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.HttpMapTileDataSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHttpMapTileDataSourceFactory.IID)
            HttpMapTileDataSource.__IHttpMapTileDataSourceFactory := IHttpMapTileDataSourceFactory(factoryPtr)
        }

        return HttpMapTileDataSource.__IHttpMapTileDataSourceFactory.CreateInstanceWithUriFormatString(uriFormatString, 0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the format of the Uri for fetching tiles from an HTTP source.
     * @remarks
     * The UriFormat property accepts the following case-insensitive replacement strings:
     * 
     * 
     * + *{x}*
     * + *{y}*
     * + *{zoomlevel}*
     * + *{quadkey}*
     * For more info about the *{x}*, *{y}*, and *{quadkey}* replacement strings, see [Bing Maps Tile System](/bingmaps/articles/bing-maps-tile-system).
     * 
     * > [!TIP]
     * > If you have to provide a custom Uri for which these arguments aren't sufficient - for example, if you have to provide *{subdomain}* for load balancing - create the custom Uri in a custom handler for the [UriRequested](httpmaptiledatasource_urirequested.md) event. For more info, see [Overlay tiled images on a map](/windows/uwp/maps-and-location/overlay-tiled-images).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.httpmaptiledatasource.uriformatstring
     * @type {HSTRING} 
     */
    UriFormatString {
        get => this.get_UriFormatString()
        set => this.put_UriFormatString(value)
    }

    /**
     * Gets or sets additional HTTP request headers and their values for fetching tiles from an HTTP source.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.httpmaptiledatasource.additionalrequestheaders
     * @type {IMap<HSTRING, HSTRING>} 
     */
    AdditionalRequestHeaders {
        get => this.get_AdditionalRequestHeaders()
    }

    /**
     * Gets or sets a value that indicates whether the Internet cache is checked before fetching a tile from an HTTP source. When caching is disabled, a new request for the tile is made every time.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.httpmaptiledatasource.allowcaching
     * @type {Boolean} 
     */
    AllowCaching {
        get => this.get_AllowCaching()
        set => this.put_AllowCaching(value)
    }

    /**
     * Occurs when the tile is requested for an [HttpMapTileDataSource](httpmaptiledatasource.md). An instance of [MapTileUriRequestedEventArgs](maptileurirequestedeventargs.md) provides data for this event.
     * @type {TypedEventHandler<HttpMapTileDataSource, MapTileUriRequestedEventArgs>}
    */
    OnUriRequested {
        get {
            if(!this.HasProp("__OnUriRequested")){
                this.__OnUriRequested := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{4933a19a-00cc-5c21-a3df-b68f9939f6ef}"),
                    HttpMapTileDataSource,
                    MapTileUriRequestedEventArgs
                )
                this.__OnUriRequestedToken := this.add_UriRequested(this.__OnUriRequested.iface)
            }
            return this.__OnUriRequested
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnUriRequestedToken")) {
            this.remove_UriRequested(this.__OnUriRequestedToken)
            this.__OnUriRequested.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_UriFormatString() {
        if (!this.HasProp("__IHttpMapTileDataSource")) {
            if ((queryResult := this.QueryInterface(IHttpMapTileDataSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpMapTileDataSource := IHttpMapTileDataSource(outPtr)
        }

        return this.__IHttpMapTileDataSource.get_UriFormatString()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_UriFormatString(value) {
        if (!this.HasProp("__IHttpMapTileDataSource")) {
            if ((queryResult := this.QueryInterface(IHttpMapTileDataSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpMapTileDataSource := IHttpMapTileDataSource(outPtr)
        }

        return this.__IHttpMapTileDataSource.put_UriFormatString(value)
    }

    /**
     * 
     * @returns {IMap<HSTRING, HSTRING>} 
     */
    get_AdditionalRequestHeaders() {
        if (!this.HasProp("__IHttpMapTileDataSource")) {
            if ((queryResult := this.QueryInterface(IHttpMapTileDataSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpMapTileDataSource := IHttpMapTileDataSource(outPtr)
        }

        return this.__IHttpMapTileDataSource.get_AdditionalRequestHeaders()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AllowCaching() {
        if (!this.HasProp("__IHttpMapTileDataSource")) {
            if ((queryResult := this.QueryInterface(IHttpMapTileDataSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpMapTileDataSource := IHttpMapTileDataSource(outPtr)
        }

        return this.__IHttpMapTileDataSource.get_AllowCaching()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AllowCaching(value) {
        if (!this.HasProp("__IHttpMapTileDataSource")) {
            if ((queryResult := this.QueryInterface(IHttpMapTileDataSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpMapTileDataSource := IHttpMapTileDataSource(outPtr)
        }

        return this.__IHttpMapTileDataSource.put_AllowCaching(value)
    }

    /**
     * 
     * @param {TypedEventHandler<HttpMapTileDataSource, MapTileUriRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_UriRequested(handler) {
        if (!this.HasProp("__IHttpMapTileDataSource")) {
            if ((queryResult := this.QueryInterface(IHttpMapTileDataSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpMapTileDataSource := IHttpMapTileDataSource(outPtr)
        }

        return this.__IHttpMapTileDataSource.add_UriRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_UriRequested(token) {
        if (!this.HasProp("__IHttpMapTileDataSource")) {
            if ((queryResult := this.QueryInterface(IHttpMapTileDataSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHttpMapTileDataSource := IHttpMapTileDataSource(outPtr)
        }

        return this.__IHttpMapTileDataSource.remove_UriRequested(token)
    }

;@endregion Instance Methods
}
