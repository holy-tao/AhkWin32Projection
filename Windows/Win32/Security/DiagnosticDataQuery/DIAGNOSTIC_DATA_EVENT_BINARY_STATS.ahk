#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * A resource that describes this binary and the amount of diagnostic data it has sent.
 * @remarks
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//diagnosticdataquerytypes/ns-diagnosticdataquerytypes-diagnostic_data_event_binary_stats
 * @namespace Windows.Win32.Security.DiagnosticDataQuery
 * @version v4.0.30319
 */
class DIAGNOSTIC_DATA_EVENT_BINARY_STATS extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Type: **[LPWSTR](/windows/desktop/winprog/windows-data-types)**
     * The full name of the module or binary.
     * @type {PWSTR}
     */
    moduleName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: **[LPWSTR](/windows/desktop/winprog/windows-data-types)**
     * The friendly name of the module or binary.
     * @type {PWSTR}
     */
    friendlyModuleName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: **[UINT32](/windows/desktop/winprog/windows-data-types)**
     * The number of events sent by this module or binary.
     * @type {Integer}
     */
    eventCount {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: **[UINT64](/windows/desktop/winprog/windows-data-types)**
     * The number of bytes sent by this module or binary.
     * @type {Integer}
     */
    uploadSizeBytes {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
