#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\MapTileDataSource.ahk
#Include .\ILocalMapTileDataSource.ahk
#Include .\ILocalMapTileDataSourceFactory.ahk
#Include ..\..\..\..\Foundation\TypedEventHandler.ahk
#Include .\LocalMapTileDataSource.ahk
#Include .\MapTileUriRequestedEventArgs.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\..\WinRTEventHandler.ahk

/**
 * Provides a source of tiles for a [MapTileSource](maptilesource.md). The tiles are fetched by using a local protocol such as **ms-appdata**.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.localmaptiledatasource
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class LocalMapTileDataSource extends MapTileDataSource {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILocalMapTileDataSource

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILocalMapTileDataSource.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {LocalMapTileDataSource} 
     */
    static CreateInstance() {
        if (!LocalMapTileDataSource.HasProp("__ILocalMapTileDataSourceFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.LocalMapTileDataSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILocalMapTileDataSourceFactory.IID)
            LocalMapTileDataSource.__ILocalMapTileDataSourceFactory := ILocalMapTileDataSourceFactory(factoryPtr)
        }

        return LocalMapTileDataSource.__ILocalMapTileDataSourceFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

    /**
     * 
     * @param {HSTRING} uriFormatString 
     * @returns {LocalMapTileDataSource} 
     */
    static CreateInstanceWithUriFormatString(uriFormatString) {
        if (!LocalMapTileDataSource.HasProp("__ILocalMapTileDataSourceFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.LocalMapTileDataSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILocalMapTileDataSourceFactory.IID)
            LocalMapTileDataSource.__ILocalMapTileDataSourceFactory := ILocalMapTileDataSourceFactory(factoryPtr)
        }

        return LocalMapTileDataSource.__ILocalMapTileDataSourceFactory.CreateInstanceWithUriFormatString(uriFormatString, 0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the format of the Uri for fetching tiles from a local source.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.localmaptiledatasource.uriformatstring
     * @type {HSTRING} 
     */
    UriFormatString {
        get => this.get_UriFormatString()
        set => this.put_UriFormatString(value)
    }

    /**
     * Occurs when the tile is requested for an [LocalMapTileDataSource](localmaptiledatasource.md). An instance of [MapTileUriRequestedEventArgs](maptileurirequestedeventargs.md) provides data for this event.
     * @type {TypedEventHandler<LocalMapTileDataSource, MapTileUriRequestedEventArgs>}
    */
    OnUriRequested {
        get {
            if(!this.HasProp("__OnUriRequested")){
                this.__OnUriRequested := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{76752fc4-b240-502c-9098-622c6c36e6a3}"),
                    LocalMapTileDataSource,
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
        if (!this.HasProp("__ILocalMapTileDataSource")) {
            if ((queryResult := this.QueryInterface(ILocalMapTileDataSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILocalMapTileDataSource := ILocalMapTileDataSource(outPtr)
        }

        return this.__ILocalMapTileDataSource.get_UriFormatString()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_UriFormatString(value) {
        if (!this.HasProp("__ILocalMapTileDataSource")) {
            if ((queryResult := this.QueryInterface(ILocalMapTileDataSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILocalMapTileDataSource := ILocalMapTileDataSource(outPtr)
        }

        return this.__ILocalMapTileDataSource.put_UriFormatString(value)
    }

    /**
     * 
     * @param {TypedEventHandler<LocalMapTileDataSource, MapTileUriRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_UriRequested(handler) {
        if (!this.HasProp("__ILocalMapTileDataSource")) {
            if ((queryResult := this.QueryInterface(ILocalMapTileDataSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILocalMapTileDataSource := ILocalMapTileDataSource(outPtr)
        }

        return this.__ILocalMapTileDataSource.add_UriRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_UriRequested(token) {
        if (!this.HasProp("__ILocalMapTileDataSource")) {
            if ((queryResult := this.QueryInterface(ILocalMapTileDataSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILocalMapTileDataSource := ILocalMapTileDataSource(outPtr)
        }

        return this.__ILocalMapTileDataSource.remove_UriRequested(token)
    }

;@endregion Instance Methods
}
