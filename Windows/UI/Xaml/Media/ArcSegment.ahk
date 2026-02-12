#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\PathSegment.ahk
#Include .\IArcSegment.ahk
#Include .\IArcSegmentStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents an elliptical arc between two points.
 * @remarks
 * At a minimum each ArcSegment should have its [RotationAngle](arcsegment_rotationangle.md) and [Size](arcsegment_size.md) properties set, because these don't have useful defaults.
 * 
 * This class is relevant for setting the vector data for either a [Path](../windows.ui.xaml.shapes/path.md) or a [PathIcon](../windows.ui.xaml.controls/pathicon.md).
 * 
 * Rather than creating an instance or an object element, you can also define an ArcSegment as part of a vector within the string for a [Move and draw commands syntax](/windows/uwp/xaml-platform/move-draw-commands-syntax).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.arcsegment
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class ArcSegment extends PathSegment {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IArcSegment

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IArcSegment.IID

    /**
     * Identifies the [Point](arcsegment_point.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.arcsegment.pointproperty
     * @type {DependencyProperty} 
     */
    static PointProperty {
        get => ArcSegment.get_PointProperty()
    }

    /**
     * Identifies the [Size](arcsegment_size.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.arcsegment.sizeproperty
     * @type {DependencyProperty} 
     */
    static SizeProperty {
        get => ArcSegment.get_SizeProperty()
    }

    /**
     * Identifies the [RotationAngle](arcsegment_rotationangle.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.arcsegment.rotationangleproperty
     * @type {DependencyProperty} 
     */
    static RotationAngleProperty {
        get => ArcSegment.get_RotationAngleProperty()
    }

    /**
     * Identifies the [IsLargeArc](arcsegment_islargearc.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.arcsegment.islargearcproperty
     * @type {DependencyProperty} 
     */
    static IsLargeArcProperty {
        get => ArcSegment.get_IsLargeArcProperty()
    }

    /**
     * Identifies the [SweepDirection](arcsegment_sweepdirection.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.arcsegment.sweepdirectionproperty
     * @type {DependencyProperty} 
     */
    static SweepDirectionProperty {
        get => ArcSegment.get_SweepDirectionProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PointProperty() {
        if (!ArcSegment.HasProp("__IArcSegmentStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.ArcSegment")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IArcSegmentStatics.IID)
            ArcSegment.__IArcSegmentStatics := IArcSegmentStatics(factoryPtr)
        }

        return ArcSegment.__IArcSegmentStatics.get_PointProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SizeProperty() {
        if (!ArcSegment.HasProp("__IArcSegmentStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.ArcSegment")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IArcSegmentStatics.IID)
            ArcSegment.__IArcSegmentStatics := IArcSegmentStatics(factoryPtr)
        }

        return ArcSegment.__IArcSegmentStatics.get_SizeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_RotationAngleProperty() {
        if (!ArcSegment.HasProp("__IArcSegmentStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.ArcSegment")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IArcSegmentStatics.IID)
            ArcSegment.__IArcSegmentStatics := IArcSegmentStatics(factoryPtr)
        }

        return ArcSegment.__IArcSegmentStatics.get_RotationAngleProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsLargeArcProperty() {
        if (!ArcSegment.HasProp("__IArcSegmentStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.ArcSegment")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IArcSegmentStatics.IID)
            ArcSegment.__IArcSegmentStatics := IArcSegmentStatics(factoryPtr)
        }

        return ArcSegment.__IArcSegmentStatics.get_IsLargeArcProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SweepDirectionProperty() {
        if (!ArcSegment.HasProp("__IArcSegmentStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.ArcSegment")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IArcSegmentStatics.IID)
            ArcSegment.__IArcSegmentStatics := IArcSegmentStatics(factoryPtr)
        }

        return ArcSegment.__IArcSegmentStatics.get_SweepDirectionProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the endpoint of the elliptical arc.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.arcsegment.point
     * @type {POINT} 
     */
    Point {
        get => this.get_Point()
        set => this.put_Point(value)
    }

    /**
     * Gets or sets the x-radius and y-radius of the arc as a [Size](../windows.foundation/size.md) structure.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.arcsegment.size
     * @type {SIZE} 
     */
    Size {
        get => this.get_Size()
        set => this.put_Size(value)
    }

    /**
     * Gets or sets the amount (in degrees) by which the ellipse is rotated about the x-axis.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.arcsegment.rotationangle
     * @type {Float} 
     */
    RotationAngle {
        get => this.get_RotationAngle()
        set => this.put_RotationAngle(value)
    }

    /**
     * Gets or sets a value that indicates whether the arc should be greater than 180 degrees.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.arcsegment.islargearc
     * @type {Boolean} 
     */
    IsLargeArc {
        get => this.get_IsLargeArc()
        set => this.put_IsLargeArc(value)
    }

    /**
     * Gets or sets a value that specifies whether the arc is drawn in the **Clockwise** or **Counterclockwise** direction.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.arcsegment.sweepdirection
     * @type {Integer} 
     */
    SweepDirection {
        get => this.get_SweepDirection()
        set => this.put_SweepDirection(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [ArcSegment](arcsegment.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.ArcSegment")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_Point() {
        if (!this.HasProp("__IArcSegment")) {
            if ((queryResult := this.QueryInterface(IArcSegment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IArcSegment := IArcSegment(outPtr)
        }

        return this.__IArcSegment.get_Point()
    }

    /**
     * 
     * @param {POINT} value 
     * @returns {HRESULT} 
     */
    put_Point(value) {
        if (!this.HasProp("__IArcSegment")) {
            if ((queryResult := this.QueryInterface(IArcSegment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IArcSegment := IArcSegment(outPtr)
        }

        return this.__IArcSegment.put_Point(value)
    }

    /**
     * 
     * @returns {SIZE} 
     */
    get_Size() {
        if (!this.HasProp("__IArcSegment")) {
            if ((queryResult := this.QueryInterface(IArcSegment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IArcSegment := IArcSegment(outPtr)
        }

        return this.__IArcSegment.get_Size()
    }

    /**
     * 
     * @param {SIZE} value 
     * @returns {HRESULT} 
     */
    put_Size(value) {
        if (!this.HasProp("__IArcSegment")) {
            if ((queryResult := this.QueryInterface(IArcSegment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IArcSegment := IArcSegment(outPtr)
        }

        return this.__IArcSegment.put_Size(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_RotationAngle() {
        if (!this.HasProp("__IArcSegment")) {
            if ((queryResult := this.QueryInterface(IArcSegment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IArcSegment := IArcSegment(outPtr)
        }

        return this.__IArcSegment.get_RotationAngle()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_RotationAngle(value) {
        if (!this.HasProp("__IArcSegment")) {
            if ((queryResult := this.QueryInterface(IArcSegment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IArcSegment := IArcSegment(outPtr)
        }

        return this.__IArcSegment.put_RotationAngle(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsLargeArc() {
        if (!this.HasProp("__IArcSegment")) {
            if ((queryResult := this.QueryInterface(IArcSegment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IArcSegment := IArcSegment(outPtr)
        }

        return this.__IArcSegment.get_IsLargeArc()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsLargeArc(value) {
        if (!this.HasProp("__IArcSegment")) {
            if ((queryResult := this.QueryInterface(IArcSegment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IArcSegment := IArcSegment(outPtr)
        }

        return this.__IArcSegment.put_IsLargeArc(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SweepDirection() {
        if (!this.HasProp("__IArcSegment")) {
            if ((queryResult := this.QueryInterface(IArcSegment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IArcSegment := IArcSegment(outPtr)
        }

        return this.__IArcSegment.get_SweepDirection()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_SweepDirection(value) {
        if (!this.HasProp("__IArcSegment")) {
            if ((queryResult := this.QueryInterface(IArcSegment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IArcSegment := IArcSegment(outPtr)
        }

        return this.__IArcSegment.put_SweepDirection(value)
    }

;@endregion Instance Methods
}
