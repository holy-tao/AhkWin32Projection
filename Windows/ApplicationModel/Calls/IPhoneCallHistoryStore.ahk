#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\PhoneCallHistoryEntry.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\PhoneCallHistoryEntryReader.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Calls
 * @version WindowsRuntime 1.4
 */
class IPhoneCallHistoryStore extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPhoneCallHistoryStore
     * @type {Guid}
     */
    static IID => Guid("{2f907db8-b40e-422b-8545-cb1910a61c52}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetEntryAsync", "GetEntryReader", "GetEntryReaderWithOptions", "SaveEntryAsync", "DeleteEntryAsync", "DeleteEntriesAsync", "MarkEntryAsSeenAsync", "MarkEntriesAsSeenAsync", "GetUnseenCountAsync", "MarkAllAsSeenAsync", "GetSourcesUnseenCountAsync", "MarkSourcesAsSeenAsync"]

    /**
     * 
     * @param {HSTRING} callHistoryEntryId 
     * @returns {IAsyncOperation<PhoneCallHistoryEntry>} 
     */
    GetEntryAsync(callHistoryEntryId) {
        if(callHistoryEntryId is String) {
            pin := HSTRING.Create(callHistoryEntryId)
            callHistoryEntryId := pin.Value
        }
        callHistoryEntryId := callHistoryEntryId is Win32Handle ? NumGet(callHistoryEntryId, "ptr") : callHistoryEntryId

        result := ComCall(6, this, "ptr", callHistoryEntryId, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(PhoneCallHistoryEntry, result_)
    }

    /**
     * 
     * @returns {PhoneCallHistoryEntryReader} 
     */
    GetEntryReader() {
        result := ComCall(7, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PhoneCallHistoryEntryReader(result_)
    }

    /**
     * 
     * @param {PhoneCallHistoryEntryQueryOptions} queryOptions_ 
     * @returns {PhoneCallHistoryEntryReader} 
     */
    GetEntryReaderWithOptions(queryOptions_) {
        result := ComCall(8, this, "ptr", queryOptions_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PhoneCallHistoryEntryReader(result_)
    }

    /**
     * 
     * @param {PhoneCallHistoryEntry} callHistoryEntry 
     * @returns {IAsyncAction} 
     */
    SaveEntryAsync(callHistoryEntry) {
        result := ComCall(9, this, "ptr", callHistoryEntry, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(result_)
    }

    /**
     * 
     * @param {PhoneCallHistoryEntry} callHistoryEntry 
     * @returns {IAsyncAction} 
     */
    DeleteEntryAsync(callHistoryEntry) {
        result := ComCall(10, this, "ptr", callHistoryEntry, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(result_)
    }

    /**
     * 
     * @param {IIterable<PhoneCallHistoryEntry>} callHistoryEntries 
     * @returns {IAsyncAction} 
     */
    DeleteEntriesAsync(callHistoryEntries) {
        result := ComCall(11, this, "ptr", callHistoryEntries, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(result_)
    }

    /**
     * 
     * @param {PhoneCallHistoryEntry} callHistoryEntry 
     * @returns {IAsyncAction} 
     */
    MarkEntryAsSeenAsync(callHistoryEntry) {
        result := ComCall(12, this, "ptr", callHistoryEntry, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(result_)
    }

    /**
     * 
     * @param {IIterable<PhoneCallHistoryEntry>} callHistoryEntries 
     * @returns {IAsyncAction} 
     */
    MarkEntriesAsSeenAsync(callHistoryEntries) {
        result := ComCall(13, this, "ptr", callHistoryEntries, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(result_)
    }

    /**
     * 
     * @returns {IAsyncOperation<Integer>} 
     */
    GetUnseenCountAsync() {
        result := ComCall(14, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetUInt32(), result_)
    }

    /**
     * 
     * @returns {IAsyncAction} 
     */
    MarkAllAsSeenAsync() {
        result := ComCall(15, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(result_)
    }

    /**
     * 
     * @param {IIterable<HSTRING>} sourceIds 
     * @returns {IAsyncOperation<Integer>} 
     */
    GetSourcesUnseenCountAsync(sourceIds) {
        result := ComCall(16, this, "ptr", sourceIds, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetUInt32(), result_)
    }

    /**
     * 
     * @param {IIterable<HSTRING>} sourceIds 
     * @returns {IAsyncAction} 
     */
    MarkSourcesAsSeenAsync(sourceIds) {
        result := ComCall(17, this, "ptr", sourceIds, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(result_)
    }
}
