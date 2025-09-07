#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * A resource that represents a category, defined by an identifier and a name. A category is an organizational construct to categorize records for a given producer. For example, "Browsing Data" could be a category for the producer "Microsoft Edge".
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/diagnosticdataquerytypes/ns-diagnosticdataquerytypes-diagnostic_data_event_category_description
 * @namespace Windows.Win32.Security.DiagnosticDataQuery
 * @version v4.0.30319
 */
class DIAGNOSTIC_DATA_EVENT_CATEGORY_DESCRIPTION extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: **[INT32](/windows/desktop/winprog/windows-data-types)**
     * An identifier to identify this category.
     * @type {Integer}
     */
    id {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: **[LPWSTR](/windows/desktop/winprog/windows-data-types)**
     * The name of this category.
     * @type {PWSTR}
     */
    name{
        get {
            if(!this.HasProp("__name"))
                this.__name := PWSTR(this.ptr + 8)
            return this.__name
        }
    }
}
