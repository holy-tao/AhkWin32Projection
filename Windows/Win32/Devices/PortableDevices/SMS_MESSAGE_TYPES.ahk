#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The SMS\_MESSAGE\_TYPES enumeration type describes the content type of a short message service (SMS) message.
 * @remarks
 * This enumeration is used by the [**WPD\_COMMAND\_SMS\_SEND Command**](wpd-command-sms-send-command.md).
 * @see https://learn.microsoft.com/windows/win32/wpd_sdk/sms-message-types
 * @namespace Windows.Win32.Devices.PortableDevices
 */
export default struct SMS_MESSAGE_TYPES {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static SMS_TEXT_MESSAGE => 0

    /**
     * @type {Integer (Int32)}
     */
    static SMS_BINARY_MESSAGE => 1
}
