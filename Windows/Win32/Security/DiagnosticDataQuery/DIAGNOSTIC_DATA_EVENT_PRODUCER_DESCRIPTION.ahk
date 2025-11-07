#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * A resource that represents a producer. A Producer is an OS component, application or service that emits events. For example, “Microsoft Edge” is the Producer ID for the Microsoft Edge browser.
 * @remarks
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//diagnosticdataquerytypes/ns-diagnosticdataquerytypes-diagnostic_data_event_producer_description
 * @namespace Windows.Win32.Security.DiagnosticDataQuery
 * @version v4.0.30319
 */
class DIAGNOSTIC_DATA_EVENT_PRODUCER_DESCRIPTION extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * Type: **[LPWSTR](/windows/desktop/winprog/windows-data-types)**
     * The name of this producer.
     * @type {PWSTR}
     */
    name {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
