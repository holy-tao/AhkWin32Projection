#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Event transcript configuration details such as maximum storage size and hours of data history.
 * @remarks
 * 
 * For more details on how configurations work, see [**Diagnostic Data Viewer overview**](/windows/privacy/diagnostic-data-viewer-overview)
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//diagnosticdataquerytypes/ns-diagnosticdataquerytypes-diagnostic_data_event_transcript_configuration
 * @namespace Windows.Win32.Security.DiagnosticDataQuery
 * @version v4.0.30319
 */
class DIAGNOSTIC_DATA_EVENT_TRANSCRIPT_CONFIGURATION extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * Type: **[UINT32](/windows/desktop/winprog/windows-data-types)**
     * Number of hours of event history to keep. When an event has been stored for longer than this amount of time, it will be dropped.
     * @type {Integer}
     */
    hoursOfHistoryToKeep {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: **[UINT32](/windows/desktop/winprog/windows-data-types)**
     * Maximum storage size (in megabytes) of event history to keep. When event store exceeds this size, events will be removed from the store starting with the oldest event.
     * @type {Integer}
     */
    maxStoreMegabytes {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: **[UINT32](/windows/desktop/winprog/windows-data-types)**
     * The requested storage size (in megabytes) of event history to keep.
     * @type {Integer}
     */
    requestedMaxStoreMegabytes {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
