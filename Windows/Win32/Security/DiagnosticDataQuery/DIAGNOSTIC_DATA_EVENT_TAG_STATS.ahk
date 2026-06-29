#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * A resource that includes a privacy tag and how many events have this privacy tag.
 * @remarks
 * See our [**privacy statement**](/windows/privacy/windows-diagnostic-data) for information about diagnostic data privacy tags.
 * @see https://learn.microsoft.com/windows/win32/api/diagnosticdataquerytypes/ns-diagnosticdataquerytypes-diagnostic_data_event_tag_stats
 * @namespace Windows.Win32.Security.DiagnosticDataQuery
 */
export default struct DIAGNOSTIC_DATA_EVENT_TAG_STATS {
    #StructPack 4

    /**
     * Type: **[INT32](/windows/desktop/winprog/windows-data-types)**
     * The numeric identifier for this privacy tag.
     */
    privacyTag : Int32

    /**
     * Type: **[UINT32](/windows/desktop/winprog/windows-data-types)**
     * The number of events that have this privacy tag.
     */
    eventCount : UInt32

}
