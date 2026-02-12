#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the result of handling the [TextUpdating](coretexteditcontext_textupdating.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.text.core.coretexttextupdatingresult
 * @namespace Windows.UI.Text.Core
 * @version WindowsRuntime 1.4
 */
class CoreTextTextUpdatingResult extends Win32Enum{

    /**
     * The text update operation completed successfully.
     * @type {Integer (Int32)}
     */
    static Succeeded => 0

    /**
     * The text update operation was not completed as the text input server expected. The state of the text input control is unchanged.
     * @type {Integer (Int32)}
     */
    static Failed => 1
}
