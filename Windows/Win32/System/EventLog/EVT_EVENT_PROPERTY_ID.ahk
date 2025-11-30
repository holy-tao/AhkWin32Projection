#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the values that determine the query information to retrieve.
 * @see https://docs.microsoft.com/windows/win32/api//winevt/ne-winevt-evt_event_property_id
 * @namespace Windows.Win32.System.EventLog
 * @version v4.0.30319
 */
class EVT_EVENT_PROPERTY_ID extends Win32Enum{

    /**
     * Not supported. The identifier of the query that selected the event. The variant type of this property is EvtVarTypeInt32.
     * @type {Integer (Int32)}
     */
    static EvtEventQueryIDs => 0

    /**
     * The channel or log file from which the event came. The variant type of this property is EvtVarTypeString.
     * @type {Integer (Int32)}
     */
    static EvtEventPath => 1

    /**
     * This enumeration value marks the end of the enumeration values. It can be used to exit a loop when retrieving all the properties.
     * @type {Integer (Int32)}
     */
    static EvtEventPropertyIdEND => 2
}
