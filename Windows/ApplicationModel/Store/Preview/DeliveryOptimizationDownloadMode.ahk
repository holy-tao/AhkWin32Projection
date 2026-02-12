#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines values that represent the supported download mode types in the Delivery Optimization settings for the current device. The [DownloadMode](deliveryoptimizationsettings_downloadmode.md) property returns one of these values.
 * @remarks
 * For more information about download modes, see [Configure Delivery Optimization for Windows 10 updates](/windows/deployment/update/waas-delivery-optimization#download-mode).
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.deliveryoptimizationdownloadmode
 * @namespace Windows.ApplicationModel.Store.Preview
 * @version WindowsRuntime 1.4
 */
class DeliveryOptimizationDownloadMode extends Win32Enum{

    /**
     * Delivery Optimization cloud services are disabled.
     * @type {Integer (Int32)}
     */
    static Simple => 0

    /**
     * Peer-to-peer caching is disabled but Delivery Optimization can still download content from Windows Update servers or WSUS servers.
     * @type {Integer (Int32)}
     */
    static HttpOnly => 1

    /**
     * Peer sharing for Delivery Optimization on the same network is enabled.
     * @type {Integer (Int32)}
     */
    static Lan => 2

    /**
     * Group peer sharing for Delivery Optimization is enabled. Peering occurs across internal subnets, between devices that belong to the same group, including devices in remote offices.
     * @type {Integer (Int32)}
     */
    static Group => 3

    /**
     * Internet peer sources for Delivery Optimization are enabled.
     * @type {Integer (Int32)}
     */
    static Internet => 4

    /**
     * Delivery Optimization is bypassed and BITS is used instead.
     * @type {Integer (Int32)}
     */
    static Bypass => 5
}
