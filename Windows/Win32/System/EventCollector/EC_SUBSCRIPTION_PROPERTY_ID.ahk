#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines values to identify event subscription properties used for subscription configuration.
 * @see https://docs.microsoft.com/windows/win32/api//evcoll/ne-evcoll-ec_subscription_property_id
 * @namespace Windows.Win32.System.EventCollector
 * @version v4.0.30319
 */
class EC_SUBSCRIPTION_PROPERTY_ID{

    /**
     * The <b>Enabled</b> property of the subscription that is used to enable or disable the subscription or obtain the current status of a subscription. This property is an <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/ns-evcoll-ec_variant">EcVarTypeBoolean</a> value.
     * @type {Integer (Int32)}
     */
    static EcSubscriptionEnabled => 0

    /**
     * The <b>EventSources</b> property of the subscription that contains a collection of information about the local or remote computers (event sources) that can forward events to the  event collector. This property is a handle to an array (an  <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/ns-evcoll-ec_variant">EcVarObjectArrayPropertyHandle</a> value). This value is typically used for collector initiated subscriptions. It can be used for source initiated subscriptions to disable the collection of events from a particular event source.
     * @type {Integer (Int32)}
     */
    static EcSubscriptionEventSources => 1

    /**
     * The <b>EventSourceAddress</b> property of the subscription that contains the IP address or fully qualified domain name (FQDN) of the local or remote computer (event source) from which the events are collected. This property is an <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/ns-evcoll-ec_variant">EcVarTypeString</a> value.
     * @type {Integer (Int32)}
     */
    static EcSubscriptionEventSourceAddress => 2

    /**
     * The <b>EventSourceEnabled</b> property of the subscription that is used to enable or disable an  event source.  This property is an <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/ns-evcoll-ec_variant">EcVarTypeBoolean</a> value.
     * @type {Integer (Int32)}
     */
    static EcSubscriptionEventSourceEnabled => 3

    /**
     * The <b>EventSourceUserName</b> property of the subscription that contains the user name, which is used by the remote computer (event source) to authenticate the user.  This property is an <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/ns-evcoll-ec_variant">EcVarTypeString</a> value. This property cannot be used for source initiated subscriptions.
     * @type {Integer (Int32)}
     */
    static EcSubscriptionEventSourceUserName => 4

    /**
     * The <b>EventSourcePassword</b> property of the subscription that contains the password, which is used by the remote computer (event source) to authenticate the user.  This property is an <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/ns-evcoll-ec_variant">EcVarTypeString</a> value. This property cannot be used for source initiated subscriptions.
     * @type {Integer (Int32)}
     */
    static EcSubscriptionEventSourcePassword => 5

    /**
     * The <b>Description</b> property of the subscription that contains a description of the subscription.  This property is an <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/ns-evcoll-ec_variant">EcVarTypeString</a> value.
     * @type {Integer (Int32)}
     */
    static EcSubscriptionDescription => 6

    /**
     * The <b>URI</b> property of the subscription that contains the URI, which is used by WS-Management to connect to a computer. For example, the URI can be `http://schemas.microsoft.com/wbem/wsman/1/logrecord/sel` for hardware events or
 * it can be `http://schemas.microsoft.com/wbem/wsman/1/windows/EventLog` for events that are published in the event log.  This property is an <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/ns-evcoll-ec_variant">EcVarTypeString</a> value.
     * @type {Integer (Int32)}
     */
    static EcSubscriptionURI => 7

    /**
     * The <b>ConfigurationMode</b> property of the subscription that specifies how events are delivered to the subscription.  This property is an <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/ns-evcoll-ec_variant">EcVarTypeUInt32</a> value from the <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/ne-evcoll-ec_subscription_configuration_mode">EC_SUBSCRIPTION_CONFIGURATION_MODE</a> enumeration.
     * @type {Integer (Int32)}
     */
    static EcSubscriptionConfigurationMode => 8

    /**
     * The <b>Expires</b> property of the subscription  that contains the date when the subscription will  end. The maximum date that can be used is 3000-12-31T23:59:59.999Z. If this property is not defined, the subscription will not expire.  This property is an <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/ns-evcoll-ec_variant">EcVarTypeDateTime</a> value.
     * @type {Integer (Int32)}
     */
    static EcSubscriptionExpires => 9

    /**
     * The <b>Query</b> property of the subscription that contains the query, which is  used by the event source for selecting events to forward to the event collector. This property is an <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/ns-evcoll-ec_variant">EcVarTypeString</a> value.
     * @type {Integer (Int32)}
     */
    static EcSubscriptionQuery => 10

    /**
     * The <b>TransportName</b> property of the subscription  that specifies the type of transport, which is used to connect to the remote computer (event source).   This value can be either HTTP, which is the default, or it can be HTTPS. This property is an <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/ns-evcoll-ec_variant">EcVarTypeString</a> value.
     * @type {Integer (Int32)}
     */
    static EcSubscriptionTransportName => 11

    /**
     * The <b>TransportPort</b> property of the subscription  that specifies the port number, which the transport uses to connect to the remote computer (event source).  The default port number for HTTP is 80 and the default port number for HTTPS is  443. This property is an <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/ns-evcoll-ec_variant">EcVarTypeUInt32</a> value.
     * @type {Integer (Int32)}
     */
    static EcSubscriptionTransportPort => 12

    /**
     * The <b>DeliveryMode</b> property of the subscription that specifies  whether events are delivered to the subscription with either a push or pull model.  This property is an <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/ne-evcoll-ec_subscription_delivery_mode">EC_SUBSCRIPTION_DELIVERY_MODE</a> enumeration value. This property cannot be used for source initiated subscriptions.
     * @type {Integer (Int32)}
     */
    static EcSubscriptionDeliveryMode => 13

    /**
     * The <b>DeliveryMaxItems</b> property of the subscription that specifies the maximum number of events that can be batched when forwarded from the event sources.  When the <b>EcSubscriptionDeliveryMode</b> property is set to <b>EcDeliveryModePush</b>, this property determines the number of events that are included in a batch sent from the event source. When the <b>EcSubscriptionDeliveryMode</b> property is set to <b>EcDeliveryModePull</b>, this property determines the maximum number of items that will forwarded from an event source for each request. This property is an <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/ns-evcoll-ec_variant">EcVarTypeUInt32</a> value.
     * @type {Integer (Int32)}
     */
    static EcSubscriptionDeliveryMaxItems => 14

    /**
     * The <b>DeliveryMaxLatencyTime</b> property of the subscription that specifies how long, in milliseconds, the event source should wait before sending events (even if it did not collect enough events  to reach the maximum number of items). This value is used when the <b>EcSubscriptionDeliveryMode</b> property is set to  <b>EcDeliveryModePush</b>.   This property is an <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/ns-evcoll-ec_variant">EcVarTypeUInt32</a> value.
     * @type {Integer (Int32)}
     */
    static EcSubscriptionDeliveryMaxLatencyTime => 15

    /**
     * The <b>HeartbeatInterval</b> property of the subscription that defines the heartbeat time interval, in milliseconds, which is observed between the sent heartbeat messages.  When the <b>EcSubscriptionDeliveryMode</b> property is set to <b>EcDeliveryModePush</b>, the event collector uses this property to determine the availability of the event source. When the <b>EcSubscriptionDeliveryMode</b> property is set to <b>EcDeliveryModePull</b>, the event collector uses this property to determine the interval between queries to the event source. This property is an <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/ns-evcoll-ec_variant">EcVarTypeUInt32</a> value.
     * @type {Integer (Int32)}
     */
    static EcSubscriptionHeartbeatInterval => 16

    /**
     * The <b>Locale</b> property of the subscription that specifies the locale (for example, en-us) of the events.  This property is an <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/ns-evcoll-ec_variant">EcVarTypeString</a> value.
     * @type {Integer (Int32)}
     */
    static EcSubscriptionLocale => 17

    /**
     * The <b>ContentFormat</b> property of the subscription that specifies the format in which the event content should be delivered.  This property is an <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/ne-evcoll-ec_subscription_content_format">EC_SUBSCRIPTION_CONTENT_FORMAT</a> enumeration value.
     * @type {Integer (Int32)}
     */
    static EcSubscriptionContentFormat => 18

    /**
     * The <b>LogFile</b> property of the subscription that specifies the log file where the events collected from the event sources will be stored.  This property is an <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/ns-evcoll-ec_variant">EcVarTypeString</a> value.
     * @type {Integer (Int32)}
     */
    static EcSubscriptionLogFile => 19

    /**
     * The <b>PublisherName</b> property of the subscription that contains the name of publisher that the event collector computer will raise events to the local log as. This is used when you want to collect events in a log other than the ForwardedEvents log. This property is an <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/ns-evcoll-ec_variant">EcVarTypeString</a> value.
     * @type {Integer (Int32)}
     */
    static EcSubscriptionPublisherName => 20

    /**
     * The <b>CredentialsType</b> property of the subscription that specifies the type of credentials used in the event subscription.  This property is an <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/ne-evcoll-ec_subscription_credentials_type">EC_SUBSCRIPTION_CREDENTIALS_TYPE</a> enumeration value. This property cannot be used for source initiated subscriptions.
     * @type {Integer (Int32)}
     */
    static EcSubscriptionCredentialsType => 21

    /**
     * The <b>CommonUserName</b> property  of the subscription that contains the common user name, which is used by the local and remote computers to authenticate the user.  This property is an <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/ns-evcoll-ec_variant">EcVarTypeString</a> value. This property cannot be used for source initiated subscriptions.
     * @type {Integer (Int32)}
     */
    static EcSubscriptionCommonUserName => 22

    /**
     * The <b>CommonPassword</b> property of the subscription that contains the common password, which is used by the local and remote computers to authenticate the user.  This property is an <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/ns-evcoll-ec_variant">EcVarTypeString</a> value. This property cannot be used for source initiated subscriptions.
     * @type {Integer (Int32)}
     */
    static EcSubscriptionCommonPassword => 23

    /**
     * The <b>HostName</b> property of the subscription that specifies the fully qualified domain name (FQDN) of the local computer. This property is used by an event source to forward events and is used in scenarios that involve multihomed servers that may have multiple FQDNs. This property is an <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/ns-evcoll-ec_variant">EcVarTypeString</a> value and must only be used for a push subscription.
     * @type {Integer (Int32)}
     */
    static EcSubscriptionHostName => 24

    /**
     * The <b>ReadExistingEvents</b> property of the subscription that determines whether to collect existing events or not. This property is an <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/ns-evcoll-ec_variant">EcVarTypeBoolean</a> value.
     * @type {Integer (Int32)}
     */
    static EcSubscriptionReadExistingEvents => 25

    /**
     * The <b>Dialect</b> property of the subscription that specifies the dialect of the query string. For example, the dialect for  SQL based filters  would be SQL, and the dialect for WMI based filters would be WQL. This property is an <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/ns-evcoll-ec_variant">EcVarTypeString</a> value.
     * @type {Integer (Int32)}
     */
    static EcSubscriptionDialect => 26

    /**
     * The <b>Type</b> property of the subscription that defines whether the subscription is initiated by  an event source or collector. This property is a <b>EC_SUBSCRPTION_TYPE</b> value.
     * @type {Integer (Int32)}
     */
    static EcSubscriptionType => 27

    /**
     * The <b>AllowedIssuerCAs</b> property of the subscription that contains the certificate authorities (CAs) allowed if the subscription uses certificate-based authentication. This is used for source initiated subscriptions. This property is an <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/ns-evcoll-ec_variant">EcVarTypeString</a> value.
     * @type {Integer (Int32)}
     */
    static EcSubscriptionAllowedIssuerCAs => 28

    /**
     * The <b>AllowedSubjects</b> property of the subscription that contains the subjects that are allowed for the subscription.  This is used for source initiated subscriptions.  The subject specifies names, such as domain names, for all the event source computers that are allowed in the subscription. This property is an <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/ns-evcoll-ec_variant">EcVarTypeString</a> value.
     * @type {Integer (Int32)}
     */
    static EcSubscriptionAllowedSubjects => 29

    /**
     * The <b>DeniedSubjects</b> property of the subscription that contains the subjects that are not allowed for the subscription.  This is used for source initiated subscriptions.  The subject specifies names, such as domain names, for all the event source computers that are not allowed in the subscription. This property is an <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/ns-evcoll-ec_variant">EcVarTypeString</a> value.
     * @type {Integer (Int32)}
     */
    static EcSubscriptionDeniedSubjects => 30

    /**
     * The <b>AllowedSourceDomainComputers</b> property of the subscription that contains the source computers that are allowed to send events to the collector computer defined by an SDDL string. This property is an <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/ns-evcoll-ec_variant">EcVarTypeString</a> value.
     * @type {Integer (Int32)}
     */
    static EcSubscriptionAllowedSourceDomainComputers => 31

    /**
     * 
     * @type {Integer (Int32)}
     */
    static EcSubscriptionPropertyIdEND => 32
}
