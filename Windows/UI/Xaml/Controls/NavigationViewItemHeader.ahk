#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\NavigationViewItemBase.ahk
#Include .\INavigationViewItemHeader.ahk
#Include .\INavigationViewItemHeaderFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a header for a group of menu items in a NavigationMenu.
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationViewItemHeader](/windows/winui/api/microsoft.ui.xaml.controls.navigationviewitemheader) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationviewitemheader
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class NavigationViewItemHeader extends NavigationViewItemBase {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => INavigationViewItemHeader

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => INavigationViewItemHeader.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {NavigationViewItemHeader} 
     */
    static CreateInstance() {
        if (!NavigationViewItemHeader.HasProp("__INavigationViewItemHeaderFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.NavigationViewItemHeader")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INavigationViewItemHeaderFactory.IID)
            NavigationViewItemHeader.__INavigationViewItemHeaderFactory := INavigationViewItemHeaderFactory(factoryPtr)
        }

        return NavigationViewItemHeader.__INavigationViewItemHeaderFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
