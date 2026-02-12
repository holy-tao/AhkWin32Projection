#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\DependencyObject.ahk
#Include .\IMapLayer.ahk
#Include .\IMapLayerFactory.ahk
#Include .\IMapLayerStatics.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Represents a collection of map data to which you can bind data and manipulate independently of other map types of map data.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.maplayer
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class MapLayer extends DependencyObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMapLayer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMapLayer.IID

    /**
     * Identifies the [MapTagIndex](maplayer_maptabindex.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.maplayer.maptabindexproperty
     * @type {DependencyProperty} 
     */
    static MapTabIndexProperty {
        get => MapLayer.get_MapTabIndexProperty()
    }

    /**
     * Identifies the [Visible](maplayer_visible.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.maplayer.visibleproperty
     * @type {DependencyProperty} 
     */
    static VisibleProperty {
        get => MapLayer.get_VisibleProperty()
    }

    /**
     * Identifies the [ZIndex](maplayer_zindex.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.maplayer.zindexproperty
     * @type {DependencyProperty} 
     */
    static ZIndexProperty {
        get => MapLayer.get_ZIndexProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {MapLayer} 
     */
    static CreateInstance() {
        if (!MapLayer.HasProp("__IMapLayerFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapLayer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapLayerFactory.IID)
            MapLayer.__IMapLayerFactory := IMapLayerFactory(factoryPtr)
        }

        return MapLayer.__IMapLayerFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_MapTabIndexProperty() {
        if (!MapLayer.HasProp("__IMapLayerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapLayer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapLayerStatics.IID)
            MapLayer.__IMapLayerStatics := IMapLayerStatics(factoryPtr)
        }

        return MapLayer.__IMapLayerStatics.get_MapTabIndexProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_VisibleProperty() {
        if (!MapLayer.HasProp("__IMapLayerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapLayer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapLayerStatics.IID)
            MapLayer.__IMapLayerStatics := IMapLayerStatics(factoryPtr)
        }

        return MapLayer.__IMapLayerStatics.get_VisibleProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ZIndexProperty() {
        if (!MapLayer.HasProp("__IMapLayerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapLayer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapLayerStatics.IID)
            MapLayer.__IMapLayerStatics := IMapLayerStatics(factoryPtr)
        }

        return MapLayer.__IMapLayerStatics.get_ZIndexProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets a value that determines the order in which objects of the [MapLayer](maplayer.md) receive focus when the user navigates through those elements by pressing the Tab key.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.maplayer.maptabindex
     * @type {Integer} 
     */
    MapTabIndex {
        get => this.get_MapTabIndex()
        set => this.put_MapTabIndex(value)
    }

    /**
     * Gets or sets a value that indicates whether the [MapLayer](maplayer.md) is visible on the [MapControl](mapcontrol.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.maplayer.visible
     * @type {Boolean} 
     */
    Visible {
        get => this.get_Visible()
        set => this.put_Visible(value)
    }

    /**
     * Gets or sets the z-index of the [MapLayer](maplayer.md). A [MapLayer](maplayer.md) with a higher z-index is displayed on top of a [MapLayer](maplayer.md) with a lower z-index.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.maplayer.zindex
     * @type {Integer} 
     */
    ZIndex {
        get => this.get_ZIndex()
        set => this.put_ZIndex(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MapTabIndex() {
        if (!this.HasProp("__IMapLayer")) {
            if ((queryResult := this.QueryInterface(IMapLayer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapLayer := IMapLayer(outPtr)
        }

        return this.__IMapLayer.get_MapTabIndex()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_MapTabIndex(value) {
        if (!this.HasProp("__IMapLayer")) {
            if ((queryResult := this.QueryInterface(IMapLayer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapLayer := IMapLayer(outPtr)
        }

        return this.__IMapLayer.put_MapTabIndex(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Visible() {
        if (!this.HasProp("__IMapLayer")) {
            if ((queryResult := this.QueryInterface(IMapLayer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapLayer := IMapLayer(outPtr)
        }

        return this.__IMapLayer.get_Visible()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Visible(value) {
        if (!this.HasProp("__IMapLayer")) {
            if ((queryResult := this.QueryInterface(IMapLayer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapLayer := IMapLayer(outPtr)
        }

        return this.__IMapLayer.put_Visible(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ZIndex() {
        if (!this.HasProp("__IMapLayer")) {
            if ((queryResult := this.QueryInterface(IMapLayer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapLayer := IMapLayer(outPtr)
        }

        return this.__IMapLayer.get_ZIndex()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ZIndex(value) {
        if (!this.HasProp("__IMapLayer")) {
            if ((queryResult := this.QueryInterface(IMapLayer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapLayer := IMapLayer(outPtr)
        }

        return this.__IMapLayer.put_ZIndex(value)
    }

;@endregion Instance Methods
}
