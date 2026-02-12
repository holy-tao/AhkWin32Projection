#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify whether the input pane should be shown automatically when focus enters your text input control.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.text.core.coretextinputpanedisplaypolicy
 * @namespace Windows.UI.Text.Core
 * @version WindowsRuntime 1.4
 */
class CoreTextInputPaneDisplayPolicy extends Win32Enum{

    /**
     * The input pane will be shown automatically when focus enters your text input control.
     * @type {Integer (Int32)}
     */
    static Automatic => 0

    /**
     * Your app is responsible for showing and hiding the input pane.
     * @type {Integer (Int32)}
     */
    static Manual => 1
}
