#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * This enumerated type specifies the message class of a message. The message class typically originates on the network, not the mobile device.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators, mobile broadband adapter IHV, or OEM. For more information, see [Mobile Broadband](/windows-hardware/drivers/mobilebroadband/index).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsmessageclass
 * @namespace Windows.Devices.Sms
 * @version WindowsRuntime 1.4
 */
class SmsMessageClass extends Win32Enum{

    /**
     * No class was specified.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Message should be immediately displayed.
     * @type {Integer (Int32)}
     */
    static Class0 => 1

    /**
     * Mobile equipment (ME) specific message.
     * @type {Integer (Int32)}
     */
    static Class1 => 2

    /**
     * SIM specific message.
     * @type {Integer (Int32)}
     */
    static Class2 => 3

    /**
     * Terminal equipment (TE) specific message. Note that this message type is not currently supported.
     * @type {Integer (Int32)}
     */
    static Class3 => 4
}
