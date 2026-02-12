#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPlayReadyDomain.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides access to metadata about a domain to which the current system is a member.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadydomain
 * @namespace Windows.Media.Protection.PlayReady
 * @version WindowsRuntime 1.4
 */
class PlayReadyDomain extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPlayReadyDomain

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPlayReadyDomain.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the current domain account identifier property.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadydomain.accountid
     * @type {Guid} 
     */
    AccountId {
        get => this.get_AccountId()
    }

    /**
     * Gets the current domain service identifier property.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadydomain.serviceid
     * @type {Guid} 
     */
    ServiceId {
        get => this.get_ServiceId()
    }

    /**
     * Gets the current domain revision number.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadydomain.revision
     * @type {Integer} 
     */
    Revision {
        get => this.get_Revision()
    }

    /**
     * Gets the current domain friendly name.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadydomain.friendlyname
     * @type {HSTRING} 
     */
    FriendlyName {
        get => this.get_FriendlyName()
    }

    /**
     * Gets the URL used to join the domain.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadydomain.domainjoinurl
     * @type {Uri} 
     */
    DomainJoinUrl {
        get => this.get_DomainJoinUrl()
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
    get_AccountId() {
        if (!this.HasProp("__IPlayReadyDomain")) {
            if ((queryResult := this.QueryInterface(IPlayReadyDomain.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayReadyDomain := IPlayReadyDomain(outPtr)
        }

        return this.__IPlayReadyDomain.get_AccountId()
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_ServiceId() {
        if (!this.HasProp("__IPlayReadyDomain")) {
            if ((queryResult := this.QueryInterface(IPlayReadyDomain.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayReadyDomain := IPlayReadyDomain(outPtr)
        }

        return this.__IPlayReadyDomain.get_ServiceId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Revision() {
        if (!this.HasProp("__IPlayReadyDomain")) {
            if ((queryResult := this.QueryInterface(IPlayReadyDomain.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayReadyDomain := IPlayReadyDomain(outPtr)
        }

        return this.__IPlayReadyDomain.get_Revision()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_FriendlyName() {
        if (!this.HasProp("__IPlayReadyDomain")) {
            if ((queryResult := this.QueryInterface(IPlayReadyDomain.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayReadyDomain := IPlayReadyDomain(outPtr)
        }

        return this.__IPlayReadyDomain.get_FriendlyName()
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_DomainJoinUrl() {
        if (!this.HasProp("__IPlayReadyDomain")) {
            if ((queryResult := this.QueryInterface(IPlayReadyDomain.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayReadyDomain := IPlayReadyDomain(outPtr)
        }

        return this.__IPlayReadyDomain.get_DomainJoinUrl()
    }

;@endregion Instance Methods
}
