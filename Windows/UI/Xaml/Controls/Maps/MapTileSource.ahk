#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\DependencyObject.ahk
#Include .\IMapTileSource.ahk
#Include .\IMapTileSource2.ahk
#Include .\IMapTileSourceStatics2.ahk
#Include .\IMapTileSourceStatics.ahk
#Include .\IMapTileSourceFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Represents a source of tiles to overlay on the [MapControl](mapcontrol.md).
 * @remarks
 * Tiles can also be animated on the [MapControl](mapcontrol.md) using a MapTileSource.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.maptilesource
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class MapTileSource extends DependencyObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMapTileSource

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMapTileSource.IID

    /**
     * Identifies the [AnimationState](maptilesource_animationstate.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.maptilesource.animationstateproperty
     * @type {DependencyProperty} 
     */
    static AnimationStateProperty {
        get => MapTileSource.get_AnimationStateProperty()
    }

    /**
     * Identifies the [AutoPlay](maptilesource_autoplay.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.maptilesource.autoplayproperty
     * @type {DependencyProperty} 
     */
    static AutoPlayProperty {
        get => MapTileSource.get_AutoPlayProperty()
    }

    /**
     * Identifies the [FrameCount](maptilesource_framecount.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.maptilesource.framecountproperty
     * @type {DependencyProperty} 
     */
    static FrameCountProperty {
        get => MapTileSource.get_FrameCountProperty()
    }

    /**
     * Identifies the [FrameDuration](maptilesource_frameduration.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.maptilesource.framedurationproperty
     * @type {DependencyProperty} 
     */
    static FrameDurationProperty {
        get => MapTileSource.get_FrameDurationProperty()
    }

    /**
     * Identifies the [DataSource](maptilesource_datasource.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.maptilesource.datasourceproperty
     * @type {DependencyProperty} 
     */
    static DataSourceProperty {
        get => MapTileSource.get_DataSourceProperty()
    }

    /**
     * Identifies the [Layer](maptilesource_layer.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.maptilesource.layerproperty
     * @type {DependencyProperty} 
     */
    static LayerProperty {
        get => MapTileSource.get_LayerProperty()
    }

    /**
     * Identifies the [ZoomLevelRange](maptilesource_zoomlevelrange.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.maptilesource.zoomlevelrangeproperty
     * @type {DependencyProperty} 
     */
    static ZoomLevelRangeProperty {
        get => MapTileSource.get_ZoomLevelRangeProperty()
    }

    /**
     * Identifies the [Bounds](maptilesource_bounds.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.maptilesource.boundsproperty
     * @type {DependencyProperty} 
     */
    static BoundsProperty {
        get => MapTileSource.get_BoundsProperty()
    }

    /**
     * Identifies the [AllowOverstretch](maptilesource_allowoverstretch.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.maptilesource.allowoverstretchproperty
     * @type {DependencyProperty} 
     */
    static AllowOverstretchProperty {
        get => MapTileSource.get_AllowOverstretchProperty()
    }

    /**
     * Identifies the [IsFadingEnabled](maptilesource_isfadingenabled.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.maptilesource.isfadingenabledproperty
     * @type {DependencyProperty} 
     */
    static IsFadingEnabledProperty {
        get => MapTileSource.get_IsFadingEnabledProperty()
    }

    /**
     * Identifies the [IsTransparencyEnabled](maptilesource_istransparencyenabled.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.maptilesource.istransparencyenabledproperty
     * @type {DependencyProperty} 
     */
    static IsTransparencyEnabledProperty {
        get => MapTileSource.get_IsTransparencyEnabledProperty()
    }

    /**
     * Identifies the [IsRetryEnabled](maptilesource_isretryenabled.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.maptilesource.isretryenabledproperty
     * @type {DependencyProperty} 
     */
    static IsRetryEnabledProperty {
        get => MapTileSource.get_IsRetryEnabledProperty()
    }

    /**
     * Identifies the [ZIndex](mapelement_zindex.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.maptilesource.zindexproperty
     * @type {DependencyProperty} 
     */
    static ZIndexProperty {
        get => MapTileSource.get_ZIndexProperty()
    }

    /**
     * Identifies the [TilePixelSize](maptilesource_tilepixelsize.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.maptilesource.tilepixelsizeproperty
     * @type {DependencyProperty} 
     */
    static TilePixelSizeProperty {
        get => MapTileSource.get_TilePixelSizeProperty()
    }

    /**
     * Identifies the [Visible](maptilesource_visible.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.maptilesource.visibleproperty
     * @type {DependencyProperty} 
     */
    static VisibleProperty {
        get => MapTileSource.get_VisibleProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_AnimationStateProperty() {
        if (!MapTileSource.HasProp("__IMapTileSourceStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapTileSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapTileSourceStatics2.IID)
            MapTileSource.__IMapTileSourceStatics2 := IMapTileSourceStatics2(factoryPtr)
        }

        return MapTileSource.__IMapTileSourceStatics2.get_AnimationStateProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_AutoPlayProperty() {
        if (!MapTileSource.HasProp("__IMapTileSourceStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapTileSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapTileSourceStatics2.IID)
            MapTileSource.__IMapTileSourceStatics2 := IMapTileSourceStatics2(factoryPtr)
        }

        return MapTileSource.__IMapTileSourceStatics2.get_AutoPlayProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FrameCountProperty() {
        if (!MapTileSource.HasProp("__IMapTileSourceStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapTileSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapTileSourceStatics2.IID)
            MapTileSource.__IMapTileSourceStatics2 := IMapTileSourceStatics2(factoryPtr)
        }

        return MapTileSource.__IMapTileSourceStatics2.get_FrameCountProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FrameDurationProperty() {
        if (!MapTileSource.HasProp("__IMapTileSourceStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapTileSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapTileSourceStatics2.IID)
            MapTileSource.__IMapTileSourceStatics2 := IMapTileSourceStatics2(factoryPtr)
        }

        return MapTileSource.__IMapTileSourceStatics2.get_FrameDurationProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_DataSourceProperty() {
        if (!MapTileSource.HasProp("__IMapTileSourceStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapTileSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapTileSourceStatics.IID)
            MapTileSource.__IMapTileSourceStatics := IMapTileSourceStatics(factoryPtr)
        }

        return MapTileSource.__IMapTileSourceStatics.get_DataSourceProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_LayerProperty() {
        if (!MapTileSource.HasProp("__IMapTileSourceStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapTileSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapTileSourceStatics.IID)
            MapTileSource.__IMapTileSourceStatics := IMapTileSourceStatics(factoryPtr)
        }

        return MapTileSource.__IMapTileSourceStatics.get_LayerProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ZoomLevelRangeProperty() {
        if (!MapTileSource.HasProp("__IMapTileSourceStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapTileSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapTileSourceStatics.IID)
            MapTileSource.__IMapTileSourceStatics := IMapTileSourceStatics(factoryPtr)
        }

        return MapTileSource.__IMapTileSourceStatics.get_ZoomLevelRangeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_BoundsProperty() {
        if (!MapTileSource.HasProp("__IMapTileSourceStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapTileSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapTileSourceStatics.IID)
            MapTileSource.__IMapTileSourceStatics := IMapTileSourceStatics(factoryPtr)
        }

        return MapTileSource.__IMapTileSourceStatics.get_BoundsProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_AllowOverstretchProperty() {
        if (!MapTileSource.HasProp("__IMapTileSourceStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapTileSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapTileSourceStatics.IID)
            MapTileSource.__IMapTileSourceStatics := IMapTileSourceStatics(factoryPtr)
        }

        return MapTileSource.__IMapTileSourceStatics.get_AllowOverstretchProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsFadingEnabledProperty() {
        if (!MapTileSource.HasProp("__IMapTileSourceStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapTileSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapTileSourceStatics.IID)
            MapTileSource.__IMapTileSourceStatics := IMapTileSourceStatics(factoryPtr)
        }

        return MapTileSource.__IMapTileSourceStatics.get_IsFadingEnabledProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsTransparencyEnabledProperty() {
        if (!MapTileSource.HasProp("__IMapTileSourceStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapTileSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapTileSourceStatics.IID)
            MapTileSource.__IMapTileSourceStatics := IMapTileSourceStatics(factoryPtr)
        }

        return MapTileSource.__IMapTileSourceStatics.get_IsTransparencyEnabledProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsRetryEnabledProperty() {
        if (!MapTileSource.HasProp("__IMapTileSourceStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapTileSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapTileSourceStatics.IID)
            MapTileSource.__IMapTileSourceStatics := IMapTileSourceStatics(factoryPtr)
        }

        return MapTileSource.__IMapTileSourceStatics.get_IsRetryEnabledProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ZIndexProperty() {
        if (!MapTileSource.HasProp("__IMapTileSourceStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapTileSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapTileSourceStatics.IID)
            MapTileSource.__IMapTileSourceStatics := IMapTileSourceStatics(factoryPtr)
        }

        return MapTileSource.__IMapTileSourceStatics.get_ZIndexProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TilePixelSizeProperty() {
        if (!MapTileSource.HasProp("__IMapTileSourceStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapTileSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapTileSourceStatics.IID)
            MapTileSource.__IMapTileSourceStatics := IMapTileSourceStatics(factoryPtr)
        }

        return MapTileSource.__IMapTileSourceStatics.get_TilePixelSizeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_VisibleProperty() {
        if (!MapTileSource.HasProp("__IMapTileSourceStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapTileSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapTileSourceStatics.IID)
            MapTileSource.__IMapTileSourceStatics := IMapTileSourceStatics(factoryPtr)
        }

        return MapTileSource.__IMapTileSourceStatics.get_VisibleProperty()
    }

    /**
     * 
     * @returns {MapTileSource} 
     */
    static CreateInstance() {
        if (!MapTileSource.HasProp("__IMapTileSourceFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapTileSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapTileSourceFactory.IID)
            MapTileSource.__IMapTileSourceFactory := IMapTileSourceFactory(factoryPtr)
        }

        return MapTileSource.__IMapTileSourceFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

    /**
     * 
     * @param {MapTileDataSource} dataSource_ 
     * @returns {MapTileSource} 
     */
    static CreateInstanceWithDataSource(dataSource_) {
        if (!MapTileSource.HasProp("__IMapTileSourceFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapTileSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapTileSourceFactory.IID)
            MapTileSource.__IMapTileSourceFactory := IMapTileSourceFactory(factoryPtr)
        }

        return MapTileSource.__IMapTileSourceFactory.CreateInstanceWithDataSource(dataSource_, 0, Buffer(A_PtrSize))
    }

    /**
     * 
     * @param {MapTileDataSource} dataSource_ 
     * @param {MapZoomLevelRange} zoomLevelRange 
     * @returns {MapTileSource} 
     */
    static CreateInstanceWithDataSourceAndZoomRange(dataSource_, zoomLevelRange) {
        if (!MapTileSource.HasProp("__IMapTileSourceFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapTileSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapTileSourceFactory.IID)
            MapTileSource.__IMapTileSourceFactory := IMapTileSourceFactory(factoryPtr)
        }

        return MapTileSource.__IMapTileSourceFactory.CreateInstanceWithDataSourceAndZoomRange(dataSource_, zoomLevelRange, 0, Buffer(A_PtrSize))
    }

    /**
     * 
     * @param {MapTileDataSource} dataSource_ 
     * @param {MapZoomLevelRange} zoomLevelRange 
     * @param {GeoboundingBox} bounds 
     * @returns {MapTileSource} 
     */
    static CreateInstanceWithDataSourceZoomRangeAndBounds(dataSource_, zoomLevelRange, bounds) {
        if (!MapTileSource.HasProp("__IMapTileSourceFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapTileSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapTileSourceFactory.IID)
            MapTileSource.__IMapTileSourceFactory := IMapTileSourceFactory(factoryPtr)
        }

        return MapTileSource.__IMapTileSourceFactory.CreateInstanceWithDataSourceZoomRangeAndBounds(dataSource_, zoomLevelRange, bounds, 0, Buffer(A_PtrSize))
    }

    /**
     * 
     * @param {MapTileDataSource} dataSource_ 
     * @param {MapZoomLevelRange} zoomLevelRange 
     * @param {GeoboundingBox} bounds 
     * @param {Integer} tileSizeInPixels 
     * @returns {MapTileSource} 
     */
    static CreateInstanceWithDataSourceZoomRangeBoundsAndTileSize(dataSource_, zoomLevelRange, bounds, tileSizeInPixels) {
        if (!MapTileSource.HasProp("__IMapTileSourceFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapTileSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapTileSourceFactory.IID)
            MapTileSource.__IMapTileSourceFactory := IMapTileSourceFactory(factoryPtr)
        }

        return MapTileSource.__IMapTileSourceFactory.CreateInstanceWithDataSourceZoomRangeBoundsAndTileSize(dataSource_, zoomLevelRange, bounds, tileSizeInPixels, 0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the data source for the tiles.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.maptilesource.datasource
     * @type {MapTileDataSource} 
     */
    DataSource {
        get => this.get_DataSource()
        set => this.put_DataSource(value)
    }

    /**
     * Gets or sets the layer that contains the tiles.
     * @remarks
     * You can specify one of the named layers of map content to contain the tiles that you overlay on the map. The values of the [MapTileLayer](maptilelayer.md) enumeration are similar to a range of z-index values, from foreground to background. If you don't specify a value for the Layer property, the tiles are overlaid in the foreground layer.
     * 
     * To replace the default map entirely:
     * 
     * 
     * + Specify [MapTileLayer](maptilelayer.md).**BackgroundReplacement** as the value of the Layer property of the [MapTileSource](maptilesource.md).
     * + Specify [MapStyle](mapstyle.md).**None** as the value of the [Style](mapcontrol_style.md) property of the [MapControl](mapcontrol.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.maptilesource.layer
     * @type {Integer} 
     */
    Layer {
        get => this.get_Layer()
        set => this.put_Layer(value)
    }

    /**
     * Gets or sets the minimum and maximum zoom level of the tiles. Tiles are only visible when the [ZoomLevel](mapcontrol_zoomlevel.md) of the [MapControl](mapcontrol.md) is within the ZoomLevelRange.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.maptilesource.zoomlevelrange
     * @type {MapZoomLevelRange} 
     */
    ZoomLevelRange {
        get => this.get_ZoomLevelRange()
        set => this.put_ZoomLevelRange(value)
    }

    /**
     * Gets or sets the rectangular area to contain the tiles.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.maptilesource.bounds
     * @type {GeoboundingBox} 
     */
    Bounds {
        get => this.get_Bounds()
        set => this.put_Bounds(value)
    }

    /**
     * Gets or sets a value that specifies whether to stretch the current tile while a higher-resolution tile is being downloaded.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.maptilesource.allowoverstretch
     * @type {Boolean} 
     */
    AllowOverstretch {
        get => this.get_AllowOverstretch()
        set => this.put_AllowOverstretch(value)
    }

    /**
     * Gets or sets a value that indicates whether fading is enabled for the tiles.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.maptilesource.isfadingenabled
     * @type {Boolean} 
     */
    IsFadingEnabled {
        get => this.get_IsFadingEnabled()
        set => this.put_IsFadingEnabled(value)
    }

    /**
     * Gets or sets a value that indicates whether transparency is enabled for the tiles.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.maptilesource.istransparencyenabled
     * @type {Boolean} 
     */
    IsTransparencyEnabled {
        get => this.get_IsTransparencyEnabled()
        set => this.put_IsTransparencyEnabled(value)
    }

    /**
     * Gets or sets a value that indicates whether retry is enabled for the tiles.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.maptilesource.isretryenabled
     * @type {Boolean} 
     */
    IsRetryEnabled {
        get => this.get_IsRetryEnabled()
        set => this.put_IsRetryEnabled(value)
    }

    /**
     * Gets or sets the z-index of the tiles.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.maptilesource.zindex
     * @type {Integer} 
     */
    ZIndex {
        get => this.get_ZIndex()
        set => this.put_ZIndex(value)
    }

    /**
     * Gets or sets the size of the tiles in pixels.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.maptilesource.tilepixelsize
     * @type {Integer} 
     */
    TilePixelSize {
        get => this.get_TilePixelSize()
        set => this.put_TilePixelSize(value)
    }

    /**
     * Gets or sets a value that indicates whether the [MapTileSource](maptilesource.md) is visible.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.maptilesource.visible
     * @type {Boolean} 
     */
    Visible {
        get => this.get_Visible()
        set => this.put_Visible(value)
    }

    /**
     * Gets the animation state of this [MapTileSource](maptilesource.md) to be displayed in the [MapControl](mapcontrol.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.maptilesource.animationstate
     * @type {Integer} 
     */
    AnimationState {
        get => this.get_AnimationState()
    }

    /**
     * Gets or sets a value that indicates whether map tiles will begin playback automatically when this [MapTileSource](maptilesource.md) gets added to the [TileSources](mapcontrol_tilesources.md) property of the [MapControl](mapcontrol.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.maptilesource.autoplay
     * @type {Boolean} 
     */
    AutoPlay {
        get => this.get_AutoPlay()
        set => this.put_AutoPlay(value)
    }

    /**
     * Gets or sets the number of frames in the animation of this [MapTileSource](maptilesource.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.maptilesource.framecount
     * @type {Integer} 
     */
    FrameCount {
        get => this.get_FrameCount()
        set => this.put_FrameCount(value)
    }

    /**
     * Gets or sets the time duration of each frame in the animation of this [MapTileSource](maptilesource.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.maptilesource.frameduration
     * @type {TimeSpan} 
     */
    FrameDuration {
        get => this.get_FrameDuration()
        set => this.put_FrameDuration(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {MapTileDataSource} 
     */
    get_DataSource() {
        if (!this.HasProp("__IMapTileSource")) {
            if ((queryResult := this.QueryInterface(IMapTileSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapTileSource := IMapTileSource(outPtr)
        }

        return this.__IMapTileSource.get_DataSource()
    }

    /**
     * 
     * @param {MapTileDataSource} value 
     * @returns {HRESULT} 
     */
    put_DataSource(value) {
        if (!this.HasProp("__IMapTileSource")) {
            if ((queryResult := this.QueryInterface(IMapTileSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapTileSource := IMapTileSource(outPtr)
        }

        return this.__IMapTileSource.put_DataSource(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Layer() {
        if (!this.HasProp("__IMapTileSource")) {
            if ((queryResult := this.QueryInterface(IMapTileSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapTileSource := IMapTileSource(outPtr)
        }

        return this.__IMapTileSource.get_Layer()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Layer(value) {
        if (!this.HasProp("__IMapTileSource")) {
            if ((queryResult := this.QueryInterface(IMapTileSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapTileSource := IMapTileSource(outPtr)
        }

        return this.__IMapTileSource.put_Layer(value)
    }

    /**
     * 
     * @returns {MapZoomLevelRange} 
     */
    get_ZoomLevelRange() {
        if (!this.HasProp("__IMapTileSource")) {
            if ((queryResult := this.QueryInterface(IMapTileSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapTileSource := IMapTileSource(outPtr)
        }

        return this.__IMapTileSource.get_ZoomLevelRange()
    }

    /**
     * 
     * @param {MapZoomLevelRange} value 
     * @returns {HRESULT} 
     */
    put_ZoomLevelRange(value) {
        if (!this.HasProp("__IMapTileSource")) {
            if ((queryResult := this.QueryInterface(IMapTileSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapTileSource := IMapTileSource(outPtr)
        }

        return this.__IMapTileSource.put_ZoomLevelRange(value)
    }

    /**
     * 
     * @returns {GeoboundingBox} 
     */
    get_Bounds() {
        if (!this.HasProp("__IMapTileSource")) {
            if ((queryResult := this.QueryInterface(IMapTileSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapTileSource := IMapTileSource(outPtr)
        }

        return this.__IMapTileSource.get_Bounds()
    }

    /**
     * 
     * @param {GeoboundingBox} value 
     * @returns {HRESULT} 
     */
    put_Bounds(value) {
        if (!this.HasProp("__IMapTileSource")) {
            if ((queryResult := this.QueryInterface(IMapTileSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapTileSource := IMapTileSource(outPtr)
        }

        return this.__IMapTileSource.put_Bounds(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AllowOverstretch() {
        if (!this.HasProp("__IMapTileSource")) {
            if ((queryResult := this.QueryInterface(IMapTileSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapTileSource := IMapTileSource(outPtr)
        }

        return this.__IMapTileSource.get_AllowOverstretch()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AllowOverstretch(value) {
        if (!this.HasProp("__IMapTileSource")) {
            if ((queryResult := this.QueryInterface(IMapTileSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapTileSource := IMapTileSource(outPtr)
        }

        return this.__IMapTileSource.put_AllowOverstretch(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsFadingEnabled() {
        if (!this.HasProp("__IMapTileSource")) {
            if ((queryResult := this.QueryInterface(IMapTileSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapTileSource := IMapTileSource(outPtr)
        }

        return this.__IMapTileSource.get_IsFadingEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsFadingEnabled(value) {
        if (!this.HasProp("__IMapTileSource")) {
            if ((queryResult := this.QueryInterface(IMapTileSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapTileSource := IMapTileSource(outPtr)
        }

        return this.__IMapTileSource.put_IsFadingEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsTransparencyEnabled() {
        if (!this.HasProp("__IMapTileSource")) {
            if ((queryResult := this.QueryInterface(IMapTileSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapTileSource := IMapTileSource(outPtr)
        }

        return this.__IMapTileSource.get_IsTransparencyEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsTransparencyEnabled(value) {
        if (!this.HasProp("__IMapTileSource")) {
            if ((queryResult := this.QueryInterface(IMapTileSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapTileSource := IMapTileSource(outPtr)
        }

        return this.__IMapTileSource.put_IsTransparencyEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsRetryEnabled() {
        if (!this.HasProp("__IMapTileSource")) {
            if ((queryResult := this.QueryInterface(IMapTileSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapTileSource := IMapTileSource(outPtr)
        }

        return this.__IMapTileSource.get_IsRetryEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsRetryEnabled(value) {
        if (!this.HasProp("__IMapTileSource")) {
            if ((queryResult := this.QueryInterface(IMapTileSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapTileSource := IMapTileSource(outPtr)
        }

        return this.__IMapTileSource.put_IsRetryEnabled(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ZIndex() {
        if (!this.HasProp("__IMapTileSource")) {
            if ((queryResult := this.QueryInterface(IMapTileSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapTileSource := IMapTileSource(outPtr)
        }

        return this.__IMapTileSource.get_ZIndex()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ZIndex(value) {
        if (!this.HasProp("__IMapTileSource")) {
            if ((queryResult := this.QueryInterface(IMapTileSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapTileSource := IMapTileSource(outPtr)
        }

        return this.__IMapTileSource.put_ZIndex(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TilePixelSize() {
        if (!this.HasProp("__IMapTileSource")) {
            if ((queryResult := this.QueryInterface(IMapTileSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapTileSource := IMapTileSource(outPtr)
        }

        return this.__IMapTileSource.get_TilePixelSize()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_TilePixelSize(value) {
        if (!this.HasProp("__IMapTileSource")) {
            if ((queryResult := this.QueryInterface(IMapTileSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapTileSource := IMapTileSource(outPtr)
        }

        return this.__IMapTileSource.put_TilePixelSize(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Visible() {
        if (!this.HasProp("__IMapTileSource")) {
            if ((queryResult := this.QueryInterface(IMapTileSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapTileSource := IMapTileSource(outPtr)
        }

        return this.__IMapTileSource.get_Visible()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Visible(value) {
        if (!this.HasProp("__IMapTileSource")) {
            if ((queryResult := this.QueryInterface(IMapTileSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapTileSource := IMapTileSource(outPtr)
        }

        return this.__IMapTileSource.put_Visible(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AnimationState() {
        if (!this.HasProp("__IMapTileSource2")) {
            if ((queryResult := this.QueryInterface(IMapTileSource2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapTileSource2 := IMapTileSource2(outPtr)
        }

        return this.__IMapTileSource2.get_AnimationState()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AutoPlay() {
        if (!this.HasProp("__IMapTileSource2")) {
            if ((queryResult := this.QueryInterface(IMapTileSource2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapTileSource2 := IMapTileSource2(outPtr)
        }

        return this.__IMapTileSource2.get_AutoPlay()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AutoPlay(value) {
        if (!this.HasProp("__IMapTileSource2")) {
            if ((queryResult := this.QueryInterface(IMapTileSource2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapTileSource2 := IMapTileSource2(outPtr)
        }

        return this.__IMapTileSource2.put_AutoPlay(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FrameCount() {
        if (!this.HasProp("__IMapTileSource2")) {
            if ((queryResult := this.QueryInterface(IMapTileSource2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapTileSource2 := IMapTileSource2(outPtr)
        }

        return this.__IMapTileSource2.get_FrameCount()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_FrameCount(value) {
        if (!this.HasProp("__IMapTileSource2")) {
            if ((queryResult := this.QueryInterface(IMapTileSource2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapTileSource2 := IMapTileSource2(outPtr)
        }

        return this.__IMapTileSource2.put_FrameCount(value)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_FrameDuration() {
        if (!this.HasProp("__IMapTileSource2")) {
            if ((queryResult := this.QueryInterface(IMapTileSource2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapTileSource2 := IMapTileSource2(outPtr)
        }

        return this.__IMapTileSource2.get_FrameDuration()
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_FrameDuration(value) {
        if (!this.HasProp("__IMapTileSource2")) {
            if ((queryResult := this.QueryInterface(IMapTileSource2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapTileSource2 := IMapTileSource2(outPtr)
        }

        return this.__IMapTileSource2.put_FrameDuration(value)
    }

    /**
     * Pauses the animation at the current frame.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.maptilesource.pause
     */
    Pause() {
        if (!this.HasProp("__IMapTileSource2")) {
            if ((queryResult := this.QueryInterface(IMapTileSource2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapTileSource2 := IMapTileSource2(outPtr)
        }

        return this.__IMapTileSource2.Pause()
    }

    /**
     * Plays the animation from the current frame.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.maptilesource.play
     */
    Play() {
        if (!this.HasProp("__IMapTileSource2")) {
            if ((queryResult := this.QueryInterface(IMapTileSource2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapTileSource2 := IMapTileSource2(outPtr)
        }

        return this.__IMapTileSource2.Play()
    }

    /**
     * Stops and resets the animation to be played from the beginning.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.maptilesource.stop
     */
    Stop() {
        if (!this.HasProp("__IMapTileSource2")) {
            if ((queryResult := this.QueryInterface(IMapTileSource2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapTileSource2 := IMapTileSource2(outPtr)
        }

        return this.__IMapTileSource2.Stop()
    }

;@endregion Instance Methods
}
