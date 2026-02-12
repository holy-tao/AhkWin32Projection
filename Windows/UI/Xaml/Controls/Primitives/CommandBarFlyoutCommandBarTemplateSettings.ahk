#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\DependencyObject.ahk
#Include .\ICommandBarFlyoutCommandBarTemplateSettings.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Provides calculated values that can be referenced as **TemplatedParent** sources when defining templates for a [CommandBarFlyout](../windows.ui.xaml.controls/commandbarflyout.md) control. Not intended for general use.
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.Primitives.CommandBarFlyoutCommandBarTemplateSettings](/windows/winui/api/microsoft.ui.xaml.controls.primitives.commandbarflyoutcommandbartemplatesettings) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.commandbarflyoutcommandbartemplatesettings
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class CommandBarFlyoutCommandBarTemplateSettings extends DependencyObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICommandBarFlyoutCommandBarTemplateSettings

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICommandBarFlyoutCommandBarTemplateSettings.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the start position for the open animation.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.Primitives.CommandBarFlyoutCommandBarTemplateSettings.OpenAnimationStartPosition](/windows/winui/api/microsoft.ui.xaml.controls.primitives.commandbarflyoutcommandbartemplatesettings.openanimationstartposition) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.commandbarflyoutcommandbartemplatesettings.openanimationstartposition
     * @type {Float} 
     */
    OpenAnimationStartPosition {
        get => this.get_OpenAnimationStartPosition()
    }

    /**
     * Gets the end position for the open animation.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.Primitives.CommandBarFlyoutCommandBarTemplateSettings.OpenAnimationEndPosition](/windows/winui/api/microsoft.ui.xaml.controls.primitives.commandbarflyoutcommandbartemplatesettings.openanimationendposition) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.commandbarflyoutcommandbartemplatesettings.openanimationendposition
     * @type {Float} 
     */
    OpenAnimationEndPosition {
        get => this.get_OpenAnimationEndPosition()
    }

    /**
     * Gets the end position for the close animation.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.Primitives.CommandBarFlyoutCommandBarTemplateSettings.CloseAnimationEndPosition](/windows/winui/api/microsoft.ui.xaml.controls.primitives.commandbarflyoutcommandbartemplatesettings.closeanimationendposition) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.commandbarflyoutcommandbartemplatesettings.closeanimationendposition
     * @type {Float} 
     */
    CloseAnimationEndPosition {
        get => this.get_CloseAnimationEndPosition()
    }

    /**
     * Gets the current width of the control.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.Primitives.CommandBarFlyoutCommandBarTemplateSettings.CurrentWidth](/windows/winui/api/microsoft.ui.xaml.controls.primitives.commandbarflyoutcommandbartemplatesettings.currentwidth) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.commandbarflyoutcommandbartemplatesettings.currentwidth
     * @type {Float} 
     */
    CurrentWidth {
        get => this.get_CurrentWidth()
    }

    /**
     * Gets the width of the control when expanded.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.Primitives.CommandBarFlyoutCommandBarTemplateSettings.ExpandedWidth](/windows/winui/api/microsoft.ui.xaml.controls.primitives.commandbarflyoutcommandbartemplatesettings.expandedwidth) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.commandbarflyoutcommandbartemplatesettings.expandedwidth
     * @type {Float} 
     */
    ExpandedWidth {
        get => this.get_ExpandedWidth()
    }

    /**
     * Gets the amount of change for the width expansion.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.Primitives.CommandBarFlyoutCommandBarTemplateSettings.WidthExpansionDelta](/windows/winui/api/microsoft.ui.xaml.controls.primitives.commandbarflyoutcommandbartemplatesettings.widthexpansiondelta) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.commandbarflyoutcommandbartemplatesettings.widthexpansiondelta
     * @type {Float} 
     */
    WidthExpansionDelta {
        get => this.get_WidthExpansionDelta()
    }

    /**
     * Gets the start position for the width expansion animation.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.Primitives.CommandBarFlyoutCommandBarTemplateSettings.WidthExpansionAnimationStartPosition](/windows/winui/api/microsoft.ui.xaml.controls.primitives.commandbarflyoutcommandbartemplatesettings.widthexpansionanimationstartposition) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.commandbarflyoutcommandbartemplatesettings.widthexpansionanimationstartposition
     * @type {Float} 
     */
    WidthExpansionAnimationStartPosition {
        get => this.get_WidthExpansionAnimationStartPosition()
    }

    /**
     * Gets the end position for the width expansion animation.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.Primitives.CommandBarFlyoutCommandBarTemplateSettings.WidthExpansionAnimationEndPosition](/windows/winui/api/microsoft.ui.xaml.controls.primitives.commandbarflyoutcommandbartemplatesettings.widthexpansionanimationendposition) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.commandbarflyoutcommandbartemplatesettings.widthexpansionanimationendposition
     * @type {Float} 
     */
    WidthExpansionAnimationEndPosition {
        get => this.get_WidthExpansionAnimationEndPosition()
    }

    /**
     * Gets the start position for the "more" button width expansion animation.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.Primitives.CommandBarFlyoutCommandBarTemplateSettings.WidthExpansionMoreButtonAnimationStartPosition](/windows/winui/api/microsoft.ui.xaml.controls.primitives.commandbarflyoutcommandbartemplatesettings.widthexpansionmorebuttonanimationstartposition) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.commandbarflyoutcommandbartemplatesettings.widthexpansionmorebuttonanimationstartposition
     * @type {Float} 
     */
    WidthExpansionMoreButtonAnimationStartPosition {
        get => this.get_WidthExpansionMoreButtonAnimationStartPosition()
    }

    /**
     * Gets the end position for the "more" button width expansion animation.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.Primitives.CommandBarFlyoutCommandBarTemplateSettings.WidthExpansionMoreButtonAnimationEndPosition](/windows/winui/api/microsoft.ui.xaml.controls.primitives.commandbarflyoutcommandbartemplatesettings.widthexpansionmorebuttonanimationendposition) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.commandbarflyoutcommandbartemplatesettings.widthexpansionmorebuttonanimationendposition
     * @type {Float} 
     */
    WidthExpansionMoreButtonAnimationEndPosition {
        get => this.get_WidthExpansionMoreButtonAnimationEndPosition()
    }

    /**
     * Gets the vertical position of the overflow when expanded up.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.Primitives.CommandBarFlyoutCommandBarTemplateSettings.ExpandUpOverflowVerticalPosition](/windows/winui/api/microsoft.ui.xaml.controls.primitives.commandbarflyoutcommandbartemplatesettings.expandupoverflowverticalposition) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.commandbarflyoutcommandbartemplatesettings.expandupoverflowverticalposition
     * @type {Float} 
     */
    ExpandUpOverflowVerticalPosition {
        get => this.get_ExpandUpOverflowVerticalPosition()
    }

    /**
     * Gets the vertical position of the overflow when expanded down.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.Primitives.CommandBarFlyoutCommandBarTemplateSettings.ExpandDownOverflowVerticalPosition](/windows/winui/api/microsoft.ui.xaml.controls.primitives.commandbarflyoutcommandbartemplatesettings.expanddownoverflowverticalposition) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.commandbarflyoutcommandbartemplatesettings.expanddownoverflowverticalposition
     * @type {Float} 
     */
    ExpandDownOverflowVerticalPosition {
        get => this.get_ExpandDownOverflowVerticalPosition()
    }

    /**
     * Gets the start position for the expand up animation.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.Primitives.CommandBarFlyoutCommandBarTemplateSettings.ExpandUpAnimationStartPosition](/windows/winui/api/microsoft.ui.xaml.controls.primitives.commandbarflyoutcommandbartemplatesettings.expandupanimationstartposition) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.commandbarflyoutcommandbartemplatesettings.expandupanimationstartposition
     * @type {Float} 
     */
    ExpandUpAnimationStartPosition {
        get => this.get_ExpandUpAnimationStartPosition()
    }

    /**
     * Gets the end position for the expand up animation.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.Primitives.CommandBarFlyoutCommandBarTemplateSettings.ExpandUpAnimationEndPosition](/windows/winui/api/microsoft.ui.xaml.controls.primitives.commandbarflyoutcommandbartemplatesettings.expandupanimationendposition) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.commandbarflyoutcommandbartemplatesettings.expandupanimationendposition
     * @type {Float} 
     */
    ExpandUpAnimationEndPosition {
        get => this.get_ExpandUpAnimationEndPosition()
    }

    /**
     * Gets the hold position for the expand up animation.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.Primitives.CommandBarFlyoutCommandBarTemplateSettings.ExpandUpAnimationHoldPosition](/windows/winui/api/microsoft.ui.xaml.controls.primitives.commandbarflyoutcommandbartemplatesettings.expandupanimationholdposition) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.commandbarflyoutcommandbartemplatesettings.expandupanimationholdposition
     * @type {Float} 
     */
    ExpandUpAnimationHoldPosition {
        get => this.get_ExpandUpAnimationHoldPosition()
    }

    /**
     * Gets the start position for the expand down animation.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.Primitives.CommandBarFlyoutCommandBarTemplateSettings.ExpandDownAnimationStartPosition](/windows/winui/api/microsoft.ui.xaml.controls.primitives.commandbarflyoutcommandbartemplatesettings.expanddownanimationstartposition) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.commandbarflyoutcommandbartemplatesettings.expanddownanimationstartposition
     * @type {Float} 
     */
    ExpandDownAnimationStartPosition {
        get => this.get_ExpandDownAnimationStartPosition()
    }

    /**
     * Gets the end position for the expand down animation.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.Primitives.CommandBarFlyoutCommandBarTemplateSettings.ExpandDownAnimationEndPosition](/windows/winui/api/microsoft.ui.xaml.controls.primitives.commandbarflyoutcommandbartemplatesettings.expanddownanimationendposition) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.commandbarflyoutcommandbartemplatesettings.expanddownanimationendposition
     * @type {Float} 
     */
    ExpandDownAnimationEndPosition {
        get => this.get_ExpandDownAnimationEndPosition()
    }

    /**
     * Gets the hold position for the expand down animation.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.Primitives.CommandBarFlyoutCommandBarTemplateSettings.ExpandDownAnimationHoldPosition](/windows/winui/api/microsoft.ui.xaml.controls.primitives.commandbarflyoutcommandbartemplatesettings.expanddownanimationholdposition) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.commandbarflyoutcommandbartemplatesettings.expanddownanimationholdposition
     * @type {Float} 
     */
    ExpandDownAnimationHoldPosition {
        get => this.get_ExpandDownAnimationHoldPosition()
    }

    /**
     * Gets the rectangle used to clip the content.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.Primitives.CommandBarFlyoutCommandBarTemplateSettings.ContentClipRect](/windows/winui/api/microsoft.ui.xaml.controls.primitives.commandbarflyoutcommandbartemplatesettings.contentcliprect) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.commandbarflyoutcommandbartemplatesettings.contentcliprect
     * @type {RECT} 
     */
    ContentClipRect {
        get => this.get_ContentClipRect()
    }

    /**
     * Gets the rectangle used to clip the overflow content.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.Primitives.CommandBarFlyoutCommandBarTemplateSettings.OverflowContentClipRect](/windows/winui/api/microsoft.ui.xaml.controls.primitives.commandbarflyoutcommandbartemplatesettings.overflowcontentcliprect) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.commandbarflyoutcommandbartemplatesettings.overflowcontentcliprect
     * @type {RECT} 
     */
    OverflowContentClipRect {
        get => this.get_OverflowContentClipRect()
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
    get_OpenAnimationStartPosition() {
        if (!this.HasProp("__ICommandBarFlyoutCommandBarTemplateSettings")) {
            if ((queryResult := this.QueryInterface(ICommandBarFlyoutCommandBarTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommandBarFlyoutCommandBarTemplateSettings := ICommandBarFlyoutCommandBarTemplateSettings(outPtr)
        }

        return this.__ICommandBarFlyoutCommandBarTemplateSettings.get_OpenAnimationStartPosition()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_OpenAnimationEndPosition() {
        if (!this.HasProp("__ICommandBarFlyoutCommandBarTemplateSettings")) {
            if ((queryResult := this.QueryInterface(ICommandBarFlyoutCommandBarTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommandBarFlyoutCommandBarTemplateSettings := ICommandBarFlyoutCommandBarTemplateSettings(outPtr)
        }

        return this.__ICommandBarFlyoutCommandBarTemplateSettings.get_OpenAnimationEndPosition()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_CloseAnimationEndPosition() {
        if (!this.HasProp("__ICommandBarFlyoutCommandBarTemplateSettings")) {
            if ((queryResult := this.QueryInterface(ICommandBarFlyoutCommandBarTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommandBarFlyoutCommandBarTemplateSettings := ICommandBarFlyoutCommandBarTemplateSettings(outPtr)
        }

        return this.__ICommandBarFlyoutCommandBarTemplateSettings.get_CloseAnimationEndPosition()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_CurrentWidth() {
        if (!this.HasProp("__ICommandBarFlyoutCommandBarTemplateSettings")) {
            if ((queryResult := this.QueryInterface(ICommandBarFlyoutCommandBarTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommandBarFlyoutCommandBarTemplateSettings := ICommandBarFlyoutCommandBarTemplateSettings(outPtr)
        }

        return this.__ICommandBarFlyoutCommandBarTemplateSettings.get_CurrentWidth()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ExpandedWidth() {
        if (!this.HasProp("__ICommandBarFlyoutCommandBarTemplateSettings")) {
            if ((queryResult := this.QueryInterface(ICommandBarFlyoutCommandBarTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommandBarFlyoutCommandBarTemplateSettings := ICommandBarFlyoutCommandBarTemplateSettings(outPtr)
        }

        return this.__ICommandBarFlyoutCommandBarTemplateSettings.get_ExpandedWidth()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_WidthExpansionDelta() {
        if (!this.HasProp("__ICommandBarFlyoutCommandBarTemplateSettings")) {
            if ((queryResult := this.QueryInterface(ICommandBarFlyoutCommandBarTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommandBarFlyoutCommandBarTemplateSettings := ICommandBarFlyoutCommandBarTemplateSettings(outPtr)
        }

        return this.__ICommandBarFlyoutCommandBarTemplateSettings.get_WidthExpansionDelta()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_WidthExpansionAnimationStartPosition() {
        if (!this.HasProp("__ICommandBarFlyoutCommandBarTemplateSettings")) {
            if ((queryResult := this.QueryInterface(ICommandBarFlyoutCommandBarTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommandBarFlyoutCommandBarTemplateSettings := ICommandBarFlyoutCommandBarTemplateSettings(outPtr)
        }

        return this.__ICommandBarFlyoutCommandBarTemplateSettings.get_WidthExpansionAnimationStartPosition()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_WidthExpansionAnimationEndPosition() {
        if (!this.HasProp("__ICommandBarFlyoutCommandBarTemplateSettings")) {
            if ((queryResult := this.QueryInterface(ICommandBarFlyoutCommandBarTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommandBarFlyoutCommandBarTemplateSettings := ICommandBarFlyoutCommandBarTemplateSettings(outPtr)
        }

        return this.__ICommandBarFlyoutCommandBarTemplateSettings.get_WidthExpansionAnimationEndPosition()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_WidthExpansionMoreButtonAnimationStartPosition() {
        if (!this.HasProp("__ICommandBarFlyoutCommandBarTemplateSettings")) {
            if ((queryResult := this.QueryInterface(ICommandBarFlyoutCommandBarTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommandBarFlyoutCommandBarTemplateSettings := ICommandBarFlyoutCommandBarTemplateSettings(outPtr)
        }

        return this.__ICommandBarFlyoutCommandBarTemplateSettings.get_WidthExpansionMoreButtonAnimationStartPosition()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_WidthExpansionMoreButtonAnimationEndPosition() {
        if (!this.HasProp("__ICommandBarFlyoutCommandBarTemplateSettings")) {
            if ((queryResult := this.QueryInterface(ICommandBarFlyoutCommandBarTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommandBarFlyoutCommandBarTemplateSettings := ICommandBarFlyoutCommandBarTemplateSettings(outPtr)
        }

        return this.__ICommandBarFlyoutCommandBarTemplateSettings.get_WidthExpansionMoreButtonAnimationEndPosition()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ExpandUpOverflowVerticalPosition() {
        if (!this.HasProp("__ICommandBarFlyoutCommandBarTemplateSettings")) {
            if ((queryResult := this.QueryInterface(ICommandBarFlyoutCommandBarTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommandBarFlyoutCommandBarTemplateSettings := ICommandBarFlyoutCommandBarTemplateSettings(outPtr)
        }

        return this.__ICommandBarFlyoutCommandBarTemplateSettings.get_ExpandUpOverflowVerticalPosition()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ExpandDownOverflowVerticalPosition() {
        if (!this.HasProp("__ICommandBarFlyoutCommandBarTemplateSettings")) {
            if ((queryResult := this.QueryInterface(ICommandBarFlyoutCommandBarTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommandBarFlyoutCommandBarTemplateSettings := ICommandBarFlyoutCommandBarTemplateSettings(outPtr)
        }

        return this.__ICommandBarFlyoutCommandBarTemplateSettings.get_ExpandDownOverflowVerticalPosition()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ExpandUpAnimationStartPosition() {
        if (!this.HasProp("__ICommandBarFlyoutCommandBarTemplateSettings")) {
            if ((queryResult := this.QueryInterface(ICommandBarFlyoutCommandBarTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommandBarFlyoutCommandBarTemplateSettings := ICommandBarFlyoutCommandBarTemplateSettings(outPtr)
        }

        return this.__ICommandBarFlyoutCommandBarTemplateSettings.get_ExpandUpAnimationStartPosition()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ExpandUpAnimationEndPosition() {
        if (!this.HasProp("__ICommandBarFlyoutCommandBarTemplateSettings")) {
            if ((queryResult := this.QueryInterface(ICommandBarFlyoutCommandBarTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommandBarFlyoutCommandBarTemplateSettings := ICommandBarFlyoutCommandBarTemplateSettings(outPtr)
        }

        return this.__ICommandBarFlyoutCommandBarTemplateSettings.get_ExpandUpAnimationEndPosition()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ExpandUpAnimationHoldPosition() {
        if (!this.HasProp("__ICommandBarFlyoutCommandBarTemplateSettings")) {
            if ((queryResult := this.QueryInterface(ICommandBarFlyoutCommandBarTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommandBarFlyoutCommandBarTemplateSettings := ICommandBarFlyoutCommandBarTemplateSettings(outPtr)
        }

        return this.__ICommandBarFlyoutCommandBarTemplateSettings.get_ExpandUpAnimationHoldPosition()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ExpandDownAnimationStartPosition() {
        if (!this.HasProp("__ICommandBarFlyoutCommandBarTemplateSettings")) {
            if ((queryResult := this.QueryInterface(ICommandBarFlyoutCommandBarTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommandBarFlyoutCommandBarTemplateSettings := ICommandBarFlyoutCommandBarTemplateSettings(outPtr)
        }

        return this.__ICommandBarFlyoutCommandBarTemplateSettings.get_ExpandDownAnimationStartPosition()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ExpandDownAnimationEndPosition() {
        if (!this.HasProp("__ICommandBarFlyoutCommandBarTemplateSettings")) {
            if ((queryResult := this.QueryInterface(ICommandBarFlyoutCommandBarTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommandBarFlyoutCommandBarTemplateSettings := ICommandBarFlyoutCommandBarTemplateSettings(outPtr)
        }

        return this.__ICommandBarFlyoutCommandBarTemplateSettings.get_ExpandDownAnimationEndPosition()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ExpandDownAnimationHoldPosition() {
        if (!this.HasProp("__ICommandBarFlyoutCommandBarTemplateSettings")) {
            if ((queryResult := this.QueryInterface(ICommandBarFlyoutCommandBarTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommandBarFlyoutCommandBarTemplateSettings := ICommandBarFlyoutCommandBarTemplateSettings(outPtr)
        }

        return this.__ICommandBarFlyoutCommandBarTemplateSettings.get_ExpandDownAnimationHoldPosition()
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_ContentClipRect() {
        if (!this.HasProp("__ICommandBarFlyoutCommandBarTemplateSettings")) {
            if ((queryResult := this.QueryInterface(ICommandBarFlyoutCommandBarTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommandBarFlyoutCommandBarTemplateSettings := ICommandBarFlyoutCommandBarTemplateSettings(outPtr)
        }

        return this.__ICommandBarFlyoutCommandBarTemplateSettings.get_ContentClipRect()
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_OverflowContentClipRect() {
        if (!this.HasProp("__ICommandBarFlyoutCommandBarTemplateSettings")) {
            if ((queryResult := this.QueryInterface(ICommandBarFlyoutCommandBarTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommandBarFlyoutCommandBarTemplateSettings := ICommandBarFlyoutCommandBarTemplateSettings(outPtr)
        }

        return this.__ICommandBarFlyoutCommandBarTemplateSettings.get_OverflowContentClipRect()
    }

;@endregion Instance Methods
}
