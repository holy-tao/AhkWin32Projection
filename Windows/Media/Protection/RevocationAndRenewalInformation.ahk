#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRevocationAndRenewalInformation.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains information about components that need to be revoked and renewed.
 * @remarks
 * An instance of this object is returned by the [ComponentLoadFailedEventArgs.Information](componentloadfailedeventargs_information.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.media.protection.revocationandrenewalinformation
 * @namespace Windows.Media.Protection
 * @version WindowsRuntime 1.4
 */
class RevocationAndRenewalInformation extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRevocationAndRenewalInformation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRevocationAndRenewalInformation.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Returns a list of components that need to be revoked and renewed with updated components.
     * @remarks
     * If there are no entries in the list, it indicates that basic system components are compromised. In that case, recovery can be attempted by invoking [ComponentRenewal.RenewSystemComponentsAsync](componentrenewal_renewsystemcomponentsasync_1438723694.md).
     * 
     * If there is a single entry in the list, the entry may indicate that the system’s revocation list (active.grl) needs updating. This usually means that the content protection system requires updates of components. This is often the first indication that components need updating. Recovery can be attempted by invoking [ComponentRenewal.RenewSystemComponentsAsync](componentrenewal_renewsystemcomponentsasync_1438723694.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.revocationandrenewalinformation.items
     * @type {IVector<RevocationAndRenewalItem>} 
     */
    Items {
        get => this.get_Items()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVector<RevocationAndRenewalItem>} 
     */
    get_Items() {
        if (!this.HasProp("__IRevocationAndRenewalInformation")) {
            if ((queryResult := this.QueryInterface(IRevocationAndRenewalInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRevocationAndRenewalInformation := IRevocationAndRenewalInformation(outPtr)
        }

        return this.__IRevocationAndRenewalInformation.get_Items()
    }

;@endregion Instance Methods
}
