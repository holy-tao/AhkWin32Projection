#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * A resource that describes a tag, defined by the tag's name and its description.
 * @remarks
 * For more details, see our [**privacy statement**](/windows/privacy/windows-diagnostic-data).
 * @see https://learn.microsoft.com/windows/win32/api/diagnosticdataquerytypes/ns-diagnosticdataquerytypes-diagnostic_data_event_tag_description
 * @namespace Windows.Win32.Security.DiagnosticDataQuery
 */
export default struct DIAGNOSTIC_DATA_EVENT_TAG_DESCRIPTION {
    #StructPack 8

    /**
     * Type: **[INT32](/windows/desktop/winprog/windows-data-types)**
     * A unique identifier for this tag.
     */
    privacyTag : Int32

    /**
     * Type: **[LPWSTR](/windows/desktop/winprog/windows-data-types)**
     * The name of this tag.
     */
    name : PWSTR

    /**
     * Type: **[LPWSTR](/windows/desktop/winprog/windows-data-types)**
     * The official description for this tag.
     */
    description : PWSTR

}
