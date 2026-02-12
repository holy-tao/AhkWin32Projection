#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAdvertisingManagerStatics2.ahk
#Include .\IAdvertisingManagerStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides a property that lets the caller retrieve the advertising ID.
 * @remarks
 * AdvertisingManager is a static runtime object and does not need to be retrieved or created.
 * @see https://learn.microsoft.com/uwp/api/windows.system.userprofile.advertisingmanager
 * @namespace Windows.System.UserProfile
 * @version WindowsRuntime 1.4
 */
class AdvertisingManager extends IInspectable {
;@region Static Properties
    /**
     * Retrieves a unique ID used to provide more relevant advertising. If the advertising ID feature is turned off, no ID is retrieved.
     * @remarks
     * This property retrieves a unique ID used to provide more relevant advertising by understanding which apps are used by the user and how they are used. It is also used to improve quality of service by determining the frequency and effectiveness of ads, and to detect fraud and security issues. This ID is per-user, per-device; all apps for a single user on a device have the same advertising ID.
     * 
     * If the advertising ID feature is turned off, no ID is retrieved. The advertising ID feature is turned on if the user chooses express settings when installing Windows. The feature can be turned off by the user, either during the custom setup process when installing Windows or at any time later through the **Privacy** page of **PC Settings**. It can also be turned off through group policy.
     * 
     * > [!NOTE]
     * > If the advertising ID feature is turned off by the user during the new device customization process, the feature will be turned off by default for any user account added to the device later. If they want to use the advertising ID, those users will have to explicitly turn the feature on through **PC Settings**.
     * 
     * When the feature is turned off and then on again, Windows creates a new advertising ID— the old one is not reused. The advertising ID can also be reset during operating system upgrades. Because the advertising ID is a per-device value, it is does not roam with the user account. It cannot be turned on for child accounts. The value is not backed up.
     * 
     * This property is retrieved as shown here:
     * 
     * ```csharp
     * var advertisingId = Windows.System.UserProfile.AdvertisingManager.AdvertisingId;
     * ```
     * 
     * ```cppwinrt
     * winrt::hstring advertisingId{ Windows::System::UserProfile::AdvertisingManager::AdvertisingId() };
     * ```
     * 
     * ```cppcx
     * auto advertisingId = Windows::System::UserProfile::AdvertisingManager::AdvertisingId;
     * ```
     * @see https://learn.microsoft.com/uwp/api/windows.system.userprofile.advertisingmanager.advertisingid
     * @type {HSTRING} 
     */
    static AdvertisingId {
        get => AdvertisingManager.get_AdvertisingId()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets the advertising ID for the specified user.
     * @param {User} user_ The user to get the advertising ID for.
     * @returns {AdvertisingManagerForUser} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.userprofile.advertisingmanager.getforuser
     */
    static GetForUser(user_) {
        if (!AdvertisingManager.HasProp("__IAdvertisingManagerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.System.UserProfile.AdvertisingManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAdvertisingManagerStatics2.IID)
            AdvertisingManager.__IAdvertisingManagerStatics2 := IAdvertisingManagerStatics2(factoryPtr)
        }

        return AdvertisingManager.__IAdvertisingManagerStatics2.GetForUser(user_)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_AdvertisingId() {
        if (!AdvertisingManager.HasProp("__IAdvertisingManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.UserProfile.AdvertisingManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAdvertisingManagerStatics.IID)
            AdvertisingManager.__IAdvertisingManagerStatics := IAdvertisingManagerStatics(factoryPtr)
        }

        return AdvertisingManager.__IAdvertisingManagerStatics.get_AdvertisingId()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
