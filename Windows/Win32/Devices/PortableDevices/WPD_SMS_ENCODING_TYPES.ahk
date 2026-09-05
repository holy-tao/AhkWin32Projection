#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The WPD\_SMS\_ENCODING\_TYPES enumeration type describes the encoding type of a short message service (SMS) message.
 * @remarks
 * This enumeration is used by the [WPD\_SMS\_ENCODING](sms-properties.md) property.
 * @see https://learn.microsoft.com/windows/win32/wpd_sdk/wpd-sms-encoding-types
 * @namespace Windows.Win32.Devices.PortableDevices
 */
class WPD_SMS_ENCODING_TYPES extends Win32Enum {

    /**
     * Native name: SMS_ENCODING_7_BIT
     * @type {Integer (Int32)}
     */
    static 7_BIT => 0

    /**
     * Native name: SMS_ENCODING_8_BIT
     * @type {Integer (Int32)}
     */
    static 8_BIT => 1

    /**
     * Native name: SMS_ENCODING_UTF_16
     * @type {Integer (Int32)}
     */
    static UTF_16 => 2
}
