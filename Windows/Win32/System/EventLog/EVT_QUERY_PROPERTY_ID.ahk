#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the identifiers that identify the query information that you can retrieve.
 * @see https://docs.microsoft.com/windows/win32/api//winevt/ne-winevt-evt_query_property_id
 * @namespace Windows.Win32.System.EventLog
 * @version v4.0.30319
 */
class EVT_QUERY_PROPERTY_ID{

    /**
     * Identifies the property that contains the list of channel or log file names that are specified in the query. The variant type for this property is <b>EvtVarTypeString \| EVT_VARIANT_TYPE_ARRAY</b>.
     * @type {Integer (Int32)}
     */
    static EvtQueryNames => 0

    /**
     * Identifies the property that contains the list of Win32 error codes that correspond directly to the list of channel or log file names that the EvtQueryNames property returns. The error codes indicate the success or failure of the query for the specific channel or log file. The variant type for this property is <b>EvtVarTypeUInt32 \| EVT_VARIANT_TYPE_ARRAY</b>.
     * @type {Integer (Int32)}
     */
    static EvtQueryStatuses => 1

    /**
     * This enumeration value marks the end of the enumeration values.
     * @type {Integer (Int32)}
     */
    static EvtQueryPropertyIdEND => 2
}
