#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\DependencyObject.ahk
#Include .\IAppBarTemplateSettings.ahk
#Include .\IAppBarTemplateSettings2.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Provides calculated values that can be referenced as **TemplatedParent** sources when defining templates for an [AppBar](../windows.ui.xaml.controls/appbar.md) control. Not intended for general use.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.appbartemplatesettings
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class AppBarTemplateSettings extends DependencyObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppBarTemplateSettings

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppBarTemplateSettings.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [Rect](../windows.foundation/rect.md) that describes the clipped area of the [AppBar](../windows.ui.xaml.controls/appbar.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.appbartemplatesettings.cliprect
     * @type {RECT} 
     */
    ClipRect {
        get => this.get_ClipRect()
    }

    /**
     * Gets the vertical delta of the [AppBar](../windows.ui.xaml.controls/appbar.md) in the compact state.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.appbartemplatesettings.compactverticaldelta
     * @type {Float} 
     */
    CompactVerticalDelta {
        get => this.get_CompactVerticalDelta()
    }

    /**
     * Gets the margin of the [AppBar](../windows.ui.xaml.controls/appbar.md) root in the compact state.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.appbartemplatesettings.compactrootmargin
     * @type {Thickness} 
     */
    CompactRootMargin {
        get => this.get_CompactRootMargin()
    }

    /**
     * Gets the vertical delta of the [AppBar](../windows.ui.xaml.controls/appbar.md) in the minimal state.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.appbartemplatesettings.minimalverticaldelta
     * @type {Float} 
     */
    MinimalVerticalDelta {
        get => this.get_MinimalVerticalDelta()
    }

    /**
     * Gets the margin of the [AppBar](../windows.ui.xaml.controls/appbar.md) root in the minimal state.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.appbartemplatesettings.minimalrootmargin
     * @type {Thickness} 
     */
    MinimalRootMargin {
        get => this.get_MinimalRootMargin()
    }

    /**
     * Gets the vertical delta of the [AppBar](../windows.ui.xaml.controls/appbar.md) in the hidden state.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.appbartemplatesettings.hiddenverticaldelta
     * @type {Float} 
     */
    HiddenVerticalDelta {
        get => this.get_HiddenVerticalDelta()
    }

    /**
     * Gets the margin of the [AppBar](../windows.ui.xaml.controls/appbar.md) root in the hidden state.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.appbartemplatesettings.hiddenrootmargin
     * @type {Thickness} 
     */
    HiddenRootMargin {
        get => this.get_HiddenRootMargin()
    }

    /**
     * Gets the negative vertical delta of the [AppBar](../windows.ui.xaml.controls/appbar.md) in the compact state.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.appbartemplatesettings.negativecompactverticaldelta
     * @type {Float} 
     */
    NegativeCompactVerticalDelta {
        get => this.get_NegativeCompactVerticalDelta()
    }

    /**
     * Gets the negative vertical delta of the [AppBar](../windows.ui.xaml.controls/appbar.md) in the minimal state.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.appbartemplatesettings.negativeminimalverticaldelta
     * @type {Float} 
     */
    NegativeMinimalVerticalDelta {
        get => this.get_NegativeMinimalVerticalDelta()
    }

    /**
     * Gets the negative vertical delta of the [AppBar](../windows.ui.xaml.controls/appbar.md) in the hidden state.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.appbartemplatesettings.negativehiddenverticaldelta
     * @type {Float} 
     */
    NegativeHiddenVerticalDelta {
        get => this.get_NegativeHiddenVerticalDelta()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_ClipRect() {
        if (!this.HasProp("__IAppBarTemplateSettings")) {
            if ((queryResult := this.QueryInterface(IAppBarTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBarTemplateSettings := IAppBarTemplateSettings(outPtr)
        }

        return this.__IAppBarTemplateSettings.get_ClipRect()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_CompactVerticalDelta() {
        if (!this.HasProp("__IAppBarTemplateSettings")) {
            if ((queryResult := this.QueryInterface(IAppBarTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBarTemplateSettings := IAppBarTemplateSettings(outPtr)
        }

        return this.__IAppBarTemplateSettings.get_CompactVerticalDelta()
    }

    /**
     * 
     * @returns {Thickness} 
     */
    get_CompactRootMargin() {
        if (!this.HasProp("__IAppBarTemplateSettings")) {
            if ((queryResult := this.QueryInterface(IAppBarTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBarTemplateSettings := IAppBarTemplateSettings(outPtr)
        }

        return this.__IAppBarTemplateSettings.get_CompactRootMargin()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MinimalVerticalDelta() {
        if (!this.HasProp("__IAppBarTemplateSettings")) {
            if ((queryResult := this.QueryInterface(IAppBarTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBarTemplateSettings := IAppBarTemplateSettings(outPtr)
        }

        return this.__IAppBarTemplateSettings.get_MinimalVerticalDelta()
    }

    /**
     * 
     * @returns {Thickness} 
     */
    get_MinimalRootMargin() {
        if (!this.HasProp("__IAppBarTemplateSettings")) {
            if ((queryResult := this.QueryInterface(IAppBarTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBarTemplateSettings := IAppBarTemplateSettings(outPtr)
        }

        return this.__IAppBarTemplateSettings.get_MinimalRootMargin()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_HiddenVerticalDelta() {
        if (!this.HasProp("__IAppBarTemplateSettings")) {
            if ((queryResult := this.QueryInterface(IAppBarTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBarTemplateSettings := IAppBarTemplateSettings(outPtr)
        }

        return this.__IAppBarTemplateSettings.get_HiddenVerticalDelta()
    }

    /**
     * 
     * @returns {Thickness} 
     */
    get_HiddenRootMargin() {
        if (!this.HasProp("__IAppBarTemplateSettings")) {
            if ((queryResult := this.QueryInterface(IAppBarTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBarTemplateSettings := IAppBarTemplateSettings(outPtr)
        }

        return this.__IAppBarTemplateSettings.get_HiddenRootMargin()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_NegativeCompactVerticalDelta() {
        if (!this.HasProp("__IAppBarTemplateSettings2")) {
            if ((queryResult := this.QueryInterface(IAppBarTemplateSettings2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBarTemplateSettings2 := IAppBarTemplateSettings2(outPtr)
        }

        return this.__IAppBarTemplateSettings2.get_NegativeCompactVerticalDelta()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_NegativeMinimalVerticalDelta() {
        if (!this.HasProp("__IAppBarTemplateSettings2")) {
            if ((queryResult := this.QueryInterface(IAppBarTemplateSettings2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBarTemplateSettings2 := IAppBarTemplateSettings2(outPtr)
        }

        return this.__IAppBarTemplateSettings2.get_NegativeMinimalVerticalDelta()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_NegativeHiddenVerticalDelta() {
        if (!this.HasProp("__IAppBarTemplateSettings2")) {
            if ((queryResult := this.QueryInterface(IAppBarTemplateSettings2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppBarTemplateSettings2 := IAppBarTemplateSettings2(outPtr)
        }

        return this.__IAppBarTemplateSettings2.get_NegativeHiddenVerticalDelta()
    }

;@endregion Instance Methods
}
