#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines values to identify event subscription properties used for subscription configuration.
 * @see https://learn.microsoft.com/windows/win32/api/evcoll/ne-evcoll-ec_subscription_property_id
 * @namespace Windows.Win32.System.EventCollector
 */
class EC_SUBSCRIPTION_PROPERTY_ID extends Win32Enum {

    /**
     * The <b>Enabled</b> property of the subscription that is used to enable or disable the subscription or obtain the current status of a subscription. This property is an <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/ns-evcoll-ec_variant">EcVarTypeBoolean</a> value.
     * Native name: EcSubscriptionEnabled
     * @type {Integer (Int32)}
     */
    static Enabled => 0

    /**
     * The <b>EventSources</b> property of the subscription that contains a collection of information about the local or remote computers (event sources) that can forward events to the  event collector. This property is a handle to an array (an  <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/ns-evcoll-ec_variant">EcVarObjectArrayPropertyHandle</a> value). This value is typically used for collector initiated subscriptions. It can be used for source initiated subscriptions to disable the collection of events from a particular event source.
     * Native name: EcSubscriptionEventSources
     * @type {Integer (Int32)}
     */
    static EventSources => 1

    /**
     * The <b>EventSourceAddress</b> property of the subscription that contains the IP address or fully qualified domain name (FQDN) of the local or remote computer (event source) from which the events are collected. This property is an <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/ns-evcoll-ec_variant">EcVarTypeString</a> value.
     * Native name: EcSubscriptionEventSourceAddress
     * @type {Integer (Int32)}
     */
    static EventSourceAddress => 2

    /**
     * The <b>EventSourceEnabled</b> property of the subscription that is used to enable or disable an  event source.  This property is an <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/ns-evcoll-ec_variant">EcVarTypeBoolean</a> value.
     * Native name: EcSubscriptionEventSourceEnabled
     * @type {Integer (Int32)}
     */
    static EventSourceEnabled => 3

    /**
     * The <b>EventSourceUserName</b> property of the subscription that contains the user name, which is used by the remote computer (event source) to authenticate the user.  This property is an <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/ns-evcoll-ec_variant">EcVarTypeString</a> value. This property cannot be used for source initiated subscriptions.
     * Native name: EcSubscriptionEventSourceUserName
     * @type {Integer (Int32)}
     */
    static EventSourceUserName => 4

    /**
     * The <b>EventSourcePassword</b> property of the subscription that contains the password, which is used by the remote computer (event source) to authenticate the user.  This property is an <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/ns-evcoll-ec_variant">EcVarTypeString</a> value. This property cannot be used for source initiated subscriptions.
     * Native name: EcSubscriptionEventSourcePassword
     * @type {Integer (Int32)}
     */
    static EventSourcePassword => 5

    /**
     * The <b>Description</b> property of the subscription that contains a description of the subscription.  This property is an <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/ns-evcoll-ec_variant">EcVarTypeString</a> value.
     * Native name: EcSubscriptionDescription
     * @type {Integer (Int32)}
     */
    static Description => 6

    /**
     * The <b>URI</b> property of the subscription that contains the URI, which is used by WS-Management to connect to a computer. For example, the URI can be `http://schemas.microsoft.com/wbem/wsman/1/logrecord/sel` for hardware events or
     * it can be `http://schemas.microsoft.com/wbem/wsman/1/windows/EventLog` for events that are published in the event log.  This property is an <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/ns-evcoll-ec_variant">EcVarTypeString</a> value.
     * Native name: EcSubscriptionURI
     * @type {Integer (Int32)}
     */
    static SubscriptionURI => 7

    /**
     * The <b>ConfigurationMode</b> property of the subscription that specifies how events are delivered to the subscription.  This property is an <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/ns-evcoll-ec_variant">EcVarTypeUInt32</a> value from the <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/ne-evcoll-ec_subscription_configuration_mode">EC_SUBSCRIPTION_CONFIGURATION_MODE</a> enumeration.
     * Native name: EcSubscriptionConfigurationMode
     * @type {Integer (Int32)}
     */
    static ConfigurationMode => 8

    /**
     * The <b>Expires</b> property of the subscription  that contains the date when the subscription will  end. The maximum date that can be used is 3000-12-31T23:59:59.999Z. If this property is not defined, the subscription will not expire.  This property is an <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/ns-evcoll-ec_variant">EcVarTypeDateTime</a> value.
     * Native name: EcSubscriptionExpires
     * @type {Integer (Int32)}
     */
    static Expires => 9

    /**
     * The <b>Query</b> property of the subscription that contains the query, which is  used by the event source for selecting events to forward to the event collector. This property is an <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/ns-evcoll-ec_variant">EcVarTypeString</a> value.
     * Native name: EcSubscriptionQuery
     * @type {Integer (Int32)}
     */
    static Query => 10

    /**
     * The <b>TransportName</b> property of the subscription  that specifies the type of transport, which is used to connect to the remote computer (event source).   This value can be either HTTP, which is the default, or it can be HTTPS. This property is an <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/ns-evcoll-ec_variant">EcVarTypeString</a> value.
     * Native name: EcSubscriptionTransportName
     * @type {Integer (Int32)}
     */
    static TransportName => 11

    /**
     * The <b>TransportPort</b> property of the subscription  that specifies the port number, which the transport uses to connect to the remote computer (event source).  The default port number for HTTP is 80 and the default port number for HTTPS is  443. This property is an <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/ns-evcoll-ec_variant">EcVarTypeUInt32</a> value.
     * Native name: EcSubscriptionTransportPort
     * @type {Integer (Int32)}
     */
    static TransportPort => 12

    /**
     * The <b>DeliveryMode</b> property of the subscription that specifies  whether events are delivered to the subscription with either a push or pull model.  This property is an <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/ne-evcoll-ec_subscription_delivery_mode">EC_SUBSCRIPTION_DELIVERY_MODE</a> enumeration value. This property cannot be used for source initiated subscriptions.
     * Native name: EcSubscriptionDeliveryMode
     * @type {Integer (Int32)}
     */
    static DeliveryMode => 13

    /**
     * The <b>DeliveryMaxItems</b> property of the subscription that specifies the maximum number of events that can be batched when forwarded from the event sources.  When the <b>EcSubscriptionDeliveryMode</b> property is set to <b>EcDeliveryModePush</b>, this property determines the number of events that are included in a batch sent from the event source. When the <b>EcSubscriptionDeliveryMode</b> property is set to <b>EcDeliveryModePull</b>, this property determines the maximum number of items that will forwarded from an event source for each request. This property is an <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/ns-evcoll-ec_variant">EcVarTypeUInt32</a> value.
     * Native name: EcSubscriptionDeliveryMaxItems
     * @type {Integer (Int32)}
     */
    static DeliveryMaxItems => 14

    /**
     * The <b>DeliveryMaxLatencyTime</b> property of the subscription that specifies how long, in milliseconds, the event source should wait before sending events (even if it did not collect enough events  to reach the maximum number of items). This value is used when the <b>EcSubscriptionDeliveryMode</b> property is set to  <b>EcDeliveryModePush</b>.   This property is an <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/ns-evcoll-ec_variant">EcVarTypeUInt32</a> value.
     * Native name: EcSubscriptionDeliveryMaxLatencyTime
     * @type {Integer (Int32)}
     */
    static DeliveryMaxLatencyTime => 15

    /**
     * The <b>HeartbeatInterval</b> property of the subscription that defines the heartbeat time interval, in milliseconds, which is observed between the sent heartbeat messages.  When the <b>EcSubscriptionDeliveryMode</b> property is set to <b>EcDeliveryModePush</b>, the event collector uses this property to determine the availability of the event source. When the <b>EcSubscriptionDeliveryMode</b> property is set to <b>EcDeliveryModePull</b>, the event collector uses this property to determine the interval between queries to the event source. This property is an <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/ns-evcoll-ec_variant">EcVarTypeUInt32</a> value.
     * Native name: EcSubscriptionHeartbeatInterval
     * @type {Integer (Int32)}
     */
    static HeartbeatInterval => 16

    /**
     * The <b>Locale</b> property of the subscription that specifies the locale (for example, en-us) of the events.  This property is an <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/ns-evcoll-ec_variant">EcVarTypeString</a> value.
     * Native name: EcSubscriptionLocale
     * @type {Integer (Int32)}
     */
    static Locale => 17

    /**
     * The <b>ContentFormat</b> property of the subscription that specifies the format in which the event content should be delivered.  This property is an <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/ne-evcoll-ec_subscription_content_format">EC_SUBSCRIPTION_CONTENT_FORMAT</a> enumeration value.
     * Native name: EcSubscriptionContentFormat
     * @type {Integer (Int32)}
     */
    static ContentFormat => 18

    /**
     * The <b>LogFile</b> property of the subscription that specifies the log file where the events collected from the event sources will be stored.  This property is an <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/ns-evcoll-ec_variant">EcVarTypeString</a> value.
     * Native name: EcSubscriptionLogFile
     * @type {Integer (Int32)}
     */
    static LogFile => 19

    /**
     * The <b>PublisherName</b> property of the subscription that contains the name of publisher that the event collector computer will raise events to the local log as. This is used when you want to collect events in a log other than the ForwardedEvents log. This property is an <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/ns-evcoll-ec_variant">EcVarTypeString</a> value.
     * Native name: EcSubscriptionPublisherName
     * @type {Integer (Int32)}
     */
    static PublisherName => 20

    /**
     * The <b>CredentialsType</b> property of the subscription that specifies the type of credentials used in the event subscription.  This property is an <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/ne-evcoll-ec_subscription_credentials_type">EC_SUBSCRIPTION_CREDENTIALS_TYPE</a> enumeration value. This property cannot be used for source initiated subscriptions.
     * Native name: EcSubscriptionCredentialsType
     * @type {Integer (Int32)}
     */
    static CredentialsType => 21

    /**
     * The <b>CommonUserName</b> property  of the subscription that contains the common user name, which is used by the local and remote computers to authenticate the user.  This property is an <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/ns-evcoll-ec_variant">EcVarTypeString</a> value. This property cannot be used for source initiated subscriptions.
     * Native name: EcSubscriptionCommonUserName
     * @type {Integer (Int32)}
     */
    static CommonUserName => 22

    /**
     * The <b>CommonPassword</b> property of the subscription that contains the common password, which is used by the local and remote computers to authenticate the user.  This property is an <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/ns-evcoll-ec_variant">EcVarTypeString</a> value. This property cannot be used for source initiated subscriptions.
     * Native name: EcSubscriptionCommonPassword
     * @type {Integer (Int32)}
     */
    static CommonPassword => 23

    /**
     * The <b>HostName</b> property of the subscription that specifies the fully qualified domain name (FQDN) of the local computer. This property is used by an event source to forward events and is used in scenarios that involve multihomed servers that may have multiple FQDNs. This property is an <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/ns-evcoll-ec_variant">EcVarTypeString</a> value and must only be used for a push subscription.
     * Native name: EcSubscriptionHostName
     * @type {Integer (Int32)}
     */
    static HostName => 24

    /**
     * The <b>ReadExistingEvents</b> property of the subscription that determines whether to collect existing events or not. This property is an <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/ns-evcoll-ec_variant">EcVarTypeBoolean</a> value.
     * Native name: EcSubscriptionReadExistingEvents
     * @type {Integer (Int32)}
     */
    static ReadExistingEvents => 25

    /**
     * The <b>Dialect</b> property of the subscription that specifies the dialect of the query string. For example, the dialect for  SQL based filters  would be SQL, and the dialect for WMI based filters would be WQL. This property is an <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/ns-evcoll-ec_variant">EcVarTypeString</a> value.
     * Native name: EcSubscriptionDialect
     * @type {Integer (Int32)}
     */
    static Dialect => 26

    /**
     * The <b>Type</b> property of the subscription that defines whether the subscription is initiated by  an event source or collector. This property is a <b>EC_SUBSCRPTION_TYPE</b> value.
     * Native name: EcSubscriptionType
     * @type {Integer (Int32)}
     */
    static Type => 27

    /**
     * The <b>AllowedIssuerCAs</b> property of the subscription that contains the certificate authorities (CAs) allowed if the subscription uses certificate-based authentication. This is used for source initiated subscriptions. This property is an <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/ns-evcoll-ec_variant">EcVarTypeString</a> value.
     * Native name: EcSubscriptionAllowedIssuerCAs
     * @type {Integer (Int32)}
     */
    static AllowedIssuerCAs => 28

    /**
     * The <b>AllowedSubjects</b> property of the subscription that contains the subjects that are allowed for the subscription.  This is used for source initiated subscriptions.  The subject specifies names, such as domain names, for all the event source computers that are allowed in the subscription. This property is an <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/ns-evcoll-ec_variant">EcVarTypeString</a> value.
     * Native name: EcSubscriptionAllowedSubjects
     * @type {Integer (Int32)}
     */
    static AllowedSubjects => 29

    /**
     * The <b>DeniedSubjects</b> property of the subscription that contains the subjects that are not allowed for the subscription.  This is used for source initiated subscriptions.  The subject specifies names, such as domain names, for all the event source computers that are not allowed in the subscription. This property is an <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/ns-evcoll-ec_variant">EcVarTypeString</a> value.
     * Native name: EcSubscriptionDeniedSubjects
     * @type {Integer (Int32)}
     */
    static DeniedSubjects => 30

    /**
     * The <b>AllowedSourceDomainComputers</b> property of the subscription that contains the source computers that are allowed to send events to the collector computer defined by an SDDL string. This property is an <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/ns-evcoll-ec_variant">EcVarTypeString</a> value.
     * Native name: EcSubscriptionAllowedSourceDomainComputers
     * @type {Integer (Int32)}
     */
    static AllowedSourceDomainComputers => 31

    /**
     * Native name: EcSubscriptionPropertyIdEND
     * @type {Integer (Int32)}
     */
    static IdEND => 32
}
