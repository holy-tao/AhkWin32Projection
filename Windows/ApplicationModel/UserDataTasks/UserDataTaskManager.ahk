#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUserDataTaskManager.ahk
#Include .\IUserDataTaskManagerStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a service that source apps can call to access task data.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.userdatataskmanager
 * @namespace Windows.ApplicationModel.UserDataTasks
 * @version WindowsRuntime 1.4
 */
class UserDataTaskManager extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUserDataTaskManager

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUserDataTaskManager.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets the default [UserTaskManager](userdatataskmanager.md) object.
     * @returns {UserDataTaskManager} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.userdatataskmanager.getdefault
     */
    static GetDefault() {
        if (!UserDataTaskManager.HasProp("__IUserDataTaskManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.UserDataTasks.UserDataTaskManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUserDataTaskManagerStatics.IID)
            UserDataTaskManager.__IUserDataTaskManagerStatics := IUserDataTaskManagerStatics(factoryPtr)
        }

        return UserDataTaskManager.__IUserDataTaskManagerStatics.GetDefault()
    }

    /**
     * Gets the [UserTaskManager](userdatataskmanager.md) object for the specified user.
     * @param {User} user_ The user account to use to get the [UserTaskManager](userdatataskmanager.md) object.
     * @returns {UserDataTaskManager} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.userdatataskmanager.getforuser
     */
    static GetForUser(user_) {
        if (!UserDataTaskManager.HasProp("__IUserDataTaskManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.UserDataTasks.UserDataTaskManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUserDataTaskManagerStatics.IID)
            UserDataTaskManager.__IUserDataTaskManagerStatics := IUserDataTaskManagerStatics(factoryPtr)
        }

        return UserDataTaskManager.__IUserDataTaskManagerStatics.GetForUser(user_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the user associated with this [UserDataTaskManager](userdatataskmanager.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.userdatataskmanager.user
     * @type {User} 
     */
    User {
        get => this.get_User()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Retrieves a [UserDataTaskStore](userdatataskstore.md) object that enables searching or retrieving contacts on the device.
     * @param {Integer} accessType Specifies the type of read/write access requested.
     * @returns {IAsyncOperation<UserDataTaskStore>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.userdatataskmanager.requeststoreasync
     */
    RequestStoreAsync(accessType) {
        if (!this.HasProp("__IUserDataTaskManager")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskManager := IUserDataTaskManager(outPtr)
        }

        return this.__IUserDataTaskManager.RequestStoreAsync(accessType)
    }

    /**
     * 
     * @returns {User} 
     */
    get_User() {
        if (!this.HasProp("__IUserDataTaskManager")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskManager := IUserDataTaskManager(outPtr)
        }

        return this.__IUserDataTaskManager.get_User()
    }

;@endregion Instance Methods
}
