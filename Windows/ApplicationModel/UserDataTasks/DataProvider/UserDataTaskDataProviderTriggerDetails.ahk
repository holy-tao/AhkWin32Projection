#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUserDataTaskDataProviderTriggerDetails.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents trigger information about the background task in which data will be transferred between the app and its caller.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.dataprovider.userdatataskdataprovidertriggerdetails
 * @namespace Windows.ApplicationModel.UserDataTasks.DataProvider
 * @version WindowsRuntime 1.4
 */
class UserDataTaskDataProviderTriggerDetails extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUserDataTaskDataProviderTriggerDetails

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUserDataTaskDataProviderTriggerDetails.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the data connection over which task data can be transferred.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.dataprovider.userdatataskdataprovidertriggerdetails.connection
     * @type {UserDataTaskDataProviderConnection} 
     */
    Connection {
        get => this.get_Connection()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {UserDataTaskDataProviderConnection} 
     */
    get_Connection() {
        if (!this.HasProp("__IUserDataTaskDataProviderTriggerDetails")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskDataProviderTriggerDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskDataProviderTriggerDetails := IUserDataTaskDataProviderTriggerDetails(outPtr)
        }

        return this.__IUserDataTaskDataProviderTriggerDetails.get_Connection()
    }

;@endregion Instance Methods
}
