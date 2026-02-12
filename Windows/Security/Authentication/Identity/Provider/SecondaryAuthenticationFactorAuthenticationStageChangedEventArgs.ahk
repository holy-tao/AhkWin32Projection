#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISecondaryAuthenticationFactorAuthenticationStageChangedEventArgs.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Provides information about the SecondaryAuthenticationFactorAuthenticationStageChanged event.
  * 
  * > [!NOTE]
  * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft to use the **secondaryAuthenticationFactor** capability, calls to this API will fail. To apply for approval, contact [cdfonboard@microsoft.com](mailto:cdfonboard@microsoft.com). For more information on capabilities, see [App capability declarations](/windows/uwp/packaging/app-capability-declarations). For an overview of the Companion Device Framework, see the [Windows Unlock with companion (IoT) devices](/windows/uwp/security/companion-device-unlock) overview.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.identity.provider.secondaryauthenticationfactorauthenticationstagechangedeventargs
 * @namespace Windows.Security.Authentication.Identity.Provider
 * @version WindowsRuntime 1.4
 */
class SecondaryAuthenticationFactorAuthenticationStageChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISecondaryAuthenticationFactorAuthenticationStageChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISecondaryAuthenticationFactorAuthenticationStageChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets info on the authentication stage.
     * 
     * > [!NOTE]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft to use the **secondaryAuthenticationFactor** capability, calls to this API will fail. To apply for approval, contact [cdfonboard@microsoft.com](mailto:cdfonboard@microsoft.com). For more information on capabilities, see [App capability declarations](/windows/uwp/packaging/app-capability-declarations). For an overview of the Companion Device Framework, see the [Windows Unlock with companion (IoT) devices](/windows/uwp/security/companion-device-unlock) overview.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.identity.provider.secondaryauthenticationfactorauthenticationstagechangedeventargs.stageinfo
     * @type {SecondaryAuthenticationFactorAuthenticationStageInfo} 
     */
    StageInfo {
        get => this.get_StageInfo()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {SecondaryAuthenticationFactorAuthenticationStageInfo} 
     */
    get_StageInfo() {
        if (!this.HasProp("__ISecondaryAuthenticationFactorAuthenticationStageChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(ISecondaryAuthenticationFactorAuthenticationStageChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISecondaryAuthenticationFactorAuthenticationStageChangedEventArgs := ISecondaryAuthenticationFactorAuthenticationStageChangedEventArgs(outPtr)
        }

        return this.__ISecondaryAuthenticationFactorAuthenticationStageChangedEventArgs.get_StageInfo()
    }

;@endregion Instance Methods
}
