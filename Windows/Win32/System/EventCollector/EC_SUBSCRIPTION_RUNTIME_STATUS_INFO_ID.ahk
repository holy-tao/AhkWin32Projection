#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The EC_SUBSCRIPTION_RUNTIME_STATUS_INFO_ID enumeration specifies the values used to get the status of a subscription or the status of a particular event source with respect to a subscription.
 * @see https://docs.microsoft.com/windows/win32/api//evcoll/ne-evcoll-ec_subscription_runtime_status_info_id
 * @namespace Windows.Win32.System.EventCollector
 * @version v4.0.30319
 */
class EC_SUBSCRIPTION_RUNTIME_STATUS_INFO_ID extends Win32Enum{

    /**
     * Get the status of an active or inactive subscription or an event source. This will return an unsigned 32-bit integer value from the <a href="https://docs.microsoft.com/windows/win32/api/evcoll/ne-evcoll-ec_subscription_runtime_status_active_status">EC_SUBSCRIPTION_RUNTIME_STATUS_ACTIVE_STATUS</a> enumeration.
     * @type {Integer (Int32)}
     */
    static EcSubscriptionRunTimeStatusActive => 0

    /**
     * Get the last error status of a  subscription or an event source. This will return an <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/ns-evcoll-ec_variant">EcVarTypeUInt32</a> value.
     * @type {Integer (Int32)}
     */
    static EcSubscriptionRunTimeStatusLastError => 1

    /**
     * Get the last error message for a  subscription or an event source. This will return an <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/ns-evcoll-ec_variant">EcVarTypeString</a> value.
     * @type {Integer (Int32)}
     */
    static EcSubscriptionRunTimeStatusLastErrorMessage => 2

    /**
     * Get the time that the last error occurred for a  subscription or an event source. This will return an <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/ns-evcoll-ec_variant">EcVarTypeDateTime</a> value.
     * @type {Integer (Int32)}
     */
    static EcSubscriptionRunTimeStatusLastErrorTime => 3

    /**
     * Get the next time that the subscription or an event source will try to run (after an error). This will return an <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/ns-evcoll-ec_variant">EcVarTypeDateTime</a> value.
     * @type {Integer (Int32)}
     */
    static EcSubscriptionRunTimeStatusNextRetryTime => 4

    /**
     * Get the event sources for the subscription. For collector initiated subscriptions, this list will be identical to the one in the subscription's configuration.  For source initiated subscriptions, this list will be the set of event sources that collector has heard from in the last 30 days.  This list is persistent across reboots of the event collector. This will return an <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/ns-evcoll-ec_variant">EcVarTypeString</a> value.
     * @type {Integer (Int32)}
     */
    static EcSubscriptionRunTimeStatusEventSources => 5

    /**
     * Get the last time that a heartbeat (a signal used to signify the subscription is working) occurred for a subscription or an event source. This will return an <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/ns-evcoll-ec_variant">EcVarTypeDateTime</a> value.
     * @type {Integer (Int32)}
     */
    static EcSubscriptionRunTimeStatusLastHeartbeatTime => 6

    /**
     * 
     * @type {Integer (Int32)}
     */
    static EcSubscriptionRunTimeStatusInfoIdEND => 7
}
