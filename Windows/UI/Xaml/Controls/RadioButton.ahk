#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include Primitives\ToggleButton.ahk
#Include .\IRadioButton.ahk
#Include .\IRadioButtonFactory.ahk
#Include .\IRadioButtonStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a button that allows a user to select a single option from a group of options.
 * @remarks
 * > [!TIP]
 * > For more info, design guidance, and code examples, see [Radio buttons](/windows/uwp/design/controls-and-patterns/radio-button).
 * 
 * Use RadioButton controls to limit a user's selection to a single choice within a set of related, but mutually exclusive, choices. You group RadioButton controls by putting them inside the same parent container or by setting the [GroupName](radiobutton_groupname.md) property on each RadioButton to the same value.
 * 
 * <img alt="Radio button controls" src="images/controls/RadioButton.png" />
 * 
 * A RadioButton has two states: selected or cleared. When a RadioButton is selected, its [IsChecked](../windows.ui.xaml.controls.primitives/togglebutton_ischecked.md) property is **true**. When a RadioButton is cleared, its [IsChecked](../windows.ui.xaml.controls.primitives/togglebutton_ischecked.md) property is **false**. A RadioButton can be cleared by clicking another RadioButton in the same group, but it cannot be cleared by clicking it again. However, a RadioButton can be cleared programmatically by setting its [IsChecked](../windows.ui.xaml.controls.primitives/togglebutton_ischecked.md) property to **false**.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.radiobutton
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class RadioButton extends ToggleButton {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRadioButton

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRadioButton.IID

    /**
     * Identifies the [GroupName](radiobutton_groupname.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.radiobutton.groupnameproperty
     * @type {DependencyProperty} 
     */
    static GroupNameProperty {
        get => RadioButton.get_GroupNameProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {RadioButton} 
     */
    static CreateInstance() {
        if (!RadioButton.HasProp("__IRadioButtonFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RadioButton")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRadioButtonFactory.IID)
            RadioButton.__IRadioButtonFactory := IRadioButtonFactory(factoryPtr)
        }

        return RadioButton.__IRadioButtonFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_GroupNameProperty() {
        if (!RadioButton.HasProp("__IRadioButtonStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RadioButton")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRadioButtonStatics.IID)
            RadioButton.__IRadioButtonStatics := IRadioButtonStatics(factoryPtr)
        }

        return RadioButton.__IRadioButtonStatics.get_GroupNameProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the name that specifies which [RadioButton](radiobutton.md) controls are mutually exclusive.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.radiobutton.groupname
     * @type {HSTRING} 
     */
    GroupName {
        get => this.get_GroupName()
        set => this.put_GroupName(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_GroupName() {
        if (!this.HasProp("__IRadioButton")) {
            if ((queryResult := this.QueryInterface(IRadioButton.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRadioButton := IRadioButton(outPtr)
        }

        return this.__IRadioButton.get_GroupName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_GroupName(value) {
        if (!this.HasProp("__IRadioButton")) {
            if ((queryResult := this.QueryInterface(IRadioButton.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRadioButton := IRadioButton(outPtr)
        }

        return this.__IRadioButton.put_GroupName(value)
    }

;@endregion Instance Methods
}
