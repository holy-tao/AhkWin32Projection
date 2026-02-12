#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that describe the location of the binding source relative to the position of the binding target.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.data.relativesourcemode
 * @namespace Windows.UI.Xaml.Data
 * @version WindowsRuntime 1.4
 */
class RelativeSourceMode extends Win32Enum{

    /**
     * Don't use this value of RelativeSourceMode; always use either **Self** or **TemplatedParent**.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Refers to the element to which the template (in which the data-bound element exists) is applied. This is similar to setting a TemplateBinding Markup Extension and is only applicable if the [Binding](binding.md) is within a template.
     * @type {Integer (Int32)}
     */
    static TemplatedParent => 1

    /**
     * Refers to the element on which you are setting the binding and allows you to bind one property of that element to another property on the same element.
     * @type {Integer (Int32)}
     */
    static Self => 2
}
