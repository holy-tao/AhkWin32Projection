#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines values that indicate how events are delivered in a subscription.
 * @see https://learn.microsoft.com/windows/win32/api/evcoll/ne-evcoll-ec_subscription_delivery_mode
 * @namespace Windows.Win32.System.EventCollector
 */
export default struct EC_SUBSCRIPTION_DELIVERY_MODE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Events are delivered through the subscription using the pull model.
     * @type {Integer (Int32)}
     */
    static EcDeliveryModePull => 1

    /**
     * Events are delivered through the subscription using the push model.
     * @type {Integer (Int32)}
     */
    static EcDeliveryModePush => 2
}
