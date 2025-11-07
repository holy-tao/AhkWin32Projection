#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the possible values that specify when to start subscribing to events.
 * @remarks
 * 
 * The EvtSubscribeToFutureEvents, EvtSubscribeStartAtOldestRecord, and EvtSubscribeStartAfterBookmark flags are mutually exclusive.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//winevt/ne-winevt-evt_subscribe_flags
 * @namespace Windows.Win32.System.EventLog
 * @version v4.0.30319
 */
class EVT_SUBSCRIBE_FLAGS{

    /**
     * Subscribe to only future events that match the query criteria.
     * @type {Integer (UInt32)}
     */
    static EvtSubscribeToFutureEvents => 1

    /**
     * Subscribe to all existing and future events that match the query criteria.
     * @type {Integer (UInt32)}
     */
    static EvtSubscribeStartAtOldestRecord => 2

    /**
     * Subscribe to all existing and future events that match the query criteria that begin after the bookmarked event. If you include the EvtSubscribeStrict flag, the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtsubscribe">EvtSubscribe</a> function fails if the bookmarked event does not exist. If you do not include the EvtSubscribeStrict flag and the bookmarked event does not exist, the subscription begins with the event that is after the event that is closest to the bookmarked event.
     * @type {Integer (UInt32)}
     */
    static EvtSubscribeStartAfterBookmark => 3

    /**
     * A bitmask that you can use to determine which of the following flags is set:
     * 
     * <ul>
     * <li>EvtSubscribeToFutureEvents</li>
     * <li>EvtSubscribeStartAtOldestRecord</li>
     * <li>EvtSubscribeStartAfterBookmark</li>
     * </ul>
     * @type {Integer (UInt32)}
     */
    static EvtSubscribeOriginMask => 3

    /**
     * Complete the subscription even if the part of the query generates an error (is not well formed). The service validates the syntax of the XPath query to determine if it is well formed. If the validation fails, the service parses the XPath into individual expressions. It builds a new XPath beginning with the left most expression. The service validates the expression and if it is valid, the service adds the next expression to the XPath. The service repeats this process until it finds the expression that is failing. It then uses the valid expressions that it found beginning with the leftmost expression as the XPath query (which means that you may not get the events that you expected). If no part of the XPath is valid, the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtsubscribe">EvtSubscribe</a> call fails.
     * @type {Integer (UInt32)}
     */
    static EvtSubscribeTolerateQueryErrors => 4096

    /**
     * Forces the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtsubscribe">EvtSubscribe</a> call to fail if you specify EvtSubscribeStartAfterBookmark and the bookmarked event is not found (the return value is ERROR_NOT_FOUND). Also, set this flag if you want to receive notification in your callback when event records are missing.
     * @type {Integer (UInt32)}
     */
    static EvtSubscribeStrict => 65536
}
