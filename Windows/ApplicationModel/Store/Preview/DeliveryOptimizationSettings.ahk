#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDeliveryOptimizationSettings.ahk
#Include .\IDeliveryOptimizationSettingsStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides access to the Delivery Optimization settings for the current device.
 * @remarks
 * To get the Delivery Optimization settings for the current device, use the static [GetGetCurrentSettings](deliveryoptimizationsettings_getcurrentsettings_1587076637.md) method to retrieve an initialized **DeliveryOptimizationSettings**. Then, use the [DownloadMode](deliveryoptimizationsettings_downloadmode.md) and [DownloadModeSource](deliveryoptimizationsettings_downloadmodesource.md) properties of this object to access the Delivery Optimization settings..
 * 
 * For more information about Delivery Optimization, see [Configure Delivery Optimization for Windows 10 updates](/windows/deployment/update/waas-delivery-optimization).
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.deliveryoptimizationsettings
 * @namespace Windows.ApplicationModel.Store.Preview
 * @version WindowsRuntime 1.4
 */
class DeliveryOptimizationSettings extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDeliveryOptimizationSettings

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDeliveryOptimizationSettings.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets the Delivery Optimization settings for the current device.
     * @remarks
     * For more information about Delivery Optimization, see [Configure Delivery Optimization for Windows 10 updates](/windows/deployment/update/waas-delivery-optimization).
     * 
     * After using this method, you can access the settings via the [DownloadMode](deliveryoptimizationsettings_downloadmode.md) and [DownloadModeSource](deliveryoptimizationsettings_downloadmodesource.md) properties of the return value.
     * @returns {DeliveryOptimizationSettings} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.deliveryoptimizationsettings.getcurrentsettings
     */
    static GetCurrentSettings() {
        if (!DeliveryOptimizationSettings.HasProp("__IDeliveryOptimizationSettingsStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Store.Preview.DeliveryOptimizationSettings")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDeliveryOptimizationSettingsStatics.IID)
            DeliveryOptimizationSettings.__IDeliveryOptimizationSettingsStatics := IDeliveryOptimizationSettingsStatics(factoryPtr)
        }

        return DeliveryOptimizationSettings.__IDeliveryOptimizationSettingsStatics.GetCurrentSettings()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the current download mode type in the Delivery Optimization settings for the current device.
     * @remarks
     * For more information about Delivery Optimization, see [Configure Delivery Optimization for Windows 10 updates](/windows/deployment/update/waas-delivery-optimization).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.deliveryoptimizationsettings.downloadmode
     * @type {Integer} 
     */
    DownloadMode {
        get => this.get_DownloadMode()
    }

    /**
     * Gets the source of the current download mode in the Delivery Optimization settings for the current device.
     * @remarks
     * For more information about Delivery Optimization, see [Configure Delivery Optimization for Windows 10 updates](/windows/deployment/update/waas-delivery-optimization).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.deliveryoptimizationsettings.downloadmodesource
     * @type {Integer} 
     */
    DownloadModeSource {
        get => this.get_DownloadModeSource()
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
    get_DownloadMode() {
        if (!this.HasProp("__IDeliveryOptimizationSettings")) {
            if ((queryResult := this.QueryInterface(IDeliveryOptimizationSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeliveryOptimizationSettings := IDeliveryOptimizationSettings(outPtr)
        }

        return this.__IDeliveryOptimizationSettings.get_DownloadMode()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DownloadModeSource() {
        if (!this.HasProp("__IDeliveryOptimizationSettings")) {
            if ((queryResult := this.QueryInterface(IDeliveryOptimizationSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDeliveryOptimizationSettings := IDeliveryOptimizationSettings(outPtr)
        }

        return this.__IDeliveryOptimizationSettings.get_DownloadModeSource()
    }

;@endregion Instance Methods
}
