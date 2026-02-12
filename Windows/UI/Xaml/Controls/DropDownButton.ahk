#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Button.ahk
#Include .\IDropDownButton.ahk
#Include .\IDropDownButtonFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a button with a chevron intended to open a menu.
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.DropDownButton](/windows/winui/api/microsoft.ui.xaml.controls.dropdownbutton) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @remarks
 * A DropDownButton is a button that shows a chevron as a visual indicator that it has an attached flyout that contains more options. It has the same behavior as a standard Button with a flyout; only the appearance is different.
 * 
 * For more info and examples, see [Buttons](/windows/apps/design/controls/buttons#create-a-drop-down-button).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.dropdownbutton
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class DropDownButton extends Button {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDropDownButton

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDropDownButton.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DropDownButton} 
     */
    static CreateInstance() {
        if (!DropDownButton.HasProp("__IDropDownButtonFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.DropDownButton")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDropDownButtonFactory.IID)
            DropDownButton.__IDropDownButtonFactory := IDropDownButtonFactory(factoryPtr)
        }

        return DropDownButton.__IDropDownButtonFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
