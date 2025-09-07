#Requires AutoHotkey v2.0.0 64-bit

/**
 * Identifies the type of UDP message.
 * @see https://learn.microsoft.com/windows/win32/api/wsdbase/ne-wsdbase-wsdudpmessagetype
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 * @version v4.0.30319
 */
class WSDUdpMessageType{

    /**
     * The message is a one-way UDP message without a corresponding response. Hello and Bye messages are one-way messages.
     * @type {Integer (Int32)}
     */
    static ONE_WAY => 0

    /**
     * The message is a two-way UDP message with a corresponding response. Probe and Resolve messages are two-way messages.
     * @type {Integer (Int32)}
     */
    static TWO_WAY => 1
}
