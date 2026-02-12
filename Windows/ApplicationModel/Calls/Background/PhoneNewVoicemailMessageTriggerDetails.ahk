#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPhoneNewVoicemailMessageTriggerDetails.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Used to provide the details about a new voice mail message on a phone line.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.background.phonenewvoicemailmessagetriggerdetails
 * @namespace Windows.ApplicationModel.Calls.Background
 * @version WindowsRuntime 1.4
 */
class PhoneNewVoicemailMessageTriggerDetails extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPhoneNewVoicemailMessageTriggerDetails

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPhoneNewVoicemailMessageTriggerDetails.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the ID of the phone line for which the new voice mail arrived.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.background.phonenewvoicemailmessagetriggerdetails.lineid
     * @type {Guid} 
     */
    LineId {
        get => this.get_LineId()
    }

    /**
     * Gets the new count of voice mail messages for the phone line.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.background.phonenewvoicemailmessagetriggerdetails.voicemailcount
     * @type {Integer} 
     */
    VoicemailCount {
        get => this.get_VoicemailCount()
    }

    /**
     * Gets the optional voice mail changed message set by an operator when they send a voice mail changed SMS.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.background.phonenewvoicemailmessagetriggerdetails.operatormessage
     * @type {HSTRING} 
     */
    OperatorMessage {
        get => this.get_OperatorMessage()
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
        if (!this.HasProp("__IPhoneNewVoicemailMessageTriggerDetails")) {
            if ((queryResult := this.QueryInterface(IPhoneNewVoicemailMessageTriggerDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneNewVoicemailMessageTriggerDetails := IPhoneNewVoicemailMessageTriggerDetails(outPtr)
        }

        return this.__IPhoneNewVoicemailMessageTriggerDetails.get_LineId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_VoicemailCount() {
        if (!this.HasProp("__IPhoneNewVoicemailMessageTriggerDetails")) {
            if ((queryResult := this.QueryInterface(IPhoneNewVoicemailMessageTriggerDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneNewVoicemailMessageTriggerDetails := IPhoneNewVoicemailMessageTriggerDetails(outPtr)
        }

        return this.__IPhoneNewVoicemailMessageTriggerDetails.get_VoicemailCount()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_OperatorMessage() {
        if (!this.HasProp("__IPhoneNewVoicemailMessageTriggerDetails")) {
            if ((queryResult := this.QueryInterface(IPhoneNewVoicemailMessageTriggerDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneNewVoicemailMessageTriggerDetails := IPhoneNewVoicemailMessageTriggerDetails(outPtr)
        }

        return this.__IPhoneNewVoicemailMessageTriggerDetails.get_OperatorMessage()
    }

;@endregion Instance Methods
}
