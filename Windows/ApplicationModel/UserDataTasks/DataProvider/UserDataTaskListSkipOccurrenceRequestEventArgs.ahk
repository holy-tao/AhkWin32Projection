#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUserDataTaskListSkipOccurrenceRequestEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Encapsulates information about a request to skip a task.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.dataprovider.userdatatasklistskipoccurrencerequesteventargs
 * @namespace Windows.ApplicationModel.UserDataTasks.DataProvider
 * @version WindowsRuntime 1.4
 */
class UserDataTaskListSkipOccurrenceRequestEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUserDataTaskListSkipOccurrenceRequestEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUserDataTaskListSkipOccurrenceRequestEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [UserDataTaskListSkipOccurrenceRequest](userdatatasklistskipoccurrencerequest.md) object associated with this request.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.dataprovider.userdatatasklistskipoccurrencerequesteventargs.request
     * @type {UserDataTaskListSkipOccurrenceRequest} 
     */
    Request {
        get => this.get_Request()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {UserDataTaskListSkipOccurrenceRequest} 
     */
    get_Request() {
        if (!this.HasProp("__IUserDataTaskListSkipOccurrenceRequestEventArgs")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskListSkipOccurrenceRequestEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskListSkipOccurrenceRequestEventArgs := IUserDataTaskListSkipOccurrenceRequestEventArgs(outPtr)
        }

        return this.__IUserDataTaskListSkipOccurrenceRequestEventArgs.get_Request()
    }

    /**
     * Gets a deferral object for this operation.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.dataprovider.userdatatasklistskipoccurrencerequesteventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IUserDataTaskListSkipOccurrenceRequestEventArgs")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskListSkipOccurrenceRequestEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskListSkipOccurrenceRequestEventArgs := IUserDataTaskListSkipOccurrenceRequestEventArgs(outPtr)
        }

        return this.__IUserDataTaskListSkipOccurrenceRequestEventArgs.GetDeferral()
    }

;@endregion Instance Methods
}
