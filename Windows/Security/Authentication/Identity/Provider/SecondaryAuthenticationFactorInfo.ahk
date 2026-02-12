#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISecondaryAuthenticationFactorInfo.ahk
#Include .\ISecondaryAuthenticationFactorInfo2.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Contains properties that provide information about a companion device.
  * 
  * > [!NOTE]
  * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft to use the **secondaryAuthenticationFactor** capability, calls to this API will fail. To apply for approval, contact [cdfonboard@microsoft.com](mailto:cdfonboard@microsoft.com). For more information on capabilities, see [App capability declarations](/windows/uwp/packaging/app-capability-declarations). For an overview of the Companion Device Framework, see the [Windows Unlock with companion (IoT) devices](/windows/uwp/security/companion-device-unlock) overview.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.identity.provider.secondaryauthenticationfactorinfo
 * @namespace Windows.Security.Authentication.Identity.Provider
 * @version WindowsRuntime 1.4
 */
class SecondaryAuthenticationFactorInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISecondaryAuthenticationFactorInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISecondaryAuthenticationFactorInfo.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the device Id.
     * 
     * > [!NOTE]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft to use the **secondaryAuthenticationFactor** capability, calls to this API will fail. To apply for approval, contact [cdfonboard@microsoft.com](mailto:cdfonboard@microsoft.com). For more information on capabilities, see [App capability declarations](/windows/uwp/packaging/app-capability-declarations). For an overview of the Companion Device Framework, see the [Windows Unlock with companion (IoT) devices](/windows/uwp/security/companion-device-unlock) overview.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.identity.provider.secondaryauthenticationfactorinfo.deviceid
     * @type {HSTRING} 
     */
    DeviceId {
        get => this.get_DeviceId()
    }

    /**
     * Gets the device friendly name.
     * 
     * > [!NOTE]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft to use the **secondaryAuthenticationFactor** capability, calls to this API will fail. To apply for approval, contact [cdfonboard@microsoft.com](mailto:cdfonboard@microsoft.com). For more information on capabilities, see [App capability declarations](/windows/uwp/packaging/app-capability-declarations). For an overview of the Companion Device Framework, see the [Windows Unlock with companion (IoT) devices](/windows/uwp/security/companion-device-unlock) overview.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.identity.provider.secondaryauthenticationfactorinfo.devicefriendlyname
     * @type {HSTRING} 
     */
    DeviceFriendlyName {
        get => this.get_DeviceFriendlyName()
    }

    /**
     * Gets the device model number.
     * 
     * > [!NOTE]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft to use the **secondaryAuthenticationFactor** capability, calls to this API will fail. To apply for approval, contact [cdfonboard@microsoft.com](mailto:cdfonboard@microsoft.com). For more information on capabilities, see [App capability declarations](/windows/uwp/packaging/app-capability-declarations). For an overview of the Companion Device Framework, see the [Windows Unlock with companion (IoT) devices](/windows/uwp/security/companion-device-unlock) overview.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.identity.provider.secondaryauthenticationfactorinfo.devicemodelnumber
     * @type {HSTRING} 
     */
    DeviceModelNumber {
        get => this.get_DeviceModelNumber()
    }

    /**
     * Gets the device configuration data.
     * 
     * > [!NOTE]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft to use the **secondaryAuthenticationFactor** capability, calls to this API will fail. To apply for approval, contact [cdfonboard@microsoft.com](mailto:cdfonboard@microsoft.com). For more information on capabilities, see [App capability declarations](/windows/uwp/packaging/app-capability-declarations). For an overview of the Companion Device Framework, see the [Windows Unlock with companion (IoT) devices](/windows/uwp/security/companion-device-unlock) overview.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.identity.provider.secondaryauthenticationfactorinfo.deviceconfigurationdata
     * @type {IBuffer} 
     */
    DeviceConfigurationData {
        get => this.get_DeviceConfigurationData()
    }

    /**
     * **Deprecated.** Gets the presence monitoring mode of the companion device (the mechanism by which the main device checks the presence of the companion device).
     * 
     * > [!NOTE]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft to use the **secondaryAuthenticationFactor** capability, calls to this API will fail. To apply for approval, contact [cdfonboard@microsoft.com](mailto:cdfonboard@microsoft.com). For more information on capabilities, see [App capability declarations](/windows/uwp/packaging/app-capability-declarations). For an overview of the Companion Device Framework, see the [Windows Unlock with companion (IoT) devices](/windows/uwp/security/companion-device-unlock) overview.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.identity.provider.secondaryauthenticationfactorinfo.presencemonitoringmode
     * @type {Integer} 
     */
    PresenceMonitoringMode {
        get => this.get_PresenceMonitoringMode()
    }

    /**
     * **Deprecated.** Checks whether the companion device supports some kind of user authentication function.
     * 
     * > [!NOTE]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft to use the **secondaryAuthenticationFactor** capability, calls to this API will fail. To apply for approval, contact [cdfonboard@microsoft.com](mailto:cdfonboard@microsoft.com). For more information on capabilities, see [App capability declarations](/windows/uwp/packaging/app-capability-declarations). For an overview of the Companion Device Framework, see the [Windows Unlock with companion (IoT) devices](/windows/uwp/security/companion-device-unlock) overview.
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.identity.provider.secondaryauthenticationfactorinfo.isauthenticationsupported
     * @type {Boolean} 
     */
    IsAuthenticationSupported {
        get => this.get_IsAuthenticationSupported()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeviceId() {
        if (!this.HasProp("__ISecondaryAuthenticationFactorInfo")) {
            if ((queryResult := this.QueryInterface(ISecondaryAuthenticationFactorInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISecondaryAuthenticationFactorInfo := ISecondaryAuthenticationFactorInfo(outPtr)
        }

        return this.__ISecondaryAuthenticationFactorInfo.get_DeviceId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeviceFriendlyName() {
        if (!this.HasProp("__ISecondaryAuthenticationFactorInfo")) {
            if ((queryResult := this.QueryInterface(ISecondaryAuthenticationFactorInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISecondaryAuthenticationFactorInfo := ISecondaryAuthenticationFactorInfo(outPtr)
        }

        return this.__ISecondaryAuthenticationFactorInfo.get_DeviceFriendlyName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeviceModelNumber() {
        if (!this.HasProp("__ISecondaryAuthenticationFactorInfo")) {
            if ((queryResult := this.QueryInterface(ISecondaryAuthenticationFactorInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISecondaryAuthenticationFactorInfo := ISecondaryAuthenticationFactorInfo(outPtr)
        }

        return this.__ISecondaryAuthenticationFactorInfo.get_DeviceModelNumber()
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_DeviceConfigurationData() {
        if (!this.HasProp("__ISecondaryAuthenticationFactorInfo")) {
            if ((queryResult := this.QueryInterface(ISecondaryAuthenticationFactorInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISecondaryAuthenticationFactorInfo := ISecondaryAuthenticationFactorInfo(outPtr)
        }

        return this.__ISecondaryAuthenticationFactorInfo.get_DeviceConfigurationData()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PresenceMonitoringMode() {
        if (!this.HasProp("__ISecondaryAuthenticationFactorInfo2")) {
            if ((queryResult := this.QueryInterface(ISecondaryAuthenticationFactorInfo2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISecondaryAuthenticationFactorInfo2 := ISecondaryAuthenticationFactorInfo2(outPtr)
        }

        return this.__ISecondaryAuthenticationFactorInfo2.get_PresenceMonitoringMode()
    }

    /**
     * **Deprecated.** Manually assigns a presence state to a device.
     * 
     * > [!NOTE]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft to use the **secondaryAuthenticationFactor** capability, calls to this API will fail. To apply for approval, contact [cdfonboard@microsoft.com](mailto:cdfonboard@microsoft.com). For more information on capabilities, see [App capability declarations](/windows/uwp/packaging/app-capability-declarations). For an overview of the Companion Device Framework, see the [Windows Unlock with companion (IoT) devices](/windows/uwp/security/companion-device-unlock) overview.
     * @remarks
     * This method should only be used when a companion device's monitoring mode is set to [SecondaryAuthenticationFactorDevicePresenceMonitoringMode.AppManaged](SecondaryAuthenticationFactorDevicePresenceMonitoringMode.md). In this case, the app that is using the companion device for authentication must incorporate the third party app's presence-monitoring functionality and manually assign a [SecondaryAuthenticationFactorDevicePresence](SecondaryAuthenticationFactorDevicePresence.md) value according to the result.
     * @param {Integer} presenceState A [SecondaryAuthenticationFactorDevicePresence](SecondaryAuthenticationFactorDevicePresence.md) value indicating the device's presence state.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.identity.provider.secondaryauthenticationfactorinfo.updatedevicepresenceasync
     */
    UpdateDevicePresenceAsync(presenceState) {
        if (!this.HasProp("__ISecondaryAuthenticationFactorInfo2")) {
            if ((queryResult := this.QueryInterface(ISecondaryAuthenticationFactorInfo2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISecondaryAuthenticationFactorInfo2 := ISecondaryAuthenticationFactorInfo2(outPtr)
        }

        return this.__ISecondaryAuthenticationFactorInfo2.UpdateDevicePresenceAsync(presenceState)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsAuthenticationSupported() {
        if (!this.HasProp("__ISecondaryAuthenticationFactorInfo2")) {
            if ((queryResult := this.QueryInterface(ISecondaryAuthenticationFactorInfo2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISecondaryAuthenticationFactorInfo2 := ISecondaryAuthenticationFactorInfo2(outPtr)
        }

        return this.__ISecondaryAuthenticationFactorInfo2.get_IsAuthenticationSupported()
    }

;@endregion Instance Methods
}
