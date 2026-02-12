#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPhoneCallInfo.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a phone call, and a set of call properties that remain unchanged throughout the lifetime of the call.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecallinfo
 * @namespace Windows.ApplicationModel.Calls
 * @version WindowsRuntime 1.4
 */
class PhoneCallInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPhoneCallInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPhoneCallInfo.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the unique identifier of the phone line that owns a particular phone call.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecallinfo.lineid
     * @type {Guid} 
     */
    LineId {
        get => this.get_LineId()
    }

    /**
     * Gets a value that determines whether or not the phone call can be placed on hold.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecallinfo.isholdsupported
     * @type {Boolean} 
     */
    IsHoldSupported {
        get => this.get_IsHoldSupported()
    }

    /**
     * Gets the start time of the call.
     * 
     * For an incoming call, this is the time that the call enters the [**Talking**](phonecallstatus.md) state. For an outgoing call, this is the time that the call enters the **Dialing** or **Talking** state, since that depends on underlying carrier and network settings.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecallinfo.starttime
     * @type {DateTime} 
     */
    StartTime {
        get => this.get_StartTime()
    }

    /**
     * Gets the phone number of the phone call.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecallinfo.phonenumber
     * @type {HSTRING} 
     */
    PhoneNumber {
        get => this.get_PhoneNumber()
    }

    /**
     * Gets the display name of the callee.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecallinfo.displayname
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
    }

    /**
     * Gets the direction of the call; whether incoming (received by user) or outgoing (dialed by user).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecallinfo.calldirection
     * @type {Integer} 
     */
    CallDirection {
        get => this.get_CallDirection()
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
        if (!this.HasProp("__IPhoneCallInfo")) {
            if ((queryResult := this.QueryInterface(IPhoneCallInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCallInfo := IPhoneCallInfo(outPtr)
        }

        return this.__IPhoneCallInfo.get_LineId()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsHoldSupported() {
        if (!this.HasProp("__IPhoneCallInfo")) {
            if ((queryResult := this.QueryInterface(IPhoneCallInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCallInfo := IPhoneCallInfo(outPtr)
        }

        return this.__IPhoneCallInfo.get_IsHoldSupported()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_StartTime() {
        if (!this.HasProp("__IPhoneCallInfo")) {
            if ((queryResult := this.QueryInterface(IPhoneCallInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCallInfo := IPhoneCallInfo(outPtr)
        }

        return this.__IPhoneCallInfo.get_StartTime()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PhoneNumber() {
        if (!this.HasProp("__IPhoneCallInfo")) {
            if ((queryResult := this.QueryInterface(IPhoneCallInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCallInfo := IPhoneCallInfo(outPtr)
        }

        return this.__IPhoneCallInfo.get_PhoneNumber()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayName() {
        if (!this.HasProp("__IPhoneCallInfo")) {
            if ((queryResult := this.QueryInterface(IPhoneCallInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCallInfo := IPhoneCallInfo(outPtr)
        }

        return this.__IPhoneCallInfo.get_DisplayName()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CallDirection() {
        if (!this.HasProp("__IPhoneCallInfo")) {
            if ((queryResult := this.QueryInterface(IPhoneCallInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCallInfo := IPhoneCallInfo(outPtr)
        }

        return this.__IPhoneCallInfo.get_CallDirection()
    }

;@endregion Instance Methods
}
