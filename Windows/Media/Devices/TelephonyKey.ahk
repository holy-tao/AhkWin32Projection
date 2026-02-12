#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Indicates the keypad button that was pressed on a telephony device.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.devices.telephonykey
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class TelephonyKey extends Win32Enum{

    /**
     * The "0" keypad button.
     * @type {Integer (Int32)}
     */
    static D0 => 0

    /**
     * The "1" keypad button.
     * @type {Integer (Int32)}
     */
    static D1 => 1

    /**
     * The "2" keypad button.
     * @type {Integer (Int32)}
     */
    static D2 => 2

    /**
     * The "3" keypad button.
     * @type {Integer (Int32)}
     */
    static D3 => 3

    /**
     * The "4" keypad button.
     * @type {Integer (Int32)}
     */
    static D4 => 4

    /**
     * The "5" keypad button.
     * @type {Integer (Int32)}
     */
    static D5 => 5

    /**
     * The "6" keypad button.
     * @type {Integer (Int32)}
     */
    static D6 => 6

    /**
     * The "7" keypad button.
     * @type {Integer (Int32)}
     */
    static D7 => 7

    /**
     * The "8" keypad button.
     * @type {Integer (Int32)}
     */
    static D8 => 8

    /**
     * The "9" keypad button.
     * @type {Integer (Int32)}
     */
    static D9 => 9

    /**
     * The "*" keypad button.
     * @type {Integer (Int32)}
     */
    static Star => 10

    /**
     * The "#" keypad button.
     * @type {Integer (Int32)}
     */
    static Pound => 11

    /**
     * Keypad button A.
     * @type {Integer (Int32)}
     */
    static A => 12

    /**
     * Keypad button B.
     * @type {Integer (Int32)}
     */
    static B => 13

    /**
     * Keypad button C.
     * @type {Integer (Int32)}
     */
    static C => 14

    /**
     * Keypad button D.
     * @type {Integer (Int32)}
     */
    static D => 15
}
