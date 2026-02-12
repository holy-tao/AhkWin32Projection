#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The state of firmware corruption for a device.
 * @remarks
 * > [!CAUTION]
 * > To avoid damaging devices, the firmware corruption and update APIs should only be used with hardware you have developed.
 * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.preview.gamecontrollerfirmwarecorruptreason
 * @namespace Windows.Gaming.Input.Preview
 * @version WindowsRuntime 1.4
 */
class GameControllerFirmwareCorruptReason extends Win32Enum{

    /**
     * It is not known whether firmware is corrupt.
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * The firmware is not corrupt.
     * @type {Integer (Int32)}
     */
    static NotCorrupt => 1

    /**
     * The 2Up firmware is corrupt.
     * @type {Integer (Int32)}
     */
    static TwoUpCorrupt => 2

    /**
     * The app firmware is corrupt.
     * @type {Integer (Int32)}
     */
    static AppCorrupt => 3

    /**
     * The radio firmware is corrupt.
     * @type {Integer (Int32)}
     */
    static RadioCorrupt => 4

    /**
     * The EEPROM is corrupt.
     * @type {Integer (Int32)}
     */
    static EepromCorrupt => 5

    /**
     * The firmware can be safely updated to recover from corruption.
     * @type {Integer (Int32)}
     */
    static SafeToUpdate => 6
}
