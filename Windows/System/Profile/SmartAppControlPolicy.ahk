#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISmartAppControlPolicyStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * The **Smart App Control** policy interface and runtime class.
 * @remarks
 * **Smart App Control** is a new security feature in Windows 11, which improves consumer PC security by blocking apps that are malicious or untrusted. It's implemented as a Microsoft Defender Application Control (MDAC) policy, similar to [Windows in S mode](https://support.microsoft.com/windows/windows-10-and-windows-11-in-s-mode-faq-851057d6-1ee9-b9e5-c30b-93baebeebc85).
 * 
 * Apps and services may want to query the **Smart App Control** mode on a given system or register for a notification when the state changes. This can be accomplished with the **SmartAppControlPolicy** APIs.
 * @see https://learn.microsoft.com/uwp/api/windows.system.profile.smartappcontrolpolicy
 * @namespace Windows.System.Profile
 * @version WindowsRuntime 1.4
 */
class SmartAppControlPolicy extends IInspectable {
;@region Static Properties
    /**
     * Indicates whether **Smart App Control** is enabled.
     * @see https://learn.microsoft.com/uwp/api/windows.system.profile.smartappcontrolpolicy.isenabled
     * @type {Boolean} 
     */
    static IsEnabled {
        get => SmartAppControlPolicy.get_IsEnabled()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {Boolean} 
     */
    static get_IsEnabled() {
        if (!SmartAppControlPolicy.HasProp("__ISmartAppControlPolicyStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Profile.SmartAppControlPolicy")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISmartAppControlPolicyStatics.IID)
            SmartAppControlPolicy.__ISmartAppControlPolicyStatics := ISmartAppControlPolicyStatics(factoryPtr)
        }

        return SmartAppControlPolicy.__ISmartAppControlPolicyStatics.get_IsEnabled()
    }

    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    static add_Changed(handler) {
        if (!SmartAppControlPolicy.HasProp("__ISmartAppControlPolicyStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Profile.SmartAppControlPolicy")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISmartAppControlPolicyStatics.IID)
            SmartAppControlPolicy.__ISmartAppControlPolicyStatics := ISmartAppControlPolicyStatics(factoryPtr)
        }

        return SmartAppControlPolicy.__ISmartAppControlPolicyStatics.add_Changed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    static remove_Changed(token) {
        if (!SmartAppControlPolicy.HasProp("__ISmartAppControlPolicyStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Profile.SmartAppControlPolicy")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISmartAppControlPolicyStatics.IID)
            SmartAppControlPolicy.__ISmartAppControlPolicyStatics := ISmartAppControlPolicyStatics(factoryPtr)
        }

        return SmartAppControlPolicy.__ISmartAppControlPolicyStatics.remove_Changed(token)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
