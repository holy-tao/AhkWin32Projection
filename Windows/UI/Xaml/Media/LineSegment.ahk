#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\PathSegment.ahk
#Include .\ILineSegment.ahk
#Include .\ILineSegmentStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a line drawn between two points, which can be part of a [PathFigure](pathfigure.md) within [Path](../windows.ui.xaml.shapes/path.md) data.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.linesegment
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class LineSegment extends PathSegment {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILineSegment

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILineSegment.IID

    /**
     * Identifies the [Point](linesegment_point.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.linesegment.pointproperty
     * @type {DependencyProperty} 
     */
    static PointProperty {
        get => LineSegment.get_PointProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PointProperty() {
        if (!LineSegment.HasProp("__ILineSegmentStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.LineSegment")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILineSegmentStatics.IID)
            LineSegment.__ILineSegmentStatics := ILineSegmentStatics(factoryPtr)
        }

        return LineSegment.__ILineSegmentStatics.get_PointProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the end point of the line segment.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.linesegment.point
     * @type {POINT} 
     */
    Point {
        get => this.get_Point()
        set => this.put_Point(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [LineSegment](linesegment.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.LineSegment")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_Point() {
        if (!this.HasProp("__ILineSegment")) {
            if ((queryResult := this.QueryInterface(ILineSegment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILineSegment := ILineSegment(outPtr)
        }

        return this.__ILineSegment.get_Point()
    }

    /**
     * 
     * @param {POINT} value 
     * @returns {HRESULT} 
     */
    put_Point(value) {
        if (!this.HasProp("__ILineSegment")) {
            if ((queryResult := this.QueryInterface(ILineSegment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILineSegment := ILineSegment(outPtr)
        }

        return this.__ILineSegment.put_Point(value)
    }

;@endregion Instance Methods
}
