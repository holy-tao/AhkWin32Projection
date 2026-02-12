#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that indicate when a binding source is updated by its binding target in two-way binding.
 * @remarks
 * > [!NOTE]
 * > The default UpdateSourceTrigger value is `Default` rather than `PropertyChanged` for legacy reasons. This evaluates as a `PropertyChanged` update behavior for most dependency properties, but evaluates as `LostFocus` for the `TextBox.Text` property.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.data.updatesourcetrigger
 * @namespace Windows.UI.Xaml.Data
 * @version WindowsRuntime 1.4
 */
class UpdateSourceTrigger extends Win32Enum{

    /**
     * Use default behavior from the dependency property that uses the binding.
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * The binding source is updated whenever the binding target value changes. This is detected automatically by the binding system.
     * @type {Integer (Int32)}
     */
    static PropertyChanged => 1

    /**
     * The binding source is updated only when you call the [BindingExpression.UpdateSource](bindingexpression_updatesource_190615267.md) method. (Not supported for `x:Bind`.)
     * @type {Integer (Int32)}
     */
    static Explicit => 2

    /**
     * The binding source is updated whenever the binding target element loses focus.
     * @type {Integer (Int32)}
     */
    static LostFocus => 3
}
