#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of subscription to use (a source initiated or collector initiated subscription).
 * @see https://learn.microsoft.com/windows/win32/api/evcoll/ne-evcoll-ec_subscription_type
 * @namespace Windows.Win32.System.EventCollector
 * @version v4.0.30319
 */
class EC_SUBSCRIPTION_TYPE extends Win32Enum{

    /**
     * Allows you to define an event subscription on an event collector computer without defining the event source computers. Multiple remote event source computers can then be set up (using a group policy setting) to forward events to the event collector computer. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WEC/setting-up-a-source-initiated-subscription">Setting up a Source Initiated Subscription</a>. This subscription type is useful when you do not know or you do not want to specify  all the event sources computers that will forward events.
     * @type {Integer (Int32)}
     */
    static EcSubscriptionTypeSourceInitiated => 0

    /**
     * The computer that receives forwarded events from event sources (other computers that the events were published on) initiates the subscription. You specify all the event sources at the time the subscription is created.
     * @type {Integer (Int32)}
     */
    static EcSubscriptionTypeCollectorInitiated => 1
}
