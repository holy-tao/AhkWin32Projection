#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMdmPolicyStatics2.ahk
#Include .\IMdmAllowPolicyStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * MDM (Mobile Device Management) policy.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.management.workplace.mdmpolicy
 * @namespace Windows.Management.Workplace
 * @version WindowsRuntime 1.4
 */
class MdmPolicy extends IInspectable {
;@region Static Methods
    /**
     * Gets the current messaging sync policy.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.workplace.mdmpolicy.getmessagingsyncpolicy
     */
    static GetMessagingSyncPolicy() {
        if (!MdmPolicy.HasProp("__IMdmPolicyStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Management.Workplace.MdmPolicy")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMdmPolicyStatics2.IID)
            MdmPolicy.__IMdmPolicyStatics2 := IMdmPolicyStatics2(factoryPtr)
        }

        return MdmPolicy.__IMdmPolicyStatics2.GetMessagingSyncPolicy()
    }

    /**
     * Returns **true** if a browser is allowed.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.workplace.mdmpolicy.isbrowserallowed
     */
    static IsBrowserAllowed() {
        if (!MdmPolicy.HasProp("__IMdmAllowPolicyStatics")) {
            activatableClassId := HSTRING.Create("Windows.Management.Workplace.MdmPolicy")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMdmAllowPolicyStatics.IID)
            MdmPolicy.__IMdmAllowPolicyStatics := IMdmAllowPolicyStatics(factoryPtr)
        }

        return MdmPolicy.__IMdmAllowPolicyStatics.IsBrowserAllowed()
    }

    /**
     * Returns **true** if a camera is allowed.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.workplace.mdmpolicy.iscameraallowed
     */
    static IsCameraAllowed() {
        if (!MdmPolicy.HasProp("__IMdmAllowPolicyStatics")) {
            activatableClassId := HSTRING.Create("Windows.Management.Workplace.MdmPolicy")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMdmAllowPolicyStatics.IID)
            MdmPolicy.__IMdmAllowPolicyStatics := IMdmAllowPolicyStatics(factoryPtr)
        }

        return MdmPolicy.__IMdmAllowPolicyStatics.IsCameraAllowed()
    }

    /**
     * Returns **true** if a Microsoft Account is allowed.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.workplace.mdmpolicy.ismicrosoftaccountallowed
     */
    static IsMicrosoftAccountAllowed() {
        if (!MdmPolicy.HasProp("__IMdmAllowPolicyStatics")) {
            activatableClassId := HSTRING.Create("Windows.Management.Workplace.MdmPolicy")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMdmAllowPolicyStatics.IID)
            MdmPolicy.__IMdmAllowPolicyStatics := IMdmAllowPolicyStatics(factoryPtr)
        }

        return MdmPolicy.__IMdmAllowPolicyStatics.IsMicrosoftAccountAllowed()
    }

    /**
     * Returns **true** if a Store is allowed.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.workplace.mdmpolicy.isstoreallowed
     */
    static IsStoreAllowed() {
        if (!MdmPolicy.HasProp("__IMdmAllowPolicyStatics")) {
            activatableClassId := HSTRING.Create("Windows.Management.Workplace.MdmPolicy")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMdmAllowPolicyStatics.IID)
            MdmPolicy.__IMdmAllowPolicyStatics := IMdmAllowPolicyStatics(factoryPtr)
        }

        return MdmPolicy.__IMdmAllowPolicyStatics.IsStoreAllowed()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
