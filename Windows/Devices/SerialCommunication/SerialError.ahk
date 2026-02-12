#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines values for error conditions that can occur on the serial port.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.serialcommunication.serialerror
 * @namespace Windows.Devices.SerialCommunication
 * @version WindowsRuntime 1.4
 */
class SerialError extends Win32Enum{

    /**
     * The hardware detected a framing error.
     * @type {Integer (Int32)}
     */
    static Frame => 0

    /**
     * A character-buffer overrun has occurred. The next character is lost.
     * @type {Integer (Int32)}
     */
    static BufferOverrun => 1

    /**
     * An input buffer overflow has occurred. There is either no room in the input buffer, or a character was received after the end-of-file (EOF) character.
     * @type {Integer (Int32)}
     */
    static ReceiveFull => 2

    /**
     * The hardware detected a parity error.
     * @type {Integer (Int32)}
     */
    static ReceiveParity => 3

    /**
     * The application tried to transmit a character, but the output buffer was full.
     * @type {Integer (Int32)}
     */
    static TransmitFull => 4
}
