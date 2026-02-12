#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IESimProfile.ahk
#Include ..\..\..\Guid.ahk

/**
 * A class that represents an eSIM profile, which is a subscriber identity associated with a mobile network operator (MNO).
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
  * >
  * > If you want to use this API and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.eSIMManagement_8wekyb3d8bbwe**. For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.esimprofile
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class ESimProfile extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IESimProfile

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IESimProfile.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the class of the eSIM profile (either Operational, Test, or Provisioning).
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * >
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.eSIMManagement_8wekyb3d8bbwe**. For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.esimprofile.class
     * @type {Integer} 
     */
    Class {
        get => this.get_Class()
    }

    /**
     * Gets the nickname of the eSIM profile.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * >
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.eSIMManagement_8wekyb3d8bbwe**. For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.esimprofile.nickname
     * @type {HSTRING} 
     */
    Nickname {
        get => this.get_Nickname()
    }

    /**
     * Gets the policy for the eSIM profile, regarding whether the profile can be disabled and/or deleted, and whether the policy is enterprise-managed.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * >
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.eSIMManagement_8wekyb3d8bbwe**. For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.esimprofile.policy
     * @type {ESimProfilePolicy} 
     */
    Policy {
        get => this.get_Policy()
    }

    /**
     * Gets the identification number (an ICCID) of the eSIM profile.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * >
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.eSIMManagement_8wekyb3d8bbwe**. For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.esimprofile.id
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * Gets a memory buffer containing the icon of the mobile network operator (MNO) provider for the eSIM profile.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * >
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.eSIMManagement_8wekyb3d8bbwe**. For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.esimprofile.providericon
     * @type {IRandomAccessStreamReference} 
     */
    ProviderIcon {
        get => this.get_ProviderIcon()
    }

    /**
     * Gets the identifier (an MCC/MNC tuple) of the mobile network operator (MNO) provider for the eSIM profile.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * >
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.eSIMManagement_8wekyb3d8bbwe**. For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.esimprofile.providerid
     * @type {HSTRING} 
     */
    ProviderId {
        get => this.get_ProviderId()
    }

    /**
     * Gets the name of the mobile network operator (MNO) provider for the eSIM profile.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * >
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.eSIMManagement_8wekyb3d8bbwe**. For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.esimprofile.providername
     * @type {HSTRING} 
     */
    ProviderName {
        get => this.get_ProviderName()
    }

    /**
     * Gets the state of the eSIM profile, which indicates the presence and enabled status of the profile.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * >
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.eSIMManagement_8wekyb3d8bbwe**. For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.esimprofile.state
     * @type {Integer} 
     */
    State {
        get => this.get_State()
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
    get_Class() {
        if (!this.HasProp("__IESimProfile")) {
            if ((queryResult := this.QueryInterface(IESimProfile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IESimProfile := IESimProfile(outPtr)
        }

        return this.__IESimProfile.get_Class()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Nickname() {
        if (!this.HasProp("__IESimProfile")) {
            if ((queryResult := this.QueryInterface(IESimProfile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IESimProfile := IESimProfile(outPtr)
        }

        return this.__IESimProfile.get_Nickname()
    }

    /**
     * 
     * @returns {ESimProfilePolicy} 
     */
    get_Policy() {
        if (!this.HasProp("__IESimProfile")) {
            if ((queryResult := this.QueryInterface(IESimProfile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IESimProfile := IESimProfile(outPtr)
        }

        return this.__IESimProfile.get_Policy()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        if (!this.HasProp("__IESimProfile")) {
            if ((queryResult := this.QueryInterface(IESimProfile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IESimProfile := IESimProfile(outPtr)
        }

        return this.__IESimProfile.get_Id()
    }

    /**
     * 
     * @returns {IRandomAccessStreamReference} 
     */
    get_ProviderIcon() {
        if (!this.HasProp("__IESimProfile")) {
            if ((queryResult := this.QueryInterface(IESimProfile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IESimProfile := IESimProfile(outPtr)
        }

        return this.__IESimProfile.get_ProviderIcon()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ProviderId() {
        if (!this.HasProp("__IESimProfile")) {
            if ((queryResult := this.QueryInterface(IESimProfile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IESimProfile := IESimProfile(outPtr)
        }

        return this.__IESimProfile.get_ProviderId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ProviderName() {
        if (!this.HasProp("__IESimProfile")) {
            if ((queryResult := this.QueryInterface(IESimProfile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IESimProfile := IESimProfile(outPtr)
        }

        return this.__IESimProfile.get_ProviderName()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_State() {
        if (!this.HasProp("__IESimProfile")) {
            if ((queryResult := this.QueryInterface(IESimProfile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IESimProfile := IESimProfile(outPtr)
        }

        return this.__IESimProfile.get_State()
    }

    /**
     * Asynchronously disables the eSIM profile so that it's no longer in use.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * >
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.eSIMManagement_8wekyb3d8bbwe**. For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
     * @returns {IAsyncOperation<ESimOperationResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.esimprofile.disableasync
     */
    DisableAsync() {
        if (!this.HasProp("__IESimProfile")) {
            if ((queryResult := this.QueryInterface(IESimProfile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IESimProfile := IESimProfile(outPtr)
        }

        return this.__IESimProfile.DisableAsync()
    }

    /**
     * Asynchronously enables the eSIM profile so that it's in use.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * >
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.eSIMManagement_8wekyb3d8bbwe**. For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
     * @returns {IAsyncOperation<ESimOperationResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.esimprofile.enableasync
     */
    EnableAsync() {
        if (!this.HasProp("__IESimProfile")) {
            if ((queryResult := this.QueryInterface(IESimProfile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IESimProfile := IESimProfile(outPtr)
        }

        return this.__IESimProfile.EnableAsync()
    }

    /**
     * Asynchronously sets the nickname of the eSIM profile.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * >
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.eSIMManagement_8wekyb3d8bbwe**. For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
     * @param {HSTRING} newNickname The nickname to set.
     * @returns {IAsyncOperation<ESimOperationResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.esimprofile.setnicknameasync
     */
    SetNicknameAsync(newNickname) {
        if (!this.HasProp("__IESimProfile")) {
            if ((queryResult := this.QueryInterface(IESimProfile.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IESimProfile := IESimProfile(outPtr)
        }

        return this.__IESimProfile.SetNicknameAsync(newNickname)
    }

;@endregion Instance Methods
}
