#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISecondaryAuthenticationFactorAuthenticationStageInfo.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Provides information about the stage of a companion device authentication.
  * 
  * > [!NOTE]
  * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft to use the **secondaryAuthenticationFactor** capability, calls to this API will fail. To apply for approval, contact [cdfonboard@microsoft.com](mailto:cdfonboard@microsoft.com). For more information on capabilities, see [App capability declarations](/windows/uwp/packaging/app-capability-declarations). For an overview of the Companion Device Framework, see the [Windows Unlock with companion (IoT) devices](/windows/uwp/security/companion-device-unlock) overview.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.identity.provider.secondaryauthenticationfactorauthenticationstageinfo
 * @namespace Windows.Security.Authentication.Identity.Provider
 * @version WindowsRuntime 1.4
 */
class SecondaryAuthenticationFactorAuthenticationStageInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISecondaryAuthenticationFactorAuthenticationStageInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISecondaryAuthenticationFactorAuthenticationStageInfo.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the stage of the authentication.
     * 
     * > [!NOTE]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft to use the **secondaryAuthenticationFactor** capability, calls to this API will fail. To apply for approval, contact [cdfonboard@microsoft.com](mailto:cdfonboard@microsoft.com). For more information on capabilities, see [App capability declarations](/windows/uwp/packaging/app-capability-declarations). For an overview of the Companion Device Framework, see the [Windows Unlock with companion (IoT) devices](/windows/uwp/security/companion-device-unlock) overview.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.identity.provider.secondaryauthenticationfactorauthenticationstageinfo.stage
     * @type {Integer} 
     */
    Stage {
        get => this.get_Stage()
    }

    /**
     * Gets the authentication scenario (sign in versus credential prompt).
     * 
     * > [!NOTE]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft to use the **secondaryAuthenticationFactor** capability, calls to this API will fail. To apply for approval, contact [cdfonboard@microsoft.com](mailto:cdfonboard@microsoft.com). For more information on capabilities, see [App capability declarations](/windows/uwp/packaging/app-capability-declarations). For an overview of the Companion Device Framework, see the [Windows Unlock with companion (IoT) devices](/windows/uwp/security/companion-device-unlock) overview.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.identity.provider.secondaryauthenticationfactorauthenticationstageinfo.scenario
     * @type {Integer} 
     */
    Scenario {
        get => this.get_Scenario()
    }

    /**
     * Gets the device Id.
     * 
     * > [!NOTE]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft to use the **secondaryAuthenticationFactor** capability, calls to this API will fail. To apply for approval, contact [cdfonboard@microsoft.com](mailto:cdfonboard@microsoft.com). For more information on capabilities, see [App capability declarations](/windows/uwp/packaging/app-capability-declarations). For an overview of the Companion Device Framework, see the [Windows Unlock with companion (IoT) devices](/windows/uwp/security/companion-device-unlock) overview.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.identity.provider.secondaryauthenticationfactorauthenticationstageinfo.deviceid
     * @type {HSTRING} 
     */
    DeviceId {
        get => this.get_DeviceId()
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
    get_Stage() {
        if (!this.HasProp("__ISecondaryAuthenticationFactorAuthenticationStageInfo")) {
            if ((queryResult := this.QueryInterface(ISecondaryAuthenticationFactorAuthenticationStageInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISecondaryAuthenticationFactorAuthenticationStageInfo := ISecondaryAuthenticationFactorAuthenticationStageInfo(outPtr)
        }

        return this.__ISecondaryAuthenticationFactorAuthenticationStageInfo.get_Stage()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Scenario() {
        if (!this.HasProp("__ISecondaryAuthenticationFactorAuthenticationStageInfo")) {
            if ((queryResult := this.QueryInterface(ISecondaryAuthenticationFactorAuthenticationStageInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISecondaryAuthenticationFactorAuthenticationStageInfo := ISecondaryAuthenticationFactorAuthenticationStageInfo(outPtr)
        }

        return this.__ISecondaryAuthenticationFactorAuthenticationStageInfo.get_Scenario()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeviceId() {
        if (!this.HasProp("__ISecondaryAuthenticationFactorAuthenticationStageInfo")) {
            if ((queryResult := this.QueryInterface(ISecondaryAuthenticationFactorAuthenticationStageInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISecondaryAuthenticationFactorAuthenticationStageInfo := ISecondaryAuthenticationFactorAuthenticationStageInfo(outPtr)
        }

        return this.__ISecondaryAuthenticationFactorAuthenticationStageInfo.get_DeviceId()
    }

;@endregion Instance Methods
}
