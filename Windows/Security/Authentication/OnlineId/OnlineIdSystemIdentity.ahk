#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IOnlineIdSystemIdentity.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Identifies the local device (system) on which the user account in question exists.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.onlineid.onlineidsystemidentity
 * @namespace Windows.Security.Authentication.OnlineId
 * @version WindowsRuntime 1.4
 */
class OnlineIdSystemIdentity extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IOnlineIdSystemIdentity

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IOnlineIdSystemIdentity.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Provides additional information about the device.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.onlineid.onlineidsystemidentity.ticket
     * @type {OnlineIdServiceTicket} 
     */
    Ticket {
        get => this.get_Ticket()
    }

    /**
     * A unique string identifier for the local system of this [OnlineIdSystemIdentity](OnlineIdSystemIdentity.md).
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.onlineid.onlineidsystemidentity.id
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {OnlineIdServiceTicket} 
     */
    get_Ticket() {
        if (!this.HasProp("__IOnlineIdSystemIdentity")) {
            if ((queryResult := this.QueryInterface(IOnlineIdSystemIdentity.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOnlineIdSystemIdentity := IOnlineIdSystemIdentity(outPtr)
        }

        return this.__IOnlineIdSystemIdentity.get_Ticket()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        if (!this.HasProp("__IOnlineIdSystemIdentity")) {
            if ((queryResult := this.QueryInterface(IOnlineIdSystemIdentity.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOnlineIdSystemIdentity := IOnlineIdSystemIdentity(outPtr)
        }

        return this.__IOnlineIdSystemIdentity.get_Id()
    }

;@endregion Instance Methods
}
