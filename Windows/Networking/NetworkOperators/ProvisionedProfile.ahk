#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IProvisionedProfile.ahk
#Include ..\..\..\Guid.ahk

/**
 * Updates cost and usage information for a mobile broadband profile.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
  * > 
  * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.provisionedprofile
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class ProvisionedProfile extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IProvisionedProfile

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IProvisionedProfile.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Called by the application to update the cost for a specific profile.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @param {Integer} value Updates the cost for the profile.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.provisionedprofile.updatecost
     */
    UpdateCost(value) {
        if (!this.HasProp("__IProvisionedProfile")) {
            if ((queryResult := this.QueryInterface(IProvisionedProfile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProvisionedProfile := IProvisionedProfile(outPtr)
        }

        return this.__IProvisionedProfile.UpdateCost(value)
    }

    /**
     * Called by the application to update the usage for a specific profile.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @param {ProfileUsage} value Updates the usage for a profile.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.provisionedprofile.updateusage
     */
    UpdateUsage(value) {
        if (!this.HasProp("__IProvisionedProfile")) {
            if ((queryResult := this.QueryInterface(IProvisionedProfile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProvisionedProfile := IProvisionedProfile(outPtr)
        }

        return this.__IProvisionedProfile.UpdateUsage(value)
    }

;@endregion Instance Methods
}
