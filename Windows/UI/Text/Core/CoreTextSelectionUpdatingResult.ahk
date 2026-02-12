#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the result of handling the [SelectionUpdating](coretexteditcontext_selectionupdating.md) event.
 * @remarks
 * This enumeration is used by the [CoreTextSelectionUpdatingEventArgs.Result](coretextselectionupdatingeventargs_result.md) property. The default is **Succeeded**.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.text.core.coretextselectionupdatingresult
 * @namespace Windows.UI.Text.Core
 * @version WindowsRuntime 1.4
 */
class CoreTextSelectionUpdatingResult extends Win32Enum{

    /**
     * The selection update operation completed successfully.
     * @type {Integer (Int32)}
     */
    static Succeeded => 0

    /**
     * The selection update operation was not completed as the text input server expected.
     * @type {Integer (Int32)}
     */
    static Failed => 1
}
