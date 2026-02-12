#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Foundation\DateTime.ahk
#Include ..\..\..\Foundation\TimeSpan.ahk
#Include ..\..\..\Foundation\IAsyncAction.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Email.DataProvider
 * @version WindowsRuntime 1.4
 */
class IEmailMailboxProposeNewTimeForMeetingRequest extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEmailMailboxProposeNewTimeForMeetingRequest
     * @type {Guid}
     */
    static IID => Guid("{5aeff152-9799-4f9f-a399-ff07f3eef04e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_EmailMailboxId", "get_EmailMessageId", "get_NewStartTime", "get_NewDuration", "get_Subject", "get_Comment", "ReportCompletedAsync", "ReportFailedAsync"]

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
     * @type {DateTime} 
     */
    NewStartTime {
        get => this.get_NewStartTime()
    }

    /**
     * @type {TimeSpan} 
     */
    NewDuration {
        get => this.get_NewDuration()
    }

    /**
     * @type {HSTRING} 
     */
    Subject {
        get => this.get_Subject()
    }

    /**
     * @type {HSTRING} 
     */
    Comment {
        get => this.get_Comment()
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
     * @returns {DateTime} 
     */
    get_NewStartTime() {
        value := DateTime()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_NewDuration() {
        value := TimeSpan()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Subject() {
        value := HSTRING()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Comment() {
        value := HSTRING()
        result := ComCall(11, this, "ptr", value, "int")
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
        result := ComCall(12, this, "ptr*", &result_ := 0, "int")
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
        result := ComCall(13, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(result_)
    }
}
