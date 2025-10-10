#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies different configuration modes that change the default settings for a subscription.
 * @remarks
 * 
  * The settings for each configuration mode can be found in the Event Collector registry located at: <pre xml:space="preserve"><b>HKEY_LOCAL_MACHINE</b>
  *    <b>SOFTWARE</b>
  *       <b>Microsoft</b>
  *          <b>Windows</b>
  *             <b>CurrentVersion</b>
  *                <b>EventCollector</b>
  *                   <b>ConfigurationModes</b></pre>
  * 
  * 
  * For more information about the subscription delivery mode and properties see, <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/ne-evcoll-ec_subscription_delivery_mode">EC_SUBSCRIPTION_DELIVERY_MODE</a> and  <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/ne-evcoll-ec_subscription_property_id">EC_SUBSCRIPTION_PROPERTY_ID</a>.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//evcoll/ne-evcoll-ec_subscription_configuration_mode
 * @namespace Windows.Win32.System.EventCollector
 * @version v4.0.30319
 */
class EC_SUBSCRIPTION_CONFIGURATION_MODE{

    /**
     * This mode is used when an administrator needs the events to be delivered reliably and for the subscription to work with minimal configuration, and when network usage is not a concern. This mode sets the default subscription delivery mode to pull subscriptions.
     * @type {Integer (Int32)}
     */
    static EcConfigurationModeNormal => 0

    /**
     * This subscription mode allows custom values for the DeliveryMode property, the DeliveryMaxItems property, the DeliveryMaxLatencyTime, and the HeartBeatInterval property.
     * @type {Integer (Int32)}
     */
    static EcConfigurationModeCustom => 1

    /**
     * This mode is used for alerts and critical events because it configures the subscription to send events as soon as they occur with minimal delay. This mode sets the default subscription delivery mode to push subscriptions.
     * @type {Integer (Int32)}
     */
    static EcConfigurationModeMinLatency => 2

    /**
     * This mode is used when network activity is controllable, and when network usage is expensive. This mode sets the default subscription delivery mode to push subscriptions.
     * @type {Integer (Int32)}
     */
    static EcConfigurationModeMinBandwidth => 3
}
