#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Represents the key modifiers applied to a drag and drop operation. Zero or more modifiers can be included.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.dragdrop.dragdropmodifiers
 * @namespace Windows.ApplicationModel.DataTransfer.DragDrop
 * @version WindowsRuntime 1.4
 */
class DragDropModifiers extends Win32BitflagEnum{

    /**
     * No modifiers.
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * The shift key.
     * @type {Integer (UInt32)}
     */
    static Shift => 1

    /**
     * The control key.
     * @type {Integer (UInt32)}
     */
    static Control => 2

    /**
     * The alt key.
     * @type {Integer (UInt32)}
     */
    static Alt => 4

    /**
     * The left mouse button.
     * @type {Integer (UInt32)}
     */
    static LeftButton => 8

    /**
     * The middle mouse button.
     * @type {Integer (UInt32)}
     */
    static MiddleButton => 16

    /**
     * The right mouse button.
     * @type {Integer (UInt32)}
     */
    static RightButton => 32
}
