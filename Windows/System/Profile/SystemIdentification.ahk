#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISystemIdentificationStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides information to uniquely identify the system on which the app is running.
 * @remarks
 * This is a static class.
 * 
 * > [!NOTE]
 * > The system identification string is created using the calling app's publisher ID and an identifier derived from the system's firmware/hardware. The system identification string will be identical for all unpackaged (Win32) apps and all packaged apps with no publisher ID.
 * @see https://learn.microsoft.com/uwp/api/windows.system.profile.systemidentification
 * @namespace Windows.System.Profile
 * @version WindowsRuntime 1.4
 */
class SystemIdentification extends IInspectable {
;@region Static Methods
    /**
     * Gets an identifier value for the system based on the app publisher ID.
     * @remarks
     * The identifier returned by this method is specific to the app publisher on the current device.
     * 
     * 
     * The ID has the following characteristics:
     * 
     * + Unique for each system
     * + On any particular system, all apps by the same publisher will get the same value for this ID (for all users). Conversely, apps by different publishers on the same system will obtain different IDs.
     * + Can be created offline
     * + Persists across restarts, reinstalls and upgrades of Windows, including clean installs (please see below for exceptions)
     * + Persists across most hardware modifications
     * + Available in OneCore
     * 
     * The method will first attempt to use the Trusted Platform Module (TPM), if present, to get an ID.
     * If a TPM is not present, the method will try to get an ID from the Unified Extensible Firmware Interface (UEFI).
     * If neither of these sources is available, this method will return an ID that is backed by the Windows registry. In the case of the Windows registry, the ID will not satisfy all the above guarantees. For example, if a system does not have a TPM or UEFI support, and thus an ID was obtained from the registry, a clean install of Windows will result in a new, different ID being returned. Callers of this method should refer to the Source property of the returned SystemIdentificationInfo to determine where the ID was obtained from in order to understand the guarantees provided.
     * @returns {SystemIdentificationInfo} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.profile.systemidentification.getsystemidforpublisher
     */
    static GetSystemIdForPublisher() {
        if (!SystemIdentification.HasProp("__ISystemIdentificationStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Profile.SystemIdentification")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISystemIdentificationStatics.IID)
            SystemIdentification.__ISystemIdentificationStatics := ISystemIdentificationStatics(factoryPtr)
        }

        return SystemIdentification.__ISystemIdentificationStatics.GetSystemIdForPublisher()
    }

    /**
     * Gets an identifier value for the system based on the user ID.
     * @remarks
     * The identifier returned by this method is specific to a user on the current device and allows for correlation of usage across different applications running on the same device for a particular user. Apps that are not multi-user-aware should only pass `null` into this method, which gets the current user's ID. 
     * 
     * Use of this method is restricted by the **userSystemId** capability, which is a restricted capability requiring Microsoft approval. Please note that most callers should instead use the [Windows.System.Profile.SystemIdentification.GetSystemIdForPublisher](systemidentification_getsystemidforpublisher_728928815.md) method instead as it is more appropriate for the large majority of use cases and does not require a restricted capability. If you do not need to obtain an ID that is shared across apps built by different publishers, you should not use this method.
     * @param {User} user_ The [User](../windows.system/user.md) data to use for creating the system ID. If the value is `null`, this method will get the current user's ID.
     * @returns {SystemIdentificationInfo} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.profile.systemidentification.getsystemidforuser
     */
    static GetSystemIdForUser(user_) {
        if (!SystemIdentification.HasProp("__ISystemIdentificationStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Profile.SystemIdentification")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISystemIdentificationStatics.IID)
            SystemIdentification.__ISystemIdentificationStatics := ISystemIdentificationStatics(factoryPtr)
        }

        return SystemIdentification.__ISystemIdentificationStatics.GetSystemIdForUser(user_)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
