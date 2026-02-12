#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUserDataAvailabilityStateChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains information about UserDataAvailabilityStateChangedEvent.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.dataprotection.userdataavailabilitystatechangedeventargs
 * @namespace Windows.Security.DataProtection
 * @version WindowsRuntime 1.4
 */
class UserDataAvailabilityStateChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUserDataAvailabilityStateChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUserDataAvailabilityStateChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Returns a Deferral object that can be used to block future events delivered on the UserDataProtectionManager object that was used to register for the event. Callers can call 'Complete' method on the Deferral object to unblock future events.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.dataprotection.userdataavailabilitystatechangedeventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IUserDataAvailabilityStateChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IUserDataAvailabilityStateChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataAvailabilityStateChangedEventArgs := IUserDataAvailabilityStateChangedEventArgs(outPtr)
        }

        return this.__IUserDataAvailabilityStateChangedEventArgs.GetDeferral()
    }

;@endregion Instance Methods
}
