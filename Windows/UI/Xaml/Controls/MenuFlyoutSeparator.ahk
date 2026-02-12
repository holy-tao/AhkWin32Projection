#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\MenuFlyoutItemBase.ahk
#Include .\IMenuFlyoutSeparator.ahk
#Include .\IMenuFlyoutSeparatorFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a horizontal line that separates items in an [MenuFlyout](menuflyout.md).
 * @remarks
 * There are three elements that you can use to compose the menu items in a [MenuFlyout](menuflyout.md) control: [MenuFlyoutItem](menuflyoutitem.md) , [ToggleMenuFlyoutItem](togglemenuflyoutitem.md), and MenuFlyoutSeparator. You can use these in any combination. MenuFlyoutSeparator is typically placed between groups of items in a [MenuFlyout](menuflyout.md). The MenuFlyoutSeparator has no other attributes when you set it in XAML.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.menuflyoutseparator
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class MenuFlyoutSeparator extends MenuFlyoutItemBase {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMenuFlyoutSeparator

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMenuFlyoutSeparator.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {MenuFlyoutSeparator} 
     */
    static CreateInstance() {
        if (!MenuFlyoutSeparator.HasProp("__IMenuFlyoutSeparatorFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.MenuFlyoutSeparator")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMenuFlyoutSeparatorFactory.IID)
            MenuFlyoutSeparator.__IMenuFlyoutSeparatorFactory := IMenuFlyoutSeparatorFactory(factoryPtr)
        }

        return MenuFlyoutSeparator.__IMenuFlyoutSeparatorFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
