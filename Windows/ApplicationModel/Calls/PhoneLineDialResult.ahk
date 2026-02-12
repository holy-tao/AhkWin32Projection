#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPhoneLineDialResult.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a phone call dial status.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonelinedialresult
 * @namespace Windows.ApplicationModel.Calls
 * @version WindowsRuntime 1.4
 */
class PhoneLineDialResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPhoneLineDialResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPhoneLineDialResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the operation status (or result) of the phone call.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonelinedialresult.dialcallstatus
     * @type {Integer} 
     */
    DialCallStatus {
        get => this.get_DialCallStatus()
    }

    /**
     * Gets the phone call instance.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonelinedialresult.dialedcall
     * @type {PhoneCall} 
     */
    DialedCall {
        get => this.get_DialedCall()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DialCallStatus() {
        if (!this.HasProp("__IPhoneLineDialResult")) {
            if ((queryResult := this.QueryInterface(IPhoneLineDialResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneLineDialResult := IPhoneLineDialResult(outPtr)
        }

        return this.__IPhoneLineDialResult.get_DialCallStatus()
    }

    /**
     * 
     * @returns {PhoneCall} 
     */
    get_DialedCall() {
        if (!this.HasProp("__IPhoneLineDialResult")) {
            if ((queryResult := this.QueryInterface(IPhoneLineDialResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneLineDialResult := IPhoneLineDialResult(outPtr)
        }

        return this.__IPhoneLineDialResult.get_DialedCall()
    }

;@endregion Instance Methods
}
