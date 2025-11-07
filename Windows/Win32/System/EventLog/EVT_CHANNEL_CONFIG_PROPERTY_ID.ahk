#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the identifiers that identify the configuration properties of a channel.
 * @see https://docs.microsoft.com/windows/win32/api//winevt/ne-winevt-evt_channel_config_property_id
 * @namespace Windows.Win32.System.EventLog
 * @version v4.0.30319
 */
class EVT_CHANNEL_CONFIG_PROPERTY_ID{

    /**
     * Identifies the <b>enabled</b> attribute of the channel.  The variant type for this property is <b>EvtVarTypeBoolean</b>.
     * 
     * You cannot set this property for the Application, System, and Security channels.
     * @type {Integer (Int32)}
     */
    static EvtChannelConfigEnabled => 0

    /**
     * Identifies the <b>isolation</b> attribute of the channel.  The variant type for this property is <b>EvtVarTypeUInt32</b>. For possible isolation values, see the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/ne-winevt-evt_channel_isolation_type">EVT_CHANNEL_ISOLATION_TYPE</a> enumeration.
     * 
     * You cannot set this property for the Application, System, and Security channels.
     * @type {Integer (Int32)}
     */
    static EvtChannelConfigIsolation => 1

    /**
     * Identifies the <b>type</b> attribute of the channel.  The variant type for this property is <b>EvtVarTypeUInt32</b>. For possible isolation values, see the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/ne-winevt-evt_channel_type">EVT_CHANNEL_TYPE</a> enumeration. 
     * 
     * You cannot set this property.
     * @type {Integer (Int32)}
     */
    static EvtChannelConfigType => 2

    /**
     * Identifies the <b>name</b> attribute of the provider that defined the channel.  The variant type for this property is <b>EvtVarTypeString</b>. 
     * 
     * You cannot set this property.
     * @type {Integer (Int32)}
     */
    static EvtChannelConfigOwningPublisher => 3

    /**
     * Identifies the configuration property that indicates whether the channel is a classic event channel (for example the Application or System log). The variant type for this property is <b>EvtVarTypeBoolean</b>. 
     * 
     * You cannot set this property.
     * @type {Integer (Int32)}
     */
    static EvtChannelConfigClassicEventlog => 4

    /**
     * Identifies the <b>access</b> attribute of the channel.  The variant type for this property is <b>EvtVarTypeString</b>.
     * @type {Integer (Int32)}
     */
    static EvtChannelConfigAccess => 5

    /**
     * Identifies the <b>retention</b> logging attribute of the channel.  The variant type for this property is <b>EvtVarTypeBoolean</b>.
     * @type {Integer (Int32)}
     */
    static EvtChannelLoggingConfigRetention => 6

    /**
     * Identifies the <b>autoBackup</b> logging attribute of the channel.  The variant type for this property is <b>EvtVarTypeBoolean</b>.
     * @type {Integer (Int32)}
     */
    static EvtChannelLoggingConfigAutoBackup => 7

    /**
     * Identifies the <b>maxSize</b> logging attribute of the channel.  The variant type for this property is <b>EvtVarTypeUInt64</b>.
     * @type {Integer (Int32)}
     */
    static EvtChannelLoggingConfigMaxSize => 8

    /**
     * Identifies the configuration property that contains the path to the file that backs the channel. The variant type for this property is <b>EvtVarTypeString</b>.
     * @type {Integer (Int32)}
     */
    static EvtChannelLoggingConfigLogFilePath => 9

    /**
     * Identifies the <b>level</b> publishing attribute of the channel.  The variant type for this property is <b>EvtVarTypeUInt32</b>. 
     * 
     * To set this property, you must first disable the debug or analytic channel.
     * @type {Integer (Int32)}
     */
    static EvtChannelPublishingConfigLevel => 10

    /**
     * Identifies the <b>keywords</b> publishing attribute of the channel.  The variant type for this property is <b>EvtVarTypeUInt64</b>. 
     * 
     * To set this property, you must first disable the debug or analytic channel.
     * @type {Integer (Int32)}
     */
    static EvtChannelPublishingConfigKeywords => 11

    /**
     * Identifies the <b>controlGuid</b> publishing attribute of the channel.  The variant type for this property is <b>EvtVarTypeGuid</b>. 
     * 
     * You cannot set this property.
     * @type {Integer (Int32)}
     */
    static EvtChannelPublishingConfigControlGuid => 12

    /**
     * Identifies the <b>bufferSize</b> publishing attribute of the channel.  The variant type for this property is <b>EvtVarTypeUInt32</b>. 
     * 
     * You cannot set this property.
     * @type {Integer (Int32)}
     */
    static EvtChannelPublishingConfigBufferSize => 13

    /**
     * Identifies the <b>minBuffers</b> publishing attribute of the channel.  The variant type for this property is <b>EvtVarTypeUInt32</b>. 
     * 
     * You cannot set this property.
     * @type {Integer (Int32)}
     */
    static EvtChannelPublishingConfigMinBuffers => 14

    /**
     * Identifies the <b>maxBuffers</b> publishing attribute of the channel.  The variant type for this property is <b>EvtVarTypeUInt32</b>. 
     * 
     * You cannot set this property.
     * @type {Integer (Int32)}
     */
    static EvtChannelPublishingConfigMaxBuffers => 15

    /**
     * Identifies the <b>latency</b> publishing attribute of the channel.  The variant type for this property is <b>EvtVarTypeUInt32</b>. 
     * 
     * You cannot set this property.
     * @type {Integer (Int32)}
     */
    static EvtChannelPublishingConfigLatency => 16

    /**
     * Identifies the <b>clockType</b> publishing attribute of the channel.  The variant type for this property is <b>EvtVarTypeUInt32</b>. For possible clock type values, see the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/ne-winevt-evt_channel_clock_type">EVT_CHANNEL_CLOCK_TYPE</a> enumeration. 
     * 
     * You cannot set this property.
     * @type {Integer (Int32)}
     */
    static EvtChannelPublishingConfigClockType => 17

    /**
     * Identifies the <b>sidType</b> publishing attribute of the channel.  The variant type for this property is <b>EvtVarTypeUInt32</b>. For possible SID type values, see the  <a href="https://docs.microsoft.com/windows/desktop/api/winevt/ne-winevt-evt_channel_sid_type">EVT_CHANNEL_SID_TYPE</a> enumeration. 
     * 
     * You cannot set this property.
     * @type {Integer (Int32)}
     */
    static EvtChannelPublishingConfigSidType => 18

    /**
     * Identifies the configuration property that contains the list of providers that import this channel.  The variant type for this property is <b>EvtVarTypeString | EVT_VARIANT_TYPE_ARRAY</b>. 
     * 
     * You cannot set this property.
     * @type {Integer (Int32)}
     */
    static EvtChannelPublisherList => 19

    /**
     * Identifies the <b>fileMax</b> publishing attribute of the channel.  The variant type for this property is <b>EvtVarTypeUInt32</b>.
     * @type {Integer (Int32)}
     */
    static EvtChannelPublishingConfigFileMax => 20

    /**
     * This enumeration value marks the end of the enumeration values.
     * @type {Integer (Int32)}
     */
    static EvtChannelConfigPropertyIdEND => 21
}
