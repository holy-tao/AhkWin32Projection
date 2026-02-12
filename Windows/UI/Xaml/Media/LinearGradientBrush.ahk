#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\GradientBrush.ahk
#Include .\ILinearGradientBrush.ahk
#Include .\ILinearGradientBrushFactory.ahk
#Include .\ILinearGradientBrushStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Paints an area with a linear gradient.
 * @remarks
 * LinearGradientBrush is a type of [Brush](brush.md) that is used for many possible UI properties that use a [Brush](brush.md) to fill some or all of an object's visual area in app UI. Examples of some of the most commonly-used properties that use a [Brush](brush.md) value include: [Control.Background](../windows.ui.xaml.controls/control_background.md), [Control.Foreground](../windows.ui.xaml.controls/control_foreground.md), [Shape.Fill](../windows.ui.xaml.shapes/shape_fill.md), [Control.BorderBrush](../windows.ui.xaml.controls/control_borderbrush.md), [Panel.Background](../windows.ui.xaml.controls/panel_background.md), [TextBlock.Foreground](../windows.ui.xaml.controls/textblock_foreground.md). LinearGradientBrush is an alternative to the more commonly used [SolidColorBrush](solidcolorbrush.md) type.
 * 
 * The [StartPoint](lineargradientbrush_startpoint.md) and [EndPoint](lineargradientbrush_endpoint.md) properties of LinearGradientBrush describe two points in a relative coordinate space. This creates an orientation for the gradient, and typically this specifies a horizontal gradient, or a vertical gradient. A diagonal gradient can also be used. A LinearGradientBrush typically has two or more [GradientStop](gradientstop.md) values for the [GradientStops](gradientbrush_gradientstops.md) property (an ordered collection). Each [GradientStop](gradientstop.md) specifies a [Color](gradientstop_color.md) and an [Offset](gradientstop_offset.md). [Offset](gradientstop_offset.md) represents a position between 0 (the [StartPoint](lineargradientbrush_startpoint.md)) and 1 (the [EndPoint](lineargradientbrush_endpoint.md)) along the gradient, and the actual pixel length of the brush and its gradient are adjusted based on the UI where you apply your LinearGradientBrush as a value. For more info on how [Offset](gradientstop_offset.md) values are defined and how [Offset](gradientstop_offset.md), [StartPoint](lineargradientbrush_startpoint.md) and [EndPoint](lineargradientbrush_endpoint.md) are related, see [Use brushes](/windows/uwp/graphics/using-brushes). It's common to use
 * 
 * You can use the [Transparent](../windows.ui/colors_transparent.md) value for one of the [GradientStop](gradientstop.md) colors. Although this doesn't visually apply any changes to UI (it's transparent), that point is detectable for hit-testing purposes. For more info on hit testing, see "Hit testing" section of [Mouse interactions](/windows/uwp/input-and-devices/mouse-interactions).
 * 
 * The [GradientStop](gradientstop.md) values of a LinearGradientBrush can be animated as part of transitions or decorative animations. Use one of the dedicated animation types that can animate a [Color](../windows.ui/color.md) value. This usually involves having `.(GradientStop.Color)` be a part of a longer property path for a [Storyboard.TargetProperty](/uwp/api/windows.ui.xaml.media.animation.storyboard.targetproperty) value. For more info on property targeting and how to animate properties that use [Brush](brush.md) values, see [Storyboarded animations](/windows/uwp/graphics/storyboarded-animations).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.lineargradientbrush
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class LinearGradientBrush extends GradientBrush {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILinearGradientBrush

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILinearGradientBrush.IID

    /**
     * Identifies the [StartPoint](lineargradientbrush_startpoint.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.lineargradientbrush.startpointproperty
     * @type {DependencyProperty} 
     */
    static StartPointProperty {
        get => LinearGradientBrush.get_StartPointProperty()
    }

    /**
     * Identifies the [EndPoint](lineargradientbrush_endpoint.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.lineargradientbrush.endpointproperty
     * @type {DependencyProperty} 
     */
    static EndPointProperty {
        get => LinearGradientBrush.get_EndPointProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes a new instance of the [LinearGradientBrush](lineargradientbrush.md) class that has the specified [GradientStopCollection](gradientstopcollection.md) and angle.
     * @param {GradientStopCollection} gradientStopCollection_ The [GradientStops](gradientbrush_gradientstops.md) to set on this brush.
     * @param {Float} angle A [System.Double](/dotnet/api/system.double?view=dotnet-uwp-10.0&preserve-view=true) that represents the angle, in degrees, of the gradient. A value of 0 creates a horizontal gradient, and a value of 90 creates a vertical gradient. Negative values are permitted, as are values over 360 (which are treated as **mod** 360).
     * @returns {LinearGradientBrush} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.lineargradientbrush.#ctor
     */
    static CreateInstanceWithGradientStopCollectionAndAngle(gradientStopCollection_, angle) {
        if (!LinearGradientBrush.HasProp("__ILinearGradientBrushFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.LinearGradientBrush")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILinearGradientBrushFactory.IID)
            LinearGradientBrush.__ILinearGradientBrushFactory := ILinearGradientBrushFactory(factoryPtr)
        }

        return LinearGradientBrush.__ILinearGradientBrushFactory.CreateInstanceWithGradientStopCollectionAndAngle(gradientStopCollection_, angle)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_StartPointProperty() {
        if (!LinearGradientBrush.HasProp("__ILinearGradientBrushStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.LinearGradientBrush")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILinearGradientBrushStatics.IID)
            LinearGradientBrush.__ILinearGradientBrushStatics := ILinearGradientBrushStatics(factoryPtr)
        }

        return LinearGradientBrush.__ILinearGradientBrushStatics.get_StartPointProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_EndPointProperty() {
        if (!LinearGradientBrush.HasProp("__ILinearGradientBrushStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.LinearGradientBrush")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILinearGradientBrushStatics.IID)
            LinearGradientBrush.__ILinearGradientBrushStatics := ILinearGradientBrushStatics(factoryPtr)
        }

        return LinearGradientBrush.__ILinearGradientBrushStatics.get_EndPointProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the starting two-dimensional coordinates of the linear gradient.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.lineargradientbrush.startpoint
     * @type {POINT} 
     */
    StartPoint {
        get => this.get_StartPoint()
        set => this.put_StartPoint(value)
    }

    /**
     * Gets or sets the ending two-dimensional coordinates of the linear gradient.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.lineargradientbrush.endpoint
     * @type {POINT} 
     */
    EndPoint {
        get => this.get_EndPoint()
        set => this.put_EndPoint(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [LinearGradientBrush](lineargradientbrush.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.LinearGradientBrush")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_StartPoint() {
        if (!this.HasProp("__ILinearGradientBrush")) {
            if ((queryResult := this.QueryInterface(ILinearGradientBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILinearGradientBrush := ILinearGradientBrush(outPtr)
        }

        return this.__ILinearGradientBrush.get_StartPoint()
    }

    /**
     * 
     * @param {POINT} value 
     * @returns {HRESULT} 
     */
    put_StartPoint(value) {
        if (!this.HasProp("__ILinearGradientBrush")) {
            if ((queryResult := this.QueryInterface(ILinearGradientBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILinearGradientBrush := ILinearGradientBrush(outPtr)
        }

        return this.__ILinearGradientBrush.put_StartPoint(value)
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_EndPoint() {
        if (!this.HasProp("__ILinearGradientBrush")) {
            if ((queryResult := this.QueryInterface(ILinearGradientBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILinearGradientBrush := ILinearGradientBrush(outPtr)
        }

        return this.__ILinearGradientBrush.get_EndPoint()
    }

    /**
     * 
     * @param {POINT} value 
     * @returns {HRESULT} 
     */
    put_EndPoint(value) {
        if (!this.HasProp("__ILinearGradientBrush")) {
            if ((queryResult := this.QueryInterface(ILinearGradientBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILinearGradientBrush := ILinearGradientBrush(outPtr)
        }

        return this.__ILinearGradientBrush.put_EndPoint(value)
    }

;@endregion Instance Methods
}
