#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * This resource describes an individual diagnostic data record (event).
 * @remarks
 * - For more information about events and providers, see [**Event Tracing**](/windows/win32/etw/event-tracing-portal). 
 * - For information about how a producer is defined, see [**DIAGNOSTIC_DATA_EVENT_PRODUCER_DESCRIPTION**](./ns-diagnosticdataquerytypes-diagnostic_data_event_producer_description.md).
 * - For information about how a tag is defined, see [**DIAGNOSTIC_DATA_EVENT_TAG_DESCRIPTION**](./ns-diagnosticdataquerytypes-diagnostic_data_event_tag_description.md).
 * - For information about how a category is defined, see [**DIAGNOSTIC_DATA_EVENT_CATEGORY_DESCRIPTION**](./ns-diagnosticdataquerytypes-diagnostic_data_event_category_description.md).
 * - For more details on what is core data, see our [**privacy statement**](/windows/privacy/windows-diagnostic-data).
 * @see https://learn.microsoft.com/windows/win32/api/diagnosticdataquerytypes/ns-diagnosticdataquerytypes-diagnostic_data_record
 * @namespace Windows.Win32.Security.DiagnosticDataQuery
 */
export default struct DIAGNOSTIC_DATA_RECORD {
    #StructPack 8

    /**
     * Type: **[INT64](/windows/desktop/com/structure-of-com-error-codes)**
     * The row ID of the record.
     */
    rowId : Int64

    /**
     * Type: **[UINT64](/windows/desktop/com/structure-of-com-error-codes)**
     * The timestamp for when the record was processed.
     */
    timestamp : Int64

    /**
     * Type: **[UINT64](/windows/desktop/com/structure-of-com-error-codes)**
     * The keywords associated with this event.
     */
    eventKeywords : Int64

    /**
     * Type: **[LPWSTR](/windows/desktop/com/structure-of-com-error-codes)**
     * The full event name.
     */
    fullEventName : PWSTR

    /**
     * Type: **[LPWSTR](/windows/desktop/com/structure-of-com-error-codes)**
     * The provider group GUID for this event.
     */
    providerGroupGuid : PWSTR

    /**
     * Type: **[LPWSTR](/windows/desktop/com/structure-of-com-error-codes)**
     * The name of the producer associated with this event.
     */
    producerName : PWSTR

    /**
     * Type: **[INT32\*](/windows/desktop/com/structure-of-com-error-codes)**
     * A list of privacy tag IDs for this event.
     */
    privacyTags : IntPtr

    /**
     * Type: **[UINT32](/windows/desktop/com/structure-of-com-error-codes)**
     * The number of privacy tags associated with this event.
     */
    privacyTagCount : UInt32

    /**
     * Type: **[INT32\*](/windows/desktop/com/structure-of-com-error-codes)**
     * A list of the categories associated with this event.
     */
    categoryIds : IntPtr

    /**
     * Type: **[UINT32](/windows/desktop/com/structure-of-com-error-codes)**
     * The number of categories associated with this event.
     */
    categoryIdCount : UInt32

    /**
     * Type: **[BOOL](/windows/desktop/winprog/windows-data-types)**
     * `TRUE` if this record is core data. `FALSE` otherwise.
     */
    isCoreData : BOOL

    extra1 : PWSTR

    extra2 : PWSTR

    extra3 : PWSTR

}
