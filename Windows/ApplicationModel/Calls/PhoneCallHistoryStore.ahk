#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPhoneCallHistoryStore.ahk
#Include ..\..\..\Guid.ahk

/**
 * A collection of phone call history entries.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecallhistorystore
 * @namespace Windows.ApplicationModel.Calls
 * @version WindowsRuntime 1.4
 */
class PhoneCallHistoryStore extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPhoneCallHistoryStore

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPhoneCallHistoryStore.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Gets an entry from the store based on the entry id.
     * @param {HSTRING} callHistoryEntryId The [PhoneCallHistoryEntryt.Id](phonecallhistoryentry_id.md) of the relevant entry.
     * @returns {IAsyncOperation<PhoneCallHistoryEntry>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecallhistorystore.getentryasync
     */
    GetEntryAsync(callHistoryEntryId) {
        if (!this.HasProp("__IPhoneCallHistoryStore")) {
            if ((queryResult := this.QueryInterface(IPhoneCallHistoryStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCallHistoryStore := IPhoneCallHistoryStore(outPtr)
        }

        return this.__IPhoneCallHistoryStore.GetEntryAsync(callHistoryEntryId)
    }

    /**
     * Retrieves an entry reader based on provided filters.
     * @remarks
     * Use *queryOptions* to create a reader that will only read the specified entries. If you want a reader that accesses all log entries, you can use [GetEntryReader](phonecallhistorystore_getentryreader_641155997.md).
     * @returns {PhoneCallHistoryEntryReader} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecallhistorystore.getentryreader
     */
    GetEntryReader() {
        if (!this.HasProp("__IPhoneCallHistoryStore")) {
            if ((queryResult := this.QueryInterface(IPhoneCallHistoryStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCallHistoryStore := IPhoneCallHistoryStore(outPtr)
        }

        return this.__IPhoneCallHistoryStore.GetEntryReader()
    }

    /**
     * Retrieves a default phone call history entry that reads all entries.
     * @remarks
     * Use [GetEntryReader](phonecallhistorystore_getentryreader_499466667.md) if you want to retrieve a reader for a limited subset of entries based on some query filters.
     * @param {PhoneCallHistoryEntryQueryOptions} queryOptions_ 
     * @returns {PhoneCallHistoryEntryReader} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecallhistorystore.getentryreader
     */
    GetEntryReaderWithOptions(queryOptions_) {
        if (!this.HasProp("__IPhoneCallHistoryStore")) {
            if ((queryResult := this.QueryInterface(IPhoneCallHistoryStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCallHistoryStore := IPhoneCallHistoryStore(outPtr)
        }

        return this.__IPhoneCallHistoryStore.GetEntryReaderWithOptions(queryOptions_)
    }

    /**
     * Saves an entry to the store.
     * @param {PhoneCallHistoryEntry} callHistoryEntry The entry to save.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecallhistorystore.saveentryasync
     */
    SaveEntryAsync(callHistoryEntry) {
        if (!this.HasProp("__IPhoneCallHistoryStore")) {
            if ((queryResult := this.QueryInterface(IPhoneCallHistoryStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCallHistoryStore := IPhoneCallHistoryStore(outPtr)
        }

        return this.__IPhoneCallHistoryStore.SaveEntryAsync(callHistoryEntry)
    }

    /**
     * Delete an entry from the store.
     * @param {PhoneCallHistoryEntry} callHistoryEntry The entry to delete.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecallhistorystore.deleteentryasync
     */
    DeleteEntryAsync(callHistoryEntry) {
        if (!this.HasProp("__IPhoneCallHistoryStore")) {
            if ((queryResult := this.QueryInterface(IPhoneCallHistoryStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCallHistoryStore := IPhoneCallHistoryStore(outPtr)
        }

        return this.__IPhoneCallHistoryStore.DeleteEntryAsync(callHistoryEntry)
    }

    /**
     * Deletes entries in the store.
     * @param {IIterable<PhoneCallHistoryEntry>} callHistoryEntries The entries to delete.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecallhistorystore.deleteentriesasync
     */
    DeleteEntriesAsync(callHistoryEntries) {
        if (!this.HasProp("__IPhoneCallHistoryStore")) {
            if ((queryResult := this.QueryInterface(IPhoneCallHistoryStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCallHistoryStore := IPhoneCallHistoryStore(outPtr)
        }

        return this.__IPhoneCallHistoryStore.DeleteEntriesAsync(callHistoryEntries)
    }

    /**
     * Updates an entry to indicate it has been seen.
     * @param {PhoneCallHistoryEntry} callHistoryEntry The entry to update.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecallhistorystore.markentryasseenasync
     */
    MarkEntryAsSeenAsync(callHistoryEntry) {
        if (!this.HasProp("__IPhoneCallHistoryStore")) {
            if ((queryResult := this.QueryInterface(IPhoneCallHistoryStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCallHistoryStore := IPhoneCallHistoryStore(outPtr)
        }

        return this.__IPhoneCallHistoryStore.MarkEntryAsSeenAsync(callHistoryEntry)
    }

    /**
     * Updates entries to indicate they have been seen by the user.
     * @param {IIterable<PhoneCallHistoryEntry>} callHistoryEntries The entries to mark as seen. This updates the [PhoneCallHistoryEntry.IsSeen](phonecallhistoryentry_isseen.md) property.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecallhistorystore.markentriesasseenasync
     */
    MarkEntriesAsSeenAsync(callHistoryEntries) {
        if (!this.HasProp("__IPhoneCallHistoryStore")) {
            if ((queryResult := this.QueryInterface(IPhoneCallHistoryStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCallHistoryStore := IPhoneCallHistoryStore(outPtr)
        }

        return this.__IPhoneCallHistoryStore.MarkEntriesAsSeenAsync(callHistoryEntries)
    }

    /**
     * Gets the number of unseen entries.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecallhistorystore.getunseencountasync
     */
    GetUnseenCountAsync() {
        if (!this.HasProp("__IPhoneCallHistoryStore")) {
            if ((queryResult := this.QueryInterface(IPhoneCallHistoryStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCallHistoryStore := IPhoneCallHistoryStore(outPtr)
        }

        return this.__IPhoneCallHistoryStore.GetUnseenCountAsync()
    }

    /**
     * Update all the entries to indicate they have all been seen by the user.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecallhistorystore.markallasseenasync
     */
    MarkAllAsSeenAsync() {
        if (!this.HasProp("__IPhoneCallHistoryStore")) {
            if ((queryResult := this.QueryInterface(IPhoneCallHistoryStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCallHistoryStore := IPhoneCallHistoryStore(outPtr)
        }

        return this.__IPhoneCallHistoryStore.MarkAllAsSeenAsync()
    }

    /**
     * Gets the number of unseen log entries for the provided sources.
     * @param {IIterable<HSTRING>} sourceIds The identifiers that need to match [PhoneCallHistoryEntry.SourceId](phonecallhistoryentry_sourceid.md) in order for that entry to be considered.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecallhistorystore.getsourcesunseencountasync
     */
    GetSourcesUnseenCountAsync(sourceIds) {
        if (!this.HasProp("__IPhoneCallHistoryStore")) {
            if ((queryResult := this.QueryInterface(IPhoneCallHistoryStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCallHistoryStore := IPhoneCallHistoryStore(outPtr)
        }

        return this.__IPhoneCallHistoryStore.GetSourcesUnseenCountAsync(sourceIds)
    }

    /**
     * Marks all entries from the specified sources as seen.
     * @param {IIterable<HSTRING>} sourceIds The list of source identifiers to mark as seen. Only entries that match [PhoneCallHistoryEntry.SourceId](phonecallhistoryentry_sourceid.md) will be updated.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecallhistorystore.marksourcesasseenasync
     */
    MarkSourcesAsSeenAsync(sourceIds) {
        if (!this.HasProp("__IPhoneCallHistoryStore")) {
            if ((queryResult := this.QueryInterface(IPhoneCallHistoryStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCallHistoryStore := IPhoneCallHistoryStore(outPtr)
        }

        return this.__IPhoneCallHistoryStore.MarkSourcesAsSeenAsync(sourceIds)
    }

;@endregion Instance Methods
}
