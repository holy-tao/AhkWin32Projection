#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines values for the parity bit for the serial data transmission. The values are used by the [Parity](serialdevice_parity.md) property on the [SerialDevice](serialdevice.md) object.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.serialcommunication.serialparity
 * @namespace Windows.Devices.SerialCommunication
 * @version WindowsRuntime 1.4
 */
class SerialParity extends Win32Enum{

    /**
     * No parity check occurs.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Sets the parity bit so that the total count of data bits set is an odd number.
     * @type {Integer (Int32)}
     */
    static Odd => 1

    /**
     * Sets the parity bit so that the total count of data bits set is an even number.
     * @type {Integer (Int32)}
     */
    static Even => 2

    /**
     * Leaves the parity bit set to 1.
     * @type {Integer (Int32)}
     */
    static Mark => 3

    /**
     * Leaves the parity bit set to 0.
     * @type {Integer (Int32)}
     */
    static Space => 4
}
