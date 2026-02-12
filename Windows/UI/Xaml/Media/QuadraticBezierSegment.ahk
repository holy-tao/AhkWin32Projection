#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\PathSegment.ahk
#Include .\IQuadraticBezierSegment.ahk
#Include .\IQuadraticBezierSegmentStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Creates a quadratic Bezier curve between two points in a [PathFigure](pathfigure.md).
 * @remarks
 * This class is relevant for setting the vector data for either a [Path](../windows.ui.xaml.shapes/path.md) or a [PathIcon](../windows.ui.xaml.controls/pathicon.md).
 * 
 * Rather than creating an instance or an object element, you can also define a QuadraticBezierSegment as part of a vector within the string for a [Move and draw commands syntax](/windows/uwp/xaml-platform/move-draw-commands-syntax).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.quadraticbeziersegment
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class QuadraticBezierSegment extends PathSegment {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IQuadraticBezierSegment

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IQuadraticBezierSegment.IID

    /**
     * Identifies the [Point1](quadraticbeziersegment_point1.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.quadraticbeziersegment.point1property
     * @type {DependencyProperty} 
     */
    static Point1Property {
        get => QuadraticBezierSegment.get_Point1Property()
    }

    /**
     * Identifies the [Point2](quadraticbeziersegment_point2.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.quadraticbeziersegment.point2property
     * @type {DependencyProperty} 
     */
    static Point2Property {
        get => QuadraticBezierSegment.get_Point2Property()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_Point1Property() {
        if (!QuadraticBezierSegment.HasProp("__IQuadraticBezierSegmentStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.QuadraticBezierSegment")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IQuadraticBezierSegmentStatics.IID)
            QuadraticBezierSegment.__IQuadraticBezierSegmentStatics := IQuadraticBezierSegmentStatics(factoryPtr)
        }

        return QuadraticBezierSegment.__IQuadraticBezierSegmentStatics.get_Point1Property()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_Point2Property() {
        if (!QuadraticBezierSegment.HasProp("__IQuadraticBezierSegmentStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.QuadraticBezierSegment")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IQuadraticBezierSegmentStatics.IID)
            QuadraticBezierSegment.__IQuadraticBezierSegmentStatics := IQuadraticBezierSegmentStatics(factoryPtr)
        }

        return QuadraticBezierSegment.__IQuadraticBezierSegmentStatics.get_Point2Property()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the control point of the curve.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.quadraticbeziersegment.point1
     * @type {POINT} 
     */
    Point1 {
        get => this.get_Point1()
        set => this.put_Point1(value)
    }

    /**
     * Gets or sets the end [Point](../windows.foundation/point.md) of this [QuadraticBezierSegment](quadraticbeziersegment.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.quadraticbeziersegment.point2
     * @type {POINT} 
     */
    Point2 {
        get => this.get_Point2()
        set => this.put_Point2(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [QuadraticBezierSegment](quadraticbeziersegment.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.QuadraticBezierSegment")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_Point1() {
        if (!this.HasProp("__IQuadraticBezierSegment")) {
            if ((queryResult := this.QueryInterface(IQuadraticBezierSegment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IQuadraticBezierSegment := IQuadraticBezierSegment(outPtr)
        }

        return this.__IQuadraticBezierSegment.get_Point1()
    }

    /**
     * 
     * @param {POINT} value 
     * @returns {HRESULT} 
     */
    put_Point1(value) {
        if (!this.HasProp("__IQuadraticBezierSegment")) {
            if ((queryResult := this.QueryInterface(IQuadraticBezierSegment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IQuadraticBezierSegment := IQuadraticBezierSegment(outPtr)
        }

        return this.__IQuadraticBezierSegment.put_Point1(value)
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_Point2() {
        if (!this.HasProp("__IQuadraticBezierSegment")) {
            if ((queryResult := this.QueryInterface(IQuadraticBezierSegment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IQuadraticBezierSegment := IQuadraticBezierSegment(outPtr)
        }

        return this.__IQuadraticBezierSegment.get_Point2()
    }

    /**
     * 
     * @param {POINT} value 
     * @returns {HRESULT} 
     */
    put_Point2(value) {
        if (!this.HasProp("__IQuadraticBezierSegment")) {
            if ((queryResult := this.QueryInterface(IQuadraticBezierSegment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IQuadraticBezierSegment := IQuadraticBezierSegment(outPtr)
        }

        return this.__IQuadraticBezierSegment.put_Point2(value)
    }

;@endregion Instance Methods
}
