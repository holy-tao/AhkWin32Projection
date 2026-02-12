#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\PathSegment.ahk
#Include .\IPolyLineSegment.ahk
#Include .\IPolyLineSegmentStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a set of line segments defined by a [Point](../windows.foundation/point.md) collection with each [Point](../windows.foundation/point.md) specifying the end point of a line segment.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.polylinesegment
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class PolyLineSegment extends PathSegment {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPolyLineSegment

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPolyLineSegment.IID

    /**
     * Identifies the [Points](polylinesegment_points.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.polylinesegment.pointsproperty
     * @type {DependencyProperty} 
     */
    static PointsProperty {
        get => PolyLineSegment.get_PointsProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PointsProperty() {
        if (!PolyLineSegment.HasProp("__IPolyLineSegmentStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.PolyLineSegment")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPolyLineSegmentStatics.IID)
            PolyLineSegment.__IPolyLineSegmentStatics := IPolyLineSegmentStatics(factoryPtr)
        }

        return PolyLineSegment.__IPolyLineSegmentStatics.get_PointsProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the collection of [Point](../windows.foundation/point.md) values that defines this [PolyLineSegment](polylinesegment.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.polylinesegment.points
     * @type {PointCollection} 
     */
    Points {
        get => this.get_Points()
        set => this.put_Points(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [PolyLineSegment](polylinesegment.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.PolyLineSegment")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {PointCollection} 
     */
    get_Points() {
        if (!this.HasProp("__IPolyLineSegment")) {
            if ((queryResult := this.QueryInterface(IPolyLineSegment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPolyLineSegment := IPolyLineSegment(outPtr)
        }

        return this.__IPolyLineSegment.get_Points()
    }

    /**
     * 
     * @param {PointCollection} value 
     * @returns {HRESULT} 
     */
    put_Points(value) {
        if (!this.HasProp("__IPolyLineSegment")) {
            if ((queryResult := this.QueryInterface(IPolyLineSegment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPolyLineSegment := IPolyLineSegment(outPtr)
        }

        return this.__IPolyLineSegment.put_Points(value)
    }

;@endregion Instance Methods
}
