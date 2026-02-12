#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\MapElement.ahk
#Include .\IMapPolyline.ahk
#Include .\IMapPolylineStatics.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Represents a polyline on a [MapControl](mapcontrol.md).
 * @remarks
 * Display pushpins, images, and shapes on the [MapControl](mapcontrol.md) by adding them to its [MapElements](mapcontrol_mapelements.md) collection.
 * 
 * 
 * + Display an **image** such as a pushpin with optional text by using the [MapIcon](mapicon.md) class. Keep the default image or provide a custom image.
 * + Define and display a [MapPolygon](mappolygon.md) or a MapPolyline.
 * Alternately, to display XAML elements on the [MapControl](mapcontrol.md), add them to its [Children](mapcontrol_children.md) collection.
 * 
 * For more info, see [Display maps with 2D, 3D, and Streetside views](/windows/uwp/maps-and-location/display-maps).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mappolyline
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class MapPolyline extends MapElement {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMapPolyline

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMapPolyline.IID

    /**
     * Identifies the [Path](mappolyline_path.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mappolyline.pathproperty
     * @type {DependencyProperty} 
     */
    static PathProperty {
        get => MapPolyline.get_PathProperty()
    }

    /**
     * Identifies the [StrokeDashed](mappolyline_strokedashed.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mappolyline.strokedashedproperty
     * @type {DependencyProperty} 
     */
    static StrokeDashedProperty {
        get => MapPolyline.get_StrokeDashedProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PathProperty() {
        if (!MapPolyline.HasProp("__IMapPolylineStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapPolyline")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapPolylineStatics.IID)
            MapPolyline.__IMapPolylineStatics := IMapPolylineStatics(factoryPtr)
        }

        return MapPolyline.__IMapPolylineStatics.get_PathProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_StrokeDashedProperty() {
        if (!MapPolyline.HasProp("__IMapPolylineStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapPolyline")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapPolylineStatics.IID)
            MapPolyline.__IMapPolylineStatics := IMapPolylineStatics(factoryPtr)
        }

        return MapPolyline.__IMapPolylineStatics.get_StrokeDashedProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the collection of coordinates that define the [MapPolyline](mappolyline.md) shape.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mappolyline.path
     * @type {Geopath} 
     */
    Path {
        get => this.get_Path()
        set => this.put_Path(value)
    }

    /**
     * Gets or sets the color used to draw the [MapPolyline](mappolyline.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mappolyline.strokecolor
     * @type {Color} 
     */
    StrokeColor {
        get => this.get_StrokeColor()
        set => this.put_StrokeColor(value)
    }

    /**
     * Gets or sets the width of the line used to draw the [MapPolyline](mappolyline.md), in logical pixels.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mappolyline.strokethickness
     * @type {Float} 
     */
    StrokeThickness {
        get => this.get_StrokeThickness()
        set => this.put_StrokeThickness(value)
    }

    /**
     * Gets or sets a value that indicates whether the line used to draw the [MapPolyline](mappolyline.md) is dashed.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mappolyline.strokedashed
     * @type {Boolean} 
     */
    StrokeDashed {
        get => this.get_StrokeDashed()
        set => this.put_StrokeDashed(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [MapPolyline](mappolyline.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapPolyline")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Geopath} 
     */
    get_Path() {
        if (!this.HasProp("__IMapPolyline")) {
            if ((queryResult := this.QueryInterface(IMapPolyline.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapPolyline := IMapPolyline(outPtr)
        }

        return this.__IMapPolyline.get_Path()
    }

    /**
     * 
     * @param {Geopath} value 
     * @returns {HRESULT} 
     */
    put_Path(value) {
        if (!this.HasProp("__IMapPolyline")) {
            if ((queryResult := this.QueryInterface(IMapPolyline.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapPolyline := IMapPolyline(outPtr)
        }

        return this.__IMapPolyline.put_Path(value)
    }

    /**
     * 
     * @returns {Color} 
     */
    get_StrokeColor() {
        if (!this.HasProp("__IMapPolyline")) {
            if ((queryResult := this.QueryInterface(IMapPolyline.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapPolyline := IMapPolyline(outPtr)
        }

        return this.__IMapPolyline.get_StrokeColor()
    }

    /**
     * 
     * @param {Color} value 
     * @returns {HRESULT} 
     */
    put_StrokeColor(value) {
        if (!this.HasProp("__IMapPolyline")) {
            if ((queryResult := this.QueryInterface(IMapPolyline.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapPolyline := IMapPolyline(outPtr)
        }

        return this.__IMapPolyline.put_StrokeColor(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_StrokeThickness() {
        if (!this.HasProp("__IMapPolyline")) {
            if ((queryResult := this.QueryInterface(IMapPolyline.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapPolyline := IMapPolyline(outPtr)
        }

        return this.__IMapPolyline.get_StrokeThickness()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_StrokeThickness(value) {
        if (!this.HasProp("__IMapPolyline")) {
            if ((queryResult := this.QueryInterface(IMapPolyline.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapPolyline := IMapPolyline(outPtr)
        }

        return this.__IMapPolyline.put_StrokeThickness(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_StrokeDashed() {
        if (!this.HasProp("__IMapPolyline")) {
            if ((queryResult := this.QueryInterface(IMapPolyline.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapPolyline := IMapPolyline(outPtr)
        }

        return this.__IMapPolyline.get_StrokeDashed()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_StrokeDashed(value) {
        if (!this.HasProp("__IMapPolyline")) {
            if ((queryResult := this.QueryInterface(IMapPolyline.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapPolyline := IMapPolyline(outPtr)
        }

        return this.__IMapPolyline.put_StrokeDashed(value)
    }

;@endregion Instance Methods
}
