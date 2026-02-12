#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Defines the type of notification callback function.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanregisternotification">WlanRegisterNotification</a> function is used by an application to register and unregister notifications on all wireless interfaces. When registering for notifications, an application must provide a callback function pointed to by the <i>funcCallback</i> parameter passed to the <b>WlanRegisterNotification</b> function. The prototype for this callback function is the <b>WLAN_NOTIFICATION_CALLBACK</b>. This callback function will receive notifications that have been registered in the <i>dwNotifSource</i> parameter passed to the <b>WlanRegisterNotification</b> function. 
 * 
 * The callback function is called with a pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms706902(v=vs.85)">WLAN_NOTIFICATION_DATA</a> structure as the first parameter that contains detailed information on the notification. The callback function also receives a second parameter that contains a pointer to the client context passed in the <i>pCallbackContext</i> parameter to the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanregisternotification">WlanRegisterNotification</a> function. This client context can be a <b>NULL</b> pointer if that is what was passed to the <b>WlanRegisterNotification</b> function.
 * 
 * Once registered, the callback function will be called whenever a notification is available until the client unregisters or closes the handle.
 * 
 * Any registration to receive notifications is automatically undone if the calling application closes its calling handle (by calling <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanclosehandle">WlanCloseHandle</a> with the <i>hClientHandle</i> parameter) used to register for notifications with the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanregisternotification">WlanRegisterNotification</a> function  or if the process ends.
 * 
 * 
 * If the <b>NotificationSource</b> member of the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms706902(v=vs.85)">WLAN_NOTIFICATION_DATA</a> structure received by the callback function is <b>WLAN_NOTIFICATION_SOURCE_ACM</b>, then the received notification is an auto configuration module notification. The <b>NotificationCode</b> member of the <b>WLAN_NOTIFICATION_DATA</b> structure passed to the <b>WLAN_NOTIFICATION_CALLBACK</b> function  determines the interpretation of the <i>pData</i> member of <b>WLAN_NOTIFICATION_DATA</b> structure.  For more information on these notifications, see the <a href="https://docs.microsoft.com/windows/win32/api/wlanapi/ne-wlanapi-wlan_notification_acm-r1">WLAN_NOTIFICATION_ACM</a> enumeration reference.
 * 
 * If the <b>NotificationSource</b> member of the  <a href="https://docs.microsoft.com/windows/win32/api/wlanapi/ne-wlanapi-wlan_hosted_network_notification_code">WLAN_NOTIFICATION_DATA</a> structure received by the callback function is <b>WLAN_NOTIFICATION_SOURCE_HNWK</b>, then the received notification is a wireless Hosted Network notification supported on Windows 7 and  on Windows Server 2008 R2 with the Wireless LAN Service installed. The <b>NotificationCode</b> member of the <b>WLAN_NOTIFICATION_DATA</b> structure passed to the <b>WLAN_NOTIFICATION_CALLBACK</b> function  determines the interpretation of the <i>pData</i> member of <b>WLAN_NOTIFICATION_DATA</b> structure. For more information on these notifications, see the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/ne-wlanapi-wlan_hosted_network_notification_code">WLAN_HOSTED_NETWORK_NOTIFICATION_CODE</a> enumeration reference.
 * 
 * If the <b>NotificationSource</b> member of the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms706902(v=vs.85)">WLAN_NOTIFICATION_DATA</a> structure received by the callback function is <b>WLAN_NOTIFICATION_SOURCE_IHV</b>, then the received notification is an independent hardware vendor (IHV) notification. The <b>NotificationCode</b> member of the <b>WLAN_NOTIFICATION_DATA</b> structure passed to the <b>WLAN_NOTIFICATION_CALLBACK</b> function determines the interpretation of the <i>pData</i> member of <b>WLAN_NOTIFICATION_DATA</b> structure, which is specific to the IHV.  
 * 
 * If the <b>NotificationSource</b> member of the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms706902(v=vs.85)">WLAN_NOTIFICATION_DATA</a> structure received by the callback function is <b>WLAN_NOTIFICATION_SOURCE_ONEX</b>, then the received notification is an 802.1X module notification. The <b>NotificationCode</b> member of the <b>WLAN_NOTIFICATION_DATA</b> structure passed to the <b>WLAN_NOTIFICATION_CALLBACK</b> function  determines the interpretation of the <i>pData</i> member of <b>WLAN_NOTIFICATION_DATA</b> structure.  For more information on these notifications, see the <a href="https://docs.microsoft.com/windows/desktop/api/dot1x/ne-dot1x-onex_notification_type">ONEX_NOTIFICATION_TYPE</a> enumeration reference.
 * 
 * If the <b>NotificationSource</b> member of the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms706902(v=vs.85)">WLAN_NOTIFICATION_DATA</a> structure received by the callback function is <b>WLAN_NOTIFICATION_SOURCE_MSM</b>, then the received notification is a media specific module (MSM) notification. The <b>NotificationCode</b> member of the <b>WLAN_NOTIFICATION_DATA</b> structure passed to the <b>WLAN_NOTIFICATION_CALLBACK</b> function  determines the interpretation of the <i>pData</i> member of <b>WLAN_NOTIFICATION_DATA</b> structure.  For more information on these notifications, see the <a href="https://docs.microsoft.com/windows/win32/api/wlanapi/ne-wlanapi-wlan_notification_msm-r1">WLAN_NOTIFICATION_MSM</a> enumeration reference.
 * 
 * If the <b>NotificationSource</b> member of the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms706902(v=vs.85)">WLAN_NOTIFICATION_DATA</a> structure received by the callback function is <b>WLAN_NOTIFICATION_SOURCE_SECURITY</b>, then the received notification is a security notification. No notifications are currently defined for <b>WLAN_NOTIFICATION_SOURCE_SECURITY</b>.
 * 
 * <b>Windows XP with SP3 and Wireless LAN API for Windows XP with SP2:  </b>Notifications are handled by the Netman service. If the Netman service is disabled or unavailable, notifications will not be received. If a notification is not received within a reasonable period of time, an application should time out and query the current interface state.
 * @see https://learn.microsoft.com/windows/win32/api//content/wlanapi/nc-wlanapi-wlan_notification_callback
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class WLAN_NOTIFICATION_CALLBACK extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {Pointer<L2_NOTIFICATION_DATA>} param0 
     * @param {Pointer<Void>} param1 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(param0, param1) {
        param1Marshal := param1 is VarRef ? "ptr" : "ptr"

        ComCall(3, this, "ptr", param0, param1Marshal, param1)
    }
}
