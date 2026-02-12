#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\MapTileDataSource.ahk
#Include .\ICustomMapTileDataSource.ahk
#Include .\ICustomMapTileDataSourceFactory.ahk
#Include ..\..\..\..\Foundation\TypedEventHandler.ahk
#Include .\CustomMapTileDataSource.ahk
#Include .\MapTileBitmapRequestedEventArgs.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\..\WinRTEventHandler.ahk

/**
 * Provides a source of custom tiles for a [MapTileSource](maptilesource.md). Use this class when you can't use [HttpMapTileDataSource](httpmaptiledatasource.md) or [LocalMapTileDataSource](localmaptiledatasource.md). For example, [CustomMapTileDataSource](custommaptiledatasource_custommaptiledatasource_1221375020.md) supports drawing tiles in memory and returning them as a stream of pixels.
 * @remarks
 * For more info about using the [CustomMapTileDataSource](custommaptiledatasource_custommaptiledatasource_1221375020.md), see the [PixelData](maptilebitmaprequest_pixeldata.md) property of the [MapTileBitmapRequest](maptilebitmaprequest.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.custommaptiledatasource
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class CustomMapTileDataSource extends MapTileDataSource {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICustomMapTileDataSource

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICustomMapTileDataSource.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {CustomMapTileDataSource} 
     */
    static CreateInstance() {
        if (!CustomMapTileDataSource.HasProp("__ICustomMapTileDataSourceFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.CustomMapTileDataSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICustomMapTileDataSourceFactory.IID)
            CustomMapTileDataSource.__ICustomMapTileDataSourceFactory := ICustomMapTileDataSourceFactory(factoryPtr)
        }

        return CustomMapTileDataSource.__ICustomMapTileDataSourceFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnBitmapRequestedToken")) {
            this.remove_BitmapRequested(this.__OnBitmapRequestedToken)
            this.__OnBitmapRequested.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @param {TypedEventHandler<CustomMapTileDataSource, MapTileBitmapRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_BitmapRequested(handler) {
        if (!this.HasProp("__ICustomMapTileDataSource")) {
            if ((queryResult := this.QueryInterface(ICustomMapTileDataSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICustomMapTileDataSource := ICustomMapTileDataSource(outPtr)
        }

        return this.__ICustomMapTileDataSource.add_BitmapRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_BitmapRequested(token) {
        if (!this.HasProp("__ICustomMapTileDataSource")) {
            if ((queryResult := this.QueryInterface(ICustomMapTileDataSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICustomMapTileDataSource := ICustomMapTileDataSource(outPtr)
        }

        return this.__ICustomMapTileDataSource.remove_BitmapRequested(token)
    }

;@endregion Instance Methods
}
