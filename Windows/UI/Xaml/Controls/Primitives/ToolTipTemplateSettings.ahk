#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\DependencyObject.ahk
#Include .\IToolTipTemplateSettings.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Provides calculated values that can be referenced as **TemplatedParent** sources when defining templates for a [ToolTip](../windows.ui.xaml.controls/tooltip.md) control. Not intended for general use.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.tooltiptemplatesettings
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class ToolTipTemplateSettings extends DependencyObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IToolTipTemplateSettings

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IToolTipTemplateSettings.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the offset that is appropriate as a value for **FromHorizontalOffset** in theme animations.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.tooltiptemplatesettings.fromhorizontaloffset
     * @type {Float} 
     */
    FromHorizontalOffset {
        get => this.get_FromHorizontalOffset()
    }

    /**
     * Gets the offset that is appropriate as a value for **FromVerticalOffset** in theme animations.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.tooltiptemplatesettings.fromverticaloffset
     * @type {Float} 
     */
    FromVerticalOffset {
        get => this.get_FromVerticalOffset()
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
    get_FromHorizontalOffset() {
        if (!this.HasProp("__IToolTipTemplateSettings")) {
            if ((queryResult := this.QueryInterface(IToolTipTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToolTipTemplateSettings := IToolTipTemplateSettings(outPtr)
        }

        return this.__IToolTipTemplateSettings.get_FromHorizontalOffset()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_FromVerticalOffset() {
        if (!this.HasProp("__IToolTipTemplateSettings")) {
            if ((queryResult := this.QueryInterface(IToolTipTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToolTipTemplateSettings := IToolTipTemplateSettings(outPtr)
        }

        return this.__IToolTipTemplateSettings.get_FromVerticalOffset()
    }

;@endregion Instance Methods
}
