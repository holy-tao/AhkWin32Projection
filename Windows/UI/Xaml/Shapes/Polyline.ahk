#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Shape.ahk
#Include .\IPolyline.ahk
#Include .\IPolylineStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Draws a series of connected straight lines.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.shapes.polyline
 * @namespace Windows.UI.Xaml.Shapes
 * @version WindowsRuntime 1.4
 */
class Polyline extends Shape {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPolyline

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPolyline.IID

    /**
     * Identifies the [FillRule](polyline_fillrule.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.shapes.polyline.fillruleproperty
     * @type {DependencyProperty} 
     */
    static FillRuleProperty {
        get => Polyline.get_FillRuleProperty()
    }

    /**
     * Identifies the [Points](polyline_points.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.shapes.polyline.pointsproperty
     * @type {DependencyProperty} 
     */
    static PointsProperty {
        get => Polyline.get_PointsProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FillRuleProperty() {
        if (!Polyline.HasProp("__IPolylineStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Shapes.Polyline")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPolylineStatics.IID)
            Polyline.__IPolylineStatics := IPolylineStatics(factoryPtr)
        }

        return Polyline.__IPolylineStatics.get_FillRuleProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PointsProperty() {
        if (!Polyline.HasProp("__IPolylineStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Shapes.Polyline")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPolylineStatics.IID)
            Polyline.__IPolylineStatics := IPolylineStatics(factoryPtr)
        }

        return Polyline.__IPolylineStatics.get_PointsProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets a value that specifies how the interior fill of the shape is determined.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.shapes.polyline.fillrule
     * @type {Integer} 
     */
    FillRule {
        get => this.get_FillRule()
        set => this.put_FillRule(value)
    }

    /**
     * Gets or sets a collection that contains the vertex points of the [Polyline](polyline.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.shapes.polyline.points
     * @type {PointCollection} 
     */
    Points {
        get => this.get_Points()
        set => this.put_Points(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [Polyline](polyline.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Shapes.Polyline")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FillRule() {
        if (!this.HasProp("__IPolyline")) {
            if ((queryResult := this.QueryInterface(IPolyline.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPolyline := IPolyline(outPtr)
        }

        return this.__IPolyline.get_FillRule()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_FillRule(value) {
        if (!this.HasProp("__IPolyline")) {
            if ((queryResult := this.QueryInterface(IPolyline.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPolyline := IPolyline(outPtr)
        }

        return this.__IPolyline.put_FillRule(value)
    }

    /**
     * 
     * @returns {PointCollection} 
     */
    get_Points() {
        if (!this.HasProp("__IPolyline")) {
            if ((queryResult := this.QueryInterface(IPolyline.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPolyline := IPolyline(outPtr)
        }

        return this.__IPolyline.get_Points()
    }

    /**
     * 
     * @param {PointCollection} value 
     * @returns {HRESULT} 
     */
    put_Points(value) {
        if (!this.HasProp("__IPolyline")) {
            if ((queryResult := this.QueryInterface(IPolyline.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPolyline := IPolyline(outPtr)
        }

        return this.__IPolyline.put_Points(value)
    }

;@endregion Instance Methods
}
