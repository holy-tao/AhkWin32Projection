#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of a given Windows Network Virtualization (WNV) notification.
 * @see https://learn.microsoft.com/windows/win32/api/wnvapi/ne-wnvapi-wnv_notification_type
 * @namespace Windows.Win32.NetworkManagement.WindowsNetworkVirtualization
 */
class WNV_NOTIFICATION_TYPE extends Win32Enum {

    /**
     * A policy mismatch notification.
     * Native name: WnvPolicyMismatchType
     * @type {Integer (Int32)}
     */
    static PolicyMismatchType => 0

    /**
     * A notification that an Internet Control Message Protocol
     * (ICMP) redirect message has been received.
     * Native name: WnvRedirectType
     * @type {Integer (Int32)}
     */
    static RedirectType => 1

    /**
     * A notification that a network object has changed.
     * Native name: WnvObjectChangeType
     * @type {Integer (Int32)}
     */
    static ObjectChangeType => 2

    /**
     * The maximum possible value for this enumeration type. This is not a legal value.
     * Native name: WnvNotificationTypeMax
     * @type {Integer (Int32)}
     */
    static Max => 3
}
