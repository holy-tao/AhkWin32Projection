#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUserDataTaskListDeleteTaskRequestEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Encapsulates information about a request to delete a task.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.dataprovider.userdatatasklistdeletetaskrequesteventargs
 * @namespace Windows.ApplicationModel.UserDataTasks.DataProvider
 * @version WindowsRuntime 1.4
 */
class UserDataTaskListDeleteTaskRequestEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUserDataTaskListDeleteTaskRequestEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUserDataTaskListDeleteTaskRequestEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [UserDataTaskListDeleteTaskRequest](userdatatasklistdeletetaskrequest.md) object associated with this request.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.dataprovider.userdatatasklistdeletetaskrequesteventargs.request
     * @type {UserDataTaskListDeleteTaskRequest} 
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
     * @returns {UserDataTaskListDeleteTaskRequest} 
     */
    get_Request() {
        if (!this.HasProp("__IUserDataTaskListDeleteTaskRequestEventArgs")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskListDeleteTaskRequestEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskListDeleteTaskRequestEventArgs := IUserDataTaskListDeleteTaskRequestEventArgs(outPtr)
        }

        return this.__IUserDataTaskListDeleteTaskRequestEventArgs.get_Request()
    }

    /**
     * Gets a deferral object for this operation.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.dataprovider.userdatatasklistdeletetaskrequesteventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IUserDataTaskListDeleteTaskRequestEventArgs")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskListDeleteTaskRequestEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskListDeleteTaskRequestEventArgs := IUserDataTaskListDeleteTaskRequestEventArgs(outPtr)
        }

        return this.__IUserDataTaskListDeleteTaskRequestEventArgs.GetDeferral()
    }

;@endregion Instance Methods
}
