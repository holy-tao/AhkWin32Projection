#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Brush.ahk
#Include .\IGradientBrush.ahk
#Include .\IGradientBrushStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * An abstract class that describes a gradient, composed of gradient stops.
 * @remarks
 * Use the [GradientStops](gradientbrush_gradientstops.md) property to describe the color composition of a [LinearGradientBrush](lineargradientbrush.md) where each [GradientStop](gradientstop.md) specifies a [Color](gradientstop_color.md) and an [Offset](gradientstop_offset.md). Each [Offset](gradientstop_offset.md) value should be between 0 and 1.
 * 
 * [Color](gradientstop_color.md) values can be any value expressed as a named color or one of the conversion syntaxes.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.gradientbrush
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class GradientBrush extends Brush {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGradientBrush

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGradientBrush.IID

    /**
     * Identifies the [SpreadMethod](gradientbrush_spreadmethod.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.gradientbrush.spreadmethodproperty
     * @type {DependencyProperty} 
     */
    static SpreadMethodProperty {
        get => GradientBrush.get_SpreadMethodProperty()
    }

    /**
     * Identifies the [MappingMode](gradientbrush_mappingmode.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.gradientbrush.mappingmodeproperty
     * @type {DependencyProperty} 
     */
    static MappingModeProperty {
        get => GradientBrush.get_MappingModeProperty()
    }

    /**
     * Identifies the [ColorInterpolationMode](gradientbrush_colorinterpolationmode.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.gradientbrush.colorinterpolationmodeproperty
     * @type {DependencyProperty} 
     */
    static ColorInterpolationModeProperty {
        get => GradientBrush.get_ColorInterpolationModeProperty()
    }

    /**
     * Identifies the [GradientStops](gradientbrush_gradientstops.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.gradientbrush.gradientstopsproperty
     * @type {DependencyProperty} 
     */
    static GradientStopsProperty {
        get => GradientBrush.get_GradientStopsProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SpreadMethodProperty() {
        if (!GradientBrush.HasProp("__IGradientBrushStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.GradientBrush")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGradientBrushStatics.IID)
            GradientBrush.__IGradientBrushStatics := IGradientBrushStatics(factoryPtr)
        }

        return GradientBrush.__IGradientBrushStatics.get_SpreadMethodProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_MappingModeProperty() {
        if (!GradientBrush.HasProp("__IGradientBrushStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.GradientBrush")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGradientBrushStatics.IID)
            GradientBrush.__IGradientBrushStatics := IGradientBrushStatics(factoryPtr)
        }

        return GradientBrush.__IGradientBrushStatics.get_MappingModeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ColorInterpolationModeProperty() {
        if (!GradientBrush.HasProp("__IGradientBrushStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.GradientBrush")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGradientBrushStatics.IID)
            GradientBrush.__IGradientBrushStatics := IGradientBrushStatics(factoryPtr)
        }

        return GradientBrush.__IGradientBrushStatics.get_ColorInterpolationModeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_GradientStopsProperty() {
        if (!GradientBrush.HasProp("__IGradientBrushStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.GradientBrush")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGradientBrushStatics.IID)
            GradientBrush.__IGradientBrushStatics := IGradientBrushStatics(factoryPtr)
        }

        return GradientBrush.__IGradientBrushStatics.get_GradientStopsProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the type of spread method that specifies how to draw a gradient that starts or ends inside the bounds of the object to be painted.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.gradientbrush.spreadmethod
     * @type {Integer} 
     */
    SpreadMethod {
        get => this.get_SpreadMethod()
        set => this.put_SpreadMethod(value)
    }

    /**
     * Gets or sets a [BrushMappingMode](brushmappingmode.md) enumeration value that specifies whether the positioning coordinates of the gradient brush are absolute or relative to the output area.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.gradientbrush.mappingmode
     * @type {Integer} 
     */
    MappingMode {
        get => this.get_MappingMode()
        set => this.put_MappingMode(value)
    }

    /**
     * Gets or sets a [ColorInterpolationMode](colorinterpolationmode.md) enumeration value that specifies how the gradient's colors are interpolated.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.gradientbrush.colorinterpolationmode
     * @type {Integer} 
     */
    ColorInterpolationMode {
        get => this.get_ColorInterpolationMode()
        set => this.put_ColorInterpolationMode(value)
    }

    /**
     * Gets or sets the brush's gradient stops.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.gradientbrush.gradientstops
     * @type {GradientStopCollection} 
     */
    GradientStops {
        get => this.get_GradientStops()
        set => this.put_GradientStops(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SpreadMethod() {
        if (!this.HasProp("__IGradientBrush")) {
            if ((queryResult := this.QueryInterface(IGradientBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGradientBrush := IGradientBrush(outPtr)
        }

        return this.__IGradientBrush.get_SpreadMethod()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_SpreadMethod(value) {
        if (!this.HasProp("__IGradientBrush")) {
            if ((queryResult := this.QueryInterface(IGradientBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGradientBrush := IGradientBrush(outPtr)
        }

        return this.__IGradientBrush.put_SpreadMethod(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MappingMode() {
        if (!this.HasProp("__IGradientBrush")) {
            if ((queryResult := this.QueryInterface(IGradientBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGradientBrush := IGradientBrush(outPtr)
        }

        return this.__IGradientBrush.get_MappingMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_MappingMode(value) {
        if (!this.HasProp("__IGradientBrush")) {
            if ((queryResult := this.QueryInterface(IGradientBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGradientBrush := IGradientBrush(outPtr)
        }

        return this.__IGradientBrush.put_MappingMode(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ColorInterpolationMode() {
        if (!this.HasProp("__IGradientBrush")) {
            if ((queryResult := this.QueryInterface(IGradientBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGradientBrush := IGradientBrush(outPtr)
        }

        return this.__IGradientBrush.get_ColorInterpolationMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ColorInterpolationMode(value) {
        if (!this.HasProp("__IGradientBrush")) {
            if ((queryResult := this.QueryInterface(IGradientBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGradientBrush := IGradientBrush(outPtr)
        }

        return this.__IGradientBrush.put_ColorInterpolationMode(value)
    }

    /**
     * 
     * @returns {GradientStopCollection} 
     */
    get_GradientStops() {
        if (!this.HasProp("__IGradientBrush")) {
            if ((queryResult := this.QueryInterface(IGradientBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGradientBrush := IGradientBrush(outPtr)
        }

        return this.__IGradientBrush.get_GradientStops()
    }

    /**
     * 
     * @param {GradientStopCollection} value 
     * @returns {HRESULT} 
     */
    put_GradientStops(value) {
        if (!this.HasProp("__IGradientBrush")) {
            if ((queryResult := this.QueryInterface(IGradientBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGradientBrush := IGradientBrush(outPtr)
        }

        return this.__IGradientBrush.put_GradientStops(value)
    }

;@endregion Instance Methods
}
