#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPhoneCallBlockedTriggerDetails.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Used to provide the details about a call that was just blocked.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.background.phonecallblockedtriggerdetails
 * @namespace Windows.ApplicationModel.Calls.Background
 * @version WindowsRuntime 1.4
 */
class PhoneCallBlockedTriggerDetails extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPhoneCallBlockedTriggerDetails

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPhoneCallBlockedTriggerDetails.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the phone number of the blocked call.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.background.phonecallblockedtriggerdetails.phonenumber
     * @type {HSTRING} 
     */
    PhoneNumber {
        get => this.get_PhoneNumber()
    }

    /**
     * Gets the ID of the phone call that was just blocked.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.background.phonecallblockedtriggerdetails.lineid
     * @type {Guid} 
     */
    LineId {
        get => this.get_LineId()
    }

    /**
     * Gets the reason why a phone call was blocked.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.background.phonecallblockedtriggerdetails.callblockedreason
     * @type {Integer} 
     */
    CallBlockedReason {
        get => this.get_CallBlockedReason()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PhoneNumber() {
        if (!this.HasProp("__IPhoneCallBlockedTriggerDetails")) {
            if ((queryResult := this.QueryInterface(IPhoneCallBlockedTriggerDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCallBlockedTriggerDetails := IPhoneCallBlockedTriggerDetails(outPtr)
        }

        return this.__IPhoneCallBlockedTriggerDetails.get_PhoneNumber()
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_LineId() {
        if (!this.HasProp("__IPhoneCallBlockedTriggerDetails")) {
            if ((queryResult := this.QueryInterface(IPhoneCallBlockedTriggerDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCallBlockedTriggerDetails := IPhoneCallBlockedTriggerDetails(outPtr)
        }

        return this.__IPhoneCallBlockedTriggerDetails.get_LineId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CallBlockedReason() {
        if (!this.HasProp("__IPhoneCallBlockedTriggerDetails")) {
            if ((queryResult := this.QueryInterface(IPhoneCallBlockedTriggerDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCallBlockedTriggerDetails := IPhoneCallBlockedTriggerDetails(outPtr)
        }

        return this.__IPhoneCallBlockedTriggerDetails.get_CallBlockedReason()
    }

;@endregion Instance Methods
}
