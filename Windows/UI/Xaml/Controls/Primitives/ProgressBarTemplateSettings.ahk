#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\DependencyObject.ahk
#Include .\IProgressBarTemplateSettings.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Provides calculated values that can be referenced as **TemplatedParent** sources when defining templates for a [ProgressBar](../windows.ui.xaml.controls/progressbar.md) control. Not intended for general use.
 * @remarks
 * Get instances of ProgressBarTemplateSettings by querying the value of [TemplateSettings](../windows.ui.xaml.controls/progressbar_templatesettings.md).
 * 
 * The values from ProgressBarTemplateSettings are typically used as either the "To" or "From" values of theme animations or transitions.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.progressbartemplatesettings
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class ProgressBarTemplateSettings extends DependencyObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IProgressBarTemplateSettings

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IProgressBarTemplateSettings.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the template-defined diameter of the "Ellipse" element that is animated in a templated [ProgressBar](../windows.ui.xaml.controls/progressbar.md).
     * @remarks
     * This value might be 4, 5, or 6 pixels. This is controlled by the animations that exist in default [ProgressBar](progressbartemplatesettings.md) templates.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.progressbartemplatesettings.ellipsediameter
     * @type {Float} 
     */
    EllipseDiameter {
        get => this.get_EllipseDiameter()
    }

    /**
     * Gets the template-defined offset position of the "Ellipse" element that is animated in a templated [ProgressBar](progressbartemplatesettings.md).
     * @remarks
     * EllipseOffset might be 4, 7, or 9 pixels. This is controlled by the animations that exist in default [ProgressBar](progressbartemplatesettings.md) templates.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.progressbartemplatesettings.ellipseoffset
     * @type {Float} 
     */
    EllipseOffset {
        get => this.get_EllipseOffset()
    }

    /**
     * Gets the stopped point of the "Ellipse" animation that animates the [ProgressBar](../windows.ui.xaml.controls/progressbar.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.progressbartemplatesettings.ellipseanimationwellposition
     * @type {Float} 
     */
    EllipseAnimationWellPosition {
        get => this.get_EllipseAnimationWellPosition()
    }

    /**
     * Gets the "To" point of the "Ellipse" animation that animates the [ProgressBar](../windows.ui.xaml.controls/progressbar.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.progressbartemplatesettings.ellipseanimationendposition
     * @type {Float} 
     */
    EllipseAnimationEndPosition {
        get => this.get_EllipseAnimationEndPosition()
    }

    /**
     * Gets the "From" point of the container animation that animates the [ProgressBar](../windows.ui.xaml.controls/progressbar.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.progressbartemplatesettings.containeranimationstartposition
     * @type {Float} 
     */
    ContainerAnimationStartPosition {
        get => this.get_ContainerAnimationStartPosition()
    }

    /**
     * Gets the target "To" point of the container animation that animates the [ProgressBar](../windows.ui.xaml.controls/progressbar.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.progressbartemplatesettings.containeranimationendposition
     * @type {Float} 
     */
    ContainerAnimationEndPosition {
        get => this.get_ContainerAnimationEndPosition()
    }

    /**
     * Gets the indicator length delta, which is useful for repositioning transitions.
     * <!--Vague, cannot find a spec anywhere. basing this desc on the only place I see a usage in generic.xaml-->
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.progressbartemplatesettings.indicatorlengthdelta
     * @type {Float} 
     */
    IndicatorLengthDelta {
        get => this.get_IndicatorLengthDelta()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_EllipseDiameter() {
        if (!this.HasProp("__IProgressBarTemplateSettings")) {
            if ((queryResult := this.QueryInterface(IProgressBarTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProgressBarTemplateSettings := IProgressBarTemplateSettings(outPtr)
        }

        return this.__IProgressBarTemplateSettings.get_EllipseDiameter()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_EllipseOffset() {
        if (!this.HasProp("__IProgressBarTemplateSettings")) {
            if ((queryResult := this.QueryInterface(IProgressBarTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProgressBarTemplateSettings := IProgressBarTemplateSettings(outPtr)
        }

        return this.__IProgressBarTemplateSettings.get_EllipseOffset()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_EllipseAnimationWellPosition() {
        if (!this.HasProp("__IProgressBarTemplateSettings")) {
            if ((queryResult := this.QueryInterface(IProgressBarTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProgressBarTemplateSettings := IProgressBarTemplateSettings(outPtr)
        }

        return this.__IProgressBarTemplateSettings.get_EllipseAnimationWellPosition()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_EllipseAnimationEndPosition() {
        if (!this.HasProp("__IProgressBarTemplateSettings")) {
            if ((queryResult := this.QueryInterface(IProgressBarTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProgressBarTemplateSettings := IProgressBarTemplateSettings(outPtr)
        }

        return this.__IProgressBarTemplateSettings.get_EllipseAnimationEndPosition()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ContainerAnimationStartPosition() {
        if (!this.HasProp("__IProgressBarTemplateSettings")) {
            if ((queryResult := this.QueryInterface(IProgressBarTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProgressBarTemplateSettings := IProgressBarTemplateSettings(outPtr)
        }

        return this.__IProgressBarTemplateSettings.get_ContainerAnimationStartPosition()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ContainerAnimationEndPosition() {
        if (!this.HasProp("__IProgressBarTemplateSettings")) {
            if ((queryResult := this.QueryInterface(IProgressBarTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProgressBarTemplateSettings := IProgressBarTemplateSettings(outPtr)
        }

        return this.__IProgressBarTemplateSettings.get_ContainerAnimationEndPosition()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_IndicatorLengthDelta() {
        if (!this.HasProp("__IProgressBarTemplateSettings")) {
            if ((queryResult := this.QueryInterface(IProgressBarTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProgressBarTemplateSettings := IProgressBarTemplateSettings(outPtr)
        }

        return this.__IProgressBarTemplateSettings.get_IndicatorLengthDelta()
    }

;@endregion Instance Methods
}
