#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUserDataTaskListCompleteTaskRequestEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Encapsulates information about a request to mark a task as completed.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.dataprovider.userdatatasklistcompletetaskrequesteventargs
 * @namespace Windows.ApplicationModel.UserDataTasks.DataProvider
 * @version WindowsRuntime 1.4
 */
class UserDataTaskListCompleteTaskRequestEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUserDataTaskListCompleteTaskRequestEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUserDataTaskListCompleteTaskRequestEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [UserDataTaskListCompleteTaskRequest](userdatatasklistcompletetaskrequest.md) object associated with this request.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.dataprovider.userdatatasklistcompletetaskrequesteventargs.request
     * @type {UserDataTaskListCompleteTaskRequest} 
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
     * @returns {UserDataTaskListCompleteTaskRequest} 
     */
    get_Request() {
        if (!this.HasProp("__IUserDataTaskListCompleteTaskRequestEventArgs")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskListCompleteTaskRequestEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskListCompleteTaskRequestEventArgs := IUserDataTaskListCompleteTaskRequestEventArgs(outPtr)
        }

        return this.__IUserDataTaskListCompleteTaskRequestEventArgs.get_Request()
    }

    /**
     * Gets a deferral object for this operation.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.dataprovider.userdatatasklistcompletetaskrequesteventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IUserDataTaskListCompleteTaskRequestEventArgs")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskListCompleteTaskRequestEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskListCompleteTaskRequestEventArgs := IUserDataTaskListCompleteTaskRequestEventArgs(outPtr)
        }

        return this.__IUserDataTaskListCompleteTaskRequestEventArgs.GetDeferral()
    }

;@endregion Instance Methods
}
