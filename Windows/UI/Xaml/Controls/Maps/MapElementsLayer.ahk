#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\MapLayer.ahk
#Include .\IMapElementsLayer.ahk
#Include .\IMapElementsLayerStatics.ahk
#Include ..\..\..\..\Foundation\TypedEventHandler.ahk
#Include .\MapElementsLayer.ahk
#Include .\MapElementsLayerClickEventArgs.ahk
#Include .\MapElementsLayerPointerEnteredEventArgs.ahk
#Include .\MapElementsLayerPointerExitedEventArgs.ahk
#Include .\MapElementsLayerContextRequestedEventArgs.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\..\WinRTEventHandler.ahk

/**
 * Represents a collection of map elements to which you can bind data and manipulate independently of other map elements.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapelementslayer
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class MapElementsLayer extends MapLayer {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMapElementsLayer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMapElementsLayer.IID

    /**
     * Identifies the [MapElements](mapelementslayer_mapelements.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapelementslayer.mapelementsproperty
     * @type {DependencyProperty} 
     */
    static MapElementsProperty {
        get => MapElementsLayer.get_MapElementsProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_MapElementsProperty() {
        if (!MapElementsLayer.HasProp("__IMapElementsLayerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapElementsLayer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapElementsLayerStatics.IID)
            MapElementsLayer.__IMapElementsLayerStatics := IMapElementsLayerStatics(factoryPtr)
        }

        return MapElementsLayer.__IMapElementsLayerStatics.get_MapElementsProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the collection of [MapElement](mapelement.md) objects that are children of the [MapElementsLayer](mapelementslayer.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapelementslayer.mapelements
     * @type {IVector<MapElement>} 
     */
    MapElements {
        get => this.get_MapElements()
        set => this.put_MapElements(value)
    }

    /**
     * Occurs when the user taps or clicks a [MapElement](mapelement.md) that has been add to the [MapElementsLayer](mapelementslayer.md).
     * @remarks
     * Touch, mouse, and pen/stylus interactions are received, processed, and managed as pointers. Any of these devices and their interactions can produce a MapElementsClick event. An instance of [MapElementsLayerClickEventArgs](mapelementslayerclickeventargs_mapelementslayerclickeventargs_1221375020.md) provides data for this event.
     * @type {TypedEventHandler<MapElementsLayer, MapElementsLayerClickEventArgs>}
    */
    OnMapElementClick {
        get {
            if(!this.HasProp("__OnMapElementClick")){
                this.__OnMapElementClick := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{d3ee3faa-6a6f-576a-9900-528e8eba9286}"),
                    MapElementsLayer,
                    MapElementsLayerClickEventArgs
                )
                this.__OnMapElementClickToken := this.add_MapElementClick(this.__OnMapElementClick.iface)
            }
            return this.__OnMapElementClick
        }
    }

    /**
     * Occurs when a pointer moves into the bounding area of a [MapElement](mapelement.md) on a [MapElementsLayer](mapelementslayer.md).
     * @remarks
     * Mouse interactions are received, processed, and managed as pointers. The MapElementPointerEntered event is triggered as the user moves their mouse over an element. An instance of [MapElementsLayerPointerEnteredEventArgs](mapelementslayerpointerenteredeventargs_mapelementslayerpointerenteredeventargs_1221375020.md) provides data for this event.
     * @type {TypedEventHandler<MapElementsLayer, MapElementsLayerPointerEnteredEventArgs>}
    */
    OnMapElementPointerEntered {
        get {
            if(!this.HasProp("__OnMapElementPointerEntered")){
                this.__OnMapElementPointerEntered := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{3622cf53-117c-5605-b142-fe47d874e26b}"),
                    MapElementsLayer,
                    MapElementsLayerPointerEnteredEventArgs
                )
                this.__OnMapElementPointerEnteredToken := this.add_MapElementPointerEntered(this.__OnMapElementPointerEntered.iface)
            }
            return this.__OnMapElementPointerEntered
        }
    }

    /**
     * Occurs when a pointer moves out of the bounding area of a [MapElement](mapelement.md) on a [MapElementsLayer](mapelementslayer.md).
     * @remarks
     * Mouse interactions are received, processed, and managed as pointers. The MapElementPointerExited event is triggered as the user moves their mouse out from over an element. An instance of [MapElementsLayerPointerExitedEventArgs](mapelementslayerpointerexitedeventargs_mapelementslayerpointerexitedeventargs_1221375020.md) provides data for this event.
     * @type {TypedEventHandler<MapElementsLayer, MapElementsLayerPointerExitedEventArgs>}
    */
    OnMapElementPointerExited {
        get {
            if(!this.HasProp("__OnMapElementPointerExited")){
                this.__OnMapElementPointerExited := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{d54471d2-03dd-5698-a92f-5fac8a5e7668}"),
                    MapElementsLayer,
                    MapElementsLayerPointerExitedEventArgs
                )
                this.__OnMapElementPointerExitedToken := this.add_MapElementPointerExited(this.__OnMapElementPointerExited.iface)
            }
            return this.__OnMapElementPointerExited
        }
    }

    /**
     * Occurs when the user has completed a context input gesture on a map layer, such as a right-click.
     * @type {TypedEventHandler<MapElementsLayer, MapElementsLayerContextRequestedEventArgs>}
    */
    OnMapContextRequested {
        get {
            if(!this.HasProp("__OnMapContextRequested")){
                this.__OnMapContextRequested := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{d4c7eced-5053-5d3c-8cfa-fb19dbde4a3a}"),
                    MapElementsLayer,
                    MapElementsLayerContextRequestedEventArgs
                )
                this.__OnMapContextRequestedToken := this.add_MapContextRequested(this.__OnMapContextRequested.iface)
            }
            return this.__OnMapContextRequested
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a [MapElementsLayer](mapelementslayer.md) instance.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapElementsLayer")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnMapElementClickToken")) {
            this.remove_MapElementClick(this.__OnMapElementClickToken)
            this.__OnMapElementClick.iface.Dispose()
        }

        if(this.HasProp("__OnMapElementPointerEnteredToken")) {
            this.remove_MapElementPointerEntered(this.__OnMapElementPointerEnteredToken)
            this.__OnMapElementPointerEntered.iface.Dispose()
        }

        if(this.HasProp("__OnMapElementPointerExitedToken")) {
            this.remove_MapElementPointerExited(this.__OnMapElementPointerExitedToken)
            this.__OnMapElementPointerExited.iface.Dispose()
        }

        if(this.HasProp("__OnMapContextRequestedToken")) {
            this.remove_MapContextRequested(this.__OnMapContextRequestedToken)
            this.__OnMapContextRequested.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {IVector<MapElement>} 
     */
    get_MapElements() {
        if (!this.HasProp("__IMapElementsLayer")) {
            if ((queryResult := this.QueryInterface(IMapElementsLayer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapElementsLayer := IMapElementsLayer(outPtr)
        }

        return this.__IMapElementsLayer.get_MapElements()
    }

    /**
     * 
     * @param {IVector<MapElement>} value 
     * @returns {HRESULT} 
     */
    put_MapElements(value) {
        if (!this.HasProp("__IMapElementsLayer")) {
            if ((queryResult := this.QueryInterface(IMapElementsLayer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapElementsLayer := IMapElementsLayer(outPtr)
        }

        return this.__IMapElementsLayer.put_MapElements(value)
    }

    /**
     * 
     * @param {TypedEventHandler<MapElementsLayer, MapElementsLayerClickEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_MapElementClick(handler) {
        if (!this.HasProp("__IMapElementsLayer")) {
            if ((queryResult := this.QueryInterface(IMapElementsLayer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapElementsLayer := IMapElementsLayer(outPtr)
        }

        return this.__IMapElementsLayer.add_MapElementClick(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_MapElementClick(token) {
        if (!this.HasProp("__IMapElementsLayer")) {
            if ((queryResult := this.QueryInterface(IMapElementsLayer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapElementsLayer := IMapElementsLayer(outPtr)
        }

        return this.__IMapElementsLayer.remove_MapElementClick(token)
    }

    /**
     * 
     * @param {TypedEventHandler<MapElementsLayer, MapElementsLayerPointerEnteredEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_MapElementPointerEntered(handler) {
        if (!this.HasProp("__IMapElementsLayer")) {
            if ((queryResult := this.QueryInterface(IMapElementsLayer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapElementsLayer := IMapElementsLayer(outPtr)
        }

        return this.__IMapElementsLayer.add_MapElementPointerEntered(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_MapElementPointerEntered(token) {
        if (!this.HasProp("__IMapElementsLayer")) {
            if ((queryResult := this.QueryInterface(IMapElementsLayer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapElementsLayer := IMapElementsLayer(outPtr)
        }

        return this.__IMapElementsLayer.remove_MapElementPointerEntered(token)
    }

    /**
     * 
     * @param {TypedEventHandler<MapElementsLayer, MapElementsLayerPointerExitedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_MapElementPointerExited(handler) {
        if (!this.HasProp("__IMapElementsLayer")) {
            if ((queryResult := this.QueryInterface(IMapElementsLayer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapElementsLayer := IMapElementsLayer(outPtr)
        }

        return this.__IMapElementsLayer.add_MapElementPointerExited(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_MapElementPointerExited(token) {
        if (!this.HasProp("__IMapElementsLayer")) {
            if ((queryResult := this.QueryInterface(IMapElementsLayer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapElementsLayer := IMapElementsLayer(outPtr)
        }

        return this.__IMapElementsLayer.remove_MapElementPointerExited(token)
    }

    /**
     * 
     * @param {TypedEventHandler<MapElementsLayer, MapElementsLayerContextRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_MapContextRequested(handler) {
        if (!this.HasProp("__IMapElementsLayer")) {
            if ((queryResult := this.QueryInterface(IMapElementsLayer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapElementsLayer := IMapElementsLayer(outPtr)
        }

        return this.__IMapElementsLayer.add_MapContextRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_MapContextRequested(token) {
        if (!this.HasProp("__IMapElementsLayer")) {
            if ((queryResult := this.QueryInterface(IMapElementsLayer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapElementsLayer := IMapElementsLayer(outPtr)
        }

        return this.__IMapElementsLayer.remove_MapContextRequested(token)
    }

;@endregion Instance Methods
}
