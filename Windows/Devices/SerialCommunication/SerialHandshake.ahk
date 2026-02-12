#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines values for hardware and software flow control protocols used in serial communication. The values are used by [Handshake](serialdevice_handshake.md) property on the [SerialDevice](serialdevice.md) object.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.serialcommunication.serialhandshake
 * @namespace Windows.Devices.SerialCommunication
 * @version WindowsRuntime 1.4
 */
class SerialHandshake extends Win32Enum{

    /**
     * No protocol is used for the handshake.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * When the port is receiving data and if the read buffer is full, the Request-to-Send (RTS) line is set to **false**. When buffer is available, the line is set to **true**. When the serial port is transmitting data, CTS line is set to **false** and the port does not send data until there is room in the write buffer.
     * @type {Integer (Int32)}
     */
    static RequestToSend => 1

    /**
     * The serial port sends an Xoff control to inform the sender to stop sending data. When ready, the port sends an Xon control to inform he sender that the port is now ready to receive data.
     * @type {Integer (Int32)}
     */
    static XOnXOff => 2

    /**
     * Both **RequestToSend** and **XOnXOff** controls are used for flow control.
     * @type {Integer (Int32)}
     */
    static RequestToSendXOnXOff => 3
}
