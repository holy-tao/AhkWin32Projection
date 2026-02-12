#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates what input should be redirected to the InteractionTracker.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.visualinteractionsourceredirectionmode
 * @namespace Windows.UI.Composition.Interactions
 * @version WindowsRuntime 1.4
 */
class VisualInteractionSourceRedirectionMode extends Win32Enum{

    /**
     * Redirection is off, all input goes to the UI thread.
     * @type {Integer (Int32)}
     */
    static Off => 0

    /**
     * Pointer input goes to the UI thread, Precision Touchpad input goes to the compositor.
     * @type {Integer (Int32)}
     */
    static CapableTouchpadOnly => 1

    /**
     * Pointer input goes to the UI thread, mouse wheel input goes to the compositor.
     * @type {Integer (Int32)}
     */
    static PointerWheelOnly => 2

    /**
     * Pointer input goes to the UI thread, Precision Touchpad and mouse wheel input goes to the compositor.
     * @type {Integer (Int32)}
     */
    static CapableTouchpadAndPointerWheel => 3
}
