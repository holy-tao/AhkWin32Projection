#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Important  The Native 802.11 Wireless LAN interface is deprecated in Windows 10 and later.
 * @remarks
 * The application or service registers to receive notifications by calling the 
  *     <b>WlanRegisterNotification</b> Auto Configuration Manager (ACM) function. For more information about this
  *     function, refer to the Microsoft Windows SDK documentation.
  * 
  * The IHV Extensions DLL sends notifications to registered services or applications by calling the 
  *     <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/wlanihv/nc-wlanihv-dot11ext_send_notification">Dot11ExtSendNotification</a> function. The service or application must register to receive
  *     notifications from a source of L2_NOTIFICATION_SOURCE_WLAN_IHV.
 * @see https://learn.microsoft.com/windows/win32/api/l2cmn/ns-l2cmn-l2_notification_data
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class L2_NOTIFICATION_DATA extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * This member specifies where the notification comes from. The IHV Extensions DLL must set this
     *      member to L2_NOTIFICATION_SOURCE_WLAN_IHV.
     * @type {Integer}
     */
    NotificationSource {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * This member specifies the notification code for the status indication. This notification code must not have the bit 0x10000 set.
     * @type {Integer}
     */
    NotificationCode {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The globally unique identifier (GUID) for the wireless LAN (WLAN) adapter. 
     *      
     * 
     * The operating system passes the GUID and other data related to the WLAN adapter through the 
     *      <i>pDot11Adapter</i> parameter of the 
     *      <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/wlanihv/nc-wlanihv-dot11extihv_init_adapter">Dot11ExtIhvInitAdapter</a> function, which the operating system calls when it detects the arrival of
     *      the WLAN adapter. For more information about this operation, see 
     *      <a href="https://docs.microsoft.com/windows/desktop/api/l2cmn/ns-l2cmn-l2_notification_data">802.11 WLAN Adapter
     *      Arrival</a>.
     * @type {Pointer<Guid>}
     */
    InterfaceGuid {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The length, in bytes, of the data within the buffer referenced by the 
     *      <b>pData</b> member. The IHV Extensions DLL must set this member to zero if additional data is not
     *      required for the notification.
     * @type {Integer}
     */
    dwDataSize {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The address of a caller-allocated buffer that contains additional data for the notification. The
     *      format of the data is defined by the independent hardware vendor (IHV).
     *      
     * 
     * The IHV Extensions DLL must set this member to <b>NULL</b> if additional data is not required for the
     *      notification.
     * @type {Pointer<Void>}
     */
    pData {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
