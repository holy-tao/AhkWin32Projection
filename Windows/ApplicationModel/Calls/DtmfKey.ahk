#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify a keypad dual tone multi-frequency (DTMF) key. Allows you to directly send DTMF keys to a phone call.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.dtmfkey
 * @namespace Windows.ApplicationModel.Calls
 * @version WindowsRuntime 1.4
 */
class DtmfKey extends Win32Enum{

    /**
     * Specifies the digit 0 key on the dialpad.
     * @type {Integer (Int32)}
     */
    static D0 => 0

    /**
     * Specifies the digit 1 key on the dialpad.
     * @type {Integer (Int32)}
     */
    static D1 => 1

    /**
     * Specifies the digit 2 key on the dialpad.
     * @type {Integer (Int32)}
     */
    static D2 => 2

    /**
     * Specifies the digit 3 key on the dialpad.
     * @type {Integer (Int32)}
     */
    static D3 => 3

    /**
     * Specifies the digit 4 key on the dialpad.
     * @type {Integer (Int32)}
     */
    static D4 => 4

    /**
     * Specifies the digit 5 key on the dialpad.
     * @type {Integer (Int32)}
     */
    static D5 => 5

    /**
     * Specifies the digit 6 key on the dialpad.
     * @type {Integer (Int32)}
     */
    static D6 => 6

    /**
     * Specifies the digit 7 key on the dialpad.
     * @type {Integer (Int32)}
     */
    static D7 => 7

    /**
     * Specifies the digit 8 key on the dialpad.
     * @type {Integer (Int32)}
     */
    static D8 => 8

    /**
     * Specifies the digit 9 key on the dialpad.
     * @type {Integer (Int32)}
     */
    static D9 => 9

    /**
     * Specifies the star, or asterisk, key on the dialpad (*).
     * @type {Integer (Int32)}
     */
    static Star => 10

    /**
     * Specifies the pound, or number, key on the dialpad (#).
     * @type {Integer (Int32)}
     */
    static Pound => 11
}
