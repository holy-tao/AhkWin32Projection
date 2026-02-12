#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWindowsIntegrityPolicyStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides information about the current Windows 10 secure mode (10 S mode), and an event that is raised when the mode changes.
 * @remarks
 * Windows provides 10 S (also known as Windows Lockdown) as a mode. When Windows is in 10 S mode, only Microsoft components and Universal Windows Platform (UWP) apps can run. Certain specific components, such as `regedit.exe` and `cmd.exe`, are also disallowed. UWP apps, particularly security and firewall apps, need to be aware of the current 10 S mode in order to behave properly. Such apps also need to be notified when 10 S mode transitions from enabled to disabled.
 * @see https://learn.microsoft.com/uwp/api/windows.system.profile.windowsintegritypolicy
 * @namespace Windows.System.Profile
 * @version WindowsRuntime 1.4
 */
class WindowsIntegrityPolicy extends IInspectable {
;@region Static Properties
    /**
     * Gets a value that indicates whether or not Windows 10 secure mode (10 S mode) is enabled (Windows Lockdown mode).
     * @see https://learn.microsoft.com/uwp/api/windows.system.profile.windowsintegritypolicy.isenabled
     * @type {Boolean} 
     */
    static IsEnabled {
        get => WindowsIntegrityPolicy.get_IsEnabled()
    }

    /**
     * Gets a value that indicates whether or not Windows 10 secure mode (10 S mode) is enabled (Windows Lockdown mode) for trial purposes.
     * @remarks
     * Trial mode is a special case for Windows 10 devices with the S mode: policies are enforced, but there is no anti-rollback protection for the enforcement of the policy.
     * @see https://learn.microsoft.com/uwp/api/windows.system.profile.windowsintegritypolicy.isenabledfortrial
     * @type {Boolean} 
     */
    static IsEnabledForTrial {
        get => WindowsIntegrityPolicy.get_IsEnabledForTrial()
    }

    /**
     * Gets a value that indicates whether or not Windows 10 secure mode (10 S mode) can be disabled by any means&mdash;at run time and/or offline; by the original equipment manufacturere (OEM), or by a third party.
     * @see https://learn.microsoft.com/uwp/api/windows.system.profile.windowsintegritypolicy.candisable
     * @type {Boolean} 
     */
    static CanDisable {
        get => WindowsIntegrityPolicy.get_CanDisable()
    }

    /**
     * Gets a value that indicates (see Remarks for other necessary conditions) whether or not there is any published way, or API, for third-party vendors to disable Windows 10 secure mode (10 S mode) at run time.
     * @remarks
     * If **IsDisableSupported** is `true`, and [IsEnabled](windowsintegritypolicy_isenabled.md) or [IsEnabledForTrial](windowsintegritypolicy_isenabledfortrial.md) is `true`, and [CanDisable](windowsintegritypolicy_candisable.md) is true, then there is a published way, or API, for third-party vendors to disable Windows 10 secure mode (10 S mode) at run time.
     * @see https://learn.microsoft.com/uwp/api/windows.system.profile.windowsintegritypolicy.isdisablesupported
     * @type {Boolean} 
     */
    static IsDisableSupported {
        get => WindowsIntegrityPolicy.get_IsDisableSupported()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {Boolean} 
     */
    static get_IsEnabled() {
        if (!WindowsIntegrityPolicy.HasProp("__IWindowsIntegrityPolicyStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Profile.WindowsIntegrityPolicy")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWindowsIntegrityPolicyStatics.IID)
            WindowsIntegrityPolicy.__IWindowsIntegrityPolicyStatics := IWindowsIntegrityPolicyStatics(factoryPtr)
        }

        return WindowsIntegrityPolicy.__IWindowsIntegrityPolicyStatics.get_IsEnabled()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    static get_IsEnabledForTrial() {
        if (!WindowsIntegrityPolicy.HasProp("__IWindowsIntegrityPolicyStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Profile.WindowsIntegrityPolicy")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWindowsIntegrityPolicyStatics.IID)
            WindowsIntegrityPolicy.__IWindowsIntegrityPolicyStatics := IWindowsIntegrityPolicyStatics(factoryPtr)
        }

        return WindowsIntegrityPolicy.__IWindowsIntegrityPolicyStatics.get_IsEnabledForTrial()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    static get_CanDisable() {
        if (!WindowsIntegrityPolicy.HasProp("__IWindowsIntegrityPolicyStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Profile.WindowsIntegrityPolicy")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWindowsIntegrityPolicyStatics.IID)
            WindowsIntegrityPolicy.__IWindowsIntegrityPolicyStatics := IWindowsIntegrityPolicyStatics(factoryPtr)
        }

        return WindowsIntegrityPolicy.__IWindowsIntegrityPolicyStatics.get_CanDisable()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    static get_IsDisableSupported() {
        if (!WindowsIntegrityPolicy.HasProp("__IWindowsIntegrityPolicyStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Profile.WindowsIntegrityPolicy")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWindowsIntegrityPolicyStatics.IID)
            WindowsIntegrityPolicy.__IWindowsIntegrityPolicyStatics := IWindowsIntegrityPolicyStatics(factoryPtr)
        }

        return WindowsIntegrityPolicy.__IWindowsIntegrityPolicyStatics.get_IsDisableSupported()
    }

    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    static add_PolicyChanged(handler) {
        if (!WindowsIntegrityPolicy.HasProp("__IWindowsIntegrityPolicyStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Profile.WindowsIntegrityPolicy")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWindowsIntegrityPolicyStatics.IID)
            WindowsIntegrityPolicy.__IWindowsIntegrityPolicyStatics := IWindowsIntegrityPolicyStatics(factoryPtr)
        }

        return WindowsIntegrityPolicy.__IWindowsIntegrityPolicyStatics.add_PolicyChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    static remove_PolicyChanged(token) {
        if (!WindowsIntegrityPolicy.HasProp("__IWindowsIntegrityPolicyStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Profile.WindowsIntegrityPolicy")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWindowsIntegrityPolicyStatics.IID)
            WindowsIntegrityPolicy.__IWindowsIntegrityPolicyStatics := IWindowsIntegrityPolicyStatics(factoryPtr)
        }

        return WindowsIntegrityPolicy.__IWindowsIntegrityPolicyStatics.remove_PolicyChanged(token)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
