#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * HCN_NOTIFICATIONS
 * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HCN_NOTIFICATIONS
 * @namespace Windows.Win32.System.HostComputeNetwork
 */
class HCN_NOTIFICATIONS extends Win32Enum {

    /**
     * Native name: HcnNotificationInvalid
     * @type {Integer (Int32)}
     */
    static NotificationInvalid => 0

    /**
     * Native name: HcnNotificationNetworkPreCreate
     * @type {Integer (Int32)}
     */
    static NotificationNetworkPreCreate => 1

    /**
     * Native name: HcnNotificationNetworkCreate
     * @type {Integer (Int32)}
     */
    static NotificationNetworkCreate => 2

    /**
     * Native name: HcnNotificationNetworkPreDelete
     * @type {Integer (Int32)}
     */
    static NotificationNetworkPreDelete => 3

    /**
     * Native name: HcnNotificationNetworkDelete
     * @type {Integer (Int32)}
     */
    static NotificationNetworkDelete => 4

    /**
     * Native name: HcnNotificationNamespaceCreate
     * @type {Integer (Int32)}
     */
    static NotificationNamespaceCreate => 5

    /**
     * Native name: HcnNotificationNamespaceDelete
     * @type {Integer (Int32)}
     */
    static NotificationNamespaceDelete => 6

    /**
     * Native name: HcnNotificationGuestNetworkServiceCreate
     * @type {Integer (Int32)}
     */
    static NotificationGuestNetworkServiceCreate => 7

    /**
     * Native name: HcnNotificationGuestNetworkServiceDelete
     * @type {Integer (Int32)}
     */
    static NotificationGuestNetworkServiceDelete => 8

    /**
     * Native name: HcnNotificationNetworkEndpointAttached
     * @type {Integer (Int32)}
     */
    static NotificationNetworkEndpointAttached => 9

    /**
     * Native name: HcnNotificationNetworkEndpointDetached
     * @type {Integer (Int32)}
     */
    static NotificationNetworkEndpointDetached => 16

    /**
     * Native name: HcnNotificationGuestNetworkServiceStateChanged
     * @type {Integer (Int32)}
     */
    static NotificationGuestNetworkServiceStateChanged => 17

    /**
     * Native name: HcnNotificationGuestNetworkServiceInterfaceStateChanged
     * @type {Integer (Int32)}
     */
    static NotificationGuestNetworkServiceInterfaceStateChanged => 18

    /**
     * Native name: HcnNotificationServiceDisconnect
     * @type {Integer (Int32)}
     */
    static NotificationServiceDisconnect => 16777216

    /**
     * Native name: HcnNotificationFlagsReserved
     * @type {Integer (Int32)}
     */
    static NotificationFlagsReserved => -268435456
}
