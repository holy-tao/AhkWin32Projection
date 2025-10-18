#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk

/**
 * @namespace Windows.Win32.Security.DiagnosticDataQuery
 * @version v4.0.30319
 */
class DiagnosticDataQuery {

;@region Constants
;@endregion Constants

;@region Methods
    /**
     * Creates a Diagnostic Data Query API session handle to be used to uniquely identify a Diagnostic Data Query session.
     * @param {Integer} accessLevel Type: **[DdqAccessLevel](/windows/win32/api/diagnosticdataquery/ne-diagnosticdataquerytypes-ddqaccesslevel)**
     * The access level desired for this session.
     * @param {Pointer<HDIAGNOSTIC_DATA_QUERY_SESSION>} hSession Type: **[HANDLE](/windows/desktop/winprog/windows-data-types)**
     * This output parameter is a handle to the created Diagnostic Data Query session.
     * @returns {HRESULT} Type: **[HRESULT](/windows/desktop/com/structure-of-com-error-codes)**
     * Returns S_OK on successful completion.
     * @see https://docs.microsoft.com/windows/win32/api//diagnosticdataquery/nf-diagnosticdataquery-ddqcreatesession
     * @since windows10.0.19041
     */
    static DdqCreateSession(accessLevel, hSession) {
        result := DllCall("DiagnosticDataQuery.dll\DdqCreateSession", "int", accessLevel, "ptr", hSession, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Closes a Diagnostic Data Query session handle.
     * @param {HDIAGNOSTIC_DATA_QUERY_SESSION} hSession Type: **[HANDLE](/windows/desktop/winprog/windows-data-types)**
     * Handle to the Diagnostic Data Query session.
     * @returns {HRESULT} Type: **[HRESULT](/windows/desktop/com/structure-of-com-error-codes)**
     * Returns S_OK on successful completion.
     * @see https://docs.microsoft.com/windows/win32/api//diagnosticdataquery/nf-diagnosticdataquery-ddqclosesession
     * @since windows10.0.19041
     */
    static DdqCloseSession(hSession) {
        hSession := hSession is Win32Handle ? NumGet(hSession, "ptr") : hSession

        result := DllCall("DiagnosticDataQuery.dll\DdqCloseSession", "ptr", hSession, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Returns the data access level of the current Diagnostic Data Query session.
     * @param {HDIAGNOSTIC_DATA_QUERY_SESSION} hSession Type: **[HANDLE](/windows/desktop/winprog/windows-data-types)**
     * Handle to the Diagnostic Data Query session.
     * @param {Pointer<Int32>} accessLevel Type: **[DdqAccessLevel\*](/windows/win32/api/diagnosticdataquery/ne-diagnosticdataquerytypes-ddqaccesslevel)**
     * This output parameter is the pointer to the access level for this session.
     * @returns {HRESULT} Type: **[HRESULT](/windows/desktop/com/structure-of-com-error-codes)**
     * Returns S_OK on successful completion.
     * @see https://docs.microsoft.com/windows/win32/api//diagnosticdataquery/nf-diagnosticdataquery-ddqgetsessionaccesslevel
     * @since windows10.0.19041
     */
    static DdqGetSessionAccessLevel(hSession, accessLevel) {
        hSession := hSession is Win32Handle ? NumGet(hSession, "ptr") : hSession

        result := DllCall("DiagnosticDataQuery.dll\DdqGetSessionAccessLevel", "ptr", hSession, "int*", accessLevel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Returns the highest available data access level for the API caller. This can be NoData, CurrentUserData or AllUserData.
     * @param {Pointer<Int32>} accessLevel Type: **[DdqAccessLevel\*](/windows/win32/api/diagnosticdataquery/ne-diagnosticdataquerytypes-ddqaccesslevel)**
     * This output parameter is a pointer to the highest access level available for the API caller.
     * @returns {HRESULT} Type: **[HRESULT](/windows/desktop/com/structure-of-com-error-codes)**
     * Returns S_OK on successful completion.
     * @see https://docs.microsoft.com/windows/win32/api//diagnosticdataquery/nf-diagnosticdataquery-ddqgetdiagnosticdataaccesslevelallowed
     * @since windows10.0.19041
     */
    static DdqGetDiagnosticDataAccessLevelAllowed(accessLevel) {
        result := DllCall("DiagnosticDataQuery.dll\DdqGetDiagnosticDataAccessLevelAllowed", "int*", accessLevel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Fetches the filtered event transcript Diagnostic Data record stats. The filtering on statistics returned is performed using the input parameter, DIAGNOSTIC_DATA_SEARCH_CRITERIA filter. The record state describes how many records matching the search criteria are available, and returns parameters used for further querying of data. One of the uses of this API is to check if there have been changes since the last time data was queried for. A change in the output parameters indicate a change in state of the event transcript record state.
     * @param {HDIAGNOSTIC_DATA_QUERY_SESSION} hSession Type: **[HANDLE](/windows/desktop/winprog/windows-data-types)**
     * Handle to the Diagnostic Data Query session.
     * @param {Pointer<DIAGNOSTIC_DATA_SEARCH_CRITERIA>} searchCriteria Type: **[DIAGNOSTIC_DATA_SEARCH_CRITERIA\*](/windows/win32/api/diagnosticdataquery/ns-diagnosticdataquerytypes-diagnostic_data_search_criteria)**
     * Pointer to the resource that contains the search criteria for this operation. This resource contains criteria such as producers, categories, and tags.
     * @param {Pointer<UInt32>} recordCount Type: **[UINT32\*](/windows/desktop/winprog/windows-data-types)**
     * This output parameter is the pointer to the number of records that match on the search criteria.
     * @param {Pointer<Int64>} minRowId Type: **[INT64\*](/windows/desktop/winprog/windows-data-types)**
     * This output parameter is the pointer to the minimum row id of the record that matches on the search criteria.
     * @param {Pointer<Int64>} maxRowId Type: **[INT64\*](/windows/desktop/winprog/windows-data-types)**
     * This output parameter is the pointer to the maximum row id of the record that matches on the search criteria.
     * @returns {HRESULT} Type: **[HRESULT](/windows/desktop/com/structure-of-com-error-codes)**
     * Returns S_OK on successful completion.
     * @see https://docs.microsoft.com/windows/win32/api//diagnosticdataquery/nf-diagnosticdataquery-ddqgetdiagnosticrecordstats
     * @since windows10.0.19041
     */
    static DdqGetDiagnosticRecordStats(hSession, searchCriteria, recordCount, minRowId, maxRowId) {
        hSession := hSession is Win32Handle ? NumGet(hSession, "ptr") : hSession

        result := DllCall("DiagnosticDataQuery.dll\DdqGetDiagnosticRecordStats", "ptr", hSession, "ptr", searchCriteria, "uint*", recordCount, "int64*", minRowId, "int64*", maxRowId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Fetches the payload text for the event record specified by rowId.
     * @param {HDIAGNOSTIC_DATA_QUERY_SESSION} hSession Type: **[HANDLE](/windows/desktop/winprog/windows-data-types)**
     * Handle to the Diagnostic Data Query session.
     * @param {Integer} rowId Type: **[INT64](/windows/desktop/winprog/windows-data-types)**
     * The row id for the event record of interest.
     * @param {Pointer<PWSTR>} payload Type: **[PCWSTR\*](/windows/desktop/winprog/windows-data-types)**
     * This output parameter is a pointer to the payload text.
     * @returns {HRESULT} Type: **[HRESULT](/windows/desktop/com/structure-of-com-error-codes)**
     * Returns S_OK on successful completion.
     * @see https://docs.microsoft.com/windows/win32/api//diagnosticdataquery/nf-diagnosticdataquery-ddqgetdiagnosticrecordpayload
     * @since windows10.0.19041
     */
    static DdqGetDiagnosticRecordPayload(hSession, rowId, payload) {
        hSession := hSession is Win32Handle ? NumGet(hSession, "ptr") : hSession

        result := DllCall("DiagnosticDataQuery.dll\DdqGetDiagnosticRecordPayload", "ptr", hSession, "int64", rowId, "ptr", payload, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HDIAGNOSTIC_DATA_QUERY_SESSION} hSession 
     * @param {PWSTR} locale 
     * @param {Pointer<HDIAGNOSTIC_EVENT_TAG_DESCRIPTION>} hTagDescription 
     * @returns {HRESULT} 
     * @since windows10.0.19041
     */
    static DdqGetDiagnosticRecordLocaleTags(hSession, locale, hTagDescription) {
        locale := locale is String ? StrPtr(locale) : locale
        hSession := hSession is Win32Handle ? NumGet(hSession, "ptr") : hSession

        result := DllCall("DiagnosticDataQuery.dll\DdqGetDiagnosticRecordLocaleTags", "ptr", hSession, "ptr", locale, "ptr", hTagDescription, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Frees memory allocated for tag information referenced by HDIAGNOSTIC_EVENT_TAG_DESCRIPTION handle.
     * @param {HDIAGNOSTIC_EVENT_TAG_DESCRIPTION} hTagDescription Type: **[HANDLE](/windows/desktop/winprog/windows-data-types)**
     * Handle to the resource that contains the tag descriptions being freed.
     * @returns {HRESULT} Type: **[HRESULT](/windows/desktop/com/structure-of-com-error-codes)**
     * Returns S_OK on successful completion.
     * @see https://docs.microsoft.com/windows/win32/api//diagnosticdataquery/nf-diagnosticdataquery-ddqfreediagnosticrecordlocaletags
     * @since windows10.0.19041
     */
    static DdqFreeDiagnosticRecordLocaleTags(hTagDescription) {
        hTagDescription := hTagDescription is Win32Handle ? NumGet(hTagDescription, "ptr") : hTagDescription

        result := DllCall("DiagnosticDataQuery.dll\DdqFreeDiagnosticRecordLocaleTags", "ptr", hTagDescription, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Fetches tag description at the specified index in the resource pointed to by the HDIAGNOSTIC_DATA_EVENT_TAG_DESCRIPTION handle.
     * @param {HDIAGNOSTIC_EVENT_TAG_DESCRIPTION} hTagDescription Type: **[HANDLE](/windows/desktop/winprog/windows-data-types)**
     * Handle to the resource that contains the list of tag descriptions.
     * @param {Integer} index Type: **[UINT32](/windows/desktop/winprog/windows-data-types)**
     * The index of the tag description to be fetched.
     * @param {Pointer<DIAGNOSTIC_DATA_EVENT_TAG_DESCRIPTION>} tagDescription Type: **[DIAGNOSTIC_DATA_EVENT_TAG_DESCRIPTION\*](../diagnosticdataquerytypes/ns-diagnosticdataquerytypes-diagnostic_data_event_tag_description.md)**
     * This outpoint parameter is a pointer to the tag description that was fetched.
     * @returns {HRESULT} Type: **[HRESULT](/windows/desktop/com/structure-of-com-error-codes)**
     * Returns S_OK on successful completion.
     * @see https://docs.microsoft.com/windows/win32/api//diagnosticdataquery/nf-diagnosticdataquery-ddqgetdiagnosticrecordlocaletagatindex
     * @since windows10.0.19041
     */
    static DdqGetDiagnosticRecordLocaleTagAtIndex(hTagDescription, index, tagDescription) {
        hTagDescription := hTagDescription is Win32Handle ? NumGet(hTagDescription, "ptr") : hTagDescription

        result := DllCall("DiagnosticDataQuery.dll\DdqGetDiagnosticRecordLocaleTagAtIndex", "ptr", hTagDescription, "uint", index, "ptr", tagDescription, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Fetches the number (size) of tags in the resource pointed to by the HDIAGNOSTIC_DATA_EVENT_TAG_DESCRIPTION handle.
     * @param {HDIAGNOSTIC_EVENT_TAG_DESCRIPTION} hTagDescription Type: **[HANDLE](/windows/desktop/winprog/windows-data-types)**
     * Handle to the resource that contains the list of tag descriptions.
     * @param {Pointer<UInt32>} tagDescriptionCount Type: **[UINT32](/windows/desktop/winprog/windows-data-types)**
     * This output parameter is the number of tags in the list of tag descriptions.
     * @returns {HRESULT} Type: **[HRESULT](/windows/desktop/com/structure-of-com-error-codes)**
     * Returns S_OK on successful completion.
     * @see https://docs.microsoft.com/windows/win32/api//diagnosticdataquery/nf-diagnosticdataquery-ddqgetdiagnosticrecordlocaletagcount
     * @since windows10.0.19041
     */
    static DdqGetDiagnosticRecordLocaleTagCount(hTagDescription, tagDescriptionCount) {
        hTagDescription := hTagDescription is Win32Handle ? NumGet(hTagDescription, "ptr") : hTagDescription

        result := DllCall("DiagnosticDataQuery.dll\DdqGetDiagnosticRecordLocaleTagCount", "ptr", hTagDescription, "uint*", tagDescriptionCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Fetches Diagnostic Data Producers available for a Diagnostic Data Query session.
     * @param {HDIAGNOSTIC_DATA_QUERY_SESSION} hSession Type: **[HANDLE](/windows/desktop/winprog/windows-data-types)**
     * Handle to the Diagnostic Data Query session.
     * @param {Pointer<HDIAGNOSTIC_EVENT_PRODUCER_DESCRIPTION>} hProducerDescription Type: **[HANDLE\*](/windows/desktop/winprog/windows-data-types)**
     * This output parameter is a pointer to the handle for the resource that contains the list of producers.
     * @returns {HRESULT} Type: **[HRESULT](/windows/desktop/com/structure-of-com-error-codes)**
     * Returns S_OK on successful completion.
     * @see https://docs.microsoft.com/windows/win32/api//diagnosticdataquery/nf-diagnosticdataquery-ddqgetdiagnosticrecordproducers
     * @since windows10.0.19041
     */
    static DdqGetDiagnosticRecordProducers(hSession, hProducerDescription) {
        hSession := hSession is Win32Handle ? NumGet(hSession, "ptr") : hSession

        result := DllCall("DiagnosticDataQuery.dll\DdqGetDiagnosticRecordProducers", "ptr", hSession, "ptr", hProducerDescription, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Frees memory allocated for the set of producers referenced by HDIAGNOSTIC_EVENT_PRODUCER_DESCRIPTION handle.
     * @param {HDIAGNOSTIC_EVENT_PRODUCER_DESCRIPTION} hProducerDescription Type: **[HANDLE](/windows/desktop/winprog/windows-data-types)**
     * Handle to the resource that contains the set of producers to be freed.
     * @returns {HRESULT} Type: **[HRESULT](/windows/desktop/com/structure-of-com-error-codes)**
     * Returns S_OK on successful completion.
     * @see https://docs.microsoft.com/windows/win32/api//diagnosticdataquery/nf-diagnosticdataquery-ddqfreediagnosticrecordproducers
     * @since windows10.0.19041
     */
    static DdqFreeDiagnosticRecordProducers(hProducerDescription) {
        hProducerDescription := hProducerDescription is Win32Handle ? NumGet(hProducerDescription, "ptr") : hProducerDescription

        result := DllCall("DiagnosticDataQuery.dll\DdqFreeDiagnosticRecordProducers", "ptr", hProducerDescription, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Fetches the description of a producer at the specified index in the resource pointed to by the HDIAGNOSTIC_EVENT_PRODUCER_DESCRIPTION handle.
     * @param {HDIAGNOSTIC_EVENT_PRODUCER_DESCRIPTION} hProducerDescription Type: **[HANDLE](/windows/desktop/winprog/windows-data-types)**
     * Handle to the resource that contains set of producers.
     * @param {Integer} index Type: **[UINT32](/windows/desktop/winprog/windows-data-types)**
     * The index of the producer to fetch.
     * @param {Pointer<DIAGNOSTIC_DATA_EVENT_PRODUCER_DESCRIPTION>} producerDescription Type: **[DIAGNOSTIC_DATA_EVENT_PRODUCER_DESCRIPTION\*](/windows/win32/api/diagnosticdataquery/ns-diagnosticdataquerytypes-diagnostic_data_event_producer_description)**
     * This output parameter is the pointer to the resource that describes the fetched producer.
     * @returns {HRESULT} Type: **[HRESULT](/windows/desktop/com/structure-of-com-error-codes)**
     * Returns S_OK on successful completion.
     * @see https://docs.microsoft.com/windows/win32/api//diagnosticdataquery/nf-diagnosticdataquery-ddqgetdiagnosticrecordproduceratindex
     * @since windows10.0.19041
     */
    static DdqGetDiagnosticRecordProducerAtIndex(hProducerDescription, index, producerDescription) {
        hProducerDescription := hProducerDescription is Win32Handle ? NumGet(hProducerDescription, "ptr") : hProducerDescription

        result := DllCall("DiagnosticDataQuery.dll\DdqGetDiagnosticRecordProducerAtIndex", "ptr", hProducerDescription, "uint", index, "ptr", producerDescription, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Fetches the number (size) of producers in the resource pointed to by the HDIAGNOSTIC_EVENT_PRODUCER_DESCRIPTION.
     * @param {HDIAGNOSTIC_EVENT_PRODUCER_DESCRIPTION} hProducerDescription Type: **[HANDLE](/windows/desktop/winprog/windows-data-types)**
     * Handle to the resource that contains list of producers.
     * @param {Pointer<UInt32>} producerDescriptionCount Type: **[UNINT32\*](/windows/desktop/winprog/windows-data-types)**
     * This output parameter is a pointer to the number of producers in provided resource.
     * @returns {HRESULT} Type: **[HRESULT](/windows/desktop/com/structure-of-com-error-codes)**
     * Returns S_OK on successful completion.
     * @see https://docs.microsoft.com/windows/win32/api//diagnosticdataquery/nf-diagnosticdataquery-ddqgetdiagnosticrecordproducercount
     * @since windows10.0.19041
     */
    static DdqGetDiagnosticRecordProducerCount(hProducerDescription, producerDescriptionCount) {
        hProducerDescription := hProducerDescription is Win32Handle ? NumGet(hProducerDescription, "ptr") : hProducerDescription

        result := DllCall("DiagnosticDataQuery.dll\DdqGetDiagnosticRecordProducerCount", "ptr", hProducerDescription, "uint*", producerDescriptionCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Producers and categories have a hierarchical relationship--that is, categories belong to producers. This function fetches the available Category IDs and text representation of categories for a given diagnostic Producer Name.
     * @param {HDIAGNOSTIC_DATA_QUERY_SESSION} hSession Type: **[HANDLE](/windows/desktop/winprog/windows-data-types)**
     * Handle to the Diagnostic Data Query session.
     * @param {PWSTR} producerName Type: **[PCWSTR](/windows/desktop/winprog/windows-data-types)**
     * The name of the producer of interest.
     * @param {Pointer<HDIAGNOSTIC_EVENT_CATEGORY_DESCRIPTION>} hCategoryDescription Type: **[HANDLE](/windows/desktop/winprog/windows-data-types)**
     * Handle to the resource that contains the list of categories and their descriptions that belong to the given producer.
     * @returns {HRESULT} Type: **[HRESULT](/windows/desktop/com/structure-of-com-error-codes)**
     * Returns S_OK on successful completion.
     * @see https://docs.microsoft.com/windows/win32/api//diagnosticdataquery/nf-diagnosticdataquery-ddqgetdiagnosticrecordproducercategories
     * @since windows10.0.19041
     */
    static DdqGetDiagnosticRecordProducerCategories(hSession, producerName, hCategoryDescription) {
        producerName := producerName is String ? StrPtr(producerName) : producerName
        hSession := hSession is Win32Handle ? NumGet(hSession, "ptr") : hSession

        result := DllCall("DiagnosticDataQuery.dll\DdqGetDiagnosticRecordProducerCategories", "ptr", hSession, "ptr", producerName, "ptr", hCategoryDescription, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Frees memory allocated for set of categories and the text representation of the categories referenced by HDIAGNOSTIC_EVENT_CATEGORY_DESCRIPTION handle.
     * @param {HDIAGNOSTIC_EVENT_CATEGORY_DESCRIPTION} hCategoryDescription Type: **[HANDLE](/windows/desktop/winprog/windows-data-types)**
     * Handle to the resource that contains the set of categories and their descriptions to be freed.
     * @returns {HRESULT} Type: **[HRESULT](/windows/desktop/com/structure-of-com-error-codes)**
     * Returns S_OK on successful completion.
     * @see https://docs.microsoft.com/windows/win32/api//diagnosticdataquery/nf-diagnosticdataquery-ddqfreediagnosticrecordproducercategories
     * @since windows10.0.19041
     */
    static DdqFreeDiagnosticRecordProducerCategories(hCategoryDescription) {
        hCategoryDescription := hCategoryDescription is Win32Handle ? NumGet(hCategoryDescription, "ptr") : hCategoryDescription

        result := DllCall("DiagnosticDataQuery.dll\DdqFreeDiagnosticRecordProducerCategories", "ptr", hCategoryDescription, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Fetches a diagnostic record category at the specified index in the resource pointed to by the HDIAGNOSTIC_DATA_EVENT_CATEGORY_DESCRIPTION handle.
     * @param {HDIAGNOSTIC_EVENT_CATEGORY_DESCRIPTION} hCategoryDescription Type: **[HANDLE](/windows/desktop/winprog/windows-data-types)**
     * Handle to the resource that contains the list of categories and their descriptions
     * @param {Integer} index Type: **[UINT32](/windows/desktop/winprog/windows-data-types)**
     * The index of the category to be fetched.
     * @param {Pointer<DIAGNOSTIC_DATA_EVENT_CATEGORY_DESCRIPTION>} categoryDescription Type: **[DIAGNOSTIC_DATA_EVENT_CATEGORY_DESCRIPTION](../diagnosticdataquerytypes/ns-diagnosticdataquerytypes-diagnostic_data_event_category_description.md)**
     * This outpoint parameter is a pointer to the category and its description that was fetched.
     * @returns {HRESULT} Type: **[HRESULT](/windows/desktop/com/structure-of-com-error-codes)**
     * Returns S_OK on successful completion.
     * @see https://docs.microsoft.com/windows/win32/api//diagnosticdataquery/nf-diagnosticdataquery-ddqgetdiagnosticrecordcategoryatindex
     * @since windows10.0.19041
     */
    static DdqGetDiagnosticRecordCategoryAtIndex(hCategoryDescription, index, categoryDescription) {
        hCategoryDescription := hCategoryDescription is Win32Handle ? NumGet(hCategoryDescription, "ptr") : hCategoryDescription

        result := DllCall("DiagnosticDataQuery.dll\DdqGetDiagnosticRecordCategoryAtIndex", "ptr", hCategoryDescription, "uint", index, "ptr", categoryDescription, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Fetches the number (size) of diagnostic record categories in the resource pointed by the HDIAGNOSTIC_EVENT_CATEGORY_DESCRIPTION handle.
     * @param {HDIAGNOSTIC_EVENT_CATEGORY_DESCRIPTION} hCategoryDescription Type: **[HANDLE](/windows/desktop/winprog/windows-data-types)**
     * Handle to the resource that contains the list of categories and their descriptions.
     * @param {Pointer<UInt32>} categoryDescriptionCount Type: **[UINT32\*](/windows/desktop/winprog/windows-data-types)**
     * This output parameter is a pointer to the number of categories in the diagnostic record category array.
     * @returns {HRESULT} Type: **[HRESULT](/windows/desktop/com/structure-of-com-error-codes)**
     * Returns S_OK on successful completion.
     * @see https://docs.microsoft.com/windows/win32/api//diagnosticdataquery/nf-diagnosticdataquery-ddqgetdiagnosticrecordcategorycount
     * @since windows10.0.19041
     */
    static DdqGetDiagnosticRecordCategoryCount(hCategoryDescription, categoryDescriptionCount) {
        hCategoryDescription := hCategoryDescription is Win32Handle ? NumGet(hCategoryDescription, "ptr") : hCategoryDescription

        result := DllCall("DiagnosticDataQuery.dll\DdqGetDiagnosticRecordCategoryCount", "ptr", hCategoryDescription, "uint*", categoryDescriptionCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Fetches the sampled-in state of the device for an event.
     * @param {HDIAGNOSTIC_DATA_QUERY_SESSION} hSession Type: **[HANDLE](/windows/desktop/winprog/windows-data-types)**
     * Handle to the Diagnostic Data Query session.
     * @param {Pointer<Guid>} providerGroup Type: **[GUID\*](../guiddef/ns-guiddef-guid.md)**
     * Pointer to the provider group GUID.
     * @param {Pointer<Guid>} providerId Type: **[GUID\*](../guiddef/ns-guiddef-guid.md)**
     * Pointer to the provider GUID.
     * @param {PWSTR} providerName Type: **[PCWSTR](/windows/win32/winprog/windows-data-types)**
     * The name of the provider.
     * @param {Pointer<UInt32>} eventId Type: **[UNI32\*](/windows/win32/winprog/windows-data-types)**
     * Pointer to the event ID.
     * @param {PWSTR} eventName Type: **[PCWSTR](/windows/win32/winprog/windows-data-types)**
     * The name of the event.
     * @param {Pointer<UInt32>} eventVersion Type: **[UINT32\*](/windows/win32/winprog/windows-data-types)**
     * The version of the event.
     * @param {Pointer<UInt64>} eventKeywords Type: **[UINT64\*](/windows/win32/winprog/windows-data-types)**
     * Pointer to the event keywords.
     * @param {Pointer<BOOL>} isSampledIn Type: **[BOOL\*](/windows/win32/winprog/windows-data-types)**
     * This output parameter is a pointer to a boolean value that is TRUE if the event is sampled in and FALSE otherwise.
     * @returns {HRESULT} Type: **[HRESULT](/windows/desktop/com/structure-of-com-error-codes)**
     * Returns S_OK on successful completion.
     * @see https://docs.microsoft.com/windows/win32/api//diagnosticdataquery/nf-diagnosticdataquery-ddqisdiagnosticrecordsampledin
     * @since windows10.0.19041
     */
    static DdqIsDiagnosticRecordSampledIn(hSession, providerGroup, providerId, providerName, eventId, eventName, eventVersion, eventKeywords, isSampledIn) {
        providerName := providerName is String ? StrPtr(providerName) : providerName
        eventName := eventName is String ? StrPtr(eventName) : eventName
        hSession := hSession is Win32Handle ? NumGet(hSession, "ptr") : hSession

        result := DllCall("DiagnosticDataQuery.dll\DdqIsDiagnosticRecordSampledIn", "ptr", hSession, "ptr", providerGroup, "ptr", providerId, "ptr", providerName, "uint*", eventId, "ptr", eventName, "uint*", eventVersion, "uint*", eventKeywords, "ptr", isSampledIn, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Fetches a page (batch) of filtered records. The filtering on records returned is performed internally using the input parameters DIAGNOSTIC_DATA_SEARCH_CRITERIA searchCriteria, pageRecordCount, offset and baseRowId.
     * @param {HDIAGNOSTIC_DATA_QUERY_SESSION} hSession Type: **[HANDLE](/windows/desktop/winprog/windows-data-types)**
     * Handle to the Diagnostic Data Query session.
     * @param {Pointer<DIAGNOSTIC_DATA_SEARCH_CRITERIA>} searchCriteria Type: **[DIAGNOSTIC_DATA_SEARCH_CRITERIA\*](/windows/win32/api/diagnosticdataquery/ns-diagnosticdataquerytypes-diagnostic_data_search_criteria)**
     * Pointer to the resource that contains the search criteria for this operation. This resource contains criteria such as producers, categories, and tags.
     * @param {Integer} offset Type: **[UINT32](/windows/desktop/winprog/windows-data-types)**
     * Filters results by returning records with rowId that start at the offset from the baseRowId.
     * @param {Integer} pageRecordCount Type: **[UINT32](/windows/desktop/winprog/windows-data-types)**
     * The number of records in a desired record page
     * @param {Integer} baseRowId Type: **[INT64](/windows/desktop/winprog/windows-data-types)**
     * Filters out new records by returning only records with rowId value less than or equal to baseRowId (this is useful if querying code wants to limit results to only events that were available at the time of DdqGetDiagnosticRecordStats call. The maxRowId parameter can be used as baseRowId). No filtering is applied if –1 is passed for baseRowId.
     * @param {Pointer<HDIAGNOSTIC_RECORD>} hRecord Type: **[HANDLE\*](/windows/desktop/winprog/windows-data-types)**
     * This output parameter is a pointer to the handle for the resource that contains the list of matching records.
     * @returns {HRESULT} Type: **[HRESULT](/windows/desktop/com/structure-of-com-error-codes)**
     * Returns S_OK on successful completion.
     * @see https://docs.microsoft.com/windows/win32/api//diagnosticdataquery/nf-diagnosticdataquery-ddqgetdiagnosticrecordpage
     * @since windows10.0.19041
     */
    static DdqGetDiagnosticRecordPage(hSession, searchCriteria, offset, pageRecordCount, baseRowId, hRecord) {
        hSession := hSession is Win32Handle ? NumGet(hSession, "ptr") : hSession

        result := DllCall("DiagnosticDataQuery.dll\DdqGetDiagnosticRecordPage", "ptr", hSession, "ptr", searchCriteria, "uint", offset, "uint", pageRecordCount, "int64", baseRowId, "ptr", hRecord, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Frees memory allocated for the diagnostic record page referenced by HDIAGNOSTIC_RECORD handle.
     * @param {HDIAGNOSTIC_RECORD} hRecord Type: **[HANDLE](/windows/desktop/winprog/windows-data-types)**
     * Handle to the resource that contains the set of diagnostic records to be freed.
     * @returns {HRESULT} Type: **[HRESULT](/windows/desktop/com/structure-of-com-error-codes)**
     * Returns S_OK on successful completion.
     * @see https://docs.microsoft.com/windows/win32/api//diagnosticdataquery/nf-diagnosticdataquery-ddqfreediagnosticrecordpage
     * @since windows10.0.19041
     */
    static DdqFreeDiagnosticRecordPage(hRecord) {
        hRecord := hRecord is Win32Handle ? NumGet(hRecord, "ptr") : hRecord

        result := DllCall("DiagnosticDataQuery.dll\DdqFreeDiagnosticRecordPage", "ptr", hRecord, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Fetches diagnostic data record information at the specified index in the resource pointed to by the HDIAGNOSTIC_DATA_RECORD handle.
     * @param {HDIAGNOSTIC_RECORD} hRecord Type: **[HANDLE](/windows/desktop/winprog/windows-data-types)**
     * Handle to the resource that contains the list of DIAGNOSTIC_DATA_RECORD items.
     * @param {Integer} index Type: **[UINT32](/windows/desktop/winprog/windows-data-types)**
     * Index of the record to be fetched.
     * @param {Pointer<DIAGNOSTIC_DATA_RECORD>} record Type: **[DIAGNOSTIC_DATA_RECORD\*](/windows/win32/api/diagnosticdataquerytypes/ns-diagnosticdataquerytypes-diagnostic_data_event_record)**
     * This output parameter is a pointer to the record at the specified index.
     * @returns {HRESULT} Type: **[HRESULT](/windows/desktop/com/structure-of-com-error-codes)**
     * Returns S_OK on successful completion.
     * @see https://docs.microsoft.com/windows/win32/api//diagnosticdataquery/nf-diagnosticdataquery-ddqgetdiagnosticrecordatindex
     * @since windows10.0.19041
     */
    static DdqGetDiagnosticRecordAtIndex(hRecord, index, record) {
        hRecord := hRecord is Win32Handle ? NumGet(hRecord, "ptr") : hRecord

        result := DllCall("DiagnosticDataQuery.dll\DdqGetDiagnosticRecordAtIndex", "ptr", hRecord, "uint", index, "ptr", record, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Fetches number (size) of elements in the resource pointed to by the HDIAGNOSTIC_DATA_RECORD handle.
     * @param {HDIAGNOSTIC_RECORD} hRecord Type: **[HANDLE](/windows/desktop/winprog/windows-data-types)**
     * Handle to the resource that contains the DIAGNOSTIC_DATA_RECORD list.
     * @param {Pointer<UInt32>} recordCount Type: **[UINT32](/windows/desktop/winprog/windows-data-types)**
     * Number of items in the DIAGNOSTIC_DATA_RECORD list.
     * @returns {HRESULT} Type: **[HRESULT](/windows/desktop/com/structure-of-com-error-codes)**
     * Returns S_OK on successful completion.
     * @see https://docs.microsoft.com/windows/win32/api//diagnosticdataquery/nf-diagnosticdataquery-ddqgetdiagnosticrecordcount
     * @since windows10.0.19041
     */
    static DdqGetDiagnosticRecordCount(hRecord, recordCount) {
        hRecord := hRecord is Win32Handle ? NumGet(hRecord, "ptr") : hRecord

        result := DllCall("DiagnosticDataQuery.dll\DdqGetDiagnosticRecordCount", "ptr", hRecord, "uint*", recordCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Fetches the number (size) of reports stored in the requested store.
     * @param {HDIAGNOSTIC_DATA_QUERY_SESSION} hSession Type: **[HANDLE](/windows/desktop/winprog/windows-data-types)**
     * Handle to the Diagnostic Data Query session.
     * @param {Integer} reportStoreType Type: **[UINT32](/windows/desktop/winprog/windows-data-types)**
     * The type of report store to extract from. See remarks.
     * @param {Pointer<UInt32>} reportCount Type: **[UINT32\*](/windows/desktop/com/structure-of-com-error-codes)**
     * Pointer to the number of error reports.
     * @returns {HRESULT} Type: **[HRESULT](/windows/desktop/com/structure-of-com-error-codes)**
     * Returns S_OK on successful completion.
     * @see https://docs.microsoft.com/windows/win32/api//diagnosticdataquery/nf-diagnosticdataquery-ddqgetdiagnosticreportstorereportcount
     * @since windows10.0.19041
     */
    static DdqGetDiagnosticReportStoreReportCount(hSession, reportStoreType, reportCount) {
        hSession := hSession is Win32Handle ? NumGet(hSession, "ptr") : hSession

        result := DllCall("DiagnosticDataQuery.dll\DdqGetDiagnosticReportStoreReportCount", "ptr", hSession, "uint", reportStoreType, "uint*", reportCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Cancels all outstanding Diagnostic Data Query API internal query operations for this session. This can be called from another thread to interrupt long running Query APIs.
     * @param {HDIAGNOSTIC_DATA_QUERY_SESSION} hSession Type: **[HANDLE](/windows/desktop/winprog/windows-data-types)**
     * Handle to the Diagnostic Data Query session.
     * @returns {HRESULT} Type: **[HRESULT](/windows/desktop/com/structure-of-com-error-codes)**
     * Returns S_OK on successful completion.
     * @see https://docs.microsoft.com/windows/win32/api//diagnosticdataquery/nf-diagnosticdataquery-ddqcanceldiagnosticrecordoperation
     * @since windows10.0.19041
     */
    static DdqCancelDiagnosticRecordOperation(hSession) {
        hSession := hSession is Win32Handle ? NumGet(hSession, "ptr") : hSession

        result := DllCall("DiagnosticDataQuery.dll\DdqCancelDiagnosticRecordOperation", "ptr", hSession, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Fetches error reports uploaded or enqueued for upload from this PC via HDIAGNOSTIC_REPORT_DATA handle.
     * @param {HDIAGNOSTIC_DATA_QUERY_SESSION} hSession Type: **[HANDLE](/windows/desktop/winprog/windows-data-types)**
     * Handle to the Diagnostic Data Query session.
     * @param {Integer} reportStoreType Type: **[UINT32](/windows/desktop/winprog/windows-data-types)**
     * The type of report store to extract from. See remarks.
     * @param {Pointer<HDIAGNOSTIC_REPORT>} hReport Type: **[HANDLE\*](/windows/desktop/winprog/windows-data-types)**
     * This output parameter is a pointer to the handle for the resource that contains the known set of problem reports.
     * @returns {HRESULT} Type: **[HRESULT](/windows/desktop/com/structure-of-com-error-codes)**
     * Returns S_OK on successful completion.
     * @see https://docs.microsoft.com/windows/win32/api//diagnosticdataquery/nf-diagnosticdataquery-ddqgetdiagnosticreport
     * @since windows10.0.19041
     */
    static DdqGetDiagnosticReport(hSession, reportStoreType, hReport) {
        hSession := hSession is Win32Handle ? NumGet(hSession, "ptr") : hSession

        result := DllCall("DiagnosticDataQuery.dll\DdqGetDiagnosticReport", "ptr", hSession, "uint", reportStoreType, "ptr", hReport, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Frees memory allocated for error reports referenced by HDIAGNOSTIC_REPORT_DATA handle.
     * @param {HDIAGNOSTIC_REPORT} hReport Type: **[HANDLE](/windows/desktop/winprog/windows-data-types)**
     * The handle to the resource that contains the set of error reports to be freed.
     * @returns {HRESULT} Type: **[HRESULT](/windows/desktop/com/structure-of-com-error-codes)**
     * Returns S_OK on successful completion.
     * @see https://docs.microsoft.com/windows/win32/api//diagnosticdataquery/nf-diagnosticdataquery-ddqfreediagnosticreport
     * @since windows10.0.19041
     */
    static DdqFreeDiagnosticReport(hReport) {
        hReport := hReport is Win32Handle ? NumGet(hReport, "ptr") : hReport

        result := DllCall("DiagnosticDataQuery.dll\DdqFreeDiagnosticReport", "ptr", hReport, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Fetches an error report and its information at the specified index in the resource pointed to by the HDIAGNOSTIC_REPORT_DATA handle.
     * @param {HDIAGNOSTIC_REPORT} hReport Type: **[HANDLE](/windows/desktop/winprog/windows-data-types)**
     * Handle to the resource with the set of problem reports.
     * @param {Integer} index Type: **[UINT32](/windows/desktop/winprog/windows-data-types)**
     * The index of the error report to fetch.
     * @param {Pointer<DIAGNOSTIC_REPORT_DATA>} report Type: **[DIAGNOSTIC_DATA_REPORT_DATA\*](/windows/win32/api/diagnosticdataquery/ns-diagnosticdataquerytypes-diagnostic_report_data)**
     * This output parameter is a pointer to the resource that contains information about the fetched diagnostic report.
     * @returns {HRESULT} Type: **[HRESULT](/windows/desktop/com/structure-of-com-error-codes)**
     * Returns S_OK on successful completion.
     * @see https://docs.microsoft.com/windows/win32/api//diagnosticdataquery/nf-diagnosticdataquery-ddqgetdiagnosticreportatindex
     * @since windows10.0.19041
     */
    static DdqGetDiagnosticReportAtIndex(hReport, index, report) {
        hReport := hReport is Win32Handle ? NumGet(hReport, "ptr") : hReport

        result := DllCall("DiagnosticDataQuery.dll\DdqGetDiagnosticReportAtIndex", "ptr", hReport, "uint", index, "ptr", report, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Fetches the number (size) of error reports in the resource pointed to by HDIAGNOSTIC_REPORT_DATA handle.
     * @param {HDIAGNOSTIC_REPORT} hReport Type: **[HANDLE](/windows/desktop/com/structure-of-com-error-codes)**
     * Handle to the resource that contains the set of error reports.
     * @param {Pointer<UInt32>} reportCount Type: **[UINT32\*](/windows/desktop/com/structure-of-com-error-codes)**
     * Pointer to the number of error reports.
     * @returns {HRESULT} Type: **[HRESULT](/windows/desktop/com/structure-of-com-error-codes)**
     * Returns S_OK on successful completion.
     * @see https://docs.microsoft.com/windows/win32/api//diagnosticdataquery/nf-diagnosticdataquery-ddqgetdiagnosticreportcount
     * @since windows10.0.19041
     */
    static DdqGetDiagnosticReportCount(hReport, reportCount) {
        hReport := hReport is Win32Handle ? NumGet(hReport, "ptr") : hReport

        result := DllCall("DiagnosticDataQuery.dll\DdqGetDiagnosticReportCount", "ptr", hReport, "uint*", reportCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Used for retrieving Windows Error Reporting reports, this API extracts cabs to destination path specified. If the error report does not contain any cabs, no work is performed.
     * @param {HDIAGNOSTIC_DATA_QUERY_SESSION} hSession Type: **[HANDLE](/windows/desktop/winprog/windows-data-types)**
     * Handle to the current Diagnostic Data Query session
     * @param {Integer} reportStoreType Type: **[UINT32](/windows/desktop/winprog/windows-data-types)**
     * The type of report store to extract from. See remarks.
     * @param {PWSTR} reportKey Type: **[PCWSTR](/windows/desktop/winprog/windows-data-types)**
     * A pointer to the report key string. See remarks.
     * @param {PWSTR} destinationPath Type: **[PCWSTR](/windows/desktop/winprog/windows-data-types)**
     * The destination path the report should be extracted to.
     * @returns {HRESULT} Type: **[HRESULT](/windows/desktop/com/structure-of-com-error-codes)**
     * Returns S_OK on successful completion.
     * @see https://docs.microsoft.com/windows/win32/api//diagnosticdataquery/nf-diagnosticdataquery-ddqextractdiagnosticreport
     * @since windows10.0.19041
     */
    static DdqExtractDiagnosticReport(hSession, reportStoreType, reportKey, destinationPath) {
        reportKey := reportKey is String ? StrPtr(reportKey) : reportKey
        destinationPath := destinationPath is String ? StrPtr(destinationPath) : destinationPath
        hSession := hSession is Win32Handle ? NumGet(hSession, "ptr") : hSession

        result := DllCall("DiagnosticDataQuery.dll\DdqExtractDiagnosticReport", "ptr", hSession, "uint", reportStoreType, "ptr", reportKey, "ptr", destinationPath, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Fetches Diagnostic Data Events per privacy tag event distribution statistics based on the specified producer names.
     * @param {HDIAGNOSTIC_DATA_QUERY_SESSION} hSession Type: **[HANDLE](/windows/desktop/winprog/windows-data-types)**
     * Handle to the Diagnostic Data Query session.
     * @param {Pointer<PWSTR>} producerNames Type: **[PCWSTR\*](/windows/desktop/winprog/windows-data-types)**
     * List of producer names to search for. A diagnostic data record that matches at least one of the producer names is included as a result in this search criteria. Use `nullptr` for this value to indicate no filter by producers.
     * @param {Integer} producerNameCount Type: **[UINT32](/windows/desktop/winprog/windows-data-types)**
     * The number of producer names in the list of producer names to search for. Use `0` for this value to indicate no filter by producers.
     * @param {Pointer<DIAGNOSTIC_DATA_EVENT_TAG_STATS>} tagStats Type: **[DIAGNOSTIC_DATA_TAG_STATS\*\*](/windows/win32/api/diagnosticdataquery/ns-diagnosticdataquerytypes-diagnostic_data_tag_stats)**
     * This output parameter is a pointer to a list of DIAGNOSTIC_DATA_TAG_STATS items. Each item is a resource that contains information about a privacy tag and the number of events that have that tag.
     * @param {Pointer<UInt32>} statCount Type: **[UINT32](/windows/desktop/winprog/windows-data-types)**
     * The number of items in the DIAGNOSTIC_DATA_TAG_STATS list.
     * @returns {HRESULT} Type: **[HRESULT](/windows/desktop/com/structure-of-com-error-codes)**
     * Returns S_OK on successful completion.
     * @see https://docs.microsoft.com/windows/win32/api//diagnosticdataquery/nf-diagnosticdataquery-ddqgetdiagnosticrecordtagdistribution
     * @since windows10.0.19041
     */
    static DdqGetDiagnosticRecordTagDistribution(hSession, producerNames, producerNameCount, tagStats, statCount) {
        hSession := hSession is Win32Handle ? NumGet(hSession, "ptr") : hSession

        result := DllCall("DiagnosticDataQuery.dll\DdqGetDiagnosticRecordTagDistribution", "ptr", hSession, "ptr", producerNames, "uint", producerNameCount, "ptr", tagStats, "uint*", statCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Fetches binary name and associated estimated total upload of Diagnostic Data Events volume in bytes for top N noisiest binaries based on total estimated upload size, where N is the value passed in for topNBinaries.
     * @param {HDIAGNOSTIC_DATA_QUERY_SESSION} hSession Type: **[HANDLE](/windows/desktop/winprog/windows-data-types)**
     * A handle to the current Diagnostic Data Query session.
     * @param {Pointer<PWSTR>} producerNames Type: **[PCWSTR\*](/windows/desktop/winprog/windows-data-types)**
     * Pointer to the set of known producers names.
     * @param {Integer} producerNameCount Type: **[UINT32](/windows/desktop/winprog/windows-data-types)**
     * Number of producer names
     * @param {Integer} topNBinaries Type: **[UINT32](/windows/desktop/winprog/windows-data-types)**
     * The number of noisiest records to return
     * @param {Pointer<DIAGNOSTIC_DATA_EVENT_BINARY_STATS>} binaryStats Type: **[DIAGNOSTIC_DATA_EVENT_BINARY_STATS](../diagnosticdataquerytypes/ns-diagnosticdataquerytypes-diagnostic_data_event_binary_stats.md)**
     * This output parameter is the pointer to the list of top N noisiest DIAGNOSTIC_DATA_EVENT_BINARY_STATS items.
     * @param {Pointer<UInt32>} statCount Type: **[UINT32](/windows/desktop/winprog/windows-data-types)**
     * The number of items in binaryStats.
     * @returns {HRESULT} Type: **[HRESULT](/windows/desktop/com/structure-of-com-error-codes)**
     * Returns S_OK on successful completion.
     * @see https://docs.microsoft.com/windows/win32/api//diagnosticdataquery/nf-diagnosticdataquery-ddqgetdiagnosticrecordbinarydistribution
     * @since windows10.0.19041
     */
    static DdqGetDiagnosticRecordBinaryDistribution(hSession, producerNames, producerNameCount, topNBinaries, binaryStats, statCount) {
        hSession := hSession is Win32Handle ? NumGet(hSession, "ptr") : hSession

        result := DllCall("DiagnosticDataQuery.dll\DdqGetDiagnosticRecordBinaryDistribution", "ptr", hSession, "ptr", producerNames, "uint", producerNameCount, "uint", topNBinaries, "ptr", binaryStats, "uint*", statCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Fetches general statistics about the diagnostic data records, filterable by producer.
     * @param {HDIAGNOSTIC_DATA_QUERY_SESSION} hSession Type: **[HANDLE](/windows/desktop/winprog/windows-data-types)**
     * Handle to the Diagnostic Data Query session.
     * @param {Pointer<PWSTR>} producerNames Type: **[PCWSTR\*](/windows/desktop/winprog/windows-data-types)**
     * List of producer names to search for. A diagnostic data record that matches at least one of the producer names is included as a result in this search criteria. Use `nullptr` for this value to indicate no filter by producers.
     * @param {Integer} producerNameCount Type: **[UINT32](/windows/desktop/winprog/windows-data-types)**
     * The number of producer names in the list of producer names to search for. Use `0` for this value to indicate no filter by producers.
     * @param {Pointer<DIAGNOSTIC_DATA_GENERAL_STATS>} generalStats Type: **[DIAGNOSTIC_DATA_GENERAL_STATS\*](/windows/win32/api/diagnosticdataquery/ns-diagnosticdataquerytypes-diagnostic_data_general_stats)**
     * This output parameter is a pointer to the resource that contains information about the general statistics for the diagnostic data records.
     * @returns {HRESULT} Type: **[HRESULT](/windows/desktop/com/structure-of-com-error-codes)**
     * Returns S_OK on successful completion.
     * @see https://docs.microsoft.com/windows/win32/api//diagnosticdataquery/nf-diagnosticdataquery-ddqgetdiagnosticrecordsummary
     * @since windows10.0.19041
     */
    static DdqGetDiagnosticRecordSummary(hSession, producerNames, producerNameCount, generalStats) {
        hSession := hSession is Win32Handle ? NumGet(hSession, "ptr") : hSession

        result := DllCall("DiagnosticDataQuery.dll\DdqGetDiagnosticRecordSummary", "ptr", hSession, "ptr", producerNames, "uint", producerNameCount, "ptr", generalStats, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Sets event transcript configuration, such as maximum storage size and hours of data history. Note that setting the configuration will fail if the user is not elevated.
     * @param {HDIAGNOSTIC_DATA_QUERY_SESSION} hSession Type: **[HANDLE](/windows/desktop/winprog/windows-data-types)**
     * Handle to the Diagnostic Data Query session.
     * @param {Pointer<DIAGNOSTIC_DATA_EVENT_TRANSCRIPT_CONFIGURATION>} desiredConfig Type: **[DIAGNOSTIC_DATA_EVENT_TRANSCRIPT_CONFIGURATION\*](/windows/win32/api/diagnosticdataquery/ns-diagnosticdataquerytypes-diagnostic_data_event_transcript_configuration)**
     * Pointer to the resource that contains the desired event transcript configuration.
     * @returns {HRESULT} Type: **[HRESULT](/windows/desktop/com/structure-of-com-error-codes)**
     * Returns S_OK on successful completion.
     * @see https://docs.microsoft.com/windows/win32/api//diagnosticdataquery/nf-diagnosticdataquery-ddqsettranscriptconfiguration
     * @since windows10.0.19041
     */
    static DdqSetTranscriptConfiguration(hSession, desiredConfig) {
        hSession := hSession is Win32Handle ? NumGet(hSession, "ptr") : hSession

        result := DllCall("DiagnosticDataQuery.dll\DdqSetTranscriptConfiguration", "ptr", hSession, "ptr", desiredConfig, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Gets event transcript configuration, such as maximum storage size and hours of data history.
     * @param {HDIAGNOSTIC_DATA_QUERY_SESSION} hSession Type: **[HANDLE](/windows/desktop/winprog/windows-data-types)**
     * Handle to the Diagnostic Data Query session.
     * @param {Pointer<DIAGNOSTIC_DATA_EVENT_TRANSCRIPT_CONFIGURATION>} currentConfig Type: **[DIAGNOSTIC_DATA_EVENT_TRANSCRIPT_CONFIGURATION\*](/windows/win32/api/diagnosticdataquery/ns-diagnosticdataquerytypes-diagnostic_data_event_transcript_configuration)**
     * This output parameter is a pointer to the resource that contains the event transcript configuration details.
     * @returns {HRESULT} Type: **[HRESULT](/windows/desktop/com/structure-of-com-error-codes)**
     * Returns S_OK on successful completion.
     * @see https://docs.microsoft.com/windows/win32/api//diagnosticdataquery/nf-diagnosticdataquery-ddqgettranscriptconfiguration
     * @since windows10.0.19041
     */
    static DdqGetTranscriptConfiguration(hSession, currentConfig) {
        hSession := hSession is Win32Handle ? NumGet(hSession, "ptr") : hSession

        result := DllCall("DiagnosticDataQuery.dll\DdqGetTranscriptConfiguration", "ptr", hSession, "ptr", currentConfig, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

;@endregion Methods
}
