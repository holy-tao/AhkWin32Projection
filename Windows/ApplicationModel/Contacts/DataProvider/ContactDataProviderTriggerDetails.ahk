#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IContactDataProviderTriggerDetails.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Contains details about the event that triggered your contact data provider background task.
  * 
  * This event is triggered when a contact data client app has instantiated the background task that runs your contact data provider. Your code should respond to this event by using the Connection property to register event handlers for contact provider request events.
 * @remarks
 * Your background task code is passed an instance of this class in the [IBackgroundTaskInstance.TriggerDetails](/uwp/api/Windows.ApplicationModel.Background.IBackgroundTaskInstance.TriggerDetails) property.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.dataprovider.contactdataprovidertriggerdetails
 * @namespace Windows.ApplicationModel.Contacts.DataProvider
 * @version WindowsRuntime 1.4
 */
class ContactDataProviderTriggerDetails extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IContactDataProviderTriggerDetails

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IContactDataProviderTriggerDetails.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [ContactDataProviderConnection](contactdataproviderconnection.md) object instance used to provide contact data to a client app.
     * 
     * This event is triggered when a contact data client app has instantiated the background task that runs your contact data provider. Your code should respond to this event my using the connection to register event handlers for data provider request events.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.dataprovider.contactdataprovidertriggerdetails.connection
     * @type {ContactDataProviderConnection} 
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
     * @returns {ContactDataProviderConnection} 
     */
    get_Connection() {
        if (!this.HasProp("__IContactDataProviderTriggerDetails")) {
            if ((queryResult := this.QueryInterface(IContactDataProviderTriggerDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactDataProviderTriggerDetails := IContactDataProviderTriggerDetails(outPtr)
        }

        return this.__IContactDataProviderTriggerDetails.get_Connection()
    }

;@endregion Instance Methods
}
