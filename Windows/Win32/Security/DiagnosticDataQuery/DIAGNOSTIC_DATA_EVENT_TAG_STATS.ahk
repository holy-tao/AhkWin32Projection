#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * A resource that includes a privacy tag and how many events have this privacy tag.
 * @remarks
 * 
  * See our [**privacy statement**](/windows/privacy/windows-diagnostic-data) for information about diagnostic data privacy tags.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//diagnosticdataquerytypes/ns-diagnosticdataquerytypes-diagnostic_data_event_tag_stats
 * @namespace Windows.Win32.Security.DiagnosticDataQuery
 * @version v4.0.30319
 */
class DIAGNOSTIC_DATA_EVENT_TAG_STATS extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Type: **[INT32](/windows/desktop/winprog/windows-data-types)**
     * The numeric identifier for this privacy tag.
     * @type {Integer}
     */
    privacyTag {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: **[UINT32](/windows/desktop/winprog/windows-data-types)**
     * The number of events that have this privacy tag.
     * @type {Integer}
     */
    eventCount {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
