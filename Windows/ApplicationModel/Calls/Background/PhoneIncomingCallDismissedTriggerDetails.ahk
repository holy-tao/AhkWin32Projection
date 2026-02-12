#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPhoneIncomingCallDismissedTriggerDetails.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * The trigger details for the IncomingCallDismissed trigger.
  * 
  * > [!NOTE]
  * > This class is deprecated.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.background.phoneincomingcalldismissedtriggerdetails
 * @namespace Windows.ApplicationModel.Calls.Background
 * @version WindowsRuntime 1.4
 */
class PhoneIncomingCallDismissedTriggerDetails extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPhoneIncomingCallDismissedTriggerDetails

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPhoneIncomingCallDismissedTriggerDetails.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The LineId for the incoming call being dismissed.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.background.phoneincomingcalldismissedtriggerdetails.lineid
     * @type {Guid} 
     */
    LineId {
        get => this.get_LineId()
    }

    /**
     * The phone number for the incoming call being dismissed.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.background.phoneincomingcalldismissedtriggerdetails.phonenumber
     * @type {HSTRING} 
     */
    PhoneNumber {
        get => this.get_PhoneNumber()
    }

    /**
     * The name of the caller (if available).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.background.phoneincomingcalldismissedtriggerdetails.displayname
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
    }

    /**
     * The time when the incoming call was dismissed.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.background.phoneincomingcalldismissedtriggerdetails.dismissaltime
     * @type {DateTime} 
     */
    DismissalTime {
        get => this.get_DismissalTime()
    }

    /**
     * The text message of the reply (if available).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.background.phoneincomingcalldismissedtriggerdetails.textreplymessage
     * @type {HSTRING} 
     */
    TextReplyMessage {
        get => this.get_TextReplyMessage()
    }

    /**
     * The reason why the incoming call is dismissed.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.background.phoneincomingcalldismissedtriggerdetails.reason
     * @type {Integer} 
     */
    Reason {
        get => this.get_Reason()
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
        if (!this.HasProp("__IPhoneIncomingCallDismissedTriggerDetails")) {
            if ((queryResult := this.QueryInterface(IPhoneIncomingCallDismissedTriggerDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneIncomingCallDismissedTriggerDetails := IPhoneIncomingCallDismissedTriggerDetails(outPtr)
        }

        return this.__IPhoneIncomingCallDismissedTriggerDetails.get_LineId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PhoneNumber() {
        if (!this.HasProp("__IPhoneIncomingCallDismissedTriggerDetails")) {
            if ((queryResult := this.QueryInterface(IPhoneIncomingCallDismissedTriggerDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneIncomingCallDismissedTriggerDetails := IPhoneIncomingCallDismissedTriggerDetails(outPtr)
        }

        return this.__IPhoneIncomingCallDismissedTriggerDetails.get_PhoneNumber()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayName() {
        if (!this.HasProp("__IPhoneIncomingCallDismissedTriggerDetails")) {
            if ((queryResult := this.QueryInterface(IPhoneIncomingCallDismissedTriggerDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneIncomingCallDismissedTriggerDetails := IPhoneIncomingCallDismissedTriggerDetails(outPtr)
        }

        return this.__IPhoneIncomingCallDismissedTriggerDetails.get_DisplayName()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_DismissalTime() {
        if (!this.HasProp("__IPhoneIncomingCallDismissedTriggerDetails")) {
            if ((queryResult := this.QueryInterface(IPhoneIncomingCallDismissedTriggerDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneIncomingCallDismissedTriggerDetails := IPhoneIncomingCallDismissedTriggerDetails(outPtr)
        }

        return this.__IPhoneIncomingCallDismissedTriggerDetails.get_DismissalTime()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_TextReplyMessage() {
        if (!this.HasProp("__IPhoneIncomingCallDismissedTriggerDetails")) {
            if ((queryResult := this.QueryInterface(IPhoneIncomingCallDismissedTriggerDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneIncomingCallDismissedTriggerDetails := IPhoneIncomingCallDismissedTriggerDetails(outPtr)
        }

        return this.__IPhoneIncomingCallDismissedTriggerDetails.get_TextReplyMessage()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Reason() {
        if (!this.HasProp("__IPhoneIncomingCallDismissedTriggerDetails")) {
            if ((queryResult := this.QueryInterface(IPhoneIncomingCallDismissedTriggerDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneIncomingCallDismissedTriggerDetails := IPhoneIncomingCallDismissedTriggerDetails(outPtr)
        }

        return this.__IPhoneIncomingCallDismissedTriggerDetails.get_Reason()
    }

;@endregion Instance Methods
}
