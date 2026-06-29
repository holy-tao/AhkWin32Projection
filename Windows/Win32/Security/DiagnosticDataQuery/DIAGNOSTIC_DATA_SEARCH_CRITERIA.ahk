#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * This resource contains details of the search criteria when fetching a diagnostic data record.
 * @remarks
 * For more details on how core data is defined, see our [**privacy statement**](/windows/privacy/windows-diagnostic-data).
 * @see https://learn.microsoft.com/windows/win32/api/diagnosticdataquerytypes/ns-diagnosticdataquerytypes-diagnostic_data_search_criteria
 * @namespace Windows.Win32.Security.DiagnosticDataQuery
 */
export default struct DIAGNOSTIC_DATA_SEARCH_CRITERIA {
    #StructPack 8

    /**
     * Type: **[LPCWSTR\*](/windows/desktop/winprog/windows-data-types)**
     * List of producer names to search for. A diagnostic data record that matches at least one of the producer names is included as a result in this search criteria. Use `nullptr` for this value to indicate no filter by producers.
     */
    producerNames : PWSTR.Ptr

    /**
     * Type: **[UINT32](/windows/desktop/winprog/windows-data-types)**
     * The number of producer names in the list of producer names to search for. Use `0` for this value to indicate no filter by producers.
     */
    producerNameCount : UInt32

    /**
     * Type: **[LPCWSTR](/windows/desktop/winprog/windows-data-types)**
     * The sub-string to search for within diagnostic data records. This text is case insensitive.
     */
    textToMatch : PWSTR

    /**
     * Type: **[INT32\*](/windows/desktop/winprog/windows-data-types)**
     * List of category identifiers to search for. A diagnostic data record that matches at least one of the category names is included as a result in this search criteria. Use `nullptr` for this value to indicate no filter by categories.
     */
    categoryIds : IntPtr

    /**
     * Type: **[UINT32](/windows/desktop/winprog/windows-data-types)**
     * The number of categories in the list of category identifiers. Use `0` for this value to indicate no filter by categories.
     */
    categoryIdCount : UInt32

    /**
     * Type: **[INT32\*](/windows/desktop/winprog/windows-data-types)**
     * List of privacy tag identifiers to search for. A diagnostic data record that matches at least one of the tags is included as a result in this search criteria. Use `nullptr` for this value to indicate no filter by privacy tags.
     */
    privacyTags : IntPtr

    /**
     * Type: **[UINT32](/windows/desktop/winprog/windows-data-types)**
     * The number of privacy tags in the list of privacy tag identifiers. Use `0` for this value to indicate no filter by tags.
     */
    privacyTagCount : UInt32

    /**
     * Type: **[BOOL](/windows/desktop/winprog/windows-data-types)**
     * `TRUE` to filter search results to only core data. `FALSE` to return both core and non-core data.
     */
    coreDataOnly : BOOL

}
