#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * This resource contains details of the search criteria when fetching a diagnostic data record.
 * @remarks
 * For more details on how core data is defined, see our [**privacy statement**](/windows/privacy/windows-diagnostic-data).
 * @see https://learn.microsoft.com/windows/win32/api/diagnosticdataquerytypes/ns-diagnosticdataquerytypes-diagnostic_data_search_criteria
 * @namespace Windows.Win32.Security.DiagnosticDataQuery
 * @version v4.0.30319
 */
class DIAGNOSTIC_DATA_SEARCH_CRITERIA extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * Type: **[LPCWSTR\*](/windows/desktop/winprog/windows-data-types)**
     * List of producer names to search for. A diagnostic data record that matches at least one of the producer names is included as a result in this search criteria. Use `nullptr` for this value to indicate no filter by producers.
     * @type {Pointer<Char>}
     */
    producerNames {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: **[UINT32](/windows/desktop/winprog/windows-data-types)**
     * The number of producer names in the list of producer names to search for. Use `0` for this value to indicate no filter by producers.
     * @type {Integer}
     */
    producerNameCount {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: **[LPCWSTR](/windows/desktop/winprog/windows-data-types)**
     * The sub-string to search for within diagnostic data records. This text is case insensitive.
     * @type {Pointer<Char>}
     */
    textToMatch {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: **[INT32\*](/windows/desktop/winprog/windows-data-types)**
     * List of category identifiers to search for. A diagnostic data record that matches at least one of the category names is included as a result in this search criteria. Use `nullptr` for this value to indicate no filter by categories.
     * @type {Pointer<Int32>}
     */
    categoryIds {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Type: **[UINT32](/windows/desktop/winprog/windows-data-types)**
     * The number of categories in the list of category identifiers. Use `0` for this value to indicate no filter by categories.
     * @type {Integer}
     */
    categoryIdCount {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Type: **[INT32\*](/windows/desktop/winprog/windows-data-types)**
     * List of privacy tag identifiers to search for. A diagnostic data record that matches at least one of the tags is included as a result in this search criteria. Use `nullptr` for this value to indicate no filter by privacy tags.
     * @type {Pointer<Int32>}
     */
    privacyTags {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Type: **[UINT32](/windows/desktop/winprog/windows-data-types)**
     * The number of privacy tags in the list of privacy tag identifiers. Use `0` for this value to indicate no filter by tags.
     * @type {Integer}
     */
    privacyTagCount {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Type: **[BOOL](/windows/desktop/winprog/windows-data-types)**
     * `TRUE` to filter search results to only core data. `FALSE` to return both core and non-core data.
     * @type {Integer}
     */
    coreDataOnly {
        get => NumGet(this, 52, "int")
        set => NumPut("int", value, this, 52)
    }
}
