#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPhoneIncomingCallNotificationTriggerDetails.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the details of a [PhoneTriggerType.IncomingCallNotification](phonetriggertype.md) trigger.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.background.phoneincomingcallnotificationtriggerdetails
 * @namespace Windows.ApplicationModel.Calls.Background
 * @version WindowsRuntime 1.4
 */
class PhoneIncomingCallNotificationTriggerDetails extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPhoneIncomingCallNotificationTriggerDetails

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPhoneIncomingCallNotificationTriggerDetails.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the line identifier for the incoming call.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.background.phoneincomingcallnotificationtriggerdetails.lineid
     * @type {Guid} 
     */
    LineId {
        get => this.get_LineId()
    }

    /**
     * Gets the call identifier for the incoming call.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.background.phoneincomingcallnotificationtriggerdetails.callid
     * @type {HSTRING} 
     */
    CallId {
        get => this.get_CallId()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_LineId() {
        if (!this.HasProp("__IPhoneIncomingCallNotificationTriggerDetails")) {
            if ((queryResult := this.QueryInterface(IPhoneIncomingCallNotificationTriggerDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneIncomingCallNotificationTriggerDetails := IPhoneIncomingCallNotificationTriggerDetails(outPtr)
        }

        return this.__IPhoneIncomingCallNotificationTriggerDetails.get_LineId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CallId() {
        if (!this.HasProp("__IPhoneIncomingCallNotificationTriggerDetails")) {
            if ((queryResult := this.QueryInterface(IPhoneIncomingCallNotificationTriggerDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneIncomingCallNotificationTriggerDetails := IPhoneIncomingCallNotificationTriggerDetails(outPtr)
        }

        return this.__IPhoneIncomingCallNotificationTriggerDetails.get_CallId()
    }

;@endregion Instance Methods
}
