#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the button type for an arcade stick.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.arcadestickbuttons
 * @namespace Windows.Gaming.Input
 * @version WindowsRuntime 1.4
 */
class ArcadeStickButtons extends Win32BitflagEnum{

    /**
     * No button.
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * The stick is pressed up.
     * @type {Integer (UInt32)}
     */
    static StickUp => 1

    /**
     * The stick is pressed down.
     * @type {Integer (UInt32)}
     */
    static StickDown => 2

    /**
     * The stick is pressed left.
     * @type {Integer (UInt32)}
     */
    static StickLeft => 4

    /**
     * The stick is pressed right.
     * @type {Integer (UInt32)}
     */
    static StickRight => 8

    /**
     * The first action button.
     * @type {Integer (UInt32)}
     */
    static Action1 => 16

    /**
     * The second action button.
     * @type {Integer (UInt32)}
     */
    static Action2 => 32

    /**
     * The third action button.
     * @type {Integer (UInt32)}
     */
    static Action3 => 64

    /**
     * The fourth action button.
     * @type {Integer (UInt32)}
     */
    static Action4 => 128

    /**
     * The fifth action button.
     * @type {Integer (UInt32)}
     */
    static Action5 => 256

    /**
     * The sixth action button.
     * @type {Integer (UInt32)}
     */
    static Action6 => 512

    /**
     * The first special button.
     * @type {Integer (UInt32)}
     */
    static Special1 => 1024

    /**
     * The second special button.
     * @type {Integer (UInt32)}
     */
    static Special2 => 2048
}
