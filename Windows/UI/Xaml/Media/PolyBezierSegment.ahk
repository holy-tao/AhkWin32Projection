#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\PathSegment.ahk
#Include .\IPolyBezierSegment.ahk
#Include .\IPolyBezierSegmentStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents one or more cubic Bezier curves.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.polybeziersegment
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class PolyBezierSegment extends PathSegment {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPolyBezierSegment

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPolyBezierSegment.IID

    /**
     * Identifies the [Points](polybeziersegment_points.md)  dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.polybeziersegment.pointsproperty
     * @type {DependencyProperty} 
     */
    static PointsProperty {
        get => PolyBezierSegment.get_PointsProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PointsProperty() {
        if (!PolyBezierSegment.HasProp("__IPolyBezierSegmentStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.PolyBezierSegment")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPolyBezierSegmentStatics.IID)
            PolyBezierSegment.__IPolyBezierSegmentStatics := IPolyBezierSegmentStatics(factoryPtr)
        }

        return PolyBezierSegment.__IPolyBezierSegmentStatics.get_PointsProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the [Point](../windows.foundation/point.md) collection that defines this [PolyBezierSegment](polybeziersegment.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.polybeziersegment.points
     * @type {PointCollection} 
     */
    Points {
        get => this.get_Points()
        set => this.put_Points(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [PolyBezierSegment](polybeziersegment.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.PolyBezierSegment")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {PointCollection} 
     */
    get_Points() {
        if (!this.HasProp("__IPolyBezierSegment")) {
            if ((queryResult := this.QueryInterface(IPolyBezierSegment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPolyBezierSegment := IPolyBezierSegment(outPtr)
        }

        return this.__IPolyBezierSegment.get_Points()
    }

    /**
     * 
     * @param {PointCollection} value 
     * @returns {HRESULT} 
     */
    put_Points(value) {
        if (!this.HasProp("__IPolyBezierSegment")) {
            if ((queryResult := this.QueryInterface(IPolyBezierSegment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPolyBezierSegment := IPolyBezierSegment(outPtr)
        }

        return this.__IPolyBezierSegment.put_Points(value)
    }

;@endregion Instance Methods
}
