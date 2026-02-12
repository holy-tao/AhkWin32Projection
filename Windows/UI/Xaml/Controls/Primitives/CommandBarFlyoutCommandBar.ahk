#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\CommandBar.ahk
#Include .\ICommandBarFlyoutCommandBar.ahk
#Include .\ICommandBarFlyoutCommandBarFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Represents a specialized command bar used in a CommandBarFlyout.
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.Primitives.CommandBarFlyoutCommandBar](/windows/winui/api/microsoft.ui.xaml.controls.primitives.commandbarflyoutcommandbar) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.commandbarflyoutcommandbar
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class CommandBarFlyoutCommandBar extends CommandBar {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICommandBarFlyoutCommandBar

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICommandBarFlyoutCommandBar.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {CommandBarFlyoutCommandBar} 
     */
    static CreateInstance() {
        if (!CommandBarFlyoutCommandBar.HasProp("__ICommandBarFlyoutCommandBarFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.CommandBarFlyoutCommandBar")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICommandBarFlyoutCommandBarFactory.IID)
            CommandBarFlyoutCommandBar.__ICommandBarFlyoutCommandBarFactory := ICommandBarFlyoutCommandBarFactory(factoryPtr)
        }

        return CommandBarFlyoutCommandBar.__ICommandBarFlyoutCommandBarFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets an object that provides calculated values that can be referenced as [{TemplateBinding} markup extension](/windows/uwp/xaml-platform/templatebinding-markup-extension) sources when defining templates for a [CommandBarFlyoutCommandBar](commandbarflyoutcommandbar.md) control.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.Primitives.CommandBarFlyoutCommandBar.FlyoutTemplateSettings](/windows/winui/api/microsoft.ui.xaml.controls.primitives.commandbarflyoutcommandbar.flyouttemplatesettings) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.commandbarflyoutcommandbar.flyouttemplatesettings
     * @type {CommandBarFlyoutCommandBarTemplateSettings} 
     */
    FlyoutTemplateSettings {
        get => this.get_FlyoutTemplateSettings()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {CommandBarFlyoutCommandBarTemplateSettings} 
     */
    get_FlyoutTemplateSettings() {
        if (!this.HasProp("__ICommandBarFlyoutCommandBar")) {
            if ((queryResult := this.QueryInterface(ICommandBarFlyoutCommandBar.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommandBarFlyoutCommandBar := ICommandBarFlyoutCommandBar(outPtr)
        }

        return this.__ICommandBarFlyoutCommandBar.get_FlyoutTemplateSettings()
    }

;@endregion Instance Methods
}
