#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\DependencyObject.ahk
#Include .\IProgressRingTemplateSettings.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Provides calculated values that can be referenced as **TemplatedParent** sources when defining templates for a [ProgressRing](../windows.ui.xaml.controls/progressring.md) control. Not intended for general use.
 * @remarks
 * Get instances of ProgressRingTemplateSettings by querying the value of [TemplateSettings](../windows.ui.xaml.controls/progressring_templatesettings.md).
 * 
 * The values from ProgressRingTemplateSettings are typically used as either the "To" or "From" values of theme animations or transitions.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.progressringtemplatesettings
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class ProgressRingTemplateSettings extends DependencyObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IProgressRingTemplateSettings

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IProgressRingTemplateSettings.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the template-defined diameter of the "Ellipse" element that is animated in a templated [ProgressRing](../windows.ui.xaml.controls/progressring.md).
     * @remarks
     * This value might be 4, 5, or 6 pixels in size depending on progress and state.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.progressringtemplatesettings.ellipsediameter
     * @type {Float} 
     */
    EllipseDiameter {
        get => this.get_EllipseDiameter()
    }

    /**
     * Gets the template-defined offset position of the "Ellipse" element that is animated in a templated [ProgressRing](../windows.ui.xaml.controls/progressring.md).
     * @remarks
     * EllipseOffset alternates between 4, 7, and 9 pixels. This is controlled by the animations that exist in default [ProgressRing](../windows.ui.xaml.controls/progressring.md) templates.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.progressringtemplatesettings.ellipseoffset
     * @type {Thickness} 
     */
    EllipseOffset {
        get => this.get_EllipseOffset()
    }

    /**
     * Gets the maximum bounding size of the progress ring as rendered.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.progressringtemplatesettings.maxsidelength
     * @type {Float} 
     */
    MaxSideLength {
        get => this.get_MaxSideLength()
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
        if (!this.HasProp("__IProgressRingTemplateSettings")) {
            if ((queryResult := this.QueryInterface(IProgressRingTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProgressRingTemplateSettings := IProgressRingTemplateSettings(outPtr)
        }

        return this.__IProgressRingTemplateSettings.get_EllipseDiameter()
    }

    /**
     * 
     * @returns {Thickness} 
     */
    get_EllipseOffset() {
        if (!this.HasProp("__IProgressRingTemplateSettings")) {
            if ((queryResult := this.QueryInterface(IProgressRingTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProgressRingTemplateSettings := IProgressRingTemplateSettings(outPtr)
        }

        return this.__IProgressRingTemplateSettings.get_EllipseOffset()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MaxSideLength() {
        if (!this.HasProp("__IProgressRingTemplateSettings")) {
            if ((queryResult := this.QueryInterface(IProgressRingTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProgressRingTemplateSettings := IProgressRingTemplateSettings(outPtr)
        }

        return this.__IProgressRingTemplateSettings.get_MaxSideLength()
    }

;@endregion Instance Methods
}
