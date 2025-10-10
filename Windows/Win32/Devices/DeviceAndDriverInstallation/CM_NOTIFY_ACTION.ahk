#Requires AutoHotkey v2.0.0 64-bit

/**
 * This enumeration identifies Plug and Play device event types.
 * @remarks
 * 
  * When a driver calls the <a href="https://docs.microsoft.com/windows/desktop/api/cfgmgr32/nf-cfgmgr32-cm_register_notification">CM_Register_Notification</a> function, the <i>pCallback</i> parameter contains a pointer to a routine to be called when a specified PnP event occurs.  The callback routine's <i>Action</i> parameter is a value from the <b>CM_NOTIFY_ACTION</b> enumeration.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//cfgmgr32/ne-cfgmgr32-cm_notify_action
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 */
class CM_NOTIFY_ACTION{

    /**
     * For this value, set the <b>FilterType</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/cfgmgr32/ns-cfgmgr32-cm_notify_filter">CM_NOTIFY_FILTER</a> structure
 *  to <b>CM_NOTIFY_FILTER_TYPE_DEVICEINTERFACE</b>.  This action indicates that a device interface that meets your filter criteria has been enabled.
     * @type {Integer (Int32)}
     */
    static CM_NOTIFY_ACTION_DEVICEINTERFACEARRIVAL => 0

    /**
     * For this value, set the <b>FilterType</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/cfgmgr32/ns-cfgmgr32-cm_notify_filter">CM_NOTIFY_FILTER</a> structure
 *  to <b>CM_NOTIFY_FILTER_TYPE_DEVICEINTERFACE</b>.
 * 
 *   This action indicates that a device interface that meets your filter criteria has been disabled.
     * @type {Integer (Int32)}
     */
    static CM_NOTIFY_ACTION_DEVICEINTERFACEREMOVAL => 1

    /**
     * For this value, set the <b>FilterType</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/cfgmgr32/ns-cfgmgr32-cm_notify_filter">CM_NOTIFY_FILTER</a> structure
 *  to <b>CM_NOTIFY_FILTER_TYPE_DEVICEHANDLE</b>.
 * 
 *   This action indicates that the device is being query removed.  In order to allow the query remove to succeed, call <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-closehandle">CloseHandle</a> to close any handles you have open to the device. If you do not do this, your open handle prevents the query remove of this device from succeeding.  See <a href="https://docs.microsoft.com/windows-hardware/drivers/install/registering-for-notification-of-device-interface-arrival-and-device-removal">Registering for Notification of Device Interface Arrival and Device Removal</a> for more information.
 * 
 * To veto the query remove, return ERROR_CANCELLED.  However, it is recommended that you do not veto the query remove and allow it to happen by closing any handles you have open to the device.
     * @type {Integer (Int32)}
     */
    static CM_NOTIFY_ACTION_DEVICEQUERYREMOVE => 2

    /**
     * For this value, set the <b>FilterType</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/cfgmgr32/ns-cfgmgr32-cm_notify_filter">CM_NOTIFY_FILTER</a> structure
 *  to <b>CM_NOTIFY_FILTER_TYPE_DEVICEHANDLE</b>.
 * 
 *  This action indicates that the query remove of a device was failed.  If you closed the handle to this device during a previous notification of <b>CM_NOTIFY_ACTION_DEVICEQUERYREMOVE</b>, open a new handle to the device to continue sending I/O requests to it.  See <a href="https://docs.microsoft.com/windows-hardware/drivers/install/registering-for-notification-of-device-interface-arrival-and-device-removal">Registering for Notification of Device Interface Arrival and Device Removal</a> for more information.
     * @type {Integer (Int32)}
     */
    static CM_NOTIFY_ACTION_DEVICEQUERYREMOVEFAILED => 3

    /**
     * For this value, set the <b>FilterType</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/cfgmgr32/ns-cfgmgr32-cm_notify_filter">CM_NOTIFY_FILTER</a> structure
 *  to <b>CM_NOTIFY_FILTER_TYPE_DEVICEHANDLE</b>.
 * 
 * The device will be removed.  If you still have an open handle to the device, call <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-closehandle">CloseHandle</a> to close the device handle. See <a href="https://docs.microsoft.com/windows-hardware/drivers/install/registering-for-notification-of-device-interface-arrival-and-device-removal">Registering for Notification of Device Interface Arrival and Device Removal</a> for more information. The system may send a <b>CM_NOTIFY_ACTION_DEVICEREMOVEPENDING</b> notification without sending a corresponding <b>CM_NOTIFY_ACTION_DEVICEQUERYREMOVE</b> message.  In such cases, the applications and drivers must recover from the loss of the device as best they can.
     * @type {Integer (Int32)}
     */
    static CM_NOTIFY_ACTION_DEVICEREMOVEPENDING => 4

    /**
     * For this value, set the <b>FilterType</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/cfgmgr32/ns-cfgmgr32-cm_notify_filter">CM_NOTIFY_FILTER</a> structure
 *  to <b>CM_NOTIFY_FILTER_TYPE_DEVICEHANDLE</b>.
 * 
 * The device has been removed.  If you still have an open handle to the device, call <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-closehandle">CloseHandle</a> to close the device handle. See <a href="https://docs.microsoft.com/windows-hardware/drivers/install/registering-for-notification-of-device-interface-arrival-and-device-removal">Registering for Notification of Device Interface Arrival and Device Removal</a> for more information.  The system may send a <b>CM_NOTIFY_ACTION_DEVICEREMOVECOMPLETE</b> notification without sending corresponding <b>CM_NOTIFY_ACTION_DEVICEQUERYREMOVE</b> or <b>CM_NOTIFY_ACTION_DEVICEREMOVEPENDING</b> messages.  In such cases, the applications and drivers must recover from the loss of the device as best they can.
     * @type {Integer (Int32)}
     */
    static CM_NOTIFY_ACTION_DEVICEREMOVECOMPLETE => 5

    /**
     * For this value, set the <b>FilterType</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/cfgmgr32/ns-cfgmgr32-cm_notify_filter">CM_NOTIFY_FILTER</a> structure
 *  to <b>CM_NOTIFY_FILTER_TYPE_DEVICEHANDLE</b>. This action is sent when a driver-defined custom event has occurred.
     * @type {Integer (Int32)}
     */
    static CM_NOTIFY_ACTION_DEVICECUSTOMEVENT => 6

    /**
     * For this value, set the <b>FilterType</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/cfgmgr32/ns-cfgmgr32-cm_notify_filter">CM_NOTIFY_FILTER</a> structure
 *  to <b>CM_NOTIFY_FILTER_TYPE_DEVICEINSTANCE</b>. This action is sent when a new device instance that meets your filter criteria has been enumerated.
     * @type {Integer (Int32)}
     */
    static CM_NOTIFY_ACTION_DEVICEINSTANCEENUMERATED => 7

    /**
     * For this value, set the <b>FilterType</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/cfgmgr32/ns-cfgmgr32-cm_notify_filter">CM_NOTIFY_FILTER</a> structure
 *  to <b>CM_NOTIFY_FILTER_TYPE_DEVICEINSTANCE</b>. This action is sent when a device instance that meets your filter criteria becomes started.
     * @type {Integer (Int32)}
     */
    static CM_NOTIFY_ACTION_DEVICEINSTANCESTARTED => 8

    /**
     * For this value, set the <b>FilterType</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/cfgmgr32/ns-cfgmgr32-cm_notify_filter">CM_NOTIFY_FILTER</a> structure
 *  to <b>CM_NOTIFY_FILTER_TYPE_DEVICEINSTANCE</b>. This action is sent when a device instance that meets your filter criteria is no longer present.
     * @type {Integer (Int32)}
     */
    static CM_NOTIFY_ACTION_DEVICEINSTANCEREMOVED => 9

    /**
     * Do not use.
     * @type {Integer (Int32)}
     */
    static CM_NOTIFY_ACTION_MAX => 10
}
