#Requires AutoHotkey v2.0.0 64-bit

/**
 * Differentiates between a push or pull subscription delivery type. This is not supported when using the DCOM protocol.
 * @see https://docs.microsoft.com/windows/win32/api//mi/ne-mi-mi_subscriptiondeliverytype
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class MI_SubscriptionDeliveryType{

    /**
     * Pull delivery is required for subscriptions. Pulling the indications from the server is more firewall friendly. However, it can also be slower than the push delivery type.
     * @type {Integer (Int32)}
     */
    static MI_SubscriptionDeliveryType_Pull => 1

    /**
     * Push delivery is required for subscriptions. Push indicates that the server will connect to the client to deliver the event when one is available. This requires the firewall on the correct ports to work and security contexts need to managed carefully.
     * @type {Integer (Int32)}
     */
    static MI_SubscriptionDeliveryType_Push => 2
}
