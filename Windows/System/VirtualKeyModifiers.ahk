#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32Enum.ahk

/**
 * Specifies the virtual key used to modify another keypress. For example, the Ctrl key when pressed in conjunction with another key, as in Ctrl+C.
 * @remarks
 * This enum is used with the [Modifiers](../windows.ui.xaml.input/keyboardaccelerator_modifiers.md) property of a [KeyboardAccelerator](../windows.ui.xaml.input/keyboardaccelerator.md) object. For more information, including code examples, see [Keyboard Accelerators](/windows/uwp/design/input/keyboard-accelerators).
 * @see https://learn.microsoft.com/uwp/api/windows.system.virtualkeymodifiers
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class VirtualKeyModifiers extends Win32BitflagEnum{

    /**
     * No virtual key modifier.
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * The Ctrl virtual key.
     * @type {Integer (UInt32)}
     */
    static Control => 1

    /**
     * The Alt virtual key.
     * @type {Integer (UInt32)}
     */
    static Menu => 2

    /**
     * The Shift virtual key.
     * @type {Integer (UInt32)}
     */
    static Shift => 4

    /**
     * The Windows virtual key.
     * @type {Integer (UInt32)}
     */
    static Windows => 8
}
