#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Identifies the type of UDP message.
 * @see https://learn.microsoft.com/windows/win32/api/wsdbase/ne-wsdbase-wsdudpmessagetype
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 */
export default struct WSDUdpMessageType {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
