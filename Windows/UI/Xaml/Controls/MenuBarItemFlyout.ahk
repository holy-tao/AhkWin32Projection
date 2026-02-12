#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\MenuFlyout.ahk
#Include .\IMenuBarItemFlyout.ahk
#Include .\IMenuBarItemFlyoutFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the flyout of a MenuBar item.
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.MenuBarItemFlyout](/windows/winui/api/microsoft.ui.xaml.controls.menubaritemflyout) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.menubaritemflyout
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class MenuBarItemFlyout extends MenuFlyout {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMenuBarItemFlyout

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMenuBarItemFlyout.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {MenuBarItemFlyout} 
     */
    static CreateInstance() {
        if (!MenuBarItemFlyout.HasProp("__IMenuBarItemFlyoutFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MenuBarItemFlyout")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMenuBarItemFlyoutFactory.IID)
            MenuBarItemFlyout.__IMenuBarItemFlyoutFactory := IMenuBarItemFlyoutFactory(factoryPtr)
        }

        return MenuBarItemFlyout.__IMenuBarItemFlyoutFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
