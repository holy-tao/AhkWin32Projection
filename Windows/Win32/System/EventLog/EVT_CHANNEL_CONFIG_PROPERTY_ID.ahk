#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the identifiers that identify the configuration properties of a channel.
 * @see https://learn.microsoft.com/windows/win32/api/winevt/ne-winevt-evt_channel_config_property_id
 * @namespace Windows.Win32.System.EventLog
 */
class EVT_CHANNEL_CONFIG_PROPERTY_ID extends Win32Enum {

    /**
     * Identifies the <b>enabled</b> attribute of the channel.  The variant type for this property is <b>EvtVarTypeBoolean</b>.
     * 
     * You cannot set this property for the Application, System, and Security channels.
     * Native name: EvtChannelConfigEnabled
     * @type {Integer (Int32)}
     */
    static Enabled => 0

    /**
     * Identifies the <b>isolation</b> attribute of the channel.  The variant type for this property is <b>EvtVarTypeUInt32</b>. For possible isolation values, see the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/ne-winevt-evt_channel_isolation_type">EVT_CHANNEL_ISOLATION_TYPE</a> enumeration.
     * 
     * You cannot set this property for the Application, System, and Security channels.
     * Native name: EvtChannelConfigIsolation
     * @type {Integer (Int32)}
     */
    static Isolation => 1

    /**
     * Identifies the <b>type</b> attribute of the channel.  The variant type for this property is <b>EvtVarTypeUInt32</b>. For possible isolation values, see the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/ne-winevt-evt_channel_type">EVT_CHANNEL_TYPE</a> enumeration. 
     * 
     * You cannot set this property.
     * Native name: EvtChannelConfigType
     * @type {Integer (Int32)}
     */
    static Type => 2

    /**
     * Identifies the <b>name</b> attribute of the provider that defined the channel.  The variant type for this property is <b>EvtVarTypeString</b>. 
     * 
     * You cannot set this property.
     * Native name: EvtChannelConfigOwningPublisher
     * @type {Integer (Int32)}
     */
    static OwningPublisher => 3

    /**
     * Identifies the configuration property that indicates whether the channel is a classic event channel (for example the Application or System log). The variant type for this property is <b>EvtVarTypeBoolean</b>. 
     * 
     * You cannot set this property.
     * Native name: EvtChannelConfigClassicEventlog
     * @type {Integer (Int32)}
     */
    static ClassicEventlog => 4

    /**
     * Identifies the <b>access</b> attribute of the channel.  The variant type for this property is <b>EvtVarTypeString</b>.
     * Native name: EvtChannelConfigAccess
     * @type {Integer (Int32)}
     */
    static Access => 5

    /**
     * Identifies the <b>retention</b> logging attribute of the channel.  The variant type for this property is <b>EvtVarTypeBoolean</b>.
     * Native name: EvtChannelLoggingConfigRetention
     * @type {Integer (Int32)}
     */
    static LoggingConfigRetention => 6

    /**
     * Identifies the <b>autoBackup</b> logging attribute of the channel.  The variant type for this property is <b>EvtVarTypeBoolean</b>.
     * Native name: EvtChannelLoggingConfigAutoBackup
     * @type {Integer (Int32)}
     */
    static LoggingConfigAutoBackup => 7

    /**
     * Identifies the <b>maxSize</b> logging attribute of the channel.  The variant type for this property is <b>EvtVarTypeUInt64</b>.
     * Native name: EvtChannelLoggingConfigMaxSize
     * @type {Integer (Int32)}
     */
    static LoggingConfigMaxSize => 8

    /**
     * Identifies the configuration property that contains the path to the file that backs the channel. The variant type for this property is <b>EvtVarTypeString</b>.
     * Native name: EvtChannelLoggingConfigLogFilePath
     * @type {Integer (Int32)}
     */
    static LoggingConfigLogFilePath => 9

    /**
     * Identifies the <b>level</b> publishing attribute of the channel.  The variant type for this property is <b>EvtVarTypeUInt32</b>. 
     * 
     * To set this property, you must first disable the debug or analytic channel.
     * Native name: EvtChannelPublishingConfigLevel
     * @type {Integer (Int32)}
     */
    static PublishingConfigLevel => 10

    /**
     * Identifies the <b>keywords</b> publishing attribute of the channel.  The variant type for this property is <b>EvtVarTypeUInt64</b>. 
     * 
     * To set this property, you must first disable the debug or analytic channel.
     * Native name: EvtChannelPublishingConfigKeywords
     * @type {Integer (Int32)}
     */
    static PublishingConfigKeywords => 11

    /**
     * Identifies the <b>controlGuid</b> publishing attribute of the channel.  The variant type for this property is <b>EvtVarTypeGuid</b>. 
     * 
     * You cannot set this property.
     * Native name: EvtChannelPublishingConfigControlGuid
     * @type {Integer (Int32)}
     */
    static PublishingConfigControlGuid => 12

    /**
     * Identifies the <b>bufferSize</b> publishing attribute of the channel.  The variant type for this property is <b>EvtVarTypeUInt32</b>. 
     * 
     * You cannot set this property.
     * Native name: EvtChannelPublishingConfigBufferSize
     * @type {Integer (Int32)}
     */
    static PublishingConfigBufferSize => 13

    /**
     * Identifies the <b>minBuffers</b> publishing attribute of the channel.  The variant type for this property is <b>EvtVarTypeUInt32</b>. 
     * 
     * You cannot set this property.
     * Native name: EvtChannelPublishingConfigMinBuffers
     * @type {Integer (Int32)}
     */
    static PublishingConfigMinBuffers => 14

    /**
     * Identifies the <b>maxBuffers</b> publishing attribute of the channel.  The variant type for this property is <b>EvtVarTypeUInt32</b>. 
     * 
     * You cannot set this property.
     * Native name: EvtChannelPublishingConfigMaxBuffers
     * @type {Integer (Int32)}
     */
    static PublishingConfigMaxBuffers => 15

    /**
     * Identifies the <b>latency</b> publishing attribute of the channel.  The variant type for this property is <b>EvtVarTypeUInt32</b>. 
     * 
     * You cannot set this property.
     * Native name: EvtChannelPublishingConfigLatency
     * @type {Integer (Int32)}
     */
    static PublishingConfigLatency => 16

    /**
     * Identifies the <b>clockType</b> publishing attribute of the channel.  The variant type for this property is <b>EvtVarTypeUInt32</b>. For possible clock type values, see the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/ne-winevt-evt_channel_clock_type">EVT_CHANNEL_CLOCK_TYPE</a> enumeration. 
     * 
     * You cannot set this property.
     * Native name: EvtChannelPublishingConfigClockType
     * @type {Integer (Int32)}
     */
    static PublishingConfigClockType => 17

    /**
     * Identifies the <b>sidType</b> publishing attribute of the channel.  The variant type for this property is <b>EvtVarTypeUInt32</b>. For possible SID type values, see the  <a href="https://docs.microsoft.com/windows/desktop/api/winevt/ne-winevt-evt_channel_sid_type">EVT_CHANNEL_SID_TYPE</a> enumeration. 
     * 
     * You cannot set this property.
     * Native name: EvtChannelPublishingConfigSidType
     * @type {Integer (Int32)}
     */
    static PublishingConfigSidType => 18

    /**
     * Identifies the configuration property that contains the list of providers that import this channel.  The variant type for this property is <b>EvtVarTypeString | EVT_VARIANT_TYPE_ARRAY</b>. 
     * 
     * You cannot set this property.
     * Native name: EvtChannelPublisherList
     * @type {Integer (Int32)}
     */
    static PublisherList => 19

    /**
     * Identifies the <b>fileMax</b> publishing attribute of the channel.  The variant type for this property is <b>EvtVarTypeUInt32</b>.
     * Native name: EvtChannelPublishingConfigFileMax
     * @type {Integer (Int32)}
     */
    static PublishingConfigFileMax => 20

    /**
     * This enumeration value marks the end of the enumeration values.
     * Native name: EvtChannelConfigPropertyIdEND
     * @type {Integer (Int32)}
     */
    static IdEND => 21
}
