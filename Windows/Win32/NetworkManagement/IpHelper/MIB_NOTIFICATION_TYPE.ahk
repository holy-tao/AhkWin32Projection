#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the notification type passed to a callback function when a notification occurs.
 * @remarks
 * 
  * The <b>MIB_NOTIFICATION_TYPE</b> enumeration is defined on Windows Vista and later. 
  * 
  * On Windows Vista and later, new functions are provided to register to be notified when an IPv6 or IPv4 interface changes, a IPv6 or IPv4 unicast address changes, or an IPv6 or IPv4 route changes. These registration functions require a callback function be passed that is called when a change occurs. One of the parameters passed to the callback function when a notification occurs is a parameter containing a <b>MIB_NOTIFICATION_TYPE</b> that indicates the notification type. 
  * 
  * Note that the <i>Netioapi.h</i> header file is automatically included in the <i>Iphlpapi.h</i> header file. The  <i>Netioapi.h</i> header file should never be used directly.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//netioapi/ne-netioapi-mib_notification_type
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class MIB_NOTIFICATION_TYPE{

    /**
     * A parameter was changed.
     * @type {Integer (Int32)}
     */
    static MibParameterNotification => 0

    /**
     * A new MIB instance was added.
     * @type {Integer (Int32)}
     */
    static MibAddInstance => 1

    /**
     * An existing MIB instance was deleted.
     * @type {Integer (Int32)}
     */
    static MibDeleteInstance => 2

    /**
     * A notification that is invoked immediately after registration for change notification completes. This initial notification does not indicate a change occurred to a MIB instance. The purpose of this initial notification type is  to provide confirmation that the callback function is properly registered.
     * @type {Integer (Int32)}
     */
    static MibInitialNotification => 3
}
