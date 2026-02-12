#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the lookup behavior for references to application resources by Uniform Resource Identifier (URI) path.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.componentresourcelocation
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class ComponentResourceLocation extends Win32Enum{

    /**
     * Lookup treats the APPXPACKAGE as the root.
     * @type {Integer (Int32)}
     */
    static Application => 0

    /**
     * Lookup expects that the resource is a nested resource of a component.
     * @type {Integer (Int32)}
     */
    static Nested => 1
}
