#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\DependencyObject.ahk
#Include .\IFrameworkTemplate.ahk
#Include ..\..\..\Guid.ahk

/**
 * Creates an element tree of elements. FrameworkTemplate is a base class for classes that have specific templating behavior, including [ControlTemplate](../windows.ui.xaml.controls/controltemplate.md) and [DataTemplate](datatemplate.md).
 * @remarks
 * FrameworkTemplate has a [ContentPropertyAttribute](../windows.ui.xaml.markup/contentpropertyattribute.md) that indicates that its XAML content property is named "Template". FrameworkTemplate doesn't define a property of that name, nor do its derived types that have a practical usage ([ControlTemplate](../windows.ui.xaml.controls/controltemplate.md), [DataTemplate](datatemplate.md)). The content of a FrameworkTemplate is a root element that should be created when the template is applied to the object being templated, and isn't a conventional property in the object model. Content of a FrameworkTemplate is handled specially by the XAML parser when content is created from a template.
 * 
 * For more info on how to use templates, see [ControlTemplate](../windows.ui.xaml.controls/controltemplate.md) and [Quickstart: Control templates](/previous-versions/windows/apps/hh465374(v=win.10)).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.frameworktemplate
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class FrameworkTemplate extends DependencyObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IFrameworkTemplate

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IFrameworkTemplate.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
