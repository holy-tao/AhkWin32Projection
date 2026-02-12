#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Declares where the header is placed in relation to the items in an items grouping control.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.groupheaderplacement
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class GroupHeaderPlacement extends Win32Enum{

    /**
     * Header appears on top of items.
     * @type {Integer (Int32)}
     */
    static Top => 0

    /**
     * Header appears to the left of items.
     * @type {Integer (Int32)}
     */
    static Left => 1
}
