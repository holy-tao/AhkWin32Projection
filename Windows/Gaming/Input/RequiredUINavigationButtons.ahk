#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the buttons that are required to be available on a controller that appears as a navigation controller.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.requireduinavigationbuttons
 * @namespace Windows.Gaming.Input
 * @version WindowsRuntime 1.4
 */
class RequiredUINavigationButtons extends Win32BitflagEnum{

    /**
     * No required buttons.
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * Menu button is required.
     * @type {Integer (UInt32)}
     */
    static Menu => 1

    /**
     * View button is required.
     * @type {Integer (UInt32)}
     */
    static View => 2

    /**
     * Accept button is required.
     * @type {Integer (UInt32)}
     */
    static Accept => 4

    /**
     * Cancel button is required.
     * @type {Integer (UInt32)}
     */
    static Cancel => 8

    /**
     * Up button is required.
     * @type {Integer (UInt32)}
     */
    static Up => 16

    /**
     * Down button is required.
     * @type {Integer (UInt32)}
     */
    static Down => 32

    /**
     * Left button is required.
     * @type {Integer (UInt32)}
     */
    static Left => 64

    /**
     * Right button is required.
     * @type {Integer (UInt32)}
     */
    static Right => 128
}
