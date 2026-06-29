#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The QOS_NOTIFY_FLOW enumeration specifies the circumstances that must be present for the QOSNotifyFlow function to send a notification.
 * @see https://learn.microsoft.com/windows/win32/api/qos2/ne-qos2-qos_notify_flow
 * @namespace Windows.Win32.NetworkManagement.QoS
 */
export default struct QOS_NOTIFY_FLOW {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
     * Notifications will be sent when the flow's available capacity is sufficient to allow upgrading its bandwidth to a specified capacity.
     * @type {Integer (Int32)}
     */
    static QOSNotifyAvailable => 2
}
