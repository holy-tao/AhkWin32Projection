#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRevocationAndRenewalItem.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a component that is being revoked and renewed with a trusted component.
 * @remarks
 * An instance of this object is returned by the [RevocationAndRenewalInformation.Items](revocationandrenewalinformation_items.md) property. This information can be passed to [ComponentRenewal.RenewSystemComponentsAsync](componentrenewal_renewsystemcomponentsasync_1438723694.md) for system processing.
 * @see https://learn.microsoft.com/uwp/api/windows.media.protection.revocationandrenewalitem
 * @namespace Windows.Media.Protection
 * @version WindowsRuntime 1.4
 */
class RevocationAndRenewalItem extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRevocationAndRenewalItem

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRevocationAndRenewalItem.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Returns the reason for revocation of component.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.revocationandrenewalitem.reasons
     * @type {Integer} 
     */
    Reasons {
        get => this.get_Reasons()
    }

    /**
     * Returns the header hash for the component being revoked.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.revocationandrenewalitem.headerhash
     * @type {HSTRING} 
     */
    HeaderHash {
        get => this.get_HeaderHash()
    }

    /**
     * Returns the public key hash for the component.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.revocationandrenewalitem.publickeyhash
     * @type {HSTRING} 
     */
    PublicKeyHash {
        get => this.get_PublicKeyHash()
    }

    /**
     * Returns the name for the component being revoked.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.revocationandrenewalitem.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * Returns the GUID for the renewal object.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.revocationandrenewalitem.renewalid
     * @type {HSTRING} 
     */
    RenewalId {
        get => this.get_RenewalId()
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
    get_Reasons() {
        if (!this.HasProp("__IRevocationAndRenewalItem")) {
            if ((queryResult := this.QueryInterface(IRevocationAndRenewalItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRevocationAndRenewalItem := IRevocationAndRenewalItem(outPtr)
        }

        return this.__IRevocationAndRenewalItem.get_Reasons()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_HeaderHash() {
        if (!this.HasProp("__IRevocationAndRenewalItem")) {
            if ((queryResult := this.QueryInterface(IRevocationAndRenewalItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRevocationAndRenewalItem := IRevocationAndRenewalItem(outPtr)
        }

        return this.__IRevocationAndRenewalItem.get_HeaderHash()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PublicKeyHash() {
        if (!this.HasProp("__IRevocationAndRenewalItem")) {
            if ((queryResult := this.QueryInterface(IRevocationAndRenewalItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRevocationAndRenewalItem := IRevocationAndRenewalItem(outPtr)
        }

        return this.__IRevocationAndRenewalItem.get_PublicKeyHash()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Name() {
        if (!this.HasProp("__IRevocationAndRenewalItem")) {
            if ((queryResult := this.QueryInterface(IRevocationAndRenewalItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRevocationAndRenewalItem := IRevocationAndRenewalItem(outPtr)
        }

        return this.__IRevocationAndRenewalItem.get_Name()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_RenewalId() {
        if (!this.HasProp("__IRevocationAndRenewalItem")) {
            if ((queryResult := this.QueryInterface(IRevocationAndRenewalItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRevocationAndRenewalItem := IRevocationAndRenewalItem(outPtr)
        }

        return this.__IRevocationAndRenewalItem.get_RenewalId()
    }

;@endregion Instance Methods
}
