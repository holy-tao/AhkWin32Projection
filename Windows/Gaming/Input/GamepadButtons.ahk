#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the button type.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.gamepadbuttons
 * @namespace Windows.Gaming.Input
 * @version WindowsRuntime 1.4
 */
class GamepadButtons extends Win32BitflagEnum{

    /**
     * No button.
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * Menu button.
     * @type {Integer (UInt32)}
     */
    static Menu => 1

    /**
     * View button.
     * @type {Integer (UInt32)}
     */
    static View => 2

    /**
     * A button.
     * @type {Integer (UInt32)}
     */
    static A => 4

    /**
     * B button.
     * @type {Integer (UInt32)}
     */
    static B => 8

    /**
     * X button.
     * @type {Integer (UInt32)}
     */
    static X => 16

    /**
     * Y button.
     * @type {Integer (UInt32)}
     */
    static Y => 32

    /**
     * D-pad up.
     * @type {Integer (UInt32)}
     */
    static DPadUp => 64

    /**
     * D-pad down.
     * @type {Integer (UInt32)}
     */
    static DPadDown => 128

    /**
     * D-pad left.
     * @type {Integer (UInt32)}
     */
    static DPadLeft => 256

    /**
     * D-pad right.
     * @type {Integer (UInt32)}
     */
    static DPadRight => 512

    /**
     * Left bumper.
     * @type {Integer (UInt32)}
     */
    static LeftShoulder => 1024

    /**
     * Right bumper.
     * @type {Integer (UInt32)}
     */
    static RightShoulder => 2048

    /**
     * Left stick.
     * @type {Integer (UInt32)}
     */
    static LeftThumbstick => 4096

    /**
     * Right stick.
     * @type {Integer (UInt32)}
     */
    static RightThumbstick => 8192

    /**
     * The first paddle.
     * @type {Integer (UInt32)}
     */
    static Paddle1 => 16384

    /**
     * The second paddle.
     * @type {Integer (UInt32)}
     */
    static Paddle2 => 32768

    /**
     * The third paddle.
     * @type {Integer (UInt32)}
     */
    static Paddle3 => 65536

    /**
     * The fourth paddle.
     * @type {Integer (UInt32)}
     */
    static Paddle4 => 131072
}
