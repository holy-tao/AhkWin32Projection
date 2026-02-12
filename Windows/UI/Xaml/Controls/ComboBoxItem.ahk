#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include Primitives\SelectorItem.ahk
#Include .\IComboBoxItem.ahk
#Include .\IComboBoxItemFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the container for an item in a [ComboBox](combobox.md) control.
 * @remarks
 * The ComboBoxItem class provides the container for items displayed in a [ComboBox](combobox.md) control. You populate the [ComboBox](combobox.md) by adding objects directly to its [Items](itemscontrol_items.md) collection or by binding its [ItemsSource](itemscontrol_itemssource.md) property to a data source. When items are added to the [ComboBox](combobox.md), a ComboBoxItem container is created automatically for each item in the collection.
 * 
 * You can specify the look of the ComboBoxItem by setting the [ComboBox](combobox.md)'s [ItemContainerStyle](itemscontrol_itemcontainerstyle.md) property to a [Style](../windows.ui.xaml/style.md) with a [TargetType](../windows.ui.xaml/style_targettype.md) of ComboBoxItem.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.comboboxitem
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ComboBoxItem extends SelectorItem {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IComboBoxItem

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IComboBoxItem.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {ComboBoxItem} 
     */
    static CreateInstance() {
        if (!ComboBoxItem.HasProp("__IComboBoxItemFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ComboBoxItem")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IComboBoxItemFactory.IID)
            ComboBoxItem.__IComboBoxItemFactory := IComboBoxItemFactory(factoryPtr)
        }

        return ComboBoxItem.__IComboBoxItemFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
