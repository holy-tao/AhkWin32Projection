#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUserDataTaskReader.ahk
#Include ..\..\..\Guid.ahk

/**
 * Used to read [UserDataTask](userdatatask.md) objects in batches from the [UserDataTaskStore](userdatataskstore.md) which may be local or remotely located.
 * @remarks
 * Use [GetTaskReader](userdatatasklist_gettaskreader_1184494814.md) or [GetTaskReader(UserDataTaskQueryOptions)](userdatatasklist_gettaskreader_1451551250.md) to get an instance of this class.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.userdatataskreader
 * @namespace Windows.ApplicationModel.UserDataTasks
 * @version WindowsRuntime 1.4
 */
class UserDataTaskReader extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUserDataTaskReader

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUserDataTaskReader.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Asynchronously reads a batch of [UserDataTask](userdatatask.md) objects from the [UserDataTaskStore](userdatataskstore.md).
     * @returns {IAsyncOperation<UserDataTaskBatch>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.userdatataskreader.readbatchasync
     */
    ReadBatchAsync() {
        if (!this.HasProp("__IUserDataTaskReader")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskReader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskReader := IUserDataTaskReader(outPtr)
        }

        return this.__IUserDataTaskReader.ReadBatchAsync()
    }

;@endregion Instance Methods
}
