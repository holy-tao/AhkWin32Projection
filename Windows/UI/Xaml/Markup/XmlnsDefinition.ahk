#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk

/**
 * Specifies a mapping on a per-assembly basis between a XAML namespace and a library-code namespace for backing types, which is then used for type resolution by a XAML object writer or XAML schema context.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.markup.xmlnsdefinition
 * @namespace Windows.UI.Xaml.Markup
 * @version WindowsRuntime 1.4
 */
class XmlnsDefinition extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The XAML namespace identifier specified in the attribute.
     * @type {HSTRING}
     */
    XmlNamespace{
        get {
            if(!this.HasProp("__XmlNamespace"))
                this.__XmlNamespace := HSTRING(0, this)
            return this.__XmlNamespace
        }
    }

    /**
     * The library-code namespace, specified as a string.
     * @type {HSTRING}
     */
    Namespace{
        get {
            if(!this.HasProp("__Namespace"))
                this.__Namespace := HSTRING(8, this)
            return this.__Namespace
        }
    }
}
