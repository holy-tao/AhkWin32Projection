#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies additional buttons that may be available on a controller that appears as a navigation controller.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.optionaluinavigationbuttons
 * @namespace Windows.Gaming.Input
 * @version WindowsRuntime 1.4
 */
class OptionalUINavigationButtons extends Win32BitflagEnum{

    /**
     * No buttons.
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * Context1 button.
     * @type {Integer (UInt32)}
     */
    static Context1 => 1

    /**
     * Context2 button.
     * @type {Integer (UInt32)}
     */
    static Context2 => 2

    /**
     * Context3 button.
     * @type {Integer (UInt32)}
     */
    static Context3 => 4

    /**
     * Context4 button.
     * @type {Integer (UInt32)}
     */
    static Context4 => 8

    /**
     * Page up button.
     * @type {Integer (UInt32)}
     */
    static PageUp => 16

    /**
     * Page down button.
     * @type {Integer (UInt32)}
     */
    static PageDown => 32

    /**
     * Page left button.
     * @type {Integer (UInt32)}
     */
    static PageLeft => 64

    /**
     * Page right button.
     * @type {Integer (UInt32)}
     */
    static PageRight => 128

    /**
     * Scroll up button.
     * @type {Integer (UInt32)}
     */
    static ScrollUp => 256

    /**
     * Scroll down button.
     * @type {Integer (UInt32)}
     */
    static ScrollDown => 512

    /**
     * Scroll left button.
     * @type {Integer (UInt32)}
     */
    static ScrollLeft => 1024

    /**
     * Scroll right button.
     * @type {Integer (UInt32)}
     */
    static ScrollRight => 2048
}
