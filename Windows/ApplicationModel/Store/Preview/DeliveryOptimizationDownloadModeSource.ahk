#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines values that represent the supported download mode sources in the Delivery Optimization settings for the current device. The [DownloadModeSource](deliveryoptimizationsettings_downloadmodesource.md) property returns one of these values.
 * @remarks
 * For more information about download modes, see [Configure Delivery Optimization for Windows 10 updates](/windows/deployment/update/waas-delivery-optimization#download-mode).
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.deliveryoptimizationdownloadmodesource
 * @namespace Windows.ApplicationModel.Store.Preview
 * @version WindowsRuntime 1.4
 */
class DeliveryOptimizationDownloadModeSource extends Win32Enum{

    /**
     * The download mode is based on default values.
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * The download mode is configured by policy (Group Policy or an MDM solution).
     * @type {Integer (Int32)}
     */
    static Policy => 1
}
