#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines values that indicate how events are delivered in a subscription.
 * @see https://docs.microsoft.com/windows/win32/api//evcoll/ne-evcoll-ec_subscription_delivery_mode
 * @namespace Windows.Win32.System.EventCollector
 * @version v4.0.30319
 */
class EC_SUBSCRIPTION_DELIVERY_MODE extends Win32Enum{

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
