#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Event transcript configuration details such as maximum storage size and hours of data history.
 * @remarks
 * For more details on how configurations work, see [**Diagnostic Data Viewer overview**](/windows/privacy/diagnostic-data-viewer-overview)
 * @see https://learn.microsoft.com/windows/win32/api/diagnosticdataquerytypes/ns-diagnosticdataquerytypes-diagnostic_data_event_transcript_configuration
 * @namespace Windows.Win32.Security.DiagnosticDataQuery
 */
export default struct DIAGNOSTIC_DATA_EVENT_TRANSCRIPT_CONFIGURATION {
    #StructPack 4

    /**
     * Type: **[UINT32](/windows/desktop/winprog/windows-data-types)**
     * Number of hours of event history to keep. When an event has been stored for longer than this amount of time, it will be dropped.
     */
    hoursOfHistoryToKeep : UInt32

    /**
     * Type: **[UINT32](/windows/desktop/winprog/windows-data-types)**
     * Maximum storage size (in megabytes) of event history to keep. When event store exceeds this size, events will be removed from the store starting with the oldest event.
     */
    maxStoreMegabytes : UInt32

    /**
     * Type: **[UINT32](/windows/desktop/winprog/windows-data-types)**
     * The requested storage size (in megabytes) of event history to keep.
     */
    requestedMaxStoreMegabytes : UInt32

}
