#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include Primitives\ToggleButton.ahk
#Include .\ICheckBox.ahk
#Include .\ICheckBoxFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a control that a user can select (check) or clear (uncheck). A CheckBox can also report its value as indeterminate.
 * @remarks
 * > [!TIP]
 * > For more info, design guidance, and code examples, see [Check boxes](/windows/uwp/design/controls-and-patterns/checkbox).
 * 
 * CheckBox is a control that a user can select or clear.
 * 
 * <img alt="The 3 states of a check box" src="images/controls/CheckBox_DefaultStates.png" />
 * 
 * Use the CheckBox control to provide a list of options that a user can select, such as a list of settings to apply to an application. Both CheckBox and [RadioButton](radiobutton.md) controls allow the user to select from a list of options. CheckBox controls allow the user to select a combination of options. In contrast, [RadioButton](radiobutton.md) controls allow the user to select from mutually exclusive options.
 * 
 * The CheckBox control inherits from [ToggleButton](../windows.ui.xaml.controls.primitives/togglebutton.md) and can have three states:
 * 
 * | State | Property | Value |
 * |---|---|---|
 * | checked | [IsChecked](../windows.ui.xaml.controls.primitives/togglebutton_ischecked.md) | **true** |
 * | unchecked | [IsChecked](../windows.ui.xaml.controls.primitives/togglebutton_ischecked.md) | **false** |
 * | indeterminate | [IsChecked](../windows.ui.xaml.controls.primitives/togglebutton_ischecked.md) | **null** |
 * 
 *  For the CheckBox to report the indeterminate state, you must set the [IsThreeState](../windows.ui.xaml.controls.primitives/togglebutton_isthreestate.md) property to **true**.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.checkbox
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class CheckBox extends ToggleButton {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICheckBox

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICheckBox.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {CheckBox} 
     */
    static CreateInstance() {
        if (!CheckBox.HasProp("__ICheckBoxFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.CheckBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICheckBoxFactory.IID)
            CheckBox.__ICheckBoxFactory := ICheckBoxFactory(factoryPtr)
        }

        return CheckBox.__ICheckBoxFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
