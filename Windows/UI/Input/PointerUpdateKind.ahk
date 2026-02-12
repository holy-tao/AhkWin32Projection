#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the types of pointer updates that are supported by an application.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.pointerupdatekind
 * @namespace Windows.UI.Input
 * @version WindowsRuntime 1.4
 */
class PointerUpdateKind extends Win32Enum{

    /**
     * Pointer updates not identified by other PointerUpdateKind values.
     * @type {Integer (Int32)}
     */
    static Other => 0

    /**
     * Left button pressed.
     * @type {Integer (Int32)}
     */
    static LeftButtonPressed => 1

    /**
     * Left button released.
     * @type {Integer (Int32)}
     */
    static LeftButtonReleased => 2

    /**
     * Right button pressed.
     * @type {Integer (Int32)}
     */
    static RightButtonPressed => 3

    /**
     * Right button released.
     * @type {Integer (Int32)}
     */
    static RightButtonReleased => 4

    /**
     * Middle button pressed.
     * @type {Integer (Int32)}
     */
    static MiddleButtonPressed => 5

    /**
     * Middle button released.
     * @type {Integer (Int32)}
     */
    static MiddleButtonReleased => 6

    /**
     * XBUTTON1 pressed.
     * @type {Integer (Int32)}
     */
    static XButton1Pressed => 7

    /**
     * XBUTTON1 released.
     * @type {Integer (Int32)}
     */
    static XButton1Released => 8

    /**
     * XBUTTON2 pressed.
     * @type {Integer (Int32)}
     */
    static XButton2Pressed => 9

    /**
     * XBUTTON2 released.
     * @type {Integer (Int32)}
     */
    static XButton2Released => 10
}
