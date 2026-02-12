#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the racing wheel button type.
 * @remarks
 * The assignment of buttons to the **Button#** values may change from controller to controller. They are intended to be used via a button mapping UI to assign functionality based on the user’s choices.
 * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.racingwheelbuttons
 * @namespace Windows.Gaming.Input
 * @version WindowsRuntime 1.4
 */
class RacingWheelButtons extends Win32BitflagEnum{

    /**
     * No button.
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * Gear shifted down.
     * @type {Integer (UInt32)}
     */
    static PreviousGear => 1

    /**
     * Gear shifted up.
     * @type {Integer (UInt32)}
     */
    static NextGear => 2

    /**
     * D-pad up.
     * @type {Integer (UInt32)}
     */
    static DPadUp => 4

    /**
     * D-pad down.
     * @type {Integer (UInt32)}
     */
    static DPadDown => 8

    /**
     * D-pad left.
     * @type {Integer (UInt32)}
     */
    static DPadLeft => 16

    /**
     * D-pad right.
     * @type {Integer (UInt32)}
     */
    static DPadRight => 32

    /**
     * Button 1.
     * @type {Integer (UInt32)}
     */
    static Button1 => 64

    /**
     * Button 2.
     * @type {Integer (UInt32)}
     */
    static Button2 => 128

    /**
     * Button 3.
     * @type {Integer (UInt32)}
     */
    static Button3 => 256

    /**
     * Button 4.
     * @type {Integer (UInt32)}
     */
    static Button4 => 512

    /**
     * Button 5.
     * @type {Integer (UInt32)}
     */
    static Button5 => 1024

    /**
     * Button 6.
     * @type {Integer (UInt32)}
     */
    static Button6 => 2048

    /**
     * Button 7.
     * @type {Integer (UInt32)}
     */
    static Button7 => 4096

    /**
     * Button 8.
     * @type {Integer (UInt32)}
     */
    static Button8 => 8192

    /**
     * Button 9.
     * @type {Integer (UInt32)}
     */
    static Button9 => 16384

    /**
     * Button 10.
     * @type {Integer (UInt32)}
     */
    static Button10 => 32768

    /**
     * Button 11.
     * @type {Integer (UInt32)}
     */
    static Button11 => 65536

    /**
     * Button 12.
     * @type {Integer (UInt32)}
     */
    static Button12 => 131072

    /**
     * Button 13.
     * @type {Integer (UInt32)}
     */
    static Button13 => 262144

    /**
     * Button 14.
     * @type {Integer (UInt32)}
     */
    static Button14 => 524288

    /**
     * Button 15.
     * @type {Integer (UInt32)}
     */
    static Button15 => 1048576

    /**
     * Button 16.
     * @type {Integer (UInt32)}
     */
    static Button16 => 2097152
}
