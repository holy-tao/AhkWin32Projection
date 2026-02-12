#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the type of text edit change.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.automationtexteditchangetype
 * @namespace Windows.UI.Xaml.Automation
 * @version WindowsRuntime 1.4
 */
class AutomationTextEditChangeType extends Win32Enum{

    /**
     * Not related to a specific change type.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Change is from an auto-correct action performed by a control.
     * @type {Integer (Int32)}
     */
    static AutoCorrect => 1

    /**
     * Change is from an IME active composition within a control.
     * @type {Integer (Int32)}
     */
    static Composition => 2

    /**
     * Change is from an IME composition going from active to finalized state within a control.
     * @type {Integer (Int32)}
     */
    static CompositionFinalized => 3
}
