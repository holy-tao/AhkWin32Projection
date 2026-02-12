#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\PathSegment.ahk
#Include .\IBezierSegment.ahk
#Include .\IBezierSegmentStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a cubic Bezier curve drawn between two points.
 * @remarks
 * This class is relevant for setting the vector data for either a [Path](../windows.ui.xaml.shapes/path.md) or a [PathIcon](../windows.ui.xaml.controls/pathicon.md).
 * 
 * Rather than creating an instance or an object element, you can also define a BezierSegment as part of a vector within the string for a [Move and draw commands syntax](/windows/uwp/xaml-platform/move-draw-commands-syntax).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.beziersegment
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class BezierSegment extends PathSegment {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBezierSegment

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBezierSegment.IID

    /**
     * Identifies the [Point1](beziersegment_point1.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.beziersegment.point1property
     * @type {DependencyProperty} 
     */
    static Point1Property {
        get => BezierSegment.get_Point1Property()
    }

    /**
     * Identifies the [Point2](beziersegment_point2.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.beziersegment.point2property
     * @type {DependencyProperty} 
     */
    static Point2Property {
        get => BezierSegment.get_Point2Property()
    }

    /**
     * Identifies the [Point3](beziersegment_point3.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.beziersegment.point3property
     * @type {DependencyProperty} 
     */
    static Point3Property {
        get => BezierSegment.get_Point3Property()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_Point1Property() {
        if (!BezierSegment.HasProp("__IBezierSegmentStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.BezierSegment")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBezierSegmentStatics.IID)
            BezierSegment.__IBezierSegmentStatics := IBezierSegmentStatics(factoryPtr)
        }

        return BezierSegment.__IBezierSegmentStatics.get_Point1Property()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_Point2Property() {
        if (!BezierSegment.HasProp("__IBezierSegmentStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.BezierSegment")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBezierSegmentStatics.IID)
            BezierSegment.__IBezierSegmentStatics := IBezierSegmentStatics(factoryPtr)
        }

        return BezierSegment.__IBezierSegmentStatics.get_Point2Property()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_Point3Property() {
        if (!BezierSegment.HasProp("__IBezierSegmentStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.BezierSegment")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBezierSegmentStatics.IID)
            BezierSegment.__IBezierSegmentStatics := IBezierSegmentStatics(factoryPtr)
        }

        return BezierSegment.__IBezierSegmentStatics.get_Point3Property()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the first control point of the curve.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.beziersegment.point1
     * @type {POINT} 
     */
    Point1 {
        get => this.get_Point1()
        set => this.put_Point1(value)
    }

    /**
     * Gets or sets the second control point of the curve.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.beziersegment.point2
     * @type {POINT} 
     */
    Point2 {
        get => this.get_Point2()
        set => this.put_Point2(value)
    }

    /**
     * Gets or sets the end point of the curve.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.beziersegment.point3
     * @type {POINT} 
     */
    Point3 {
        get => this.get_Point3()
        set => this.put_Point3(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [BezierSegment](beziersegment.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.BezierSegment")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_Point1() {
        if (!this.HasProp("__IBezierSegment")) {
            if ((queryResult := this.QueryInterface(IBezierSegment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBezierSegment := IBezierSegment(outPtr)
        }

        return this.__IBezierSegment.get_Point1()
    }

    /**
     * 
     * @param {POINT} value 
     * @returns {HRESULT} 
     */
    put_Point1(value) {
        if (!this.HasProp("__IBezierSegment")) {
            if ((queryResult := this.QueryInterface(IBezierSegment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBezierSegment := IBezierSegment(outPtr)
        }

        return this.__IBezierSegment.put_Point1(value)
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_Point2() {
        if (!this.HasProp("__IBezierSegment")) {
            if ((queryResult := this.QueryInterface(IBezierSegment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBezierSegment := IBezierSegment(outPtr)
        }

        return this.__IBezierSegment.get_Point2()
    }

    /**
     * 
     * @param {POINT} value 
     * @returns {HRESULT} 
     */
    put_Point2(value) {
        if (!this.HasProp("__IBezierSegment")) {
            if ((queryResult := this.QueryInterface(IBezierSegment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBezierSegment := IBezierSegment(outPtr)
        }

        return this.__IBezierSegment.put_Point2(value)
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_Point3() {
        if (!this.HasProp("__IBezierSegment")) {
            if ((queryResult := this.QueryInterface(IBezierSegment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBezierSegment := IBezierSegment(outPtr)
        }

        return this.__IBezierSegment.get_Point3()
    }

    /**
     * 
     * @param {POINT} value 
     * @returns {HRESULT} 
     */
    put_Point3(value) {
        if (!this.HasProp("__IBezierSegment")) {
            if ((queryResult := this.QueryInterface(IBezierSegment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBezierSegment := IBezierSegment(outPtr)
        }

        return this.__IBezierSegment.put_Point3(value)
    }

;@endregion Instance Methods
}
