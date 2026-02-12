#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IESimProfileMetadata.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\ESimProfileMetadata.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * A class representing eSIM profile installation metadata.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
  * >
  * > If you want to use this API and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.eSIMManagement_8wekyb3d8bbwe**. For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.esimprofilemetadata
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class ESimProfileMetadata extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IESimProfileMetadata

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IESimProfileMetadata.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value that indicates whether the profile requires a confirmation to download.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * >
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.eSIMManagement_8wekyb3d8bbwe**. For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.esimprofilemetadata.isconfirmationcoderequired
     * @type {Boolean} 
     */
    IsConfirmationCodeRequired {
        get => this.get_IsConfirmationCodeRequired()
    }

    /**
     * Gets the policy for an eSIM profile.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * >
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.eSIMManagement_8wekyb3d8bbwe**. For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.esimprofilemetadata.policy
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
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.esimprofilemetadata.id
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
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.esimprofilemetadata.providericon
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
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.esimprofilemetadata.providerid
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
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.esimprofilemetadata.providername
     * @type {HSTRING} 
     */
    ProviderName {
        get => this.get_ProviderName()
    }

    /**
     * Gets the state of the eSIM profile metadata.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * >
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.eSIMManagement_8wekyb3d8bbwe**. For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.esimprofilemetadata.state
     * @type {Integer} 
     */
    State {
        get => this.get_State()
    }

    /**
     * Occurs when the state of the eSIM profile metadata changes.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * >
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.eSIMManagement_8wekyb3d8bbwe**. For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
     * @type {TypedEventHandler<ESimProfileMetadata, IInspectable>}
    */
    OnStateChanged {
        get {
            if(!this.HasProp("__OnStateChanged")){
                this.__OnStateChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{f4586725-ea85-5ac6-846e-a847e0e45a0b}"),
                    ESimProfileMetadata,
                    IInspectable
                )
                this.__OnStateChangedToken := this.add_StateChanged(this.__OnStateChanged.iface)
            }
            return this.__OnStateChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnStateChangedToken")) {
            this.remove_StateChanged(this.__OnStateChangedToken)
            this.__OnStateChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsConfirmationCodeRequired() {
        if (!this.HasProp("__IESimProfileMetadata")) {
            if ((queryResult := this.QueryInterface(IESimProfileMetadata.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IESimProfileMetadata := IESimProfileMetadata(outPtr)
        }

        return this.__IESimProfileMetadata.get_IsConfirmationCodeRequired()
    }

    /**
     * 
     * @returns {ESimProfilePolicy} 
     */
    get_Policy() {
        if (!this.HasProp("__IESimProfileMetadata")) {
            if ((queryResult := this.QueryInterface(IESimProfileMetadata.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IESimProfileMetadata := IESimProfileMetadata(outPtr)
        }

        return this.__IESimProfileMetadata.get_Policy()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        if (!this.HasProp("__IESimProfileMetadata")) {
            if ((queryResult := this.QueryInterface(IESimProfileMetadata.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IESimProfileMetadata := IESimProfileMetadata(outPtr)
        }

        return this.__IESimProfileMetadata.get_Id()
    }

    /**
     * 
     * @returns {IRandomAccessStreamReference} 
     */
    get_ProviderIcon() {
        if (!this.HasProp("__IESimProfileMetadata")) {
            if ((queryResult := this.QueryInterface(IESimProfileMetadata.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IESimProfileMetadata := IESimProfileMetadata(outPtr)
        }

        return this.__IESimProfileMetadata.get_ProviderIcon()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ProviderId() {
        if (!this.HasProp("__IESimProfileMetadata")) {
            if ((queryResult := this.QueryInterface(IESimProfileMetadata.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IESimProfileMetadata := IESimProfileMetadata(outPtr)
        }

        return this.__IESimProfileMetadata.get_ProviderId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ProviderName() {
        if (!this.HasProp("__IESimProfileMetadata")) {
            if ((queryResult := this.QueryInterface(IESimProfileMetadata.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IESimProfileMetadata := IESimProfileMetadata(outPtr)
        }

        return this.__IESimProfileMetadata.get_ProviderName()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_State() {
        if (!this.HasProp("__IESimProfileMetadata")) {
            if ((queryResult := this.QueryInterface(IESimProfileMetadata.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IESimProfileMetadata := IESimProfileMetadata(outPtr)
        }

        return this.__IESimProfileMetadata.get_State()
    }

    /**
     * Asynchronously denies installation of the profile. The profile is revoked at the profile server.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * >
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.eSIMManagement_8wekyb3d8bbwe**. For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
     * @returns {IAsyncOperation<ESimOperationResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.esimprofilemetadata.denyinstallasync
     */
    DenyInstallAsync() {
        if (!this.HasProp("__IESimProfileMetadata")) {
            if ((queryResult := this.QueryInterface(IESimProfileMetadata.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IESimProfileMetadata := IESimProfileMetadata(outPtr)
        }

        return this.__IESimProfileMetadata.DenyInstallAsync()
    }

    /**
     * Asynchronously (with progress) downloads and installs an eSIM profile whose confirmation code is provided.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * >
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.eSIMManagement_8wekyb3d8bbwe**. For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
     * @returns {IAsyncOperationWithProgress<ESimOperationResult, ESimProfileInstallProgress>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.esimprofilemetadata.confirminstallasync
     */
    ConfirmInstallAsync() {
        if (!this.HasProp("__IESimProfileMetadata")) {
            if ((queryResult := this.QueryInterface(IESimProfileMetadata.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IESimProfileMetadata := IESimProfileMetadata(outPtr)
        }

        return this.__IESimProfileMetadata.ConfirmInstallAsync()
    }

    /**
     * Asynchronously (with progress) downloads and installs an eSIM profile.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * >
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.eSIMManagement_8wekyb3d8bbwe**. For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
     * @remarks
     * An asynchronous download and install operation with progress. On successful completion, contains an [ESimProfileInstallProgress](esimprofileinstallprogress.md) object representing the result of the download and install operation.
     * @param {HSTRING} confirmationCode 
     * @returns {IAsyncOperationWithProgress<ESimOperationResult, ESimProfileInstallProgress>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.esimprofilemetadata.confirminstallasync
     */
    ConfirmInstallWithConfirmationCodeAsync(confirmationCode) {
        if (!this.HasProp("__IESimProfileMetadata")) {
            if ((queryResult := this.QueryInterface(IESimProfileMetadata.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IESimProfileMetadata := IESimProfileMetadata(outPtr)
        }

        return this.__IESimProfileMetadata.ConfirmInstallWithConfirmationCodeAsync(confirmationCode)
    }

    /**
     * Asynchronously postpones the installation of an eSIM profile.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * >
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.eSIMManagement_8wekyb3d8bbwe**. For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
     * @remarks
     * An eSIM profile whose installation has been postponed is still reserved at the profile server. You can choose not to process the result of this asynchronous operation, since its purpose is to postpone installation. But an error can be the result of a timeout or a bad connection with the profile server. Any such error condition will effectively postpone the install.
     * @returns {IAsyncOperation<ESimOperationResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.esimprofilemetadata.postponeinstallasync
     */
    PostponeInstallAsync() {
        if (!this.HasProp("__IESimProfileMetadata")) {
            if ((queryResult := this.QueryInterface(IESimProfileMetadata.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IESimProfileMetadata := IESimProfileMetadata(outPtr)
        }

        return this.__IESimProfileMetadata.PostponeInstallAsync()
    }

    /**
     * 
     * @param {TypedEventHandler<ESimProfileMetadata, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_StateChanged(handler) {
        if (!this.HasProp("__IESimProfileMetadata")) {
            if ((queryResult := this.QueryInterface(IESimProfileMetadata.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IESimProfileMetadata := IESimProfileMetadata(outPtr)
        }

        return this.__IESimProfileMetadata.add_StateChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_StateChanged(token) {
        if (!this.HasProp("__IESimProfileMetadata")) {
            if ((queryResult := this.QueryInterface(IESimProfileMetadata.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IESimProfileMetadata := IESimProfileMetadata(outPtr)
        }

        return this.__IESimProfileMetadata.remove_StateChanged(token)
    }

;@endregion Instance Methods
}
