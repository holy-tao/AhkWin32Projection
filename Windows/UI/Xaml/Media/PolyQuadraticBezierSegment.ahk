#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\PathSegment.ahk
#Include .\IPolyQuadraticBezierSegment.ahk
#Include .\IPolyQuadraticBezierSegmentStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a set of quadratic Bezier segments.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.polyquadraticbeziersegment
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class PolyQuadraticBezierSegment extends PathSegment {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPolyQuadraticBezierSegment

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPolyQuadraticBezierSegment.IID

    /**
     * Identifies the [Points](polyquadraticbeziersegment_points.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.polyquadraticbeziersegment.pointsproperty
     * @type {DependencyProperty} 
     */
    static PointsProperty {
        get => PolyQuadraticBezierSegment.get_PointsProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PointsProperty() {
        if (!PolyQuadraticBezierSegment.HasProp("__IPolyQuadraticBezierSegmentStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.PolyQuadraticBezierSegment")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPolyQuadraticBezierSegmentStatics.IID)
            PolyQuadraticBezierSegment.__IPolyQuadraticBezierSegmentStatics := IPolyQuadraticBezierSegmentStatics(factoryPtr)
        }

        return PolyQuadraticBezierSegment.__IPolyQuadraticBezierSegmentStatics.get_PointsProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the [Point](../windows.foundation/point.md) collection that defines this [PolyQuadraticBezierSegment](polyquadraticbeziersegment.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.polyquadraticbeziersegment.points
     * @type {PointCollection} 
     */
    Points {
        get => this.get_Points()
        set => this.put_Points(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [PolyQuadraticBezierSegment](polyquadraticbeziersegment.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.PolyQuadraticBezierSegment")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {PointCollection} 
     */
    get_Points() {
        if (!this.HasProp("__IPolyQuadraticBezierSegment")) {
            if ((queryResult := this.QueryInterface(IPolyQuadraticBezierSegment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPolyQuadraticBezierSegment := IPolyQuadraticBezierSegment(outPtr)
        }

        return this.__IPolyQuadraticBezierSegment.get_Points()
    }

    /**
     * 
     * @param {PointCollection} value 
     * @returns {HRESULT} 
     */
    put_Points(value) {
        if (!this.HasProp("__IPolyQuadraticBezierSegment")) {
            if ((queryResult := this.QueryInterface(IPolyQuadraticBezierSegment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPolyQuadraticBezierSegment := IPolyQuadraticBezierSegment(outPtr)
        }

        return this.__IPolyQuadraticBezierSegment.put_Points(value)
    }

;@endregion Instance Methods
}
