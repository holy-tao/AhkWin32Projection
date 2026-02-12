#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IInkModelerAttributes.ahk
#Include .\IInkModelerAttributes2.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Manages which types of ink modeler attributes can be processed by the [InkPresenter](inkpresenter.md) object.
 * @remarks
 * Ink modeling refers to the process of processing and optimizing input for rendering as ink strokes. This can inlcude filtering, smoothing, prediction (to reduce perceived latency), and transformation (such as scaling for display DPI, or mapping pointer pressure to stroke width).
 * 
 * When using the [InkToolbar](../windows.ui.xaml.controls/inktoolbar.md), [InkModelerAttributes](inkmodelerattributes.md) should be set in the [InkToolbar.ActiveToolChanged](../windows.ui.xaml.controls/inktoolbar_activetoolchanged.md) event as attributes are overwritten whenever the active tool is changed.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkmodelerattributes
 * @namespace Windows.UI.Input.Inking
 * @version WindowsRuntime 1.4
 */
class InkModelerAttributes extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IInkModelerAttributes

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IInkModelerAttributes.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the amount of time into the future used to predict the expected location of the input pointer.
     * @remarks
     * When using the [InkToolbar](../windows.ui.xaml.controls/inktoolbar.md), [InkModelerAttributes](inkmodelerattributes.md) should be set in the [InkToolbar.ActiveToolChanged](../windows.ui.xaml.controls/inktoolbar_activetoolchanged.md) event as attributes are overwritten whenever the active tool is changed.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkmodelerattributes.predictiontime
     * @type {TimeSpan} 
     */
    PredictionTime {
        get => this.get_PredictionTime()
        set => this.put_PredictionTime(value)
    }

    /**
     * Gets or sets the scale transform for the coordinate space of the ink stroke.
     * @remarks
     * When using the [InkToolbar](../windows.ui.xaml.controls/inktoolbar.md), [InkModelerAttributes](inkmodelerattributes.md) should be set in the [InkToolbar.ActiveToolChanged](../windows.ui.xaml.controls/inktoolbar_activetoolchanged.md) event as attributes are overwritten whenever the active tool is changed.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkmodelerattributes.scalingfactor
     * @type {Float} 
     */
    ScalingFactor {
        get => this.get_ScalingFactor()
        set => this.put_ScalingFactor(value)
    }

    /**
     * Gets or sets whether pen velocity is used in combination with pressure on the inking surface to calculate final pressure value.
     * @remarks
     * This setting is valid for pencil and ballpoint pen brushes.
     * 
     * For the ballpoint pen brush, a faster velocity results in a thinner stroke, while a lower velocity results in a thicker stroke.
     * 
     * For the pencil brush, a faster velocity results in a thinner and lighter stroke, while a lower velocity results in a thicker and darker stroke.
     * 
     * When using the [InkToolbar](../windows.ui.xaml.controls/inktoolbar.md), [InkModelerAttributes](inkmodelerattributes.md) should be set in the [InkToolbar.ActiveToolChanged](../windows.ui.xaml.controls/inktoolbar_activetoolchanged.md) event as attributes are overwritten whenever the active tool is changed.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkmodelerattributes.usevelocitybasedpressure
     * @type {Boolean} 
     */
    UseVelocityBasedPressure {
        get => this.get_UseVelocityBasedPressure()
        set => this.put_UseVelocityBasedPressure(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_PredictionTime() {
        if (!this.HasProp("__IInkModelerAttributes")) {
            if ((queryResult := this.QueryInterface(IInkModelerAttributes.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkModelerAttributes := IInkModelerAttributes(outPtr)
        }

        return this.__IInkModelerAttributes.get_PredictionTime()
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_PredictionTime(value) {
        if (!this.HasProp("__IInkModelerAttributes")) {
            if ((queryResult := this.QueryInterface(IInkModelerAttributes.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkModelerAttributes := IInkModelerAttributes(outPtr)
        }

        return this.__IInkModelerAttributes.put_PredictionTime(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ScalingFactor() {
        if (!this.HasProp("__IInkModelerAttributes")) {
            if ((queryResult := this.QueryInterface(IInkModelerAttributes.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkModelerAttributes := IInkModelerAttributes(outPtr)
        }

        return this.__IInkModelerAttributes.get_ScalingFactor()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_ScalingFactor(value) {
        if (!this.HasProp("__IInkModelerAttributes")) {
            if ((queryResult := this.QueryInterface(IInkModelerAttributes.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkModelerAttributes := IInkModelerAttributes(outPtr)
        }

        return this.__IInkModelerAttributes.put_ScalingFactor(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_UseVelocityBasedPressure() {
        if (!this.HasProp("__IInkModelerAttributes2")) {
            if ((queryResult := this.QueryInterface(IInkModelerAttributes2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkModelerAttributes2 := IInkModelerAttributes2(outPtr)
        }

        return this.__IInkModelerAttributes2.get_UseVelocityBasedPressure()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_UseVelocityBasedPressure(value) {
        if (!this.HasProp("__IInkModelerAttributes2")) {
            if ((queryResult := this.QueryInterface(IInkModelerAttributes2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkModelerAttributes2 := IInkModelerAttributes2(outPtr)
        }

        return this.__IInkModelerAttributes2.put_UseVelocityBasedPressure(value)
    }

;@endregion Instance Methods
}
