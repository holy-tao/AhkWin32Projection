#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes how the data propagates in a binding.
 * @remarks
 * For **OneWay** and **TwoWay** bindings, dynamic changes to the source don't automatically propagate to the target. You must implement the [INotifyPropertyChanged](inotifypropertychanged.md) interface on the source object for this to happen.
 * 
 * For **TwoWay** bindings, changes to the target automatically propagate to the source, except if the binding target is the [Text](../windows.ui.xaml.controls/textbox_text.md) property. In that case, the update happens only when the [TextBox](../windows.ui.xaml.controls/textbox.md) loses focus.
 * 
 * For **OneTime** and **OneWay** bindings, calls to [DependencyObject.SetValue](../windows.ui.xaml/dependencyobject_setvalue_52578133.md) automatically change the target value and delete the binding.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.data.bindingmode
 * @namespace Windows.UI.Xaml.Data
 * @version WindowsRuntime 1.4
 */
class BindingMode extends Win32Enum{

    /**
     * Updates the target property when the binding is created. Changes to the source object can also propagate to the target.
     * @type {Integer (Int32)}
     */
    static OneWay => 1

    /**
     * Updates the target property when the binding is created.
     * @type {Integer (Int32)}
     */
    static OneTime => 2

    /**
     * Updates either the target or the source object when either changes. When the binding is created, the target property is updated from the source.
     * @type {Integer (Int32)}
     */
    static TwoWay => 3
}
