#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Foundation\IAsyncAction.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Email.DataProvider
 * @version WindowsRuntime 1.4
 */
class IEmailMailboxDownloadMessageRequest extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEmailMailboxDownloadMessageRequest
     * @type {Guid}
     */
    static IID => Guid("{497b4187-5b4d-4b23-816c-f3842beb753e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_EmailMailboxId", "get_EmailMessageId", "ReportCompletedAsync", "ReportFailedAsync"]

    /**
     * @type {HSTRING} 
     */
    EmailMailboxId {
        get => this.get_EmailMailboxId()
    }

    /**
     * @type {HSTRING} 
     */
    EmailMessageId {
        get => this.get_EmailMessageId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_EmailMailboxId() {
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
    get_EmailMessageId() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IAsyncAction} 
     */
    ReportCompletedAsync() {
        result := ComCall(8, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(result_)
    }

    /**
     * 
     * @returns {IAsyncAction} 
     */
    ReportFailedAsync() {
        result := ComCall(9, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(result_)
    }
}
