#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * A resource that describes a tag, defined by the tag's name and its description.
 * @remarks
 * For more details, see our [**privacy statement**](/windows/privacy/windows-diagnostic-data).
 * @see https://learn.microsoft.com/windows/win32/api/diagnosticdataquerytypes/ns-diagnosticdataquerytypes-diagnostic_data_event_tag_description
 * @namespace Windows.Win32.Security.DiagnosticDataQuery
 * @version v4.0.30319
 */
class DIAGNOSTIC_DATA_EVENT_TAG_DESCRIPTION extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Type: **[INT32](/windows/desktop/winprog/windows-data-types)**
     * A unique identifier for this tag.
     * @type {Integer}
     */
    privacyTag {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: **[LPWSTR](/windows/desktop/winprog/windows-data-types)**
     * The name of this tag.
     * @type {PWSTR}
     */
    name{
        get {
            if(!this.HasProp("__name"))
                this.__name := PWSTR(this.ptr + 8)
            return this.__name
        }
    }

    /**
     * Type: **[LPWSTR](/windows/desktop/winprog/windows-data-types)**
     * The official description for this tag.
     * @type {PWSTR}
     */
    description{
        get {
            if(!this.HasProp("__description"))
                this.__description := PWSTR(this.ptr + 16)
            return this.__description
        }
    }
}
