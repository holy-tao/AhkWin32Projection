#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the kind of jump list item.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.startscreen.jumplistitemkind
 * @namespace Windows.UI.StartScreen
 * @version WindowsRuntime 1.4
 */
class JumpListItemKind extends Win32Enum{

    /**
     * Indicates a jump list item that includes arguments.
     * @type {Integer (Int32)}
     */
    static Arguments => 0

    /**
     * Indicates a jump list item that is an inert separator within a custom jump list item group.
     * @type {Integer (Int32)}
     */
    static Separator => 1
}
