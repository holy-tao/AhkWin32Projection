#Requires AutoHotkey v2.0.0 64-bit

/**
 * The QOS_NOTIFY_FLOW enumeration specifies the circumstances that must be present for the QOSNotifyFlow function to send a notification.
 * @see https://docs.microsoft.com/windows/win32/api//qos2/ne-qos2-qos_notify_flow
 * @namespace Windows.Win32.NetworkManagement.QoS
 * @version v4.0.30319
 */
class QOS_NOTIFY_FLOW{

    /**
     * Notifications will be sent when congestion is detected.  If the flow is currently congested, a notification may be sent immediately.
     * @type {Integer (Int32)}
     */
    static QOSNotifyCongested => 0

    /**
     * Notifications will be sent when the flow is not congested.  If the flow is currently uncongested, a notification may be sent immediately.
     * @type {Integer (Int32)}
     */
    static QOSNotifyUncongested => 1

    /**
     * Notifications will be sent when the flow's available capacity is sufficient  to allow upgrading it's bandwidth to a specified  capacity.
     * @type {Integer (Int32)}
     */
    static QOSNotifyAvailable => 2
}
