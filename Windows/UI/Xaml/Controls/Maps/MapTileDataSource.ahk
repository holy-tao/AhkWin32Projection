#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\DependencyObject.ahk
#Include .\IMapTileDataSource.ahk
#Include .\IMapTileDataSourceFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Provides a source of tiles for a [MapTileSource](maptilesource.md). This class serves as the base class for [HttpMapTileDataSource](httpmaptiledatasource.md), [LocalMapTileDataSource](localmaptiledatasource.md), and [CustomMapTileDataSource](custommaptiledatasource.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.maptiledatasource
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class MapTileDataSource extends DependencyObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMapTileDataSource

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMapTileDataSource.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {MapTileDataSource} 
     */
    static CreateInstance() {
        if (!MapTileDataSource.HasProp("__IMapTileDataSourceFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapTileDataSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapTileDataSourceFactory.IID)
            MapTileDataSource.__IMapTileDataSourceFactory := IMapTileDataSourceFactory(factoryPtr)
        }

        return MapTileDataSource.__IMapTileDataSourceFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
