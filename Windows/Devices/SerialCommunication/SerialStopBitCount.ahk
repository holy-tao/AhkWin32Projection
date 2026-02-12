#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines values that indicate the number of stop bits used in a transmission. The values are used by the [StopBits](serialdevice_stopbits.md) property on the [SerialDevice](serialdevice.md) object.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.serialcommunication.serialstopbitcount
 * @namespace Windows.Devices.SerialCommunication
 * @version WindowsRuntime 1.4
 */
class SerialStopBitCount extends Win32Enum{

    /**
     * One stop bit is used.
     * @type {Integer (Int32)}
     */
    static One => 0

    /**
     * 1.5 stop bits are used.
     * @type {Integer (Int32)}
     */
    static OnePointFive => 1

    /**
     * Two stop bits are used.
     * @type {Integer (Int32)}
     */
    static Two => 2
}
