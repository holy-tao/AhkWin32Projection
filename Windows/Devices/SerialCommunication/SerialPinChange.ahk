#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines values for types of signal state changes on the serial port.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.serialcommunication.serialpinchange
 * @namespace Windows.Devices.SerialCommunication
 * @version WindowsRuntime 1.4
 */
class SerialPinChange extends Win32Enum{

    /**
     * Change in the break signal state.
     * @type {Integer (Int32)}
     */
    static BreakSignal => 0

    /**
     * Change in the Carrier Detect line for the port.
     * @type {Integer (Int32)}
     */
    static CarrierDetect => 1

    /**
     * Change in the Clear-to-Send line for the port.
     * @type {Integer (Int32)}
     */
    static ClearToSend => 2

    /**
     * Change in the state of the Data Set Ready (DSR) signal.
     * @type {Integer (Int32)}
     */
    static DataSetReady => 3

    /**
     * Change in the ring indicator state.
     * @type {Integer (Int32)}
     */
    static RingIndicator => 4
}
