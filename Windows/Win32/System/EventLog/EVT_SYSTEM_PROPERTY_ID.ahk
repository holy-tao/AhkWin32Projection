#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the identifiers that identify the system-specific properties of an event.
 * @remarks
 * Before accessing these properties, check the variant type to ensure that it is not EvtVarTypeNULL; not all events will contain all system properties. For a list of system properties, see the <a href="https://docs.microsoft.com/windows/desktop/WES/eventschema-schema">Event</a> schema.
 * @see https://learn.microsoft.com/windows/win32/api/winevt/ne-winevt-evt_system_property_id
 * @namespace Windows.Win32.System.EventLog
 */
class EVT_SYSTEM_PROPERTY_ID extends Win32Enum {

    /**
     * Identifies the <b>Name</b> attribute of the provider element. The variant type for this property is <b>EvtVarTypeString</b>.
     * Native name: EvtSystemProviderName
     * @type {Integer (Int32)}
     */
    static ProviderName => 0

    /**
     * Identifies the <b>Guid</b> attribute of the provider element. The variant type for this property is <b>EvtVarTypeGuid</b>.
     * Native name: EvtSystemProviderGuid
     * @type {Integer (Int32)}
     */
    static ProviderGuid => 1

    /**
     * Identifies the <b>EventID</b> element. The variant type for this property is <b>EvtVarTypeUInt16</b>.
     * Native name: EvtSystemEventID
     * @type {Integer (Int32)}
     */
    static EventID => 2

    /**
     * Identifies the <b>Qualifiers</b> attribute of the EventID element. The variant type for this property is <b>EvtVarTypeUInt16</b>.
     * Native name: EvtSystemQualifiers
     * @type {Integer (Int32)}
     */
    static Qualifiers => 3

    /**
     * Identifies the <b>Level</b> element. The variant type for this property is <b>EvtVarTypeUInt8</b>.
     * Native name: EvtSystemLevel
     * @type {Integer (Int32)}
     */
    static Level => 4

    /**
     * Identifies the <b>Task</b> element. The variant type for this property is <b>EvtVarTypeUInt16</b>.
     * Native name: EvtSystemTask
     * @type {Integer (Int32)}
     */
    static Task => 5

    /**
     * Identifies the <b>Opcode</b> element. The variant type for this property is <b>EvtVarTypeUInt8</b>.
     * Native name: EvtSystemOpcode
     * @type {Integer (Int32)}
     */
    static Opcode => 6

    /**
     * Identifies the <b>Keywords</b> element. The variant type for this property is <b>EvtVarTypeInt64</b>.
     * Native name: EvtSystemKeywords
     * @type {Integer (Int32)}
     */
    static Keywords => 7

    /**
     * Identifies the <b>SystemTime</b> attribute of the TimeCreated element. The variant type for this property is <b>EvtVarTypeFileTime</b>.
     * Native name: EvtSystemTimeCreated
     * @type {Integer (Int32)}
     */
    static TimeCreated => 8

    /**
     * Identifies the <b>EventRecordID</b> element. The variant type for this property is <b>EvtVarTypeUInt64</b>.
     * Native name: EvtSystemEventRecordId
     * @type {Integer (Int32)}
     */
    static EventRecordId => 9

    /**
     * Identifies the <b>ActivityID</b> attribute of the Correlation element. The variant type for this property is <b>EvtVarTypeGuid</b>.
     * Native name: EvtSystemActivityID
     * @type {Integer (Int32)}
     */
    static ActivityID => 10

    /**
     * Identifies the <b>RelatedActivityID</b> attribute of the Correlation element. The variant type for this property is <b>EvtVarTypeGuid</b>.
     * Native name: EvtSystemRelatedActivityID
     * @type {Integer (Int32)}
     */
    static RelatedActivityID => 11

    /**
     * Identifies the <b>ProcessID</b> attribute of the Execution element. The variant type for this property is <b>EvtVarTypeUInt32</b>.
     * Native name: EvtSystemProcessID
     * @type {Integer (Int32)}
     */
    static ProcessID => 12

    /**
     * Identifies the <b>ThreadID</b> attribute of the Execution element. The variant type for this property is <b>EvtVarTypeUInt32</b>.
     * Native name: EvtSystemThreadID
     * @type {Integer (Int32)}
     */
    static ThreadID => 13

    /**
     * Identifies the <b>Channel</b> element. The variant type for this property is <b>EvtVarTypeString</b>.
     * Native name: EvtSystemChannel
     * @type {Integer (Int32)}
     */
    static Channel => 14

    /**
     * Identifies the <b>Computer</b> element. The variant type for this property is <b>EvtVarTypeString</b>.
     * Native name: EvtSystemComputer
     * @type {Integer (Int32)}
     */
    static Computer => 15

    /**
     * Identifies the <b>UserID</b> element. The variant type for this property is <b>EvtVarTypeSid</b>.
     * Native name: EvtSystemUserID
     * @type {Integer (Int32)}
     */
    static UserID => 16

    /**
     * Identifies the <b>Version</b> element. The variant type for this property is <b>EvtVarTypeUInt8</b>.
     * Native name: EvtSystemVersion
     * @type {Integer (Int32)}
     */
    static Version => 17

    /**
     * This enumeration value marks the end of the enumeration values.
     * Native name: EvtSystemPropertyIdEND
     * @type {Integer (Int32)}
     */
    static IdEND => 18
}
