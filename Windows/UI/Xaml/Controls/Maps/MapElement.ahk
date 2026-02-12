#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\DependencyObject.ahk
#Include .\IMapElement.ahk
#Include .\IMapElement2.ahk
#Include .\IMapElement3.ahk
#Include .\IMapElement4.ahk
#Include .\IMapElementStatics3.ahk
#Include .\IMapElementFactory.ahk
#Include .\IMapElementStatics4.ahk
#Include .\IMapElementStatics2.ahk
#Include .\IMapElementStatics.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Represents an element displayed on a [MapControl](mapcontrol.md).
 * @remarks
 * Display pushpins, images, and shapes on the [MapControl](mapcontrol.md) by adding them to its [MapElements](mapcontrol_mapelements.md) collection.
 * 
 * + Display an **image** such as a pushpin with optional text by using the [MapIcon](mapicon.md) class. Keep the default image or provide a custom image.
 * + Define and display a [MapPolygon](mappolygon.md) or a [MapPolyline](mappolyline.md).
 * + Display a **3D model** using the [MapElement3D](mapelement3d.md) class.
 * 
 * Alternately, to display XAML elements on the [MapControl](mapcontrol.md), add them to its [Children](mapcontrol_children.md) collection.
 * 
 * For more info, see [Display maps with 2D, 3D, and Streetside views](/windows/uwp/maps-and-location/display-maps).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapelement
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class MapElement extends DependencyObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMapElement

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMapElement.IID

    /**
     * Identifies for the [MapStyleSheetEntry](mapelement_mapstylesheetentry.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapelement.mapstylesheetentryproperty
     * @type {DependencyProperty} 
     */
    static MapStyleSheetEntryProperty {
        get => MapElement.get_MapStyleSheetEntryProperty()
    }

    /**
     * Identifies for the [MapStyleSheetEntryState](mapelement_mapstylesheetentrystate.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapelement.mapstylesheetentrystateproperty
     * @type {DependencyProperty} 
     */
    static MapStyleSheetEntryStateProperty {
        get => MapElement.get_MapStyleSheetEntryStateProperty()
    }

    /**
     * Identifies the [Tag](mapelement_tag.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapelement.tagproperty
     * @type {DependencyProperty} 
     */
    static TagProperty {
        get => MapElement.get_TagProperty()
    }

    /**
     * Identifies the [IsEnabled](mapelement_isenabled.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapelement.isenabledproperty
     * @type {DependencyProperty} 
     */
    static IsEnabledProperty {
        get => MapElement.get_IsEnabledProperty()
    }

    /**
     * Identifies the [MapTabIndex](mapelement_maptabindex.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapelement.maptabindexproperty
     * @type {DependencyProperty} 
     */
    static MapTabIndexProperty {
        get => MapElement.get_MapTabIndexProperty()
    }

    /**
     * Identifies the [ZIndex](mapelement_zindex.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapelement.zindexproperty
     * @type {DependencyProperty} 
     */
    static ZIndexProperty {
        get => MapElement.get_ZIndexProperty()
    }

    /**
     * Identifies the [Visible](mapelement_visible.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapelement.visibleproperty
     * @type {DependencyProperty} 
     */
    static VisibleProperty {
        get => MapElement.get_VisibleProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_MapStyleSheetEntryProperty() {
        if (!MapElement.HasProp("__IMapElementStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapElementStatics3.IID)
            MapElement.__IMapElementStatics3 := IMapElementStatics3(factoryPtr)
        }

        return MapElement.__IMapElementStatics3.get_MapStyleSheetEntryProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_MapStyleSheetEntryStateProperty() {
        if (!MapElement.HasProp("__IMapElementStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapElementStatics3.IID)
            MapElement.__IMapElementStatics3 := IMapElementStatics3(factoryPtr)
        }

        return MapElement.__IMapElementStatics3.get_MapStyleSheetEntryStateProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TagProperty() {
        if (!MapElement.HasProp("__IMapElementStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapElementStatics3.IID)
            MapElement.__IMapElementStatics3 := IMapElementStatics3(factoryPtr)
        }

        return MapElement.__IMapElementStatics3.get_TagProperty()
    }

    /**
     * 
     * @returns {MapElement} 
     */
    static CreateInstance() {
        if (!MapElement.HasProp("__IMapElementFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapElementFactory.IID)
            MapElement.__IMapElementFactory := IMapElementFactory(factoryPtr)
        }

        return MapElement.__IMapElementFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsEnabledProperty() {
        if (!MapElement.HasProp("__IMapElementStatics4")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapElementStatics4.IID)
            MapElement.__IMapElementStatics4 := IMapElementStatics4(factoryPtr)
        }

        return MapElement.__IMapElementStatics4.get_IsEnabledProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_MapTabIndexProperty() {
        if (!MapElement.HasProp("__IMapElementStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapElementStatics2.IID)
            MapElement.__IMapElementStatics2 := IMapElementStatics2(factoryPtr)
        }

        return MapElement.__IMapElementStatics2.get_MapTabIndexProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ZIndexProperty() {
        if (!MapElement.HasProp("__IMapElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapElementStatics.IID)
            MapElement.__IMapElementStatics := IMapElementStatics(factoryPtr)
        }

        return MapElement.__IMapElementStatics.get_ZIndexProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_VisibleProperty() {
        if (!MapElement.HasProp("__IMapElementStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapElement")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapElementStatics.IID)
            MapElement.__IMapElementStatics := IMapElementStatics(factoryPtr)
        }

        return MapElement.__IMapElementStatics.get_VisibleProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the z-index of the [MapElement](mapelement.md). A [MapElement](mapelement.md) with a higher z-index is displayed on top of a [MapElement](mapelement.md) with a lower z-index.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapelement.zindex
     * @type {Integer} 
     */
    ZIndex {
        get => this.get_ZIndex()
        set => this.put_ZIndex(value)
    }

    /**
     * Gets or sets a value that indicates whether the [MapElement](mapelement.md) is visible on the [MapControl](mapcontrol.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapelement.visible
     * @type {Boolean} 
     */
    Visible {
        get => this.get_Visible()
        set => this.put_Visible(value)
    }

    /**
     * Gets or sets a value that determines the order in which elements of the [MapControl](mapcontrol.md) receive focus when the user navigates through those elements by pressing the Tab key.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapelement.maptabindex
     * @type {Integer} 
     */
    MapTabIndex {
        get => this.get_MapTabIndex()
        set => this.put_MapTabIndex(value)
    }

    /**
     * Gets or sets the name of an entry in the map's style sheet that you'd like to apply to this [MapElement](mapelement.md).
     * @remarks
     * Set this property to a string or to any of the property values available in the [MapStyleSheetEntries](mapstylesheetentries.md) class.
     * 
     * To learn more about entries in a map style sheet, see [Map style sheet reference](/windows/uwp/maps-and-location/elements-of-map-style-sheet#version) and [Map style sheet extensions](/bingmaps/styling/map-style-sheet-extensions).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapelement.mapstylesheetentry
     * @type {HSTRING} 
     */
    MapStyleSheetEntry {
        get => this.get_MapStyleSheetEntry()
        set => this.put_MapStyleSheetEntry(value)
    }

    /**
     * Gets or sets the name of the state of this [MapElement](mapelement.md). If the style sheet defines a style for that state, that style is applied to this element. Values defined in the style sheet for the state override values defined in the [MapStyleSheetEntry](mapelement_mapstylesheetentry.md).
     * @remarks
     * Set this property to a string or to any of the property values available in the [MapStyleSheetEntryStates](mapstylesheetentrystates.md) class.
     * 
     * To learn more about entries in a map style sheet, see [Map style sheet reference](/windows/uwp/maps-and-location/elements-of-map-style-sheet#version).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapelement.mapstylesheetentrystate
     * @type {HSTRING} 
     */
    MapStyleSheetEntryState {
        get => this.get_MapStyleSheetEntryState()
        set => this.put_MapStyleSheetEntryState(value)
    }

    /**
     * Gets or sets an arbitrary object value that can be used to store custom information about this object.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapelement.tag
     * @type {IInspectable} 
     */
    Tag {
        get => this.get_Tag()
        set => this.put_Tag(value)
    }

    /**
     * Indicates whether users can interact with the [MapElement](mapelement.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapelement.isenabled
     * @type {Boolean} 
     */
    IsEnabled {
        get => this.get_IsEnabled()
        set => this.put_IsEnabled(value)
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
    get_ZIndex() {
        if (!this.HasProp("__IMapElement")) {
            if ((queryResult := this.QueryInterface(IMapElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapElement := IMapElement(outPtr)
        }

        return this.__IMapElement.get_ZIndex()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ZIndex(value) {
        if (!this.HasProp("__IMapElement")) {
            if ((queryResult := this.QueryInterface(IMapElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapElement := IMapElement(outPtr)
        }

        return this.__IMapElement.put_ZIndex(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Visible() {
        if (!this.HasProp("__IMapElement")) {
            if ((queryResult := this.QueryInterface(IMapElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapElement := IMapElement(outPtr)
        }

        return this.__IMapElement.get_Visible()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Visible(value) {
        if (!this.HasProp("__IMapElement")) {
            if ((queryResult := this.QueryInterface(IMapElement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapElement := IMapElement(outPtr)
        }

        return this.__IMapElement.put_Visible(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MapTabIndex() {
        if (!this.HasProp("__IMapElement2")) {
            if ((queryResult := this.QueryInterface(IMapElement2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapElement2 := IMapElement2(outPtr)
        }

        return this.__IMapElement2.get_MapTabIndex()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_MapTabIndex(value) {
        if (!this.HasProp("__IMapElement2")) {
            if ((queryResult := this.QueryInterface(IMapElement2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapElement2 := IMapElement2(outPtr)
        }

        return this.__IMapElement2.put_MapTabIndex(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_MapStyleSheetEntry() {
        if (!this.HasProp("__IMapElement3")) {
            if ((queryResult := this.QueryInterface(IMapElement3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapElement3 := IMapElement3(outPtr)
        }

        return this.__IMapElement3.get_MapStyleSheetEntry()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_MapStyleSheetEntry(value) {
        if (!this.HasProp("__IMapElement3")) {
            if ((queryResult := this.QueryInterface(IMapElement3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapElement3 := IMapElement3(outPtr)
        }

        return this.__IMapElement3.put_MapStyleSheetEntry(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_MapStyleSheetEntryState() {
        if (!this.HasProp("__IMapElement3")) {
            if ((queryResult := this.QueryInterface(IMapElement3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapElement3 := IMapElement3(outPtr)
        }

        return this.__IMapElement3.get_MapStyleSheetEntryState()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_MapStyleSheetEntryState(value) {
        if (!this.HasProp("__IMapElement3")) {
            if ((queryResult := this.QueryInterface(IMapElement3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapElement3 := IMapElement3(outPtr)
        }

        return this.__IMapElement3.put_MapStyleSheetEntryState(value)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_Tag() {
        if (!this.HasProp("__IMapElement3")) {
            if ((queryResult := this.QueryInterface(IMapElement3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapElement3 := IMapElement3(outPtr)
        }

        return this.__IMapElement3.get_Tag()
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_Tag(value) {
        if (!this.HasProp("__IMapElement3")) {
            if ((queryResult := this.QueryInterface(IMapElement3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapElement3 := IMapElement3(outPtr)
        }

        return this.__IMapElement3.put_Tag(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsEnabled() {
        if (!this.HasProp("__IMapElement4")) {
            if ((queryResult := this.QueryInterface(IMapElement4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapElement4 := IMapElement4(outPtr)
        }

        return this.__IMapElement4.get_IsEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsEnabled(value) {
        if (!this.HasProp("__IMapElement4")) {
            if ((queryResult := this.QueryInterface(IMapElement4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapElement4 := IMapElement4(outPtr)
        }

        return this.__IMapElement4.put_IsEnabled(value)
    }

;@endregion Instance Methods
}
