#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the type of a given Windows Network Virtualization (WNV) notification.
 * @see https://docs.microsoft.com/windows/win32/api//wnvapi/ne-wnvapi-wnv_notification_type
 * @namespace Windows.Win32.NetworkManagement.WindowsNetworkVirtualization
 * @version v4.0.30319
 */
class WNV_NOTIFICATION_TYPE{

    /**
     * A policy mismatch notification.
     * @type {Integer (Int32)}
     */
    static WnvPolicyMismatchType => 0

    /**
     * A notification that an Internet Control Message Protocol
 * (ICMP) redirect message has been received.
     * @type {Integer (Int32)}
     */
    static WnvRedirectType => 1

    /**
     * A notification that a network object has changed.
     * @type {Integer (Int32)}
     */
    static WnvObjectChangeType => 2

    /**
     * The maximum possible value for this enumeration type. This is not a legal value.
     * @type {Integer (Int32)}
     */
    static WnvNotificationTypeMax => 3
}
