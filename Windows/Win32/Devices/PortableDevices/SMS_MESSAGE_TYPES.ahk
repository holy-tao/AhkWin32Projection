#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The SMS\_MESSAGE\_TYPES enumeration type describes the content type of a short message service (SMS) message.
 * @remarks
 * This enumeration is used by the [**WPD\_COMMAND\_SMS\_SEND Command**](wpd-command-sms-send-command.md).
 * @see https://learn.microsoft.com/windows/win32/wpd_sdk/sms-message-types
 * @namespace Windows.Win32.Devices.PortableDevices
 * @version v4.0.30319
 */
class SMS_MESSAGE_TYPES extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SMS_TEXT_MESSAGE => 0

    /**
     * @type {Integer (Int32)}
     */
    static SMS_BINARY_MESSAGE => 1
}
