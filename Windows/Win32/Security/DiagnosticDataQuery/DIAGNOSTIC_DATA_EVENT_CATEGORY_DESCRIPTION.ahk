#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * A resource that represents a category, defined by an identifier and a name. A category is an organizational construct to categorize records for a given producer. For example, "Browsing Data" could be a category for the producer "Microsoft Edge".
 * @see https://learn.microsoft.com/windows/win32/api/diagnosticdataquerytypes/ns-diagnosticdataquerytypes-diagnostic_data_event_category_description
 * @namespace Windows.Win32.Security.DiagnosticDataQuery
 */
export default struct DIAGNOSTIC_DATA_EVENT_CATEGORY_DESCRIPTION {
    #StructPack 8

    /**
     * Type: **[INT32](/windows/desktop/winprog/windows-data-types)**
     * An identifier to identify this category.
     */
    id : Int32

    /**
     * Type: **[LPWSTR](/windows/desktop/winprog/windows-data-types)**
     * The name of this category.
     */
    name : PWSTR

}
