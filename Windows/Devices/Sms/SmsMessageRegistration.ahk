#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISmsMessageRegistration.ahk
#Include .\ISmsMessageRegistrationStatics.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\SmsMessageRegistration.ahk
#Include .\SmsMessageReceivedTriggerDetails.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Class used to represent registered message filters.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators, mobile broadband adapter IHV, or OEM. For more information, see [Mobile Broadband](/windows-hardware/drivers/mobilebroadband/index).
 * @remarks
 * Your code does not instantiate this class directly. A newly-created instance of the class is returned by the [SmsMessageRegistration.Register](smsmessageregistration_register_1493443681.md) method, and you can retrieve a collection of instances representing existing registrations using the static [SmsMessageRegistration.AllRegistrations](smsmessageregistration_allregistrations.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsmessageregistration
 * @namespace Windows.Devices.Sms
 * @version WindowsRuntime 1.4
 */
class SmsMessageRegistration extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISmsMessageRegistration

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISmsMessageRegistration.IID

    /**
     * Static property that gets a list of currently registered message filters..
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsmessageregistration.allregistrations
     * @type {IVectorView<SmsMessageRegistration>} 
     */
    static AllRegistrations {
        get => SmsMessageRegistration.get_AllRegistrations()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {IVectorView<SmsMessageRegistration>} 
     */
    static get_AllRegistrations() {
        if (!SmsMessageRegistration.HasProp("__ISmsMessageRegistrationStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Sms.SmsMessageRegistration")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISmsMessageRegistrationStatics.IID)
            SmsMessageRegistration.__ISmsMessageRegistrationStatics := ISmsMessageRegistrationStatics(factoryPtr)
        }

        return SmsMessageRegistration.__ISmsMessageRegistrationStatics.get_AllRegistrations()
    }

    /**
     * Registers a message filter.
     * @param {HSTRING} id Identifier used to describe this message filter.
     * @param {SmsFilterRules} filterRules An object that represents the filter rules to be used for this registered message filter.
     * @returns {SmsMessageRegistration} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsmessageregistration.register
     */
    static Register(id, filterRules) {
        if (!SmsMessageRegistration.HasProp("__ISmsMessageRegistrationStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Sms.SmsMessageRegistration")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISmsMessageRegistrationStatics.IID)
            SmsMessageRegistration.__ISmsMessageRegistrationStatics := ISmsMessageRegistrationStatics(factoryPtr)
        }

        return SmsMessageRegistration.__ISmsMessageRegistrationStatics.Register(id, filterRules)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets an identifier for this registered message filter.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsmessageregistration.id
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * Event signaled when a message has been received that meets the filter criteria set in a registered message filter.
     * @type {TypedEventHandler<SmsMessageRegistration, SmsMessageReceivedTriggerDetails>}
    */
    OnMessageReceived {
        get {
            if(!this.HasProp("__OnMessageReceived")){
                this.__OnMessageReceived := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{33f985c7-dcfa-531f-9cce-ee5e6c26b1e6}"),
                    SmsMessageRegistration,
                    SmsMessageReceivedTriggerDetails
                )
                this.__OnMessageReceivedToken := this.add_MessageReceived(this.__OnMessageReceived.iface)
            }
            return this.__OnMessageReceived
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnMessageReceivedToken")) {
            this.remove_MessageReceived(this.__OnMessageReceivedToken)
            this.__OnMessageReceived.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        if (!this.HasProp("__ISmsMessageRegistration")) {
            if ((queryResult := this.QueryInterface(ISmsMessageRegistration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsMessageRegistration := ISmsMessageRegistration(outPtr)
        }

        return this.__ISmsMessageRegistration.get_Id()
    }

    /**
     * Unregisters a previously-registered message filter. The filter will no longer be applied to incoming messages.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sms.smsmessageregistration.unregister
     */
    Unregister() {
        if (!this.HasProp("__ISmsMessageRegistration")) {
            if ((queryResult := this.QueryInterface(ISmsMessageRegistration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsMessageRegistration := ISmsMessageRegistration(outPtr)
        }

        return this.__ISmsMessageRegistration.Unregister()
    }

    /**
     * 
     * @param {TypedEventHandler<SmsMessageRegistration, SmsMessageReceivedTriggerDetails>} eventHandler 
     * @returns {EventRegistrationToken} 
     */
    add_MessageReceived(eventHandler) {
        if (!this.HasProp("__ISmsMessageRegistration")) {
            if ((queryResult := this.QueryInterface(ISmsMessageRegistration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsMessageRegistration := ISmsMessageRegistration(outPtr)
        }

        return this.__ISmsMessageRegistration.add_MessageReceived(eventHandler)
    }

    /**
     * 
     * @param {EventRegistrationToken} eventCookie 
     * @returns {HRESULT} 
     */
    remove_MessageReceived(eventCookie) {
        if (!this.HasProp("__ISmsMessageRegistration")) {
            if ((queryResult := this.QueryInterface(ISmsMessageRegistration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmsMessageRegistration := ISmsMessageRegistration(outPtr)
        }

        return this.__ISmsMessageRegistration.remove_MessageReceived(eventCookie)
    }

;@endregion Instance Methods
}
