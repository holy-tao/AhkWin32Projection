#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUserDataTaskListSyncManagerSyncRequestEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Encapsulates information about a request to sync a task list.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.dataprovider.userdatatasklistsyncmanagersyncrequesteventargs
 * @namespace Windows.ApplicationModel.UserDataTasks.DataProvider
 * @version WindowsRuntime 1.4
 */
class UserDataTaskListSyncManagerSyncRequestEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUserDataTaskListSyncManagerSyncRequestEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUserDataTaskListSyncManagerSyncRequestEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [UserDataTaskListSyncManagerSyncRequest](userdatatasklistsyncmanagersyncrequest.md) object associated with this request.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.dataprovider.userdatatasklistsyncmanagersyncrequesteventargs.request
     * @type {UserDataTaskListSyncManagerSyncRequest} 
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
     * @returns {UserDataTaskListSyncManagerSyncRequest} 
     */
    get_Request() {
        if (!this.HasProp("__IUserDataTaskListSyncManagerSyncRequestEventArgs")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskListSyncManagerSyncRequestEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskListSyncManagerSyncRequestEventArgs := IUserDataTaskListSyncManagerSyncRequestEventArgs(outPtr)
        }

        return this.__IUserDataTaskListSyncManagerSyncRequestEventArgs.get_Request()
    }

    /**
     * Gets a deferral object for this operation.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.dataprovider.userdatatasklistsyncmanagersyncrequesteventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IUserDataTaskListSyncManagerSyncRequestEventArgs")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskListSyncManagerSyncRequestEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskListSyncManagerSyncRequestEventArgs := IUserDataTaskListSyncManagerSyncRequestEventArgs(outPtr)
        }

        return this.__IUserDataTaskListSyncManagerSyncRequestEventArgs.GetDeferral()
    }

;@endregion Instance Methods
}
