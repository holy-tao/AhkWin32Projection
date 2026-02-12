#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the visibility of a programming element for which the composable attribute is applied.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.foundation.metadata.compositiontype
 * @namespace Windows.Foundation.Metadata
 * @version WindowsRuntime 1.4
 */
class CompositionType extends Win32Enum{

    /**
     * Indicates that access to the programming element is limited to other elements in the containing class or types derived from the containing class.
     * @type {Integer (Int32)}
     */
    static Protected => 1

    /**
     * Indicates that access to the programming element is not restricted.
     * @type {Integer (Int32)}
     */
    static Public => 2
}
