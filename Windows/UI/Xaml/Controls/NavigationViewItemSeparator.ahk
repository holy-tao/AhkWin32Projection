#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\NavigationViewItemBase.ahk
#Include .\INavigationViewItemSeparator.ahk
#Include .\INavigationViewItemSeparatorFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a line that separates menu items in a NavigationMenu.
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationViewItemSeparator](/windows/winui/api/microsoft.ui.xaml.controls.navigationviewitemseparator) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationviewitemseparator
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class NavigationViewItemSeparator extends NavigationViewItemBase {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => INavigationViewItemSeparator

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => INavigationViewItemSeparator.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {NavigationViewItemSeparator} 
     */
    static CreateInstance() {
        if (!NavigationViewItemSeparator.HasProp("__INavigationViewItemSeparatorFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.NavigationViewItemSeparator")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INavigationViewItemSeparatorFactory.IID)
            NavigationViewItemSeparator.__INavigationViewItemSeparatorFactory := INavigationViewItemSeparatorFactory(factoryPtr)
        }

        return NavigationViewItemSeparator.__INavigationViewItemSeparatorFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
