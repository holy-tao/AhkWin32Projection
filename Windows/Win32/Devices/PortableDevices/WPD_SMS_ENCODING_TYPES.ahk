#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The WPD\_SMS\_ENCODING\_TYPES enumeration type describes the encoding type of a short message service (SMS) message.
 * @remarks
 * This enumeration is used by the [WPD\_SMS\_ENCODING](sms-properties.md) property.
 * @see https://learn.microsoft.com/windows/win32/wpd_sdk/wpd-sms-encoding-types
 * @namespace Windows.Win32.Devices.PortableDevices
 */
export default struct WPD_SMS_ENCODING_TYPES {
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
    static SMS_ENCODING_7_BIT => 0

    /**
     * @type {Integer (Int32)}
     */
    static SMS_ENCODING_8_BIT => 1

    /**
     * @type {Integer (Int32)}
     */
    static SMS_ENCODING_UTF_16 => 2
}
