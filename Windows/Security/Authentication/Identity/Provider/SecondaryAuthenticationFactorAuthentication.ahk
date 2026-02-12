#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISecondaryAuthenticationFactorAuthentication.ahk
#Include .\ISecondaryAuthenticationFactorAuthenticationStatics.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Contains core methods for authenticating with a companion device.
  * 
  * > [!NOTE]
  * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft to use the **secondaryAuthenticationFactor** capability, calls to this API will fail. To apply for approval, contact [cdfonboard@microsoft.com](mailto:cdfonboard@microsoft.com). For more information on capabilities, see [App capability declarations](/windows/uwp/packaging/app-capability-declarations). For an overview of the Companion Device Framework, see the [Windows Unlock with companion (IoT) devices](/windows/uwp/security/companion-device-unlock) overview.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.identity.provider.secondaryauthenticationfactorauthentication
 * @namespace Windows.Security.Authentication.Identity.Provider
 * @version WindowsRuntime 1.4
 */
class SecondaryAuthenticationFactorAuthentication extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISecondaryAuthenticationFactorAuthentication

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISecondaryAuthenticationFactorAuthentication.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Shows a message above the lock screen or within the companion device sign in option tile.
     * 
     * > [!NOTE]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft to use the **secondaryAuthenticationFactor** capability, calls to this API will fail. To apply for approval, contact [cdfonboard@microsoft.com](mailto:cdfonboard@microsoft.com). For more information on capabilities, see [App capability declarations](/windows/uwp/packaging/app-capability-declarations). For an overview of the Companion Device Framework, see the [Windows Unlock with companion (IoT) devices](/windows/uwp/security/companion-device-unlock) overview.
     * @param {HSTRING} deviceName The name of device to display as part of the notification message (set using the message parameter).
     * @param {Integer} message The message to show.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.identity.provider.secondaryauthenticationfactorauthentication.shownotificationmessageasync
     */
    static ShowNotificationMessageAsync(deviceName, message) {
        if (!SecondaryAuthenticationFactorAuthentication.HasProp("__ISecondaryAuthenticationFactorAuthenticationStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Authentication.Identity.Provider.SecondaryAuthenticationFactorAuthentication")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISecondaryAuthenticationFactorAuthenticationStatics.IID)
            SecondaryAuthenticationFactorAuthentication.__ISecondaryAuthenticationFactorAuthenticationStatics := ISecondaryAuthenticationFactorAuthenticationStatics(factoryPtr)
        }

        return SecondaryAuthenticationFactorAuthentication.__ISecondaryAuthenticationFactorAuthenticationStatics.ShowNotificationMessageAsync(deviceName, message)
    }

    /**
     * Start an authentication with a companion device.
     * 
     * > [!NOTE]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft to use the **secondaryAuthenticationFactor** capability, calls to this API will fail. To apply for approval, contact [cdfonboard@microsoft.com](mailto:cdfonboard@microsoft.com). For more information on capabilities, see [App capability declarations](/windows/uwp/packaging/app-capability-declarations). For an overview of the Companion Device Framework, see the [Windows Unlock with companion (IoT) devices](/windows/uwp/security/companion-device-unlock) overview.
     * @param {HSTRING} deviceId The Id of the device to authenticate with.
     * @param {IBuffer} serviceAuthenticationNonce The service authentication nonce.
     * @returns {IAsyncOperation<SecondaryAuthenticationFactorAuthenticationResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.identity.provider.secondaryauthenticationfactorauthentication.startauthenticationasync
     */
    static StartAuthenticationAsync(deviceId, serviceAuthenticationNonce) {
        if (!SecondaryAuthenticationFactorAuthentication.HasProp("__ISecondaryAuthenticationFactorAuthenticationStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Authentication.Identity.Provider.SecondaryAuthenticationFactorAuthentication")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISecondaryAuthenticationFactorAuthenticationStatics.IID)
            SecondaryAuthenticationFactorAuthentication.__ISecondaryAuthenticationFactorAuthenticationStatics := ISecondaryAuthenticationFactorAuthenticationStatics(factoryPtr)
        }

        return SecondaryAuthenticationFactorAuthentication.__ISecondaryAuthenticationFactorAuthenticationStatics.StartAuthenticationAsync(deviceId, serviceAuthenticationNonce)
    }

    /**
     * 
     * @param {EventHandler<SecondaryAuthenticationFactorAuthenticationStageChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    static add_AuthenticationStageChanged(handler) {
        if (!SecondaryAuthenticationFactorAuthentication.HasProp("__ISecondaryAuthenticationFactorAuthenticationStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Authentication.Identity.Provider.SecondaryAuthenticationFactorAuthentication")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISecondaryAuthenticationFactorAuthenticationStatics.IID)
            SecondaryAuthenticationFactorAuthentication.__ISecondaryAuthenticationFactorAuthenticationStatics := ISecondaryAuthenticationFactorAuthenticationStatics(factoryPtr)
        }

        return SecondaryAuthenticationFactorAuthentication.__ISecondaryAuthenticationFactorAuthenticationStatics.add_AuthenticationStageChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    static remove_AuthenticationStageChanged(token) {
        if (!SecondaryAuthenticationFactorAuthentication.HasProp("__ISecondaryAuthenticationFactorAuthenticationStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Authentication.Identity.Provider.SecondaryAuthenticationFactorAuthentication")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISecondaryAuthenticationFactorAuthenticationStatics.IID)
            SecondaryAuthenticationFactorAuthentication.__ISecondaryAuthenticationFactorAuthenticationStatics := ISecondaryAuthenticationFactorAuthenticationStatics(factoryPtr)
        }

        return SecondaryAuthenticationFactorAuthentication.__ISecondaryAuthenticationFactorAuthenticationStatics.remove_AuthenticationStageChanged(token)
    }

    /**
     * Gets info on the authentication stage.
     * 
     * > [!NOTE]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft to use the **secondaryAuthenticationFactor** capability, calls to this API will fail. To apply for approval, contact [cdfonboard@microsoft.com](mailto:cdfonboard@microsoft.com). For more information on capabilities, see [App capability declarations](/windows/uwp/packaging/app-capability-declarations). For an overview of the Companion Device Framework, see the [Windows Unlock with companion (IoT) devices](/windows/uwp/security/companion-device-unlock) overview.
     * @returns {IAsyncOperation<SecondaryAuthenticationFactorAuthenticationStageInfo>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.identity.provider.secondaryauthenticationfactorauthentication.getauthenticationstageinfoasync
     */
    static GetAuthenticationStageInfoAsync() {
        if (!SecondaryAuthenticationFactorAuthentication.HasProp("__ISecondaryAuthenticationFactorAuthenticationStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Authentication.Identity.Provider.SecondaryAuthenticationFactorAuthentication")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISecondaryAuthenticationFactorAuthenticationStatics.IID)
            SecondaryAuthenticationFactorAuthentication.__ISecondaryAuthenticationFactorAuthenticationStatics := ISecondaryAuthenticationFactorAuthenticationStatics(factoryPtr)
        }

        return SecondaryAuthenticationFactorAuthentication.__ISecondaryAuthenticationFactorAuthenticationStatics.GetAuthenticationStageInfoAsync()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the service authentication HMAC.
     * 
     * > [!NOTE]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft to use the **secondaryAuthenticationFactor** capability, calls to this API will fail. To apply for approval, contact [cdfonboard@microsoft.com](mailto:cdfonboard@microsoft.com). For more information on capabilities, see [App capability declarations](/windows/uwp/packaging/app-capability-declarations). For an overview of the Companion Device Framework, see the [Windows Unlock with companion (IoT) devices](/windows/uwp/security/companion-device-unlock) overview.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.identity.provider.secondaryauthenticationfactorauthentication.serviceauthenticationhmac
     * @type {IBuffer} 
     */
    ServiceAuthenticationHmac {
        get => this.get_ServiceAuthenticationHmac()
    }

    /**
     * Gets the session nonce.
     * 
     * > [!NOTE]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft to use the **secondaryAuthenticationFactor** capability, calls to this API will fail. To apply for approval, contact [cdfonboard@microsoft.com](mailto:cdfonboard@microsoft.com). For more information on capabilities, see [App capability declarations](/windows/uwp/packaging/app-capability-declarations). For an overview of the Companion Device Framework, see the [Windows Unlock with companion (IoT) devices](/windows/uwp/security/companion-device-unlock) overview.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.identity.provider.secondaryauthenticationfactorauthentication.sessionnonce
     * @type {IBuffer} 
     */
    SessionNonce {
        get => this.get_SessionNonce()
    }

    /**
     * Gets the device nonce.
     * 
     * > [!NOTE]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft to use the **secondaryAuthenticationFactor** capability, calls to this API will fail. To apply for approval, contact [cdfonboard@microsoft.com](mailto:cdfonboard@microsoft.com). For more information on capabilities, see [App capability declarations](/windows/uwp/packaging/app-capability-declarations). For an overview of the Companion Device Framework, see the [Windows Unlock with companion (IoT) devices](/windows/uwp/security/companion-device-unlock) overview.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.identity.provider.secondaryauthenticationfactorauthentication.devicenonce
     * @type {IBuffer} 
     */
    DeviceNonce {
        get => this.get_DeviceNonce()
    }

    /**
     * Gets the device configuration data.
     * 
     * > [!NOTE]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft to use the **secondaryAuthenticationFactor** capability, calls to this API will fail. To apply for approval, contact [cdfonboard@microsoft.com](mailto:cdfonboard@microsoft.com). For more information on capabilities, see [App capability declarations](/windows/uwp/packaging/app-capability-declarations). For an overview of the Companion Device Framework, see the [Windows Unlock with companion (IoT) devices](/windows/uwp/security/companion-device-unlock) overview.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.identity.provider.secondaryauthenticationfactorauthentication.deviceconfigurationdata
     * @type {IBuffer} 
     */
    DeviceConfigurationData {
        get => this.get_DeviceConfigurationData()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_ServiceAuthenticationHmac() {
        if (!this.HasProp("__ISecondaryAuthenticationFactorAuthentication")) {
            if ((queryResult := this.QueryInterface(ISecondaryAuthenticationFactorAuthentication.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISecondaryAuthenticationFactorAuthentication := ISecondaryAuthenticationFactorAuthentication(outPtr)
        }

        return this.__ISecondaryAuthenticationFactorAuthentication.get_ServiceAuthenticationHmac()
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_SessionNonce() {
        if (!this.HasProp("__ISecondaryAuthenticationFactorAuthentication")) {
            if ((queryResult := this.QueryInterface(ISecondaryAuthenticationFactorAuthentication.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISecondaryAuthenticationFactorAuthentication := ISecondaryAuthenticationFactorAuthentication(outPtr)
        }

        return this.__ISecondaryAuthenticationFactorAuthentication.get_SessionNonce()
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_DeviceNonce() {
        if (!this.HasProp("__ISecondaryAuthenticationFactorAuthentication")) {
            if ((queryResult := this.QueryInterface(ISecondaryAuthenticationFactorAuthentication.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISecondaryAuthenticationFactorAuthentication := ISecondaryAuthenticationFactorAuthentication(outPtr)
        }

        return this.__ISecondaryAuthenticationFactorAuthentication.get_DeviceNonce()
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_DeviceConfigurationData() {
        if (!this.HasProp("__ISecondaryAuthenticationFactorAuthentication")) {
            if ((queryResult := this.QueryInterface(ISecondaryAuthenticationFactorAuthentication.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISecondaryAuthenticationFactorAuthentication := ISecondaryAuthenticationFactorAuthentication(outPtr)
        }

        return this.__ISecondaryAuthenticationFactorAuthentication.get_DeviceConfigurationData()
    }

    /**
     * Finishes an authentication with a companion device.
     * 
     * > [!NOTE]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft to use the **secondaryAuthenticationFactor** capability, calls to this API will fail. To apply for approval, contact [cdfonboard@microsoft.com](mailto:cdfonboard@microsoft.com). For more information on capabilities, see [App capability declarations](/windows/uwp/packaging/app-capability-declarations). For an overview of the Companion Device Framework, see the [Windows Unlock with companion (IoT) devices](/windows/uwp/security/companion-device-unlock) overview.
     * @param {IBuffer} deviceHmac The authentication device HMAC.
     * @param {IBuffer} sessionHmac The session HMAC.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.identity.provider.secondaryauthenticationfactorauthentication.finishauthenticationasync
     */
    FinishAuthenticationAsync(deviceHmac, sessionHmac) {
        if (!this.HasProp("__ISecondaryAuthenticationFactorAuthentication")) {
            if ((queryResult := this.QueryInterface(ISecondaryAuthenticationFactorAuthentication.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISecondaryAuthenticationFactorAuthentication := ISecondaryAuthenticationFactorAuthentication(outPtr)
        }

        return this.__ISecondaryAuthenticationFactorAuthentication.FinishAuthenticationAsync(deviceHmac, sessionHmac)
    }

    /**
     * Aborts an authentication.
     * 
     * > [!NOTE]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft to use the **secondaryAuthenticationFactor** capability, calls to this API will fail. To apply for approval, contact [cdfonboard@microsoft.com](mailto:cdfonboard@microsoft.com). For more information on capabilities, see [App capability declarations](/windows/uwp/packaging/app-capability-declarations). For an overview of the Companion Device Framework, see the [Windows Unlock with companion (IoT) devices](/windows/uwp/security/companion-device-unlock) overview.
     * @param {HSTRING} errorLogMessage An error message to log.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.identity.provider.secondaryauthenticationfactorauthentication.abortauthenticationasync
     */
    AbortAuthenticationAsync(errorLogMessage) {
        if (!this.HasProp("__ISecondaryAuthenticationFactorAuthentication")) {
            if ((queryResult := this.QueryInterface(ISecondaryAuthenticationFactorAuthentication.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISecondaryAuthenticationFactorAuthentication := ISecondaryAuthenticationFactorAuthentication(outPtr)
        }

        return this.__ISecondaryAuthenticationFactorAuthentication.AbortAuthenticationAsync(errorLogMessage)
    }

;@endregion Instance Methods
}
