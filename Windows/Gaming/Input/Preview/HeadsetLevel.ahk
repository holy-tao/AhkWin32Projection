#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates levels of variable settings like volume for headsets.
 * @remarks
 * > [!CAUTION]
 * > To avoid damaging devices, the headset control APIs should only be used with hardware you have developed.
 * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.preview.headsetlevel
 * @namespace Windows.Gaming.Input.Preview
 * @version WindowsRuntime 1.4
 */
class HeadsetLevel extends Win32Enum{

    /**
     * The level is off.
     * @type {Integer (Int32)}
     */
    static Off => 0

    /**
     * The level is low.
     * @type {Integer (Int32)}
     */
    static Low => 1

    /**
     * The level is medium.
     * @type {Integer (Int32)}
     */
    static Medium => 2

    /**
     * The level is high.
     * @type {Integer (Int32)}
     */
    static High => 3
}
