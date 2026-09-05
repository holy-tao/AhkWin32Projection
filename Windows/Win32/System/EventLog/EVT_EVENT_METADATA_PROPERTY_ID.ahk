#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the identifiers that identify the metadata properties of an event definition.
 * @remarks
 * The channel, level, opcode, task, and keyword properties return the value of the value attribute. To get the metadata for a property whose value is not zero, call the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtgetpublishermetadataproperty">EvtGetPublisherMetadataProperty</a> function for the property. For example, to get the metadata for the task property, call <b>EvtGetPublisherMetadataProperty</b> using the EvtPublisherMetadataTasks provider property identifier. The function returns an array of task objects that you enumerate. For each object, compare the value of the object's value property to the value specified in the event. If the values match, use the metadata from that object.
 * @see https://learn.microsoft.com/windows/win32/api/winevt/ne-winevt-evt_event_metadata_property_id
 * @namespace Windows.Win32.System.EventLog
 */
class EVT_EVENT_METADATA_PROPERTY_ID extends Win32Enum {

    /**
     * Identifies the <b>value</b> attribute of the event definition. The variant type for this property is <b>EvtVarTypeUInt32</b>.
     * Native name: EventMetadataEventID
     * @type {Integer (Int32)}
     */
    static EventID => 0

    /**
     * Identifies the <b>version</b> attribute of the event definition. The variant type for this property is <b>EvtVarTypeUInt32</b>.
     * Native name: EventMetadataEventVersion
     * @type {Integer (Int32)}
     */
    static EventVersion => 1

    /**
     * Identifies the <b>channel</b> attribute of the event definition. The variant type for this property is <b>EvtVarTypeUInt32</b>. This property does not contain the channel identifier that you specified in the event definition but instead contains the <b>value</b> attribute of the channel. The value is zero if the event definition does not specify a channel.
     * Native name: EventMetadataEventChannel
     * @type {Integer (Int32)}
     */
    static EventChannel => 2

    /**
     * Identifies the <b>level</b> attribute of the event definition. The variant type for this property is <b>EvtVarTypeUInt32</b>. This property does not contain the level name that you specified in the event definition but instead contains the <b>value</b> attribute of the level. The value is zero if the event definition does not specify a level.
     * Native name: EventMetadataEventLevel
     * @type {Integer (Int32)}
     */
    static EventLevel => 3

    /**
     * Identifies the <b>opcode</b> attribute of the event definition. The variant type for this property is <b>EvtVarTypeUInt32</b>. This property does not contain the opcode name that you specified in the event definition but instead contains the <b>value</b> attribute of the opcode. The value is zero if the event definition does not specify an opcode.
     * Native name: EventMetadataEventOpcode
     * @type {Integer (Int32)}
     */
    static EventOpcode => 4

    /**
     * Identifies the <b>task</b> attribute of the event definition. The variant type for this property is <b>EvtVarTypeUInt32</b>. This property does not contain the task name that you specified in the event definition but instead contains the <b>value</b> attribute of the task. The value is zero if the event definition does not specify a task.
     * Native name: EventMetadataEventTask
     * @type {Integer (Int32)}
     */
    static EventTask => 5

    /**
     * Identifies the <b>keyword</b> attribute of the event definition. The variant type for this property is <b>EvtVarTypeUInt64</b>. This property does not contain the list of keyword names that you specified in the event definition but instead contains a 64-bitmask of all the keywords. The top 16 bits of the mask are reserved for internal use and should be ignored when determining the keyword bits that the event definition set.
     * Native name: EventMetadataEventKeyword
     * @type {Integer (Int32)}
     */
    static EventKeyword => 6

    /**
     * Identifies the <b>message</b> attribute of the event definition. The variant type for this property is <b>EvtVarTypeUInt32</b>. The property contains the resource identifier that is assigned to the message string. To get the message string, call the <a href="https://docs.microsoft.com/windows/desktop/api/winevt/nf-winevt-evtformatmessage">EvtFormatMessage</a> function. If the event definition does not specify a message, the value is –1.
     * Native name: EventMetadataEventMessageID
     * @type {Integer (Int32)}
     */
    static EventMessageID => 7

    /**
     * Identifies the <b>template</b> attribute of the event definition. The variant type for this property is <b>EvtVarTypeString</b>. This property does not contain the template name that you specified in the event definition but instead contains an XML string that includes the template node and each data node; the string does not include the UserData. The value is an empty string if the event definition does not specify a template.
     * Native name: EventMetadataEventTemplate
     * @type {Integer (Int32)}
     */
    static EventTemplate => 8

    /**
     * This enumeration value marks the end of the enumeration values.
     * Native name: EvtEventMetadataPropertyIdEND
     * @type {Integer (Int32)}
     */
    static IdEND => 9
}
