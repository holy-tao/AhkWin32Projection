#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include Primitives\FlyoutBase.ahk
#Include .\ICommandBarFlyout.ahk
#Include .\ICommandBarFlyoutFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a specialized flyout that provides layout for [AppBarButton](appbarbutton.md) and related command elements.
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.CommandBarFlyout](/windows/winui/api/microsoft.ui.xaml.controls.commandbarflyout) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.commandbarflyout
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class CommandBarFlyout extends FlyoutBase {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICommandBarFlyout

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICommandBarFlyout.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {CommandBarFlyout} 
     */
    static CreateInstance() {
        if (!CommandBarFlyout.HasProp("__ICommandBarFlyoutFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CommandBarFlyout")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICommandBarFlyoutFactory.IID)
            CommandBarFlyout.__ICommandBarFlyoutFactory := ICommandBarFlyoutFactory(factoryPtr)
        }

        return CommandBarFlyout.__ICommandBarFlyoutFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the collection of primary command elements for the [CommandBarFlyout](commandbarflyout.md).
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.CommandBarFlyout.PrimaryCommands](/windows/winui/api/microsoft.ui.xaml.controls.commandbarflyout.primarycommands) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @remarks
     * The PrimaryCommands collection can directly contain only [AppBarButton](appbarbutton.md), [AppBarToggleButton](appbartogglebutton.md), [AppBarSeparator](appbarseparator.md) command elements. Other elements must be wrapped in an [AppBarElementContainer](appbarelementcontainer.md).
     * 
     * The primary commands are shown in the command bar portion of the flyout.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.commandbarflyout.primarycommands
     * @type {IObservableVector<ICommandBarElement>} 
     */
    PrimaryCommands {
        get => this.get_PrimaryCommands()
    }

    /**
     * Gets the collection of secondary command elements for the [CommandBarFlyout](commandbarflyout.md).
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.CommandBarFlyout.SecondaryCommands](/windows/winui/api/microsoft.ui.xaml.controls.commandbarflyout.secondarycommands) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @remarks
     * The SecondaryCommands collection can directly contain only [AppBarButton](appbarbutton.md), [AppBarToggleButton](appbartogglebutton.md), or [AppBarSeparator](appbarseparator.md) command elements.  Other elements must be wrapped in an [AppBarElementContainer](appbarelementcontainer.md).
     * 
     * The secondary commands are shown in the menu portion of the flyout when the [CommandBarFlyout](commandbarflyout.md) is expanded.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.commandbarflyout.secondarycommands
     * @type {IObservableVector<ICommandBarElement>} 
     */
    SecondaryCommands {
        get => this.get_SecondaryCommands()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IObservableVector<ICommandBarElement>} 
     */
    get_PrimaryCommands() {
        if (!this.HasProp("__ICommandBarFlyout")) {
            if ((queryResult := this.QueryInterface(ICommandBarFlyout.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommandBarFlyout := ICommandBarFlyout(outPtr)
        }

        return this.__ICommandBarFlyout.get_PrimaryCommands()
    }

    /**
     * 
     * @returns {IObservableVector<ICommandBarElement>} 
     */
    get_SecondaryCommands() {
        if (!this.HasProp("__ICommandBarFlyout")) {
            if ((queryResult := this.QueryInterface(ICommandBarFlyout.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommandBarFlyout := ICommandBarFlyout(outPtr)
        }

        return this.__ICommandBarFlyout.get_SecondaryCommands()
    }

;@endregion Instance Methods
}
