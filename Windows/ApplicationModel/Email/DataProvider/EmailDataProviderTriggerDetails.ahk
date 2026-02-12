#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IEmailDataProviderTriggerDetails.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Contains details about the event that triggered your email data provider background task.
  * 
  * This event is triggered when an email data client app has instantiated the background task that runs your email data provider. Your code should respond to this event by using the connection to register event handlers for data provider request events.
 * @remarks
 * Your background task code is passed an instance of this class in the [IBackgroundTaskInstance.TriggerDetails](/uwp/api/Windows.ApplicationModel.Background.IBackgroundTaskInstance.TriggerDetails) property.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emaildataprovidertriggerdetails
 * @namespace Windows.ApplicationModel.Email.DataProvider
 * @version WindowsRuntime 1.4
 */
class EmailDataProviderTriggerDetails extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IEmailDataProviderTriggerDetails

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IEmailDataProviderTriggerDetails.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [EmailDataProviderConnection](emaildataproviderconnection.md) to be used to communicate with an email client app.
     * 
     * This event is triggered when an email data client app has instantiated the background task that runs your email data provider. Your code should respond to this event by using the connection to register an event handler for data provider request events.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.dataprovider.emaildataprovidertriggerdetails.connection
     * @type {EmailDataProviderConnection} 
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
     * @returns {EmailDataProviderConnection} 
     */
    get_Connection() {
        if (!this.HasProp("__IEmailDataProviderTriggerDetails")) {
            if ((queryResult := this.QueryInterface(IEmailDataProviderTriggerDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailDataProviderTriggerDetails := IEmailDataProviderTriggerDetails(outPtr)
        }

        return this.__IEmailDataProviderTriggerDetails.get_Connection()
    }

;@endregion Instance Methods
}
