#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUserDataTaskListCreateOrUpdateTaskRequestEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Encapsulates information about a request to create or update.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.dataprovider.userdatatasklistcreateorupdatetaskrequesteventargs
 * @namespace Windows.ApplicationModel.UserDataTasks.DataProvider
 * @version WindowsRuntime 1.4
 */
class UserDataTaskListCreateOrUpdateTaskRequestEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUserDataTaskListCreateOrUpdateTaskRequestEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUserDataTaskListCreateOrUpdateTaskRequestEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [UserDataTaskListCreateOrUpdateTaskRequest](userdatatasklistcreateorupdatetaskrequest.md) object associated with this request.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.dataprovider.userdatatasklistcreateorupdatetaskrequesteventargs.request
     * @type {UserDataTaskListCreateOrUpdateTaskRequest} 
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
     * @returns {UserDataTaskListCreateOrUpdateTaskRequest} 
     */
    get_Request() {
        if (!this.HasProp("__IUserDataTaskListCreateOrUpdateTaskRequestEventArgs")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskListCreateOrUpdateTaskRequestEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskListCreateOrUpdateTaskRequestEventArgs := IUserDataTaskListCreateOrUpdateTaskRequestEventArgs(outPtr)
        }

        return this.__IUserDataTaskListCreateOrUpdateTaskRequestEventArgs.get_Request()
    }

    /**
     * Gets a deferral object for this operation.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.dataprovider.userdatatasklistcreateorupdatetaskrequesteventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IUserDataTaskListCreateOrUpdateTaskRequestEventArgs")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskListCreateOrUpdateTaskRequestEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskListCreateOrUpdateTaskRequestEventArgs := IUserDataTaskListCreateOrUpdateTaskRequestEventArgs(outPtr)
        }

        return this.__IUserDataTaskListCreateOrUpdateTaskRequestEventArgs.GetDeferral()
    }

;@endregion Instance Methods
}
