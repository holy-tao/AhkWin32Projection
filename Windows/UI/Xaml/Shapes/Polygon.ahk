#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Shape.ahk
#Include .\IPolygon.ahk
#Include .\IPolygonStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Draws a polygon, which is a connected series of lines that form a closed shape.
 * @remarks
 * The Polygon object is similar to the [Polyline](polyline.md) object, except that Polygon must be a closed shape.
 * 
 * You define the shape by adding vertices to the [Points](polygon_points.md) collection. For example, two points could form a line, three points could form a triangle, and four points could form a quadrilateral.
 * 
 * The [FillRule](polygon_fillrule.md) property specifies how the interior area of the shape is determined. See the [FillRule](../windows.ui.xaml.media/fillrule.md) enumeration for more info.
 * 
 * You can set the [Fill](shape_fill.md) property to give the shape a background fill, like a solid color, gradient, or image. You can set the [Stroke](shape_stroke.md) and other related stroke properties to specify the look of the shape's outline.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.shapes.polygon
 * @namespace Windows.UI.Xaml.Shapes
 * @version WindowsRuntime 1.4
 */
class Polygon extends Shape {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPolygon

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPolygon.IID

    /**
     * Identifies the [FillRule](polygon_fillrule.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.shapes.polygon.fillruleproperty
     * @type {DependencyProperty} 
     */
    static FillRuleProperty {
        get => Polygon.get_FillRuleProperty()
    }

    /**
     * Identifies the [Points](polygon_points.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.shapes.polygon.pointsproperty
     * @type {DependencyProperty} 
     */
    static PointsProperty {
        get => Polygon.get_PointsProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FillRuleProperty() {
        if (!Polygon.HasProp("__IPolygonStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Shapes.Polygon")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPolygonStatics.IID)
            Polygon.__IPolygonStatics := IPolygonStatics(factoryPtr)
        }

        return Polygon.__IPolygonStatics.get_FillRuleProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PointsProperty() {
        if (!Polygon.HasProp("__IPolygonStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Shapes.Polygon")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPolygonStatics.IID)
            Polygon.__IPolygonStatics := IPolygonStatics(factoryPtr)
        }

        return Polygon.__IPolygonStatics.get_PointsProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets a value that specifies how the interior fill of the shape is determined.
     * @remarks
     * See the [FillRule](../windows.ui.xaml.media/fillrule.md) enumeration for more info.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.shapes.polygon.fillrule
     * @type {Integer} 
     */
    FillRule {
        get => this.get_FillRule()
        set => this.put_FillRule(value)
    }

    /**
     * Gets or sets a collection that contains the vertex points of the polygon.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.shapes.polygon.points
     * @type {PointCollection} 
     */
    Points {
        get => this.get_Points()
        set => this.put_Points(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [Polygon](polygon.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Shapes.Polygon")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FillRule() {
        if (!this.HasProp("__IPolygon")) {
            if ((queryResult := this.QueryInterface(IPolygon.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPolygon := IPolygon(outPtr)
        }

        return this.__IPolygon.get_FillRule()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_FillRule(value) {
        if (!this.HasProp("__IPolygon")) {
            if ((queryResult := this.QueryInterface(IPolygon.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPolygon := IPolygon(outPtr)
        }

        return this.__IPolygon.put_FillRule(value)
    }

    /**
     * 
     * @returns {PointCollection} 
     */
    get_Points() {
        if (!this.HasProp("__IPolygon")) {
            if ((queryResult := this.QueryInterface(IPolygon.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPolygon := IPolygon(outPtr)
        }

        return this.__IPolygon.get_Points()
    }

    /**
     * 
     * @param {PointCollection} value 
     * @returns {HRESULT} 
     */
    put_Points(value) {
        if (!this.HasProp("__IPolygon")) {
            if ((queryResult := this.QueryInterface(IPolygon.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPolygon := IPolygon(outPtr)
        }

        return this.__IPolygon.put_Points(value)
    }

;@endregion Instance Methods
}
