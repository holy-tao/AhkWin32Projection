#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Gets the Delivery Optimization settings for the current device.
 * @remarks
 * For more information about Delivery Optimization, see [Configure Delivery Optimization for Windows 10 updates](/windows/deployment/update/waas-delivery-optimization).
 * 
 * After using this method, you can access the settings via the [DownloadMode](deliveryoptimizationsettings_downloadmode.md) and [DownloadModeSource](deliveryoptimizationsettings_downloadmodesource.md) properties of the return value.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.deliveryoptimizationsettings.getcurrentsettings
 * @namespace Windows.Win32.Networking.DeliveryOptimization
 * @version v4.0.30319
 */
class DeliveryOptimization extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
