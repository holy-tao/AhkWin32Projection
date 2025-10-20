#Requires AutoHotkey v2.0.0 64-bit

/**
 * 
 * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HCN_NOTIFICATIONS
 * @namespace Windows.Win32.System.HostComputeNetwork
 * @version v4.0.30319
 */
class HCN_NOTIFICATIONS{

    /**
     * @type {Integer (Int32)}
     */
    static HcnNotificationInvalid => 0

    /**
     * @type {Integer (Int32)}
     */
    static HcnNotificationNetworkPreCreate => 1

    /**
     * @type {Integer (Int32)}
     */
    static HcnNotificationNetworkCreate => 2

    /**
     * @type {Integer (Int32)}
     */
    static HcnNotificationNetworkPreDelete => 3

    /**
     * @type {Integer (Int32)}
     */
    static HcnNotificationNetworkDelete => 4

    /**
     * @type {Integer (Int32)}
     */
    static HcnNotificationNamespaceCreate => 5

    /**
     * @type {Integer (Int32)}
     */
    static HcnNotificationNamespaceDelete => 6

    /**
     * @type {Integer (Int32)}
     */
    static HcnNotificationGuestNetworkServiceCreate => 7

    /**
     * @type {Integer (Int32)}
     */
    static HcnNotificationGuestNetworkServiceDelete => 8

    /**
     * @type {Integer (Int32)}
     */
    static HcnNotificationNetworkEndpointAttached => 9

    /**
     * @type {Integer (Int32)}
     */
    static HcnNotificationNetworkEndpointDetached => 16

    /**
     * @type {Integer (Int32)}
     */
    static HcnNotificationGuestNetworkServiceStateChanged => 17

    /**
     * @type {Integer (Int32)}
     */
    static HcnNotificationGuestNetworkServiceInterfaceStateChanged => 18

    /**
     * @type {Integer (Int32)}
     */
    static HcnNotificationServiceDisconnect => 16777216

    /**
     * @type {Integer (Int32)}
     */
    static HcnNotificationFlagsReserved => -268435456
}
