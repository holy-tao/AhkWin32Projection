#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPlayReadyLicense.ahk
#Include .\IPlayReadyLicense2.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the properties of a PlayReady license.
 * @remarks
 * This class is used to query license metadata. It could represent a single license or an entire chain of licenses depending on how the license enumeration was performed.
 * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadylicense
 * @namespace Windows.Media.Protection.PlayReady
 * @version WindowsRuntime 1.4
 */
class PlayReadyLicense extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPlayReadyLicense

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPlayReadyLicense.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the state of the license.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadylicense.fullyevaluated
     * @type {Boolean} 
     */
    FullyEvaluated {
        get => this.get_FullyEvaluated()
    }

    /**
     * Gets whether this license is usable for playback.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadylicense.usableforplay
     * @type {Boolean} 
     */
    UsableForPlay {
        get => this.get_UsableForPlay()
    }

    /**
     * Gets the expiration date of the current license.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadylicense.expirationdate
     * @type {IReference<DateTime>} 
     */
    ExpirationDate {
        get => this.get_ExpirationDate()
    }

    /**
     * Gets the amount of time, in seconds, before the current license expires after the media is first played.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadylicense.expireafterfirstplay
     * @type {Integer} 
     */
    ExpireAfterFirstPlay {
        get => this.get_ExpireAfterFirstPlay()
    }

    /**
     * Gets the domain account identifier to which this license is bound.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadylicense.domainaccountid
     * @type {Guid} 
     */
    DomainAccountID {
        get => this.get_DomainAccountID()
    }

    /**
     * Gets the chain depth of the license chain represented by the current [PlayReadyLicense](playreadylicense.md) class.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadylicense.chaindepth
     * @type {Integer} 
     */
    ChainDepth {
        get => this.get_ChainDepth()
    }

    /**
     * Gets the unique identifier of the certificate for the service that handles the server-side of the SecureStop protocol.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadylicense.securestopid
     * @type {Guid} 
     */
    SecureStopId {
        get => this.get_SecureStopId()
    }

    /**
     * Gets a value that indicates the security level of the license.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadylicense.securitylevel
     * @type {Integer} 
     */
    SecurityLevel {
        get => this.get_SecurityLevel()
    }

    /**
     * Gets a value that indicates if the license is in-memory-only.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadylicense.inmemoryonly
     * @type {Boolean} 
     */
    InMemoryOnly {
        get => this.get_InMemoryOnly()
    }

    /**
     * Gets a value that indicates if the license can expire in the middle of playback or if only expires when attempting a fresh playback.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadylicense.expiresinrealtime
     * @type {Boolean} 
     */
    ExpiresInRealTime {
        get => this.get_ExpiresInRealTime()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_FullyEvaluated() {
        if (!this.HasProp("__IPlayReadyLicense")) {
            if ((queryResult := this.QueryInterface(IPlayReadyLicense.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayReadyLicense := IPlayReadyLicense(outPtr)
        }

        return this.__IPlayReadyLicense.get_FullyEvaluated()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_UsableForPlay() {
        if (!this.HasProp("__IPlayReadyLicense")) {
            if ((queryResult := this.QueryInterface(IPlayReadyLicense.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayReadyLicense := IPlayReadyLicense(outPtr)
        }

        return this.__IPlayReadyLicense.get_UsableForPlay()
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_ExpirationDate() {
        if (!this.HasProp("__IPlayReadyLicense")) {
            if ((queryResult := this.QueryInterface(IPlayReadyLicense.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayReadyLicense := IPlayReadyLicense(outPtr)
        }

        return this.__IPlayReadyLicense.get_ExpirationDate()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ExpireAfterFirstPlay() {
        if (!this.HasProp("__IPlayReadyLicense")) {
            if ((queryResult := this.QueryInterface(IPlayReadyLicense.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayReadyLicense := IPlayReadyLicense(outPtr)
        }

        return this.__IPlayReadyLicense.get_ExpireAfterFirstPlay()
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_DomainAccountID() {
        if (!this.HasProp("__IPlayReadyLicense")) {
            if ((queryResult := this.QueryInterface(IPlayReadyLicense.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayReadyLicense := IPlayReadyLicense(outPtr)
        }

        return this.__IPlayReadyLicense.get_DomainAccountID()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ChainDepth() {
        if (!this.HasProp("__IPlayReadyLicense")) {
            if ((queryResult := this.QueryInterface(IPlayReadyLicense.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayReadyLicense := IPlayReadyLicense(outPtr)
        }

        return this.__IPlayReadyLicense.get_ChainDepth()
    }

    /**
     * Gets the key identifier (KID) of the license at the specified chain depth.
     * @remarks
     * The *chainDepth* parameter must be between the value of 0 and (**PlayReadyLicense.ChainDepth** - 1).
     * @param {Integer} chainDepth The depth of the license in the chain for which to retrieve the KID. This value is a 0-based index.
     * @returns {Guid} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadylicense.getkidatchaindepth
     */
    GetKIDAtChainDepth(chainDepth) {
        if (!this.HasProp("__IPlayReadyLicense")) {
            if ((queryResult := this.QueryInterface(IPlayReadyLicense.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayReadyLicense := IPlayReadyLicense(outPtr)
        }

        return this.__IPlayReadyLicense.GetKIDAtChainDepth(chainDepth)
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_SecureStopId() {
        if (!this.HasProp("__IPlayReadyLicense2")) {
            if ((queryResult := this.QueryInterface(IPlayReadyLicense2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayReadyLicense2 := IPlayReadyLicense2(outPtr)
        }

        return this.__IPlayReadyLicense2.get_SecureStopId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SecurityLevel() {
        if (!this.HasProp("__IPlayReadyLicense2")) {
            if ((queryResult := this.QueryInterface(IPlayReadyLicense2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayReadyLicense2 := IPlayReadyLicense2(outPtr)
        }

        return this.__IPlayReadyLicense2.get_SecurityLevel()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_InMemoryOnly() {
        if (!this.HasProp("__IPlayReadyLicense2")) {
            if ((queryResult := this.QueryInterface(IPlayReadyLicense2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayReadyLicense2 := IPlayReadyLicense2(outPtr)
        }

        return this.__IPlayReadyLicense2.get_InMemoryOnly()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ExpiresInRealTime() {
        if (!this.HasProp("__IPlayReadyLicense2")) {
            if ((queryResult := this.QueryInterface(IPlayReadyLicense2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayReadyLicense2 := IPlayReadyLicense2(outPtr)
        }

        return this.__IPlayReadyLicense2.get_ExpiresInRealTime()
    }

;@endregion Instance Methods
}
