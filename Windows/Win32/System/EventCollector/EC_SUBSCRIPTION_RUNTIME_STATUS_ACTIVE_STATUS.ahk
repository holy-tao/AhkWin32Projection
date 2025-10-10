#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the status of a subscription or an event source with respect to a subscription.
 * @see https://docs.microsoft.com/windows/win32/api//evcoll/ne-evcoll-ec_subscription_runtime_status_active_status
 * @namespace Windows.Win32.System.EventCollector
 * @version v4.0.30319
 */
class EC_SUBSCRIPTION_RUNTIME_STATUS_ACTIVE_STATUS{

    /**
     * The subscription or event source is disabled.
     * @type {Integer (Int32)}
     */
    static EcRuntimeStatusActiveStatusDisabled => 1

    /**
     * The subscription or event source is running.
     * @type {Integer (Int32)}
     */
    static EcRuntimeStatusActiveStatusActive => 2

    /**
     * The subscription or event source is inactive. You can query the System event log to see the error events sent by the Event Collector service. Use the <a href="https://docs.microsoft.com/windows/win32/api/evcoll/ne-evcoll-ec_subscription_runtime_status_info_id">EC_SUBSCRIPTION_RUNTIME_STATUS_INFO_ID</a> values to obtain information on why the subscription or source is inactive.
     * @type {Integer (Int32)}
     */
    static EcRuntimeStatusActiveStatusInactive => 3

    /**
     * The subscription or event source is trying to connect for the first time or is retrying after a problem. When an active subscription runs into a problem, it will retry several times.
     * @type {Integer (Int32)}
     */
    static EcRuntimeStatusActiveStatusTrying => 4
}
