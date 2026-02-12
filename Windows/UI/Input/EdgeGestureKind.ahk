#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the type of user input that triggered the edge gesture event.
 * @remarks
 * These values are used in the [EdgeGestureEventArgs.kind](edgegestureeventargs_kind.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.edgegesturekind
 * @namespace Windows.UI.Input
 * @version WindowsRuntime 1.4
 */
class EdgeGestureKind extends Win32Enum{

    /**
     * The user made a swipe gesture on a touch-enabled screen.
     * @type {Integer (Int32)}
     */
    static Touch => 0

    /**
     * The user entered the Win+Z key sequence on the keyboard.
     * @type {Integer (Int32)}
     */
    static Keyboard => 1

    /**
     * The user performed a right mouse click.
     * @type {Integer (Int32)}
     */
    static Mouse => 2
}
