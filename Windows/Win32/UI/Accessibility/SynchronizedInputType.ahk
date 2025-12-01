#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains values that specify the type of synchronized input.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/ne-uiautomationcore-synchronizedinputtype
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class SynchronizedInputType extends Win32BitflagEnum{

    /**
     * A key has been released.
     * @type {Integer (Int32)}
     */
    static SynchronizedInputType_KeyUp => 1

    /**
     * A key has been pressed.
     * @type {Integer (Int32)}
     */
    static SynchronizedInputType_KeyDown => 2

    /**
     * The left mouse button has been released.
     * @type {Integer (Int32)}
     */
    static SynchronizedInputType_LeftMouseUp => 4

    /**
     * The left mouse button has been pressed.
     * @type {Integer (Int32)}
     */
    static SynchronizedInputType_LeftMouseDown => 8

    /**
     * The right mouse button has been released.
     * @type {Integer (Int32)}
     */
    static SynchronizedInputType_RightMouseUp => 16

    /**
     * The right mouse button has been pressed.
     * @type {Integer (Int32)}
     */
    static SynchronizedInputType_RightMouseDown => 32
}
