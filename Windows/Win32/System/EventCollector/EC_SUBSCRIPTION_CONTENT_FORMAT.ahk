#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies how events will be rendered on the computer that sends the events before the events are sent to the event collector computer.
 * @see https://docs.microsoft.com/windows/win32/api//evcoll/ne-evcoll-ec_subscription_content_format
 * @namespace Windows.Win32.System.EventCollector
 * @version v4.0.30319
 */
class EC_SUBSCRIPTION_CONTENT_FORMAT{

    /**
     * When an event is received, the Event Collector service sends an event as the received event to an event log. The service sends the raw event data only, and not any localized event data.
     * @type {Integer (Int32)}
     */
    static EcContentFormatEvents => 1

    /**
     * When an event is received, the Event Collector service sends an event as rendered text to an event log. The service sends raw event data and localized event information.
     * @type {Integer (Int32)}
     */
    static EcContentFormatRenderedText => 2
}
