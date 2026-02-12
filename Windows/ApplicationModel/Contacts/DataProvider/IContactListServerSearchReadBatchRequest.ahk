#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\ContactQueryOptions.ahk
#Include ..\..\..\Foundation\IAsyncAction.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Contacts.DataProvider
 * @version WindowsRuntime 1.4
 */
class IContactListServerSearchReadBatchRequest extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContactListServerSearchReadBatchRequest
     * @type {Guid}
     */
    static IID => Guid("{ba776a97-4030-4925-9fb4-143b295e653b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SessionId", "get_ContactListId", "get_Options", "get_SuggestedBatchSize", "SaveContactAsync", "ReportCompletedAsync", "ReportFailedAsync"]

    /**
     * @type {HSTRING} 
     */
    SessionId {
        get => this.get_SessionId()
    }

    /**
     * @type {HSTRING} 
     */
    ContactListId {
        get => this.get_ContactListId()
    }

    /**
     * @type {ContactQueryOptions} 
     */
    Options {
        get => this.get_Options()
    }

    /**
     * @type {Integer} 
     */
    SuggestedBatchSize {
        get => this.get_SuggestedBatchSize()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SessionId() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ContactListId() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {ContactQueryOptions} 
     */
    get_Options() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ContactQueryOptions(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SuggestedBatchSize() {
        result := ComCall(9, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Contact} contact_ 
     * @returns {IAsyncAction} 
     */
    SaveContactAsync(contact_) {
        result := ComCall(10, this, "ptr", contact_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(result_)
    }

    /**
     * 
     * @returns {IAsyncAction} 
     */
    ReportCompletedAsync() {
        result := ComCall(11, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(result_)
    }

    /**
     * 
     * @param {Integer} batchStatus 
     * @returns {IAsyncAction} 
     */
    ReportFailedAsync(batchStatus) {
        result := ComCall(12, this, "int", batchStatus, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(result_)
    }
}
