#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IOnlineIdSystemTicketResult.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the result of a call to retrieve a system ticket.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.onlineid.onlineidsystemticketresult
 * @namespace Windows.Security.Authentication.OnlineId
 * @version WindowsRuntime 1.4
 */
class OnlineIdSystemTicketResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IOnlineIdSystemTicketResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IOnlineIdSystemTicketResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The [OnlineIdSystemIdentity](OnlineIdSystemIdentity.md) object corresponding to the device whose system ticket was retrieved.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.onlineid.onlineidsystemticketresult.identity
     * @type {OnlineIdSystemIdentity} 
     */
    Identity {
        get => this.get_Identity()
    }

    /**
     * Gets the status of the system ticket call.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.onlineid.onlineidsystemticketresult.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * Represents the Windows Runtime error associated with a failed attempt to retrieve the system ticket.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.onlineid.onlineidsystemticketresult.extendederror
     * @type {HRESULT} 
     */
    ExtendedError {
        get => this.get_ExtendedError()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {OnlineIdSystemIdentity} 
     */
    get_Identity() {
        if (!this.HasProp("__IOnlineIdSystemTicketResult")) {
            if ((queryResult := this.QueryInterface(IOnlineIdSystemTicketResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOnlineIdSystemTicketResult := IOnlineIdSystemTicketResult(outPtr)
        }

        return this.__IOnlineIdSystemTicketResult.get_Identity()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IOnlineIdSystemTicketResult")) {
            if ((queryResult := this.QueryInterface(IOnlineIdSystemTicketResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOnlineIdSystemTicketResult := IOnlineIdSystemTicketResult(outPtr)
        }

        return this.__IOnlineIdSystemTicketResult.get_Status()
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    get_ExtendedError() {
        if (!this.HasProp("__IOnlineIdSystemTicketResult")) {
            if ((queryResult := this.QueryInterface(IOnlineIdSystemTicketResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IOnlineIdSystemTicketResult := IOnlineIdSystemTicketResult(outPtr)
        }

        return this.__IOnlineIdSystemTicketResult.get_ExtendedError()
    }

;@endregion Instance Methods
}
