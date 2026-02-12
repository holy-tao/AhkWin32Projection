#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * This enumerated type specifies which messages in the device message store an operation is performed on.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators, mobile broadband adapter IHV, or OEM. For more information, see [Mobile Broadband](/windows-hardware/drivers/mobilebroadband/index).
  * 
  * > [!NOTE]
  * > This class and its methods are supported for the maintenance of legacy desktop apps that used it in earlier versions of Windows. If you do use this class, then you must specify the **Windows.Devices.Sms.LegacySmsApiContract** in your app's manifest. Don't use this class if you're developing a new app for Windows. Instead, use the APIs in this namespace that don't require the **Windows.Devices.Sms.LegacySmsApiContract**.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsmessagefilter
 * @namespace Windows.Devices.Sms
 * @version WindowsRuntime 1.4
 */
class SmsMessageFilter extends Win32Enum{

    /**
     * All messages in the device message store.
     * @type {Integer (Int32)}
     */
    static All => 0

    /**
     * All unread received messages.
     * @type {Integer (Int32)}
     */
    static Unread => 1

    /**
     * All read received messages.
     * @type {Integer (Int32)}
     */
    static Read => 2

    /**
     * All sent and saved messages.
     * @type {Integer (Int32)}
     */
    static Sent => 3

    /**
     * All unsent and saved messages.
     * @type {Integer (Int32)}
     */
    static Draft => 4
}
