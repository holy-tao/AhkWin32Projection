#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Control.ahk
#Include .\IMenuFlyoutItemBase.ahk
#Include .\IMenuFlyoutItemBaseFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the base class for items in a [MenuFlyout](menuflyout.md) control.
 * @remarks
 * There are three elements that you can use to compose the menu items in a [MenuFlyout](menuflyout.md) control: [MenuFlyoutItem](menuflyoutitem.md) , [ToggleMenuFlyoutItem](togglemenuflyoutitem.md), and [MenuFlyoutSeparator](menuflyoutseparator.md). You can use these in any combination.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.menuflyoutitembase
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class MenuFlyoutItemBase extends Control {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMenuFlyoutItemBase

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMenuFlyoutItemBase.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
