#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the identifiers that identify the system-specific properties of an event.
 * @remarks
 * 
 * Before accessing these properties, check the variant type to ensure that it is not EvtVarTypeNULL; not all events will contain all system properties. For a list of system properties, see the <a href="https://docs.microsoft.com/windows/desktop/WES/eventschema-schema">Event</a> schema.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//winevt/ne-winevt-evt_system_property_id
 * @namespace Windows.Win32.System.EventLog
 * @version v4.0.30319
 */
class EVT_SYSTEM_PROPERTY_ID{

    /**
     * Identifies the <b>Name</b> attribute of the provider element. The variant type for this property is <b>EvtVarTypeString</b>.
     * @type {Integer (Int32)}
     */
    static EvtSystemProviderName => 0

    /**
     * Identifies the <b>Guid</b> attribute of the provider element. The variant type for this property is <b>EvtVarTypeGuid</b>.
     * @type {Integer (Int32)}
     */
    static EvtSystemProviderGuid => 1

    /**
     * Identifies the <b>EventID</b> element. The variant type for this property is <b>EvtVarTypeUInt16</b>.
     * @type {Integer (Int32)}
     */
    static EvtSystemEventID => 2

    /**
     * Identifies the <b>Qualifiers</b> attribute of the EventID element. The variant type for this property is <b>EvtVarTypeUInt16</b>.
     * @type {Integer (Int32)}
     */
    static EvtSystemQualifiers => 3

    /**
     * Identifies the <b>Level</b> element. The variant type for this property is <b>EvtVarTypeUInt8</b>.
     * @type {Integer (Int32)}
     */
    static EvtSystemLevel => 4

    /**
     * Identifies the <b>Task</b> element. The variant type for this property is <b>EvtVarTypeUInt16</b>.
     * @type {Integer (Int32)}
     */
    static EvtSystemTask => 5

    /**
     * Identifies the <b>Opcode</b> element. The variant type for this property is <b>EvtVarTypeUInt8</b>.
     * @type {Integer (Int32)}
     */
    static EvtSystemOpcode => 6

    /**
     * Identifies the <b>Keywords</b> element. The variant type for this property is <b>EvtVarTypeInt64</b>.
     * @type {Integer (Int32)}
     */
    static EvtSystemKeywords => 7

    /**
     * Identifies the <b>SystemTime</b> attribute of the TimeCreated element. The variant type for this property is <b>EvtVarTypeFileTime</b>.
     * @type {Integer (Int32)}
     */
    static EvtSystemTimeCreated => 8

    /**
     * Identifies the <b>EventRecordID</b> element. The variant type for this property is <b>EvtVarTypeUInt64</b>.
     * @type {Integer (Int32)}
     */
    static EvtSystemEventRecordId => 9

    /**
     * Identifies the <b>ActivityID</b> attribute of the Correlation element. The variant type for this property is <b>EvtVarTypeGuid</b>.
     * @type {Integer (Int32)}
     */
    static EvtSystemActivityID => 10

    /**
     * Identifies the <b>RelatedActivityID</b> attribute of the Correlation element. The variant type for this property is <b>EvtVarTypeGuid</b>.
     * @type {Integer (Int32)}
     */
    static EvtSystemRelatedActivityID => 11

    /**
     * Identifies the <b>ProcessID</b> attribute of the Execution element. The variant type for this property is <b>EvtVarTypeUInt32</b>.
     * @type {Integer (Int32)}
     */
    static EvtSystemProcessID => 12

    /**
     * Identifies the <b>ThreadID</b> attribute of the Execution element. The variant type for this property is <b>EvtVarTypeUInt32</b>.
     * @type {Integer (Int32)}
     */
    static EvtSystemThreadID => 13

    /**
     * Identifies the <b>Channel</b> element. The variant type for this property is <b>EvtVarTypeString</b>.
     * @type {Integer (Int32)}
     */
    static EvtSystemChannel => 14

    /**
     * Identifies the <b>Computer</b> element. The variant type for this property is <b>EvtVarTypeString</b>.
     * @type {Integer (Int32)}
     */
    static EvtSystemComputer => 15

    /**
     * Identifies the <b>UserID</b> element. The variant type for this property is <b>EvtVarTypeSid</b>.
     * @type {Integer (Int32)}
     */
    static EvtSystemUserID => 16

    /**
     * Identifies the <b>Version</b> element. The variant type for this property is <b>EvtVarTypeUInt8</b>.
     * @type {Integer (Int32)}
     */
    static EvtSystemVersion => 17

    /**
     * This enumeration value marks the end of the enumeration values.
     * @type {Integer (Int32)}
     */
    static EvtSystemPropertyIdEND => 18
}
