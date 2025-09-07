#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

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
 * @version v4.0.30319
 */
class DIAGNOSTIC_DATA_RECORD extends Win32Struct
{
    static sizeof => 104

    static packingSize => 8

    /**
     * Type: **[INT64](/windows/desktop/com/structure-of-com-error-codes)**
     * The row ID of the record.
     * @type {Integer}
     */
    rowId {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }

    /**
     * Type: **[UINT64](/windows/desktop/com/structure-of-com-error-codes)**
     * The timestamp for when the record was processed.
     * @type {Integer}
     */
    timestamp {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: **[UINT64](/windows/desktop/com/structure-of-com-error-codes)**
     * The keywords associated with this event.
     * @type {Integer}
     */
    eventKeywords {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: **[LPWSTR](/windows/desktop/com/structure-of-com-error-codes)**
     * The full event name.
     * @type {PWSTR}
     */
    fullEventName{
        get {
            if(!this.HasProp("__fullEventName"))
                this.__fullEventName := PWSTR(this.ptr + 24)
            return this.__fullEventName
        }
    }

    /**
     * Type: **[LPWSTR](/windows/desktop/com/structure-of-com-error-codes)**
     * The provider group GUID for this event.
     * @type {PWSTR}
     */
    providerGroupGuid{
        get {
            if(!this.HasProp("__providerGroupGuid"))
                this.__providerGroupGuid := PWSTR(this.ptr + 32)
            return this.__providerGroupGuid
        }
    }

    /**
     * Type: **[LPWSTR](/windows/desktop/com/structure-of-com-error-codes)**
     * The name of the producer associated with this event.
     * @type {PWSTR}
     */
    producerName{
        get {
            if(!this.HasProp("__producerName"))
                this.__producerName := PWSTR(this.ptr + 40)
            return this.__producerName
        }
    }

    /**
     * Type: **[INT32\*](/windows/desktop/com/structure-of-com-error-codes)**
     * A list of privacy tag IDs for this event.
     * @type {Pointer<Int32>}
     */
    privacyTags {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Type: **[UINT32](/windows/desktop/com/structure-of-com-error-codes)**
     * The number of privacy tags associated with this event.
     * @type {Integer}
     */
    privacyTagCount {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * Type: **[INT32\*](/windows/desktop/com/structure-of-com-error-codes)**
     * A list of the categories associated with this event.
     * @type {Pointer<Int32>}
     */
    categoryIds {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * Type: **[UINT32](/windows/desktop/com/structure-of-com-error-codes)**
     * The number of categories associated with this event.
     * @type {Integer}
     */
    categoryIdCount {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * Type: **[BOOL](/windows/desktop/winprog/windows-data-types)**
     * `TRUE` if this record is core data. `FALSE` otherwise.
     * @type {Integer}
     */
    isCoreData {
        get => NumGet(this, 76, "int")
        set => NumPut("int", value, this, 76)
    }

    /**
     * 
     * @type {PWSTR}
     */
    extra1{
        get {
            if(!this.HasProp("__extra1"))
                this.__extra1 := PWSTR(this.ptr + 80)
            return this.__extra1
        }
    }

    /**
     * 
     * @type {PWSTR}
     */
    extra2{
        get {
            if(!this.HasProp("__extra2"))
                this.__extra2 := PWSTR(this.ptr + 88)
            return this.__extra2
        }
    }

    /**
     * 
     * @type {PWSTR}
     */
    extra3{
        get {
            if(!this.HasProp("__extra3"))
                this.__extra3 := PWSTR(this.ptr + 96)
            return this.__extra3
        }
    }
}
