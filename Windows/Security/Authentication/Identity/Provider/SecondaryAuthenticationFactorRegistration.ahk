#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISecondaryAuthenticationFactorRegistration.ahk
#Include .\ISecondaryAuthenticationFactorRegistrationStatics.ahk
#Include .\ISecondaryAuthenticationFactorDevicePresenceMonitoringRegistrationStatics.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Contains methods for registering companion devices.
  * 
  * > [!NOTE]
  * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft to use the **secondaryAuthenticationFactor** capability, calls to this API will fail. To apply for approval, contact [cdfonboard@microsoft.com](mailto:cdfonboard@microsoft.com). For more information on capabilities, see [App capability declarations](/windows/uwp/packaging/app-capability-declarations). For an overview of the Companion Device Framework, see the [Windows Unlock with companion (IoT) devices](/windows/uwp/security/companion-device-unlock) overview.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.identity.provider.secondaryauthenticationfactorregistration
 * @namespace Windows.Security.Authentication.Identity.Provider
 * @version WindowsRuntime 1.4
 */
class SecondaryAuthenticationFactorRegistration extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISecondaryAuthenticationFactorRegistration

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISecondaryAuthenticationFactorRegistration.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Starts registering a companion device.
     * 
     * > [!NOTE]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft to use the **secondaryAuthenticationFactor** capability, calls to this API will fail. To apply for approval, contact [cdfonboard@microsoft.com](mailto:cdfonboard@microsoft.com). For more information on capabilities, see [App capability declarations](/windows/uwp/packaging/app-capability-declarations). For an overview of the Companion Device Framework, see the [Windows Unlock with companion (IoT) devices](/windows/uwp/security/companion-device-unlock) overview.
     * @remarks
     * A companion device must be registered for secondary authentication before it is optionally registered for device presence monitoring.
     * @param {HSTRING} deviceId The Id of the device.
     * @param {Integer} capabilities The device capabilities.
     * @param {HSTRING} deviceFriendlyName The device friendly name.
     * @param {HSTRING} deviceModelNumber The device model number.
     * @param {IBuffer} deviceKey The device key.
     * @param {IBuffer} mutualAuthenticationKey The mutual authentication key.
     * @returns {IAsyncOperation<SecondaryAuthenticationFactorRegistrationResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.identity.provider.secondaryauthenticationfactorregistration.requeststartregisteringdeviceasync
     */
    static RequestStartRegisteringDeviceAsync(deviceId, capabilities, deviceFriendlyName, deviceModelNumber, deviceKey, mutualAuthenticationKey) {
        if (!SecondaryAuthenticationFactorRegistration.HasProp("__ISecondaryAuthenticationFactorRegistrationStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Authentication.Identity.Provider.SecondaryAuthenticationFactorRegistration")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISecondaryAuthenticationFactorRegistrationStatics.IID)
            SecondaryAuthenticationFactorRegistration.__ISecondaryAuthenticationFactorRegistrationStatics := ISecondaryAuthenticationFactorRegistrationStatics(factoryPtr)
        }

        return SecondaryAuthenticationFactorRegistration.__ISecondaryAuthenticationFactorRegistrationStatics.RequestStartRegisteringDeviceAsync(deviceId, capabilities, deviceFriendlyName, deviceModelNumber, deviceKey, mutualAuthenticationKey)
    }

    /**
     * Returns info on found registered devices.
     * 
     * > [!NOTE]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft to use the **secondaryAuthenticationFactor** capability, calls to this API will fail. To apply for approval, contact [cdfonboard@microsoft.com](mailto:cdfonboard@microsoft.com). For more information on capabilities, see [App capability declarations](/windows/uwp/packaging/app-capability-declarations). For an overview of the Companion Device Framework, see the [Windows Unlock with companion (IoT) devices](/windows/uwp/security/companion-device-unlock) overview.
     * @param {Integer} queryType The scope of devices to find.
     * @returns {IAsyncOperation<IVectorView<SecondaryAuthenticationFactorInfo>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.identity.provider.secondaryauthenticationfactorregistration.findallregistereddeviceinfoasync
     */
    static FindAllRegisteredDeviceInfoAsync(queryType) {
        if (!SecondaryAuthenticationFactorRegistration.HasProp("__ISecondaryAuthenticationFactorRegistrationStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Authentication.Identity.Provider.SecondaryAuthenticationFactorRegistration")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISecondaryAuthenticationFactorRegistrationStatics.IID)
            SecondaryAuthenticationFactorRegistration.__ISecondaryAuthenticationFactorRegistrationStatics := ISecondaryAuthenticationFactorRegistrationStatics(factoryPtr)
        }

        return SecondaryAuthenticationFactorRegistration.__ISecondaryAuthenticationFactorRegistrationStatics.FindAllRegisteredDeviceInfoAsync(queryType)
    }

    /**
     * Unregisters a companion device.
     * 
     * > [!NOTE]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft to use the **secondaryAuthenticationFactor** capability, calls to this API will fail. To apply for approval, contact [cdfonboard@microsoft.com](mailto:cdfonboard@microsoft.com). For more information on capabilities, see [App capability declarations](/windows/uwp/packaging/app-capability-declarations). For an overview of the Companion Device Framework, see the [Windows Unlock with companion (IoT) devices](/windows/uwp/security/companion-device-unlock) overview.
     * @param {HSTRING} deviceId The Id of the device to unregister.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.identity.provider.secondaryauthenticationfactorregistration.unregisterdeviceasync
     */
    static UnregisterDeviceAsync(deviceId) {
        if (!SecondaryAuthenticationFactorRegistration.HasProp("__ISecondaryAuthenticationFactorRegistrationStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Authentication.Identity.Provider.SecondaryAuthenticationFactorRegistration")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISecondaryAuthenticationFactorRegistrationStatics.IID)
            SecondaryAuthenticationFactorRegistration.__ISecondaryAuthenticationFactorRegistrationStatics := ISecondaryAuthenticationFactorRegistrationStatics(factoryPtr)
        }

        return SecondaryAuthenticationFactorRegistration.__ISecondaryAuthenticationFactorRegistrationStatics.UnregisterDeviceAsync(deviceId)
    }

    /**
     * Updates the configuration data of a companion device.
     * 
     * > [!NOTE]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft to use the **secondaryAuthenticationFactor** capability, calls to this API will fail. To apply for approval, contact [cdfonboard@microsoft.com](mailto:cdfonboard@microsoft.com). For more information on capabilities, see [App capability declarations](/windows/uwp/packaging/app-capability-declarations). For an overview of the Companion Device Framework, see the [Windows Unlock with companion (IoT) devices](/windows/uwp/security/companion-device-unlock) overview.
     * @param {HSTRING} deviceId The Id of the device to update.
     * @param {IBuffer} deviceConfigurationData The updated configuration data. This data is capped at 4KB.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.identity.provider.secondaryauthenticationfactorregistration.updatedeviceconfigurationdataasync
     */
    static UpdateDeviceConfigurationDataAsync(deviceId, deviceConfigurationData) {
        if (!SecondaryAuthenticationFactorRegistration.HasProp("__ISecondaryAuthenticationFactorRegistrationStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Authentication.Identity.Provider.SecondaryAuthenticationFactorRegistration")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISecondaryAuthenticationFactorRegistrationStatics.IID)
            SecondaryAuthenticationFactorRegistration.__ISecondaryAuthenticationFactorRegistrationStatics := ISecondaryAuthenticationFactorRegistrationStatics(factoryPtr)
        }

        return SecondaryAuthenticationFactorRegistration.__ISecondaryAuthenticationFactorRegistrationStatics.UpdateDeviceConfigurationDataAsync(deviceId, deviceConfigurationData)
    }

    /**
     * **Deprecated.** Registers a companion device for presence monitoring by the main device.
     * 
     * > [!NOTE]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft to use the **secondaryAuthenticationFactor** capability, calls to this API will fail. To apply for approval, contact [cdfonboard@microsoft.com](mailto:cdfonboard@microsoft.com). For more information on capabilities, see [App capability declarations](/windows/uwp/packaging/app-capability-declarations). For an overview of the Companion Device Framework, see the [Windows Unlock with companion (IoT) devices](/windows/uwp/security/companion-device-unlock) overview.
     * @remarks
     * A companion device must be registered for secondary authentication before it is optionally registered for device presence monitoring.
     * @param {HSTRING} deviceId The unique identifier for the companion device.
     * @param {HSTRING} deviceInstancePath The device instance path string.
     * @param {Integer} monitoringMode A [SecondaryAuthenticationFactorDevicePresenceMonitoringMode](SecondaryAuthenticationFactorDevicePresenceMonitoringMode.md) value describing the monitoring mode type that will be used.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.identity.provider.secondaryauthenticationfactorregistration.registerdevicepresencemonitoringasync
     */
    static RegisterDevicePresenceMonitoringAsync(deviceId, deviceInstancePath, monitoringMode) {
        if (!SecondaryAuthenticationFactorRegistration.HasProp("__ISecondaryAuthenticationFactorDevicePresenceMonitoringRegistrationStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Authentication.Identity.Provider.SecondaryAuthenticationFactorRegistration")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISecondaryAuthenticationFactorDevicePresenceMonitoringRegistrationStatics.IID)
            SecondaryAuthenticationFactorRegistration.__ISecondaryAuthenticationFactorDevicePresenceMonitoringRegistrationStatics := ISecondaryAuthenticationFactorDevicePresenceMonitoringRegistrationStatics(factoryPtr)
        }

        return SecondaryAuthenticationFactorRegistration.__ISecondaryAuthenticationFactorDevicePresenceMonitoringRegistrationStatics.RegisterDevicePresenceMonitoringAsync(deviceId, deviceInstancePath, monitoringMode)
    }

    /**
     * **Deprecated.** Registers a companion device for presence monitoring by the main device.
     * 
     * > [!NOTE]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft to use the **secondaryAuthenticationFactor** capability, calls to this API will fail. To apply for approval, contact [cdfonboard@microsoft.com](mailto:cdfonboard@microsoft.com). For more information on capabilities, see [App capability declarations](/windows/uwp/packaging/app-capability-declarations). For an overview of the Companion Device Framework, see the [Windows Unlock with companion (IoT) devices](/windows/uwp/security/companion-device-unlock) overview.
     * @remarks
     * A companion device must be registered for secondary authentication before it is optionally registered for device presence monitoring.
     * @param {HSTRING} deviceId The unique identifier for the companion device.
     * @param {HSTRING} deviceInstancePath The device instance path string.
     * @param {Integer} monitoringMode A [SecondaryAuthenticationFactorDevicePresenceMonitoringMode](SecondaryAuthenticationFactorDevicePresenceMonitoringMode.md) value describing the monitoring mode type that will be used.
     * @param {HSTRING} deviceFriendlyName 
     * @param {HSTRING} deviceModelNumber 
     * @param {IBuffer} deviceConfigurationData 
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.identity.provider.secondaryauthenticationfactorregistration.registerdevicepresencemonitoringasync
     */
    static RegisterDevicePresenceMonitoringWithNewDeviceAsync(deviceId, deviceInstancePath, monitoringMode, deviceFriendlyName, deviceModelNumber, deviceConfigurationData) {
        if (!SecondaryAuthenticationFactorRegistration.HasProp("__ISecondaryAuthenticationFactorDevicePresenceMonitoringRegistrationStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Authentication.Identity.Provider.SecondaryAuthenticationFactorRegistration")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISecondaryAuthenticationFactorDevicePresenceMonitoringRegistrationStatics.IID)
            SecondaryAuthenticationFactorRegistration.__ISecondaryAuthenticationFactorDevicePresenceMonitoringRegistrationStatics := ISecondaryAuthenticationFactorDevicePresenceMonitoringRegistrationStatics(factoryPtr)
        }

        return SecondaryAuthenticationFactorRegistration.__ISecondaryAuthenticationFactorDevicePresenceMonitoringRegistrationStatics.RegisterDevicePresenceMonitoringWithNewDeviceAsync(deviceId, deviceInstancePath, monitoringMode, deviceFriendlyName, deviceModelNumber, deviceConfigurationData)
    }

    /**
     * **Deprecated.** Unregisters a companion device from presence monitoring.
     * 
     * > [!NOTE]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft to use the **secondaryAuthenticationFactor** capability, calls to this API will fail. To apply for approval, contact [cdfonboard@microsoft.com](mailto:cdfonboard@microsoft.com). For more information on capabilities, see [App capability declarations](/windows/uwp/packaging/app-capability-declarations). For an overview of the Companion Device Framework, see the [Windows Unlock with companion (IoT) devices](/windows/uwp/security/companion-device-unlock) overview.
     * @param {HSTRING} deviceId The unique identifier for the device.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.identity.provider.secondaryauthenticationfactorregistration.unregisterdevicepresencemonitoringasync
     */
    static UnregisterDevicePresenceMonitoringAsync(deviceId) {
        if (!SecondaryAuthenticationFactorRegistration.HasProp("__ISecondaryAuthenticationFactorDevicePresenceMonitoringRegistrationStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Authentication.Identity.Provider.SecondaryAuthenticationFactorRegistration")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISecondaryAuthenticationFactorDevicePresenceMonitoringRegistrationStatics.IID)
            SecondaryAuthenticationFactorRegistration.__ISecondaryAuthenticationFactorDevicePresenceMonitoringRegistrationStatics := ISecondaryAuthenticationFactorDevicePresenceMonitoringRegistrationStatics(factoryPtr)
        }

        return SecondaryAuthenticationFactorRegistration.__ISecondaryAuthenticationFactorDevicePresenceMonitoringRegistrationStatics.UnregisterDevicePresenceMonitoringAsync(deviceId)
    }

    /**
     * **Deprecated.** Checks whether the main device is able to monitor for the presence of companion devices.
     * 
     * > [!NOTE]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft to use the **secondaryAuthenticationFactor** capability, calls to this API will fail. To apply for approval, contact [cdfonboard@microsoft.com](mailto:cdfonboard@microsoft.com). For more information on capabilities, see [App capability declarations](/windows/uwp/packaging/app-capability-declarations). For an overview of the Companion Device Framework, see the [Windows Unlock with companion (IoT) devices](/windows/uwp/security/companion-device-unlock) overview.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.identity.provider.secondaryauthenticationfactorregistration.isdevicepresencemonitoringsupported
     */
    static IsDevicePresenceMonitoringSupported() {
        if (!SecondaryAuthenticationFactorRegistration.HasProp("__ISecondaryAuthenticationFactorDevicePresenceMonitoringRegistrationStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Authentication.Identity.Provider.SecondaryAuthenticationFactorRegistration")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISecondaryAuthenticationFactorDevicePresenceMonitoringRegistrationStatics.IID)
            SecondaryAuthenticationFactorRegistration.__ISecondaryAuthenticationFactorDevicePresenceMonitoringRegistrationStatics := ISecondaryAuthenticationFactorDevicePresenceMonitoringRegistrationStatics(factoryPtr)
        }

        return SecondaryAuthenticationFactorRegistration.__ISecondaryAuthenticationFactorDevicePresenceMonitoringRegistrationStatics.IsDevicePresenceMonitoringSupported()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Finishes registering a companion device.
     * 
     * > [!NOTE]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft to use the **secondaryAuthenticationFactor** capability, calls to this API will fail. To apply for approval, contact [cdfonboard@microsoft.com](mailto:cdfonboard@microsoft.com). For more information on capabilities, see [App capability declarations](/windows/uwp/packaging/app-capability-declarations). For an overview of the Companion Device Framework, see the [Windows Unlock with companion (IoT) devices](/windows/uwp/security/companion-device-unlock) overview.
     * @param {IBuffer} deviceConfigurationData Configuration data for the device. This data is capped at 4KB.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.identity.provider.secondaryauthenticationfactorregistration.finishregisteringdeviceasync
     */
    FinishRegisteringDeviceAsync(deviceConfigurationData) {
        if (!this.HasProp("__ISecondaryAuthenticationFactorRegistration")) {
            if ((queryResult := this.QueryInterface(ISecondaryAuthenticationFactorRegistration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISecondaryAuthenticationFactorRegistration := ISecondaryAuthenticationFactorRegistration(outPtr)
        }

        return this.__ISecondaryAuthenticationFactorRegistration.FinishRegisteringDeviceAsync(deviceConfigurationData)
    }

    /**
     * Aborts registering the companion device.
     * 
     * > [!NOTE]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft to use the **secondaryAuthenticationFactor** capability, calls to this API will fail. To apply for approval, contact [cdfonboard@microsoft.com](mailto:cdfonboard@microsoft.com). For more information on capabilities, see [App capability declarations](/windows/uwp/packaging/app-capability-declarations). For an overview of the Companion Device Framework, see the [Windows Unlock with companion (IoT) devices](/windows/uwp/security/companion-device-unlock) overview.
     * @param {HSTRING} errorLogMessage An error message to log.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.authentication.identity.provider.secondaryauthenticationfactorregistration.abortregisteringdeviceasync
     */
    AbortRegisteringDeviceAsync(errorLogMessage) {
        if (!this.HasProp("__ISecondaryAuthenticationFactorRegistration")) {
            if ((queryResult := this.QueryInterface(ISecondaryAuthenticationFactorRegistration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISecondaryAuthenticationFactorRegistration := ISecondaryAuthenticationFactorRegistration(outPtr)
        }

        return this.__ISecondaryAuthenticationFactorRegistration.AbortRegisteringDeviceAsync(errorLogMessage)
    }

;@endregion Instance Methods
}
