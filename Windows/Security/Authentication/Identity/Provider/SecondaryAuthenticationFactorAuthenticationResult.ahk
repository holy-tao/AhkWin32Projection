#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISecondaryAuthenticationFactorAuthenticationResult.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Represents the results of authentication with a companion device.
  * 
  * > [!NOTE]
  * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft to use the **secondaryAuthenticationFactor** capability, calls to this API will fail. To apply for approval, contact [cdfonboard@microsoft.com](mailto:cdfonboard@microsoft.com). For more information on capabilities, see [App capability declarations](/windows/uwp/packaging/app-capability-declarations). For an overview of the Companion Device Framework, see the [Windows Unlock with companion (IoT) devices](/windows/uwp/security/companion-device-unlock) overview.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.identity.provider.secondaryauthenticationfactorauthenticationresult
 * @namespace Windows.Security.Authentication.Identity.Provider
 * @version WindowsRuntime 1.4
 */
class SecondaryAuthenticationFactorAuthenticationResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISecondaryAuthenticationFactorAuthenticationResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISecondaryAuthenticationFactorAuthenticationResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the status of the authentication.
     * 
     * > [!NOTE]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft to use the **secondaryAuthenticationFactor** capability, calls to this API will fail. To apply for approval, contact [cdfonboard@microsoft.com](mailto:cdfonboard@microsoft.com). For more information on capabilities, see [App capability declarations](/windows/uwp/packaging/app-capability-declarations). For an overview of the Companion Device Framework, see the [Windows Unlock with companion (IoT) devices](/windows/uwp/security/companion-device-unlock) overview.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.identity.provider.secondaryauthenticationfactorauthenticationresult.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * Gets the authentication.
     * 
     * > [!NOTE]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft to use the **secondaryAuthenticationFactor** capability, calls to this API will fail. To apply for approval, contact [cdfonboard@microsoft.com](mailto:cdfonboard@microsoft.com). For more information on capabilities, see [App capability declarations](/windows/uwp/packaging/app-capability-declarations). For an overview of the Companion Device Framework, see the [Windows Unlock with companion (IoT) devices](/windows/uwp/security/companion-device-unlock) overview.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.identity.provider.secondaryauthenticationfactorauthenticationresult.authentication
     * @type {SecondaryAuthenticationFactorAuthentication} 
     */
    Authentication {
        get => this.get_Authentication()
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
    get_Status() {
        if (!this.HasProp("__ISecondaryAuthenticationFactorAuthenticationResult")) {
            if ((queryResult := this.QueryInterface(ISecondaryAuthenticationFactorAuthenticationResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISecondaryAuthenticationFactorAuthenticationResult := ISecondaryAuthenticationFactorAuthenticationResult(outPtr)
        }

        return this.__ISecondaryAuthenticationFactorAuthenticationResult.get_Status()
    }

    /**
     * 
     * @returns {SecondaryAuthenticationFactorAuthentication} 
     */
    get_Authentication() {
        if (!this.HasProp("__ISecondaryAuthenticationFactorAuthenticationResult")) {
            if ((queryResult := this.QueryInterface(ISecondaryAuthenticationFactorAuthenticationResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISecondaryAuthenticationFactorAuthenticationResult := ISecondaryAuthenticationFactorAuthenticationResult(outPtr)
        }

        return this.__ISecondaryAuthenticationFactorAuthenticationResult.get_Authentication()
    }

;@endregion Instance Methods
}
