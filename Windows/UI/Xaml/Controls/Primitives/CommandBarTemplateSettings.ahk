#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\DependencyObject.ahk
#Include .\ICommandBarTemplateSettings.ahk
#Include .\ICommandBarTemplateSettings2.ahk
#Include .\ICommandBarTemplateSettings3.ahk
#Include .\ICommandBarTemplateSettings4.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Provides calculated values that can be referenced as **TemplatedParent** sources when defining templates for a [CommandBar](../windows.ui.xaml.controls/commandbar.md) control. Not intended for general use.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.commandbartemplatesettings
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class CommandBarTemplateSettings extends DependencyObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICommandBarTemplateSettings

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICommandBarTemplateSettings.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the height of the [CommandBar](../windows.ui.xaml.controls/commandbar.md) content.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.commandbartemplatesettings.contentheight
     * @type {Float} 
     */
    ContentHeight {
        get => this.get_ContentHeight()
    }

    /**
     * Gets the [Rect](../windows.foundation/rect.md) that describes the clipped area of the overflow content.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.commandbartemplatesettings.overflowcontentcliprect
     * @type {RECT} 
     */
    OverflowContentClipRect {
        get => this.get_OverflowContentClipRect()
    }

    /**
     * Gets the minimum width value of the overflow content.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.commandbartemplatesettings.overflowcontentminwidth
     * @type {Float} 
     */
    OverflowContentMinWidth {
        get => this.get_OverflowContentMinWidth()
    }

    /**
     * Gets the maximum height value of the overflow content.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.commandbartemplatesettings.overflowcontentmaxheight
     * @type {Float} 
     */
    OverflowContentMaxHeight {
        get => this.get_OverflowContentMaxHeight()
    }

    /**
     * Gets the horizontal offset value of the overflow content.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.commandbartemplatesettings.overflowcontenthorizontaloffset
     * @type {Float} 
     */
    OverflowContentHorizontalOffset {
        get => this.get_OverflowContentHorizontalOffset()
    }

    /**
     * Gets the height of the overflow content.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.commandbartemplatesettings.overflowcontentheight
     * @type {Float} 
     */
    OverflowContentHeight {
        get => this.get_OverflowContentHeight()
    }

    /**
     * Gets the height of the overflow content when the overflow direction is negative.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.commandbartemplatesettings.negativeoverflowcontentheight
     * @type {Float} 
     */
    NegativeOverflowContentHeight {
        get => this.get_NegativeOverflowContentHeight()
    }

    /**
     * Gets the maximum width value of the overflow content.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.commandbartemplatesettings.overflowcontentmaxwidth
     * @type {Float} 
     */
    OverflowContentMaxWidth {
        get => this.get_OverflowContentMaxWidth()
    }

    /**
     * Gets the effective visibility of the command bar's overflow button.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.commandbartemplatesettings.effectiveoverflowbuttonvisibility
     * @type {Integer} 
     */
    EffectiveOverflowButtonVisibility {
        get => this.get_EffectiveOverflowButtonVisibility()
    }

    /**
     * Gets the translation of the overflow content on the Y-axis in the compact state.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.commandbartemplatesettings.overflowcontentcompactytranslation
     * @type {Float} 
     */
    OverflowContentCompactYTranslation {
        get => this.get_OverflowContentCompactYTranslation()
    }

    /**
     * Gets the translation of the overflow content on the Y-axis in the minimal state.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.commandbartemplatesettings.overflowcontentminimalytranslation
     * @type {Float} 
     */
    OverflowContentMinimalYTranslation {
        get => this.get_OverflowContentMinimalYTranslation()
    }

    /**
     * Gets the translation of the overflow content on the Y-axis in the hidden state.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.commandbartemplatesettings.overflowcontenthiddenytranslation
     * @type {Float} 
     */
    OverflowContentHiddenYTranslation {
        get => this.get_OverflowContentHiddenYTranslation()
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
    get_ContentHeight() {
        if (!this.HasProp("__ICommandBarTemplateSettings")) {
            if ((queryResult := this.QueryInterface(ICommandBarTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommandBarTemplateSettings := ICommandBarTemplateSettings(outPtr)
        }

        return this.__ICommandBarTemplateSettings.get_ContentHeight()
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_OverflowContentClipRect() {
        if (!this.HasProp("__ICommandBarTemplateSettings")) {
            if ((queryResult := this.QueryInterface(ICommandBarTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommandBarTemplateSettings := ICommandBarTemplateSettings(outPtr)
        }

        return this.__ICommandBarTemplateSettings.get_OverflowContentClipRect()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_OverflowContentMinWidth() {
        if (!this.HasProp("__ICommandBarTemplateSettings")) {
            if ((queryResult := this.QueryInterface(ICommandBarTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommandBarTemplateSettings := ICommandBarTemplateSettings(outPtr)
        }

        return this.__ICommandBarTemplateSettings.get_OverflowContentMinWidth()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_OverflowContentMaxHeight() {
        if (!this.HasProp("__ICommandBarTemplateSettings")) {
            if ((queryResult := this.QueryInterface(ICommandBarTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommandBarTemplateSettings := ICommandBarTemplateSettings(outPtr)
        }

        return this.__ICommandBarTemplateSettings.get_OverflowContentMaxHeight()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_OverflowContentHorizontalOffset() {
        if (!this.HasProp("__ICommandBarTemplateSettings")) {
            if ((queryResult := this.QueryInterface(ICommandBarTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommandBarTemplateSettings := ICommandBarTemplateSettings(outPtr)
        }

        return this.__ICommandBarTemplateSettings.get_OverflowContentHorizontalOffset()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_OverflowContentHeight() {
        if (!this.HasProp("__ICommandBarTemplateSettings")) {
            if ((queryResult := this.QueryInterface(ICommandBarTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommandBarTemplateSettings := ICommandBarTemplateSettings(outPtr)
        }

        return this.__ICommandBarTemplateSettings.get_OverflowContentHeight()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_NegativeOverflowContentHeight() {
        if (!this.HasProp("__ICommandBarTemplateSettings")) {
            if ((queryResult := this.QueryInterface(ICommandBarTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommandBarTemplateSettings := ICommandBarTemplateSettings(outPtr)
        }

        return this.__ICommandBarTemplateSettings.get_NegativeOverflowContentHeight()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_OverflowContentMaxWidth() {
        if (!this.HasProp("__ICommandBarTemplateSettings2")) {
            if ((queryResult := this.QueryInterface(ICommandBarTemplateSettings2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommandBarTemplateSettings2 := ICommandBarTemplateSettings2(outPtr)
        }

        return this.__ICommandBarTemplateSettings2.get_OverflowContentMaxWidth()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_EffectiveOverflowButtonVisibility() {
        if (!this.HasProp("__ICommandBarTemplateSettings3")) {
            if ((queryResult := this.QueryInterface(ICommandBarTemplateSettings3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommandBarTemplateSettings3 := ICommandBarTemplateSettings3(outPtr)
        }

        return this.__ICommandBarTemplateSettings3.get_EffectiveOverflowButtonVisibility()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_OverflowContentCompactYTranslation() {
        if (!this.HasProp("__ICommandBarTemplateSettings4")) {
            if ((queryResult := this.QueryInterface(ICommandBarTemplateSettings4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommandBarTemplateSettings4 := ICommandBarTemplateSettings4(outPtr)
        }

        return this.__ICommandBarTemplateSettings4.get_OverflowContentCompactYTranslation()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_OverflowContentMinimalYTranslation() {
        if (!this.HasProp("__ICommandBarTemplateSettings4")) {
            if ((queryResult := this.QueryInterface(ICommandBarTemplateSettings4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommandBarTemplateSettings4 := ICommandBarTemplateSettings4(outPtr)
        }

        return this.__ICommandBarTemplateSettings4.get_OverflowContentMinimalYTranslation()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_OverflowContentHiddenYTranslation() {
        if (!this.HasProp("__ICommandBarTemplateSettings4")) {
            if ((queryResult := this.QueryInterface(ICommandBarTemplateSettings4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommandBarTemplateSettings4 := ICommandBarTemplateSettings4(outPtr)
        }

        return this.__ICommandBarTemplateSettings4.get_OverflowContentHiddenYTranslation()
    }

;@endregion Instance Methods
}
