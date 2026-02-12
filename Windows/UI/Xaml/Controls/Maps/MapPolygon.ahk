#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\MapElement.ahk
#Include .\IMapPolygon.ahk
#Include .\IMapPolygon2.ahk
#Include .\IMapPolygonStatics.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Represents a polygon on a [MapControl](mapcontrol.md).
 * @remarks
 * Display pushpins, images, and shapes on the [MapControl](mapcontrol.md) by adding them to its [MapElements](mapcontrol_mapelements.md) collection.
 * 
 * + Display an **image** such as a pushpin with optional text by using the [MapIcon](mapicon.md) class. Keep the default image or provide a custom image.
 * + Define and display a MapPolygon or a [MapPolyline](mappolyline.md).
 * Alternately, to display XAML elements on the [MapControl](mapcontrol.md), add them to its [Children](mapcontrol_children.md) collection.
 * 
 * For more info, see [Display maps with 2D, 3D, and Streetside views](/windows/uwp/maps-and-location/display-maps).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mappolygon
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class MapPolygon extends MapElement {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMapPolygon

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMapPolygon.IID

    /**
     * Identifies the [Path](mappolygon_path.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mappolygon.pathproperty
     * @type {DependencyProperty} 
     */
    static PathProperty {
        get => MapPolygon.get_PathProperty()
    }

    /**
     * Identifies the [StrokeThickness](mappolygon_strokethickness.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mappolygon.strokethicknessproperty
     * @type {DependencyProperty} 
     */
    static StrokeThicknessProperty {
        get => MapPolygon.get_StrokeThicknessProperty()
    }

    /**
     * Identifies the [StrokeDashed](mappolygon_strokedashed.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mappolygon.strokedashedproperty
     * @type {DependencyProperty} 
     */
    static StrokeDashedProperty {
        get => MapPolygon.get_StrokeDashedProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PathProperty() {
        if (!MapPolygon.HasProp("__IMapPolygonStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapPolygon")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapPolygonStatics.IID)
            MapPolygon.__IMapPolygonStatics := IMapPolygonStatics(factoryPtr)
        }

        return MapPolygon.__IMapPolygonStatics.get_PathProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_StrokeThicknessProperty() {
        if (!MapPolygon.HasProp("__IMapPolygonStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapPolygon")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapPolygonStatics.IID)
            MapPolygon.__IMapPolygonStatics := IMapPolygonStatics(factoryPtr)
        }

        return MapPolygon.__IMapPolygonStatics.get_StrokeThicknessProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_StrokeDashedProperty() {
        if (!MapPolygon.HasProp("__IMapPolygonStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapPolygon")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapPolygonStatics.IID)
            MapPolygon.__IMapPolygonStatics := IMapPolygonStatics(factoryPtr)
        }

        return MapPolygon.__IMapPolygonStatics.get_StrokeDashedProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the collection of coordinates that define the [MapPolygon](mappolygon.md) shape.
     * 
     * > [!NOTE]
     * > In Windows 10, version 1511, we recommend using the [Paths](mappolygon_paths.md) property to create simple and complex polygons. Do not use both properties ([Paths](mappolygon_paths.md) and Path) at the same time.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mappolygon.path
     * @type {Geopath} 
     */
    Path {
        get => this.get_Path()
        set => this.put_Path(value)
    }

    /**
     * Gets or sets the color used to draw the [MapPolygon](mappolygon.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mappolygon.strokecolor
     * @type {Color} 
     */
    StrokeColor {
        get => this.get_StrokeColor()
        set => this.put_StrokeColor(value)
    }

    /**
     * Gets or sets the width of the line used to draw the [MapPolygon](mappolygon.md), in logical pixels.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mappolygon.strokethickness
     * @type {Float} 
     */
    StrokeThickness {
        get => this.get_StrokeThickness()
        set => this.put_StrokeThickness(value)
    }

    /**
     * Gets or sets a value that indicates whether the line used to draw the [MapPolygon](mappolygon.md) is dashed.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mappolygon.strokedashed
     * @type {Boolean} 
     */
    StrokeDashed {
        get => this.get_StrokeDashed()
        set => this.put_StrokeDashed(value)
    }

    /**
     * Gets or sets the color used to fill the [MapPolygon](mappolygon.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mappolygon.fillcolor
     * @type {Color} 
     */
    FillColor {
        get => this.get_FillColor()
        set => this.put_FillColor(value)
    }

    /**
     * Gets a list of [Geopath](../windows.devices.geolocation/geopath.md) objects that define the [MapPolygon](mappolygon.md) shape.
     * 
     * > [!NOTE]
     * > In Windows 10, version 1511, we recommend using this property instead of [Path](mappolygon_path.md) to create polygons. Do not use both properties (Paths and [Path](mappolygon_path.md)) at the same time.
     * @remarks
     * This property allows the [MapPolygon](mappolygon.md) to be defined by one or more [Geopath](../windows.devices.geolocation/geopath.md) objects. With multiple geopaths, you can create complex shapes, such as a polygon with a hole in it.
     * 
     * 
     * 
     * In this example, a [MapPolygon](mappolygon.md) is created in the shape of a polygon with a hole in it.
     * 
     * ```csharp
     * var pathPositions = new List<BasicGeoposition>();
     * 
     * pathPositions.Add(new BasicGeoposition() { Latitude = 0, Longitude = 0 });
     * pathPositions.Add(new BasicGeoposition() { Latitude = 1, Longitude = 0 });
     * pathPositions.Add(new BasicGeoposition() { Latitude = 1, Longitude = 1 });
     * pathPositions.Add(new BasicGeoposition() { Latitude = 0, Longitude = 1 });
     * 
     * var interiorPositions = new List<BasicGeoposition>();
     * 
     * interiorPositions.Add(new BasicGeoposition() { Latitude = 0.2, Longitude = 0.2 });
     * interiorPositions.Add(new BasicGeoposition() { Latitude = 0.4, Longitude = 0.2 });
     * interiorPositions.Add(new BasicGeoposition() { Latitude = 0.4, Longitude = 0.4 });
     * interiorPositions.Add(new BasicGeoposition() { Latitude = 0.2, Longitude = 0.4 });
     * 
     * var mp = new MapPolygon();
     * 
     * mp.Paths.Add(new Geopath(pathPositions));
     * mp.Paths.Add(new Geopath(interiorPositions));
     * 
     * this.maps.MapElements.Add(mp);
     * 
     * ```
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mappolygon.paths
     * @type {IVector<Geopath>} 
     */
    Paths {
        get => this.get_Paths()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [MapPolygon](mappolygon.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapPolygon")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Geopath} 
     */
    get_Path() {
        if (!this.HasProp("__IMapPolygon")) {
            if ((queryResult := this.QueryInterface(IMapPolygon.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapPolygon := IMapPolygon(outPtr)
        }

        return this.__IMapPolygon.get_Path()
    }

    /**
     * 
     * @param {Geopath} value 
     * @returns {HRESULT} 
     */
    put_Path(value) {
        if (!this.HasProp("__IMapPolygon")) {
            if ((queryResult := this.QueryInterface(IMapPolygon.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapPolygon := IMapPolygon(outPtr)
        }

        return this.__IMapPolygon.put_Path(value)
    }

    /**
     * 
     * @returns {Color} 
     */
    get_StrokeColor() {
        if (!this.HasProp("__IMapPolygon")) {
            if ((queryResult := this.QueryInterface(IMapPolygon.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapPolygon := IMapPolygon(outPtr)
        }

        return this.__IMapPolygon.get_StrokeColor()
    }

    /**
     * 
     * @param {Color} value 
     * @returns {HRESULT} 
     */
    put_StrokeColor(value) {
        if (!this.HasProp("__IMapPolygon")) {
            if ((queryResult := this.QueryInterface(IMapPolygon.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapPolygon := IMapPolygon(outPtr)
        }

        return this.__IMapPolygon.put_StrokeColor(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_StrokeThickness() {
        if (!this.HasProp("__IMapPolygon")) {
            if ((queryResult := this.QueryInterface(IMapPolygon.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapPolygon := IMapPolygon(outPtr)
        }

        return this.__IMapPolygon.get_StrokeThickness()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_StrokeThickness(value) {
        if (!this.HasProp("__IMapPolygon")) {
            if ((queryResult := this.QueryInterface(IMapPolygon.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapPolygon := IMapPolygon(outPtr)
        }

        return this.__IMapPolygon.put_StrokeThickness(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_StrokeDashed() {
        if (!this.HasProp("__IMapPolygon")) {
            if ((queryResult := this.QueryInterface(IMapPolygon.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapPolygon := IMapPolygon(outPtr)
        }

        return this.__IMapPolygon.get_StrokeDashed()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_StrokeDashed(value) {
        if (!this.HasProp("__IMapPolygon")) {
            if ((queryResult := this.QueryInterface(IMapPolygon.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapPolygon := IMapPolygon(outPtr)
        }

        return this.__IMapPolygon.put_StrokeDashed(value)
    }

    /**
     * 
     * @returns {Color} 
     */
    get_FillColor() {
        if (!this.HasProp("__IMapPolygon")) {
            if ((queryResult := this.QueryInterface(IMapPolygon.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapPolygon := IMapPolygon(outPtr)
        }

        return this.__IMapPolygon.get_FillColor()
    }

    /**
     * 
     * @param {Color} value 
     * @returns {HRESULT} 
     */
    put_FillColor(value) {
        if (!this.HasProp("__IMapPolygon")) {
            if ((queryResult := this.QueryInterface(IMapPolygon.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapPolygon := IMapPolygon(outPtr)
        }

        return this.__IMapPolygon.put_FillColor(value)
    }

    /**
     * 
     * @returns {IVector<Geopath>} 
     */
    get_Paths() {
        if (!this.HasProp("__IMapPolygon2")) {
            if ((queryResult := this.QueryInterface(IMapPolygon2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapPolygon2 := IMapPolygon2(outPtr)
        }

        return this.__IMapPolygon2.get_Paths()
    }

;@endregion Instance Methods
}
