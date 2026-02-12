#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify whether an input should be redirected to the InteractionTracker.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.interactionsourceredirectionmode
 * @namespace Windows.UI.Composition.Interactions
 * @version WindowsRuntime 1.4
 */
class InteractionSourceRedirectionMode extends Win32Enum{

    /**
     * Redirection is off, all input goes to the UI thread.
     * @type {Integer (Int32)}
     */
    static Disabled => 0

    /**
     * Input is redirected to the InteractionTracker.
     * @type {Integer (Int32)}
     */
    static Enabled => 1
}
