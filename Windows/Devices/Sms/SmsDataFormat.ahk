#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * This enumerated type identifies the format of a given protocol description unit (PDU) buffer.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators, mobile broadband adapter IHV, or OEM. For more information, see [Mobile Broadband](/windows-hardware/drivers/mobilebroadband/index).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsdataformat
 * @namespace Windows.Devices.Sms
 * @version WindowsRuntime 1.4
 */
class SmsDataFormat extends Win32Enum{

    /**
     * The data format is unknown.
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * The data format is CDMA WMT format of type submit.
     * @type {Integer (Int32)}
     */
    static CdmaSubmit => 1

    /**
     * The data format is GSM of type submit.
     * @type {Integer (Int32)}
     */
    static GsmSubmit => 2

    /**
     * The data format is CDMA WMT format of type deliver.
     * @type {Integer (Int32)}
     */
    static CdmaDeliver => 3

    /**
     * The data format is GSM of type deliver.
     * @type {Integer (Int32)}
     */
    static GsmDeliver => 4
}
