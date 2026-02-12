#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * This enumerated type defines the format of the SMS message.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators, mobile broadband adapter IHV, or OEM. For more information, see [Mobile Broadband](/windows-hardware/drivers/mobilebroadband/index).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsmessagetype
 * @namespace Windows.Devices.Sms
 * @version WindowsRuntime 1.4
 */
class SmsMessageType extends Win32Enum{

    /**
     * The SMS message is in binary format.
     * @type {Integer (Int32)}
     */
    static Binary => 0

    /**
     * The SMS message is in text format.
     * @type {Integer (Int32)}
     */
    static Text => 1

    /**
     * A WAP Push message (an MMS message, for example). This value is supported on UWP app and Windows Phone 8.x app on Windows 10.
     * @type {Integer (Int32)}
     */
    static Wap => 2

    /**
     * An application-directed message (a visual voicemail message on a specific port, for example). This value is supported on UWP app and Windows Phone 8.x app on Windows 10.
     * @type {Integer (Int32)}
     */
    static App => 3

    /**
     * A cell broadcast message. This value is supported on UWP app and Windows Phone 8.x app on Windows 10.
     * @type {Integer (Int32)}
     */
    static Broadcast => 4

    /**
     * A legacy voicemail message waiting indication message.
     * 
     * This value is supported on UWP app and Windows Phone 8.x app on Windows 10.
     * @type {Integer (Int32)}
     */
    static Voicemail => 5

    /**
     * A send status message. This value is supported on UWP app and Windows Phone 8.x app on Windows 10.
     * @type {Integer (Int32)}
     */
    static Status => 6
}
