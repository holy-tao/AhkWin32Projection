#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPhoneVoicemail.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the voice mail data associated with a [PhoneLine](phoneline.md) instance.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonevoicemail
 * @namespace Windows.ApplicationModel.Calls
 * @version WindowsRuntime 1.4
 */
class PhoneVoicemail extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPhoneVoicemail

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPhoneVoicemail.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the access number for the voice mail associated with the [PhoneLine](phoneline.md) instance. The phone user can dial the access number to access the voice mail account.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonevoicemail.number
     * @type {HSTRING} 
     */
    Number {
        get => this.get_Number()
    }

    /**
     * Get the current count of voice mail messages associated with the [PhoneLine](phoneline.md) instance. A value of -1 indicates an "indeterminate" number of messages.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonevoicemail.messagecount
     * @type {Integer} 
     */
    MessageCount {
        get => this.get_MessageCount()
    }

    /**
     * Get the type of the voice mail associated with the [PhoneLine](phoneline.md) instance.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonevoicemail.type
     * @type {Integer} 
     */
    Type {
        get => this.get_Type()
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
    get_Number() {
        if (!this.HasProp("__IPhoneVoicemail")) {
            if ((queryResult := this.QueryInterface(IPhoneVoicemail.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneVoicemail := IPhoneVoicemail(outPtr)
        }

        return this.__IPhoneVoicemail.get_Number()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MessageCount() {
        if (!this.HasProp("__IPhoneVoicemail")) {
            if ((queryResult := this.QueryInterface(IPhoneVoicemail.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneVoicemail := IPhoneVoicemail(outPtr)
        }

        return this.__IPhoneVoicemail.get_MessageCount()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Type() {
        if (!this.HasProp("__IPhoneVoicemail")) {
            if ((queryResult := this.QueryInterface(IPhoneVoicemail.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneVoicemail := IPhoneVoicemail(outPtr)
        }

        return this.__IPhoneVoicemail.get_Type()
    }

    /**
     * Dials a call to the voice mail access number.
     * @remarks
     * In order to use this method, the calling application needs to be in the foreground. In addition, the [PhoneLine](phoneline.md) instance needs to support outbound calls. Use [CanDial](phoneline_candial.md) to verify whether or not that is supported.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonevoicemail.dialvoicemailasync
     */
    DialVoicemailAsync() {
        if (!this.HasProp("__IPhoneVoicemail")) {
            if ((queryResult := this.QueryInterface(IPhoneVoicemail.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneVoicemail := IPhoneVoicemail(outPtr)
        }

        return this.__IPhoneVoicemail.DialVoicemailAsync()
    }

;@endregion Instance Methods
}
