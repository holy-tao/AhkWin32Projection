#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the state of an element in the visual tree.
 * @see https://learn.microsoft.com/windows/win32/api/xamlom/ne-xamlom-visualelementstate
 * @namespace Windows.Win32.UI.Xaml.Diagnostics
 * @version v4.0.30319
 */
class VisualElementState extends Win32Enum{

    /**
     * The error has been fixed.
     * @type {Integer (Int32)}
     */
    static ErrorResolved => 0

    /**
     * The resource could not be resolved.
     * @type {Integer (Int32)}
     */
    static ErrorResourceNotFound => 1

    /**
     * The resource was found, but does not match the property.
     * @type {Integer (Int32)}
     */
    static ErrorInvalidResource => 2
}
