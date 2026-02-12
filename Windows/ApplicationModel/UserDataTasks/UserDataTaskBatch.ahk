#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUserDataTaskBatch.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a group of [UserDataTask](userdatatask.md) objects.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.userdatataskbatch
 * @namespace Windows.ApplicationModel.UserDataTasks
 * @version WindowsRuntime 1.4
 */
class UserDataTaskBatch extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUserDataTaskBatch

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUserDataTaskBatch.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the list of [UserDataTask](userdatatask.md) objects returned by a search operation.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.userdatataskbatch.tasks
     * @type {IVectorView<UserDataTask>} 
     */
    Tasks {
        get => this.get_Tasks()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVectorView<UserDataTask>} 
     */
    get_Tasks() {
        if (!this.HasProp("__IUserDataTaskBatch")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskBatch.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskBatch := IUserDataTaskBatch(outPtr)
        }

        return this.__IUserDataTaskBatch.get_Tasks()
    }

;@endregion Instance Methods
}
