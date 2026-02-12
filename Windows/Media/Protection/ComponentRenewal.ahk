#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IComponentRenewalStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Enables applications to initiate renewal of components which need updating in order to play protected media content.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.protection.componentrenewal
 * @namespace Windows.Media.Protection
 * @version WindowsRuntime 1.4
 */
class ComponentRenewal extends IInspectable {
;@region Static Methods
    /**
     * Initiates updating of critical content protection components after prompting the user.
     * @param {RevocationAndRenewalInformation} information Revocation and renewal information.
     * @returns {IAsyncOperationWithProgress<Integer, Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.componentrenewal.renewsystemcomponentsasync
     */
    static RenewSystemComponentsAsync(information) {
        if (!ComponentRenewal.HasProp("__IComponentRenewalStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Protection.ComponentRenewal")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IComponentRenewalStatics.IID)
            ComponentRenewal.__IComponentRenewalStatics := IComponentRenewalStatics(factoryPtr)
        }

        return ComponentRenewal.__IComponentRenewalStatics.RenewSystemComponentsAsync(information)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
