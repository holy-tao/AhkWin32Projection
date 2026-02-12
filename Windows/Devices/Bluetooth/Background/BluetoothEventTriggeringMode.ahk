#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * This enumeration represents a Bluetooth background event triggering mode.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.background.bluetootheventtriggeringmode
 * @namespace Windows.Devices.Bluetooth.Background
 * @version WindowsRuntime 1.4
 */
class BluetoothEventTriggeringMode extends Win32Enum{

    /**
     * The triggering method is serial.
     * @type {Integer (Int32)}
     */
    static Serial => 0

    /**
     * The triggering mode is batch.
     * @type {Integer (Int32)}
     */
    static Batch => 1

    /**
     * The triggering mode is keep latest.
     * @type {Integer (Int32)}
     */
    static KeepLatest => 2
}
